------------------------------------------------------------
-- Creating Users
------------------------------------------------------------

CREATE USER jean IDENTIFIED BY master;

-- Creating user 'henrique' with default and temporary tablespace
CREATE USER henrique IDENTIFIED BY 0800
    DEFAULT TABLESPACE users
    TEMPORARY TABLESPACE temp;


------------------------------------------------------------
-- Granting System Privileges
------------------------------------------------------------

-- Grant CREATE SESSION to user 'jean'
GRANT CREATE SESSION TO jean;
-- Now 'jean' can connect to the database

-- Creating users 'fernando' and 'sonia' and granting CREATE SESSION
CREATE USER fernando IDENTIFIED BY fernando1234;
CREATE USER sonia IDENTIFIED BY sonia1234;
GRANT CREATE SESSION TO fernando, sonia;


------------------------------------------------------------
-- Alter User Password
------------------------------------------------------------

ALTER USER jean IDENTIFIED BY senha123alterada;


------------------------------------------------------------
-- Dropping a User
------------------------------------------------------------

DROP USER jean;
-- Note: Use CASCADE if the user schema contains objects.
-- Always ensure no other user depends on those objects before dropping.


------------------------------------------------------------
-- Granting Additional System Privileges
------------------------------------------------------------

GRANT CREATE SESSION,
      CREATE USER,
      CREATE TABLE
TO fernando;

-- Granting EXECUTE ANY PROCEDURE with ADMIN OPTION
GRANT EXECUTE ANY PROCEDURE TO fernando WITH ADMIN OPTION;
-- fernando can now grant this privilege to other users


------------------------------------------------------------
-- Granting Privilege from Another User
------------------------------------------------------------

-- Connect as user fernando:
GRANT EXECUTE ANY PROCEDURE TO sonia;

-- Back to SYSTEM:
-- Granting EXECUTE ANY PROCEDURE to all users
GRANT EXECUTE ANY PROCEDURE TO PUBLIC;


------------------------------------------------------------
-- Querying User System Privileges
------------------------------------------------------------

SELECT *
FROM user_sys_privs
ORDER BY privilege;


------------------------------------------------------------
-- Attempt to Create User Without Privilege
------------------------------------------------------------

-- As user fernando (does not have CREATE USER privilege):
CREATE USER roberto IDENTIFIED BY roberto1234;
-- This raises ORA-01031: Insufficient privileges

-- Trying to drop a user also fails:
DROP USER roberto;


------------------------------------------------------------
-- Revoking Privileges
------------------------------------------------------------

-- As SYSTEM:
REVOKE CREATE TABLE FROM fernando;
-- If a user grants a privilege to another user, and later loses that privilege,
-- the granted privilege remains active for the other user.


------------------------------------------------------------
-- Granting Object Privileges
------------------------------------------------------------

-- Object privileges on tb_produtos
GRANT SELECT, INSERT, UPDATE ON tb_produtos TO fernando;

-- SELECT privilege on tb_funcionarios
GRANT SELECT ON tb_funcionarios TO fernando;

-- Granting UPDATE on specific columns only
GRANT UPDATE(sobrenome, salario)
    ON tb_funcionarios TO fernando;

-- Granting SELECT on tb_clientes with GRANT OPTION
GRANT SELECT ON tb_clientes TO fernando WITH GRANT OPTION;
-- GRANT OPTION = allows granting object privilege
-- ADMIN OPTION = allows granting system privilege


------------------------------------------------------------
-- Granting Privilege to Another User via GRANT OPTION
------------------------------------------------------------

-- Connect as fernando:
GRANT SELECT ON loja.tb_clientes TO sonia;


------------------------------------------------------------
-- Checking Privileges Granted by the User
------------------------------------------------------------

-- Connect as loja:
SELECT *
FROM user_tab_privs_made
WHERE table_name = 'TB_PRODUTOS';

-- Column-level privileges granted
SELECT *
FROM user_col_privs_made;


------------------------------------------------------------
-- Checking Privileges Received by the User
------------------------------------------------------------

-- Connect as fernando:
SELECT *
FROM user_tab_privs_recd;


------------------------------------------------------------
-- Creating Synonyms
------------------------------------------------------------

-- As SYSTEM, grant synonym creation privilege
GRANT CREATE SYNONYM TO fernando;

-- Creating a private synonym
CREATE SYNONYM clientes FOR loja.tb_clientes;

-- Query using synonym
SELECT *
FROM clientes;

-- Creating a public synonym (visible to all users)
CREATE PUBLIC SYNONYM produtos FOR loja.tb_produtos;

-- Query using public synonym
SELECT *
FROM produtos;