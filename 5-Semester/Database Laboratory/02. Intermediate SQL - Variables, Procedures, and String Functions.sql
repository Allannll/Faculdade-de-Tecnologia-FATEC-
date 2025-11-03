-- ==========================================================
-- 02. SQL Variables, Scripts, Procedures, and String Functions
-- ==========================================================
-- This lesson demonstrates the use of DEFINE variables, script execution,
-- anonymous PL/SQL blocks, procedures, and Oracle string manipulation functions.
-- It’s designed for Oracle SQL environments such as SQL*Plus or SQL Developer.
-- ==========================================================


-- ============================
-- DEFINE example
-- ============================
-- DEFINE creates a substitution variable that can be reused in queries.
-- Here, we define a variable v_id_produto with the value 7.
DEFINE v_id_produto = 7;

-- The & symbol references the value of a substitution variable.
-- This query selects product information for the specified product ID.
SELECT nm_produto, id_produto
FROM tb_produtos
WHERE id_produto = &v_id_produto;

-- UNDEFINE removes the variable definition from memory.
UNDEFINE v_id_produto;

-- SHOW USER displays the username currently connected to the database.
SHOW USER;


-- ============================
-- Script 1
-- ============================
-- SET ECHO OFF: hides the command text during execution.
-- SET VERIFY OFF: prevents Oracle from showing old and new substitution values.
SET ECHO OFF
SET VERIFY OFF

-- This query retrieves product data using a substitution variable.
SELECT id_produto, nm_produto, preco
FROM tb_produtos
WHERE id_produto = &v_id_produto;

-- End of Script 1

-- The @ command executes an external SQL script from a file.
@ /C:\temp\teste_1.sql


-- ============================
-- Script 2 (ACCEPT command)
-- ============================
-- ACCEPT reads user input from the console and stores it in a variable.
-- FORMAT 99 limits input to two digits; PROMPT displays a message.
SET ECHO OFF
SET VERIFY OFF

ACCEPT v_id_produto NUMBER FORMAT 99 PROMPT 'Enter the product ID: '

SELECT id_produto, nm_produto, preco
FROM tb_produtos
WHERE id_produto = &v_id_produto;

-- End of Script 2
-- To execute: @ /C:\temp\teste_2.sql


-- ============================
-- Script 3 (using argument &1)
-- ============================
-- &1 refers to the first argument passed when executing the script.
-- Example: @ /C:\temp\teste_3.sql 5
SET ECHO OFF
SET VERIFY OFF

SELECT id_produto, nm_produto, preco
FROM tb_produtos
WHERE id_produto = &1;

-- End of Script 3


-- ============================
-- Script 4 (using two arguments)
-- ============================
-- &1 and &2 represent arguments passed to the script.
-- Example: @ /C:\temp\teste_4.sql 6 19.99
SET ECHO OFF
SET VERIFY OFF

SELECT id_produto, nm_produto, preco
FROM tb_produtos
WHERE id_produto = &1
AND preco > &2;

-- End of Script 4


-- ============================
-- Table creation for testing
-- ============================
-- Creates a simple test table for bulk insert demonstration.
CREATE TABLE tb_teste(
  id     INTEGER,
  valor  VARCHAR2(100)
);

-- Anonymous PL/SQL block to insert 100,000 rows into tb_teste.
-- || is the concatenation operator in Oracle.
BEGIN
  FOR v_loop IN 1..100000 LOOP
    INSERT INTO tb_teste(id, valor)
    VALUES (v_loop, 'DBA_' || v_loop);
  END LOOP;

  COMMIT;
END;

-- Retrieves all records, sorted in descending order by ID.
SELECT *
FROM tb_teste
ORDER BY 1 DESC;


-- ============================
-- DELETE vs TRUNCATE explanation
-- ============================
-- DELETE:
--   - A DML (Data Manipulation Language) command.
--   - Removes rows one by one.
--   - Supports ROLLBACK (undo).
-- TRUNCATE:
--   - A DDL (Data Definition Language) command.
--   - Removes all rows instantly without scanning.
--   - Does NOT allow ROLLBACK.
-- Internally, TRUNCATE performs a DROP TABLE + CREATE TABLE combination.


-- ============================
-- Practice: Procedures
-- ============================
-- This section demonstrates how to create and use a stored procedure.

-- Table creation for client data
CREATE TABLE tb_cliente_teste(
  id_cliente  INTEGER,
  ds_cliente  VARCHAR2(40),
  nm_cliente  VARCHAR2(40),
  valor       NUMBER(5,2),
  fg_ativo    INTEGER,
  CONSTRAINT pk_tb_cliente_teste_id_cliente PRIMARY KEY (id_cliente)
);

-- CREATE OR REPLACE PROCEDURE defines a reusable block of PL/SQL logic.
-- This procedure performs INSERT, UPDATE, and DELETE operations
-- based on the 'p_opcao' parameter ('I', 'U', or 'D').
CREATE OR REPLACE PROCEDURE manipula_dados(
    p_id_cliente    IN tb_cliente_teste.id_cliente%TYPE,
    p_descricao     IN tb_cliente_teste.ds_cliente%TYPE,
    p_nome          IN tb_cliente_teste.nm_cliente%TYPE,
    p_valor         IN tb_cliente_teste.valor%TYPE,
    p_fg_ativo      IN tb_cliente_teste.fg_ativo%TYPE,
    p_opcao         IN CHAR)
AS
  v_controle    INTEGER;
