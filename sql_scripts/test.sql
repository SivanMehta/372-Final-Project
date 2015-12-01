\c postgres

-- set up database

\i sql_scripts/create.sql
\i sql_scripts/initialize.sql

-- run tests

\i sql_scripts/trigger_tests.sql