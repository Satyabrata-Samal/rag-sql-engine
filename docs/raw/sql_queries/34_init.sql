-- Initial database setup script
-- This runs first (01_init.sql) to create users and enable extensions
-- The chinook schema will be loaded next via 02_chinook.sql
-- Permissions will be granted via 03_permissions.sql

-- Enable pg_stat_statements extension for query performance tracking
CREATE EXTENSION IF NOT EXISTS pg_stat_statements;

-- Create application user
-- This user represents the application accessing the database
CREATE USER app WITH PASSWORD 'app_password';

-- Create monitoring user for postgres_exporter
-- This user has limited read-only permissions for monitoring
CREATE USER postgres_exporter WITH PASSWORD 'exporter_password';

-- Create DBA role
-- DBAs get superuser privileges for administrative tasks
CREATE ROLE dba WITH LOGIN SUPERUSER PASSWORD 'dba_password';

-- Note: Specific permissions for these users will be granted
-- in 03_permissions.sql after the chinook schema is loaded
