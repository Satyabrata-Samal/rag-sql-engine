-- Permissions setup script
-- This runs last (03_permissions.sql) after the chinook schema is loaded
-- Grants appropriate permissions to app, postgres_exporter, and dba users

-- ============================================================================
-- Application User (app) Permissions
-- ============================================================================
-- The app user needs full access to the chinook schema for normal operations

GRANT CONNECT ON DATABASE chinook TO app;
GRANT USAGE ON SCHEMA chinook TO app;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA chinook TO app;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA chinook TO app;

-- Grant default privileges for future objects
ALTER DEFAULT PRIVILEGES IN SCHEMA chinook
    GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO app;
ALTER DEFAULT PRIVILEGES IN SCHEMA chinook
    GRANT USAGE, SELECT ON SEQUENCES TO app;

-- ============================================================================
-- Monitoring User (postgres_exporter) Permissions
-- ============================================================================
-- The postgres_exporter user needs read-only access to system catalogs
-- and statistics views for monitoring metrics

GRANT CONNECT ON DATABASE chinook TO postgres_exporter;

-- Access to pg_catalog for system information
GRANT USAGE ON SCHEMA pg_catalog TO postgres_exporter;
GRANT SELECT ON ALL TABLES IN SCHEMA pg_catalog TO postgres_exporter;

-- Access to chinook schema for application-specific metrics
GRANT USAGE ON SCHEMA chinook TO postgres_exporter;
GRANT SELECT ON ALL TABLES IN SCHEMA chinook TO postgres_exporter;

-- Access to statistics and monitoring views
GRANT SELECT ON pg_stat_database TO postgres_exporter;
GRANT SELECT ON pg_stat_user_tables TO postgres_exporter;
GRANT SELECT ON pg_stat_user_indexes TO postgres_exporter;
GRANT SELECT ON pg_statio_user_tables TO postgres_exporter;
GRANT SELECT ON pg_statio_user_indexes TO postgres_exporter;
GRANT SELECT ON pg_stat_activity TO postgres_exporter;
GRANT SELECT ON pg_stat_replication TO postgres_exporter;
GRANT SELECT ON pg_stat_bgwriter TO postgres_exporter;
GRANT SELECT ON pg_stat_archiver TO postgres_exporter;

-- Access to pg_stat_statements for query performance monitoring
GRANT SELECT ON pg_stat_statements TO postgres_exporter;
-- Note: pg_stat_statements_reset() requires parameters in PostgreSQL 13+
-- GRANT EXECUTE ON FUNCTION pg_stat_statements_reset(oid, oid, bigint) TO postgres_exporter;

-- Grant default privileges for future objects in chinook
ALTER DEFAULT PRIVILEGES IN SCHEMA chinook
    GRANT SELECT ON TABLES TO postgres_exporter;

-- ============================================================================
-- DBA User Permissions
-- ============================================================================
-- DBAs already have SUPERUSER privilege (granted in 01_init.sql)
-- They have full access to all databases and objects
-- No additional grants needed

-- ============================================================================
-- Verification Queries
-- ============================================================================
-- Uncomment these to verify permissions after setup:

-- SELECT grantee, privilege_type
-- FROM information_schema.role_table_grants
-- WHERE table_schema = 'chinook'
-- ORDER BY grantee, table_name;

-- SELECT * FROM information_schema.role_usage_grants
-- WHERE object_schema = 'chinook';
