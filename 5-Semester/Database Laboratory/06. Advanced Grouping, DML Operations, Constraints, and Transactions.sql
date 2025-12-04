------------------------------------------------------------
-- GROUP BY CUBE
-- CUBE extends GROUP BY to return subtotal rows for all
-- combinations of the columns, plus a row containing the grand total.
------------------------------------------------------------

SELECT id_divisao, id_cargo, SUM(salario)
FROM tb_funcionarios_2
GROUP BY CUBE(id_divisao, id_cargo)
ORDER BY id_divisao, id_cargo;


------------------------------------------------------------
-- Using CASE to interpret GROUPING results
-- CASE converts GROUPING = 1 into the string "All Divisions"
------------------------------------------------------------

SELECT 
    CASE GROUPING(id_divisao)
        WHEN 1 THEN 'All Divisions'
        ELSE id_divisao
    END AS division,
    SUM(salario) AS total_salary
FROM tb_funcionarios_2
GROUP BY ROLLUP(id_divisao)
ORDER BY id_divisao;


------------------------------------------------------------
-- DML OPERATIONS: INSERT, UPDATE, DELETE
------------------------------------------------------------

INSERT INTO tb_clientes(id_cliente, nome, sobrenome, dt_nascimento, telefone, fg_ativo)
VALUES (6, 'Joaquim', 'Silva', '26-02-1977', '80-666-2522', 1);

INSERT INTO tb_clientes
VALUES (9, 'Sophie', 'White', NULL, NULL, 1);

INSERT INTO tb_clientes
VALUES (10, 'Kyle', 'O''Maley', NULL, NULL, 1);

INSERT INTO tb_produtos (id_produto, id_tipo_produto, nm_produto, ds_produto, preco, fg_ativo)
VALUES (14, 1, 'The "Great" Gatsby', NULL, 12.99, 1);

INSERT INTO tb_clientes(id_cliente, nome, sobrenome)
SELECT 11, nome, sobrenome
FROM tb_clientes
WHERE id_cliente = 1;


------------------------------------------------------------
-- UPDATE examples
------------------------------------------------------------

UPDATE tb_clientes
SET sobrenome = 'Orange'
WHERE id_cliente = 2;

UPDATE tb_produtos
SET preco = preco * 1.20,
    nm_produto = LOWER(nm_produto)
WHERE preco > 14.00;


------------------------------------------------------------
-- UPDATE with RETURNING clause inside PL/SQL block
------------------------------------------------------------

SET SERVEROUTPUT ON;

DECLARE 
    media_preco_produto NUMBER; 
BEGIN
    UPDATE tb_produtos
    SET preco = preco * 0.75
    RETURNING AVG(preco) INTO media_preco_produto;

    DBMS_OUTPUT.PUT_LINE('Variable value: ' || media_preco_produto);
END;
/


------------------------------------------------------------
-- DELETE example
------------------------------------------------------------

DELETE FROM tb_clientes
WHERE id_cliente = 5;

ROLLBACK;


------------------------------------------------------------
-- Constraint Violations: Primary Key and Foreign Key
------------------------------------------------------------

-- Primary key violation (id_cliente is a PK, values must be unique)
INSERT INTO tb_clientes(id_cliente, nome, sobrenome, dt_nascimento, telefone, fg_ativo)
VALUES (1, 'Jasonn', 'Price', '01-JAN-60', '800-555-1211', 1);

-- Updating PK to an existing value also triggers ORA-00001
UPDATE tb_clientes
SET id_cliente = 1
WHERE id_cliente = 2;

-- Foreign key violation:
-- No record in TB_TIPOS_PRODUTOS with id_tipo_produto = 6
INSERT INTO tb_produtos(id_produto, id_tipo_produto, nm_produto, ds_produto, preco, fg_ativo)
VALUES (15, 6, 'Teste', NULL, 1);

-- Updating with a non-existing foreign key value
UPDATE tb_produtos
SET id_tipo_produto = 6
WHERE id_produto = 6;

-- Deleting parent row referenced by child table causes error
DELETE FROM tb_tipos_produtos
WHERE id_tipo_produto = 1;


------------------------------------------------------------
-- Creating a table with DEFAULT values and PK constraint
------------------------------------------------------------

CREATE TABLE tb_status_encomenda(
    id_status_encomenda     INTEGER,
    status                  VARCHAR2(40) DEFAULT 'Order Available' NOT NULL,
    ultima_modificacao      DATE DEFAULT SYSDATE,
    PRIMARY KEY (id_status_encomenda)
);


------------------------------------------------------------
-- TRANSACTIONS
------------------------------------------------------------

INSERT INTO tb_clientes
VALUES (12, 'Geraldo', 'Henrique', '31-JUL-1977', '800-112233', 1);

COMMIT;


-- Update then rollback example
UPDATE tb_clientes
SET nome = 'Jose'
WHERE id_cliente = 1;

SELECT *
FROM tb_clientes
ORDER BY 1;

ROLLBACK;


------------------------------------------------------------
-- SAVEPOINTS
------------------------------------------------------------

-- Check current prices for products 4 and 6
SELECT id_produto, preco
FROM tb_produtos
WHERE id_produto IN (4, 6);

-- Update price of product 4 and commit
UPDATE tb_produtos
SET preco = preco * 1.20
WHERE id_produto = 4;

COMMIT;

-- Define a savepoint
SAVEPOINT save1;

-- Increase price of product 6 by 30%
UPDATE tb_produtos
SET preco = preco * 1.30
WHERE id_produto = 6;

-- Check new prices
SELECT id_produto, preco
FROM tb_produtos
WHERE id_produto IN (4, 6);

-- Rollback to savepoint
ROLLBACK TO SAVEPOINT save1;

-- Check prices after rollback to savepoint
SELECT id_produto, preco
FROM tb_produtos
WHERE id_produto IN (4, 6);