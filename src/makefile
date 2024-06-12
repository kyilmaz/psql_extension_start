MODULE_big = funcs
OBJS = funcs.o
DATA = ../SQL/funcs--1.0.sql  # Scripts to install with extension
PGFILEDESC = "funcs - sample PostgreSQL extension"

EXTENSION = funcs
DIR = $(shell pg_config --pkglibdir)
SHAREDIR = $(shell pg_config --sharedir)

PG_CONFIG = pg_config
PGXS := $(shell $(PG_CONFIG) --pgxs)
include $(PGXS)

install: all
	$(INSTALL_PROGRAM) funcs.so '$(DIR)/funcs.so'
	$(INSTALL_DATA) funcs.control '$(SHAREDIR)/extension/'
	$(INSTALL_DATA) ../SQL/funcs--1.0.sql '$(SHAREDIR)/extension/'

all: $(OBJS)

clean:
	rm -f $(OBJS) funcs.so
