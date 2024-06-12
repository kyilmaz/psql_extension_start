# Testing Containerized Postgres Extensions
This repository contains a simple example of how to test a Postgres extension using C, Docker and Docker Compose.

The C code is coppied from the documentation of the Postgres project. The code is located in the `src` folder.

For the execution of the code in local, the following steps are required:
1. Clean the environment

    If there are any compiled code is present, it is necessary to clean the environment. This can be done by executing the following command on the `src` directory:

    ```
   make clean
    ```
2. Compile the code

    To compile the code, it is necessary to execute the following command on the `src` directory:

    ```
   make
    ```
3. Install the extension

    To install the extension, it is necessary to execute the following command on the `src` directory:

   ```
   make install
   ```
For the execution of the code in a containerized environment, the following steps are required:
1. Clean the environment

   If there are any compiled code is present, it is necessary to clean the environment. This can be done by executing the following command on the `src` directory:

    ```
   make clean
    ```
2. Build the container

   To build the container, it is necessary to execute the following command on the root directory of the project:

   ```
   docker build -t psql_extension_c_helloworld .
    ```
3. Run the container

   To run the container, it is necessary to execute the following command on the root directory of the project:

   ```
   docker run -d --name psql_extension_c_helloworld_db psql_extension_c_helloworld
   ```
4. Connect to the container

   To connect to the container, it is necessary to execute the following command on the root directory of the project:

   ```
   docker run -it --entrypoint /bin/bash psql_extension_c_helloworld
    ```

5. Create the extension & test database 

   To create the extension, it is necessary to execute the following command on the container as the root:

   ```
   su - postgres
   /usr/lib/postgresql/16/bin/initdb -D /var/lib/postgresql/data
   /usr/lib/postgresql/16/bin/pg_ctl -D /var/lib/postgresql/data -l logfile start
   psql -U postgres
   CREATE DATABASE testdb; 
   \c testdb
   CREATE EXTENSION funcs;
   ```
6. Test if the extension works

    While connected to the database run the following command in order to check if a simple extension function works:

    ```
   SELECT add_one(10); -- Expected output: 11
    ```