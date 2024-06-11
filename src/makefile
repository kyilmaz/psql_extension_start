DATA = ../SQL/funcs--1.0.sql
DATA_built = $(DATA)
EXTENSION = funcs

MODULE_big = funcs
OBJS = funcs.o

PG_CONFIG = pg_config
PGXS := $(shell $(PG_CONFIG) --pgxs)
include $(PGXS)
