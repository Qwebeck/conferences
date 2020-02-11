DROP SCHEMA IF EXISTS conf CASCADE;
\i conferences.sql;
\i add_data_to_conf.sql;
SET search_path TO conf;