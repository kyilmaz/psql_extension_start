-- Extension script to define a PostgreSQL function that calls the C function
CREATE OR REPLACE FUNCTION hello_world()
RETURNS text AS 'MODULE_PATHNAME', 'hello_world'
LANGUAGE C STRICT;