BEGIN
  -- Count records with the given client ID and active flag.
  SELECT COUNT(1) INTO v_controle
  FROM tb_cliente_teste
  WHERE id_cliente = p_id_cliente
  AND fg_ativo = 1;

  -- INSERT operation
  IF (p_opcao = 'I') THEN
    IF (v_controle != 1) THEN
      INSERT INTO tb_cliente_teste(id_cliente, ds_cliente, nm_cliente, valor, fg_ativo)
      VALUES (p_id_cliente, p_descricao, p_nome, p_valor, p_fg_ativo);
      COMMIT;
      dbms_output.put_line('Client successfully inserted');
    ELSE
      dbms_output.put_line('Client ID already exists');
    END IF;
  END IF;

  -- UPDATE operation
  IF (p_opcao = 'U') THEN
    IF (v_controle = 1) THEN
      UPDATE tb_cliente_teste
      SET ds_cliente = p_descricao,
          nm_cliente = p_nome,
          valor      = p_valor,
          fg_ativo   = p_fg_ativo
      WHERE id_cliente = p_id_cliente
      AND fg_ativo = 1;
      COMMIT;
      dbms_output.put_line('Client successfully updated');
    ELSE
      dbms_output.put_line('Client ID does not exist');
    END IF;
  END IF;

  -- DELETE operation
  IF (p_opcao = 'D') THEN
    IF (v_controle = 1) THEN
      DELETE FROM tb_cliente_teste
      WHERE id_cliente = p_id_cliente
      AND fg_ativo = 1;
      COMMIT;
      dbms_output.put_line('Client successfully deleted');
    ELSE
      dbms_output.put_line('Client ID does not exist');
    END IF;
  END IF;

EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
END manipula_dados;

-- CALL executes the stored procedure directly.
CALL manipula_dados(1, 'Client 1', 'Name Client 1', 24, 1, 'I');
CALL manipula_dados(2, 'Client 2', 'Name Client 2', 27, 1, 'I');
CALL manipula_dados(2, 'Client Updated', 'Updated', 99, 1, 'U');
CALL manipula_dados(2, NULL, NULL, NULL, NULL, 'D');

-- Display current client table contents.
SELECT * FROM tb_cliente_teste;

-- Anonymous PL/SQL block example calling a procedure.
SET serveroutput ON
BEGIN
  manipula_dados(3, NULL, NULL, NULL, NULL, 'D');
END;


-- ============================
-- String Functions
-- ============================
-- This section demonstrates Oracle’s most common string functions.


-- ASCII and CHR
-- CHR(n) returns the character represented by the ASCII code n.
SELECT CHR(65), CHR(122), CHR(90), CHR(48), CHR(57)
FROM dual;

-- CONCAT
-- CONCAT(string1, string2) joins two strings together.
SELECT CONCAT(nome, sobrenome)
FROM tb_funcionarios;

-- INITCAP
-- INITCAP capitalizes the first letter of each word.
SELECT id_produto, INITCAP(ds_produto)
FROM tb_produtos;

-- INSTR
-- INSTR(string, substring) returns the position of a substring in a string.
SELECT nm_produto, INSTR(nm_produto, 'Line')
FROM tb_produtos
WHERE id_produto = 13;

-- LENGTH
-- LENGTH(string) returns the number of characters in a string.
SELECT nm_produto, LENGTH(nm_produto)
FROM tb_produtos;

-- UPPER and LOWER
-- UPPER(string) converts all characters to uppercase.
-- LOWER(string) converts all characters to lowercase.
SELECT nm_produto, UPPER(nm_produto), LOWER(nm_produto)
FROM tb_produtos;

-- LPAD and RPAD
-- LPAD(string, length, pad_char) pads on the left.
-- RPAD(string, length, pad_char) pads on the right.
SELECT RPAD(nm_produto, 30, '.'), LPAD(preco, 8, '+')
FROM tb_produtos
WHERE id_produto < 15;

-- TRIM, LTRIM, and RTRIM
-- TRIM removes spaces (or specified characters) from both sides.
-- LTRIM removes from the left; RTRIM removes from the right.
SELECT nm_produto, TRIM(nm_produto), LTRIM(nm_produto), RTRIM(nm_produto)
FROM tb_produtos;

-- NVL
-- NVL(expr1, expr2) replaces NULL with the given value.
SELECT id_cliente, NVL(telefone, 'Phone not available')
FROM tb_clientes
ORDER BY id_cliente DESC;

-- NVL2
-- NVL2(expr1, expr2, expr3) returns expr2 if expr1 is not NULL, otherwise expr3.
SELECT id_cliente, NVL2(telefone, 'Phone available', 'Phone not available')
FROM tb_clientes
ORDER BY id_cliente DESC;

-- REPLACE
-- REPLACE(string, search, replacement) replaces occurrences of a substring.
SELECT REPLACE(nm_produto, 'Line', 'Brumemo')
FROM tb_produtos
WHERE id_produto = 13;

-- SOUNDEX
-- SOUNDEX(string) returns a phonetic representation of the string.
-- Useful for comparing words that sound similar.
SELECT sobrenome
FROM tb_clientes
WHERE SOUNDEX(sobrenome) = SOUNDEX('Souza');

-- SUBSTR
-- SUBSTR(string, start, length) extracts a substring from the given position.
SELECT nm_produto, SUBSTR(nm_produto, 2, 7)
FROM tb_produtos
WHERE id_produto < 15;