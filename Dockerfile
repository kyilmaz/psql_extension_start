FROM ubuntu:22.04

# Set non-interactive installation to avoid tzdata prompts
ENV DEBIAN_FRONTEND=noninteractive

# Install prerequisites
RUN apt-get update && apt-get install -y \
    build-essential \
    wget \
    gnupg2 \
    lsb-release

# Add PostgreSQL's official repository
RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list
RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -

# Update and install PostgreSQL
RUN apt-get update && apt-get install -y \
    postgresql-16 \
    postgresql-client-16 \
    postgresql-server-dev-16 \
    libpq-dev

# Copy your source code and SQL scripts into the image
COPY src/ /app/src/
COPY SQL/ /app/SQL/

# Set the working directory
WORKDIR /app/src/

# Ensure Makefile exists and list files for debugging
RUN ls -la

# Clean the .so file if it exists
RUN make clean

# Compile the C program
RUN make

# Install the extension
RUN make install

# Verify the shared library installation
RUN ls -la /usr/lib/postgresql/16/lib/

# Add the initialization script for the extension
COPY SQL/funcs--1.0.sql /docker-entrypoint-initdb.d/
