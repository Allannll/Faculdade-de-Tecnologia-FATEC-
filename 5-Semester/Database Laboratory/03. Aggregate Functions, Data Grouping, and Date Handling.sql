-- ==========================================================
-- 03. Aggregate Functions, Data Grouping, and Date Handling
-- ==========================================================
-- This lesson covers:
-- - Aggregate functions (MAX, MIN, AVG, COUNT, VARIANCE, STDDEV)
-- - GROUP BY and HAVING clauses
-- - Handling duplicates using GROUP BY
-- - Working with dates (TO_CHAR, TO_DATE, ALTER SESSION)
-- ==========================================================


-- ==========================================================
--  Aggregate Functions
-- ==========================================================

-- MAX() → Returns the maximum value in a column.
-- MIN() → Returns the minimum value in a column.
-- Example: returns the oldest and youngest clients by birth date.
SELECT MAX(dt_nascimento) AS Max_Birthdate,
       MIN(dt_nascimento) AS Min_Birthdate
FROM tb_clientes;


-- STDDEV() → Returns the statistical standard deviation of numeric values.
-- Example: returns the price standard deviation among products.
SELECT STDDEV(preco) AS Std_Deviation
FROM tb_produtos;


-- VARIANCE() → Returns the statistical variance of numeric values.
-- Example: returns how dispersed the prices are.
SELECT VARIANCE(preco) AS Variance_Value
FROM tb_produtos;



-- ==========================================================
--  Data Grouping (GROUP BY)
-- ==========================================================

-- COUNT() → Returns the number of rows in each group.
-- Example: counts how many products exist in each product type.
SELECT id_tipo_produto, COUNT(ROWID) AS Product_Count
FROM tb_produtos
GROUP BY id_tipo_produto
ORDER BY id_tipo_produto;


-- AVG() → Returns the average value of a numeric column.
-- ROUND(x, n) → Rounds a numeric value x to n decimal places.
-- Example: returns average price by product type, including type name.
SELECT a.id_tipo_produto,
       b.nm_tipo_produto,
       ROUND(AVG(preco), 2) AS Avg_Price
FROM tb_produtos a
INNER JOIN tb_tipos_produtos b ON a.id_tipo_produto = b.id_tipo_produto
GROUP BY a.id_tipo_produto, b.nm_tipo_produto
ORDER BY 1;


-- ORDER BY with aggregate function
-- Example: orders groups by price variance.
SELECT VARIANCE(preco) AS Variance_Value
FROM tb_produtos
GROUP BY id_tipo_produto
ORDER BY VARIANCE(preco);



-- ==========================================================
--  Filtering Groups with HAVING
-- ==========================================================
-- HAVING → filters grouped data (applied *after* GROUP BY).
-- Example: filters only product types with average price above 20.
SELECT id_tipo_produto, AVG(preco) AS Avg_Price
FROM tb_produtos
GROUP BY id_tipo_produto
HAVING AVG(preco) > 20.00;


-- WHERE → filters data *before* grouping.
-- Example: only considers products cheaper than 15 before grouping.
SELECT id_tipo_produto, AVG(preco) AS Avg_Price
FROM tb_produtos
WHERE preco < 15.00
GROUP BY id_tipo_produto
ORDER BY id_tipo_produto;


-- Example combining WHERE and HAVING
-- WHERE filters raw data; HAVING filters aggregated results.
SELECT id_tipo_produto, AVG(preco) AS Avg_Price
FROM tb_produtos
WHERE preco < 15.00
GROUP BY id_tipo_produto
HAVING AVG(preco) > 13.00
ORDER BY id_tipo_produto;



-- ==========================================================
--  Handling Duplicate Data
-- ==========================================================

-- Creates a test table with duplicated names
CREATE TABLE tb_pessoas (
    nm_pessoa VARCHAR2(60)
);

-- Inserts data with intentional duplicates
INSERT INTO tb_pessoas (nm_pessoa)
VALUES
('Audrey'),
('Helena'),
('Guilherme'),
('Irving'),
('Gabriele'),
('Gabriel'),
('Gabriele'),
('Gabriel'),
('Gabriel');

-- GROUP BY with HAVING identifies duplicates
-- HAVING COUNT(1) > 1 → filters names that appear more than once.
SELECT nm_pessoa
FROM tb_pessoas
GROUP BY nm_pessoa
HAVING COUNT(1) > 1;



-- ==========================================================
--  Working with Dates
-- ==========================================================

-- DATE'YYYY-MM-DD' → literal syntax to insert a date.
-- Inserts a new client with a birthdate.
INSERT INTO tb_clientes(id_cliente, nome, sobrenome, dt_nascimento, telefone, fg_ativo)
VALUES(7, 'Steve', 'Purple', DATE'1972-10-25', '800-555-1215', 1);


-- TO_CHAR(date, format) → Converts a date to a formatted string.
-- Example: formats date as "MONTH DD, YYYY".
SELECT id_cliente,
       TO_CHAR(dt_nascimento, 'MONTH DD, YYYY') AS Formatted_Birthdate
FROM tb_clientes;



-- ==========================================================
--  Fixing Common Typing Errors
-- ==========================================================
-- Example of a wrong command (typo in SELECT and TO_DATE format):

--  Incorrect:
-- SELET TO_CHAR(SYSDATE, 'MONTH DD, YYYY, HH24:MI:SS')
-- FROM dual;
--
-- INSERT INTO tb_clientes(id_cliente, nome, sbrenome, dt_nascimento, telefone, fg_ativo)
-- VALUES(10, 'Nome', 'Sobrenome', TO_DATE('Jul 04, 2013 19:32:36', 'MONTH DD));

--  Correct version:
-- TO_CHAR(SYSDATE, format) → Converts current date/time to string.
SELECT TO_CHAR(SYSDATE, 'MONTH DD, YYYY, HH24:MI:SS') AS Current_Timestamp
FROM dual;

-- TO_DATE(string, format) → Converts a string into a DATE value.
INSERT INTO tb_clientes(id_cliente, nome, sobrenome, dt_nascimento, telefone, fg_ativo)
VALUES(10, 'Nome', 'Sobrenome',
       TO_DATE('Jul 04, 2013 19:32:36', 'MONTH DD, YYYY HH24:MI:SS'),
       '800-555-1234', 1);



-- ==========================================================
--  Changing the Default Date Format in Session
-- ==========================================================
-- ALTER SESSION → modifies session settings.
-- NLS_DATE_FORMAT → changes the default format for displaying dates.
ALTER SESSION SET NLS_DATE_FORMAT = 'MONTH-DD-YYYY';
