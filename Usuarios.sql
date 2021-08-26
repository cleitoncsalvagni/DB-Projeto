CREATE USER steve_jobs WITH password '123456' NOLOGIN NOCREATEDB

ALTER USER steve_jobs WITH LOGIN

SELECT * FROM teste.conta

CREATE GROUP grupo;

ALTER GROUP grupo ADD USER steve_jobs

ALTER TABLE teste.conta OWNER TO steve_jobs

ALTER TABLE teste.conta OWNER TO postgres

GRANT SELECT ON  ALL TABLES IN SCHEMA teste TO steve_jobs
-- REVOKE SELECT ON teste.conta FROM steve_jobs