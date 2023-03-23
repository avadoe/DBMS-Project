set role 'manager'; -- this will make the current user manager

SELECT SESSION_USER, CURRENT_USER;

\DU+ -- This will give the list of users


SELECT
    ROLNAME
FROM
    PG_ROLES;  -- This will give the list of roles

CREATE ROLE MANAGER;

GRANT CONNECT ON DATABSE dbms_project TO MANAGER

GRANT UPDATE, INSERT, DELETE ON TABLE property TO manager;
\c dbms_project MANAGER
-- this will allow us to connect to the dbms_project database as the manager

alter user manager with password 'managerPassword'

-- To delete a manager:
REASSIGN OWNED BY MANAGER TO AASHUTOSH
DROP OWNED BY MANAGER
DROP ROLE MANAGER

GRANT ALL PRIVILEGES ON PROPERTY TO MANAGER;