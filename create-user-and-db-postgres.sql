-- Enable autocommit before executing this commanc.
-- Sql Workbench - menu->sql->autocommit
SET AUTOCOMMIT
= ON;

CREATE database authentik;

CREATE USER authentik
WITH ENCRYPTED PASSWORD '<password>';

GRANT ALL PRIVILEGES ON DATABASE authentik TO authentik;
