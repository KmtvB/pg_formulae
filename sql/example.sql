CREATE FUNCTION add_one(integer) RETURNS integer 
    AS 'example', 'add_one' 
    LANGUAGE C STRICT;