\c postgres

-- set up database

\i sql_scripts/create.sql
\i sql_scripts/initialize.sql

-- run tests

\i test/trigger_tests.sql
\i sql_scripts/simple_queries.sql
