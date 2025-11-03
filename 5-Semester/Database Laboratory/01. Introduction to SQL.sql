/* =====================================================
   📚 LABORATORY CLASS 1 – DATABASE (ORACLE SQL)
   -----------------------------------------------------
   Topics covered:
   - Date manipulation
   - Queries and filters
   - Identifiers (ROWID, ROWNUM)
   - Arithmetic expressions
   - Aliases and concatenation
   - Handling NULL values (NVL, COALESCE, NULLIF)
   - Comparison operators (IN, LIKE, ANY, ALL, ESCAPE)
   ===================================================== */


/* =====================================================
    1. DATE MANIPULATION
   ===================================================== */
SELECT TO_DATE('31/DEC/2023') - TO_DATE('22/JUN/2023');
-- Calculates the difference (in days) between two dates


/* =====================================================
    2. SIMPLE TABLE SELECTIONS
   ===================================================== */
SELECT id_cliente, nome, sobrenome, dt_nascimento, telefone
FROM tb_clientes;
-- Selects specific columns

SELECT *
FROM tb_clientes;
-- Returns all columns from the table

SELECT *
FROM tb_clientes
WHERE id_cliente = 2;
-- Returns only the customer with id 2


/* =====================================================
    3. RECORD IDENTIFIERS
   ===================================================== */
SELECT ROWID, id_cliente
FROM tb_clientes;
-- ROWID: unique physical identifier of each row

SELECT ROWNUM, id_cliente, nome, sobrenome
FROM tb_clientes;
-- ROWNUM: sequential numbering of returned rows

SELECT ROWNUM, id_cliente, nome, sobrenome
FROM tb_clientes
WHERE id_cliente = 3;
-- Returns only the customer with id 3 and its row number


/* =====================================================
    4. ARITHMETIC EXPRESSIONS
   ===================================================== */
SELECT 2 * 6 FROM dual;
-- Simple multiplication

SELECT 10 * 12 / 3 - 1 FROM dual;
-- Combined arithmetic operations

SELECT 10 * (12 / 3 - 1) FROM dual;
-- Using parentheses to control execution order

SELECT TO_DATE('22/JUN/2023') + 2 FROM dual;
-- Adds two days to a date


/* =====================================================
    5. COLUMN MANIPULATION AND ALIASES
   ===================================================== */
SELECT nm_produto, preco, preco + 2.00 FROM tb_produtos;
-- Shows original price and price plus 2

SELECT preco, preco * 2 DOBRO_PREÇO FROM tb_produtos;
-- Creates alias without quotes

SELECT preco, preco * 2 "Double Price" FROM tb_produtos;
-- Creates alias with double quotes (allows spaces)

SELECT preco, preco * 2 AS "Double Price" FROM tb_produtos;
-- Uses AS to name the column


/* =====================================================
    6. STRING CONCATENATION
   ===================================================== */
SELECT nome || ' ' || sobrenome AS "Client Name"
FROM tb_clientes;
-- Concatenates first name and last name with a space

SELECT 'The employee ' || nome || ' ' || sobrenome ||
       ' earns the salary of $ ' || salario ||
       ' but wishes for $ ' || salario * 3 AS "Dream Salary"
FROM tb_funcionarios;
-- Example combining text and numeric expressions


/* =====================================================
    7. NULL VALUES
   ===================================================== */
SELECT id_cliente, nome, sobrenome, dt_nascimento
FROM tb_clientes
WHERE dt_nascimento IS NULL;
-- Displays customers without a birth date

SELECT id_cliente, nome, sobrenome, dt_nascimento
FROM tb_clientes
WHERE dt_nascimento IS NOT NULL;
-- Displays customers with a birth date

SELECT id_cliente, nome, sobrenome, telefone
FROM tb_clientes
WHERE telefone IS NULL;
-- Displays customers without a phone number


/* =====================================================
    8. HANDLING NULLS WITH NVL
   ===================================================== */
SELECT id_cliente, nome, sobrenome,
       NVL(telefone, 'Unknown phone number') AS Phone_Number
FROM tb_clientes;
-- Replaces NULL phone values with default text

SELECT id_cliente, nome, sobrenome,
       NVL(dt_nascimento, '22/JUN/2013') AS "Birth Date"
FROM tb_clientes;
-- Replaces NULL dates with a default date


/* =====================================================
    9. COMPARING LENGTHS WITH NULLIF
   ===================================================== */
SELECT nome, LENGTH(nome) "expr1",
       sobrenome, LENGTH(sobrenome) "expr2",
       NULLIF(LENGTH(nome), LENGTH(sobrenome)) "result"
FROM tb_funcionarios;
-- Returns NULL if both lengths are equal


/* =====================================================
    10. SUBSTITUTION WITH COALESCE
   ===================================================== */
SELECT id_cliente, nome, sobrenome,
       COALESCE(dt_nascimento, TO_DATE('22/JUN/2013')) AS "Birth Date"
FROM tb_clientes;
-- Returns the first non-null value among the arguments


/* =====================================================
    11. REMOVE DUPLICATES WITH DISTINCT
   ===================================================== */
SELECT DISTINCT id_cliente
FROM tb_compras;
-- Removes duplicate customer IDs


/* =====================================================
    12. COMPARISON OPERATORS
   ===================================================== */
SELECT *
FROM tb_clientes
WHERE id_cliente <> 101;
-- Not equal to 101

SELECT id_produto, nm_produto
FROM tb_produtos
WHERE id_produto > 2;
-- Greater than 2

SELECT ROWNUM id_produto, nm_produto
FROM tb_produtos
WHERE ROWNUM <= 3;
-- Returns only the first 3 rows


/* =====================================================
    13. OPERATORS ANY AND ALL
   ===================================================== */
SELECT *
FROM tb_clientes
WHERE id_cliente > ANY(2, 3, 4);
-- Greater than at least one value in the list

SELECT *
FROM tb_clientes
WHERE id_cliente > ALL(2, 3, 4);
-- Greater than all values in the list


/* =====================================================
    14. OPERATOR LIKE
   ===================================================== */
SELECT *
FROM tb_clientes
WHERE nome LIKE '_u%';
-- Searches for names where the second letter is 'u'


/* =====================================================
    15. OPERATOR ESCAPE
   ===================================================== */
SELECT *
FROM tb_promocao
WHERE nome LIKE '%\%%' ESCAPE '\';
-- Searches for the literal character '%' in text


/* =====================================================
    16. OPERATOR IN AND NOT IN
   ===================================================== */
SELECT * 
FROM tb_clientes
WHERE id_cliente NOT IN(2, 3, 5);
-- Excludes customers with IDs 2, 3, and 5

SELECT *
FROM tb_clientes
WHERE id_cliente NOT IN (2, 3, 5, NVL(NULL, 0));
-- Demonstrates the issue with NOT IN when NULL values are present
