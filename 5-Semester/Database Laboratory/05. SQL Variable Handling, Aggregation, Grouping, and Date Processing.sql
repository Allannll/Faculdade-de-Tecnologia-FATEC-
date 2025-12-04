------------------------------------------------------------
-- Variable Definition and Basic Query
------------------------------------------------------------

-- Define a variable for product ID
DEFINE v_id_produto = 7;

-- Query using the defined variable
SELECT nm_produto, id_produto
FROM tb_produtos
WHERE id_produto = &v_id_produto;

-- Remove the variable from memory
UNDEFINE v_id_produto;

-- Display the current database user
SHOW USER;


------------------------------------------------------------
-- Script Configuration
------------------------------------------------------------
SET ECHO OFF;
SET VERIFY OFF;
SET FEEDBACK ON;
SET SERVEROUTPUT ON;


------------------------------------------------------------
-- Basic Select Examples
------------------------------------------------------------

-- Select all products
SELECT id_produto, nm_produto, vl_preco
FROM tb_produtos;

-- Select with filtering
SELECT id_produto, nm_produto
FROM tb_produtos
WHERE vl_preco > 50;


------------------------------------------------------------
-- Aggregate Functions
------------------------------------------------------------

-- Calculate the total number of products
SELECT COUNT(*) AS total_products
FROM tb_produtos;

-- Average price of products
SELECT AVG(vl_preco) AS average_price
FROM tb_produtos;

-- Highest and lowest price
SELECT MAX(vl_preco) AS max_price,
       MIN(vl_preco) AS min_price
FROM tb_produtos;

-- Sum of all product prices
SELECT SUM(vl_preco) AS total_price_sum
FROM tb_produtos;


------------------------------------------------------------
-- Grouping Data
------------------------------------------------------------

-- Group products by category and calculate statistics
SELECT id_categoria,
       COUNT(*) AS total_products,
       AVG(vl_preco) AS average_price
FROM tb_produtos
GROUP BY id_categoria;

-- Group with HAVING (filter groups)
SELECT id_categoria,
       COUNT(*) AS total_products
FROM tb_produtos
GROUP BY id_categoria
HAVING COUNT(*) > 5;


------------------------------------------------------------
-- Ordering Results
------------------------------------------------------------

-- Order products by name
SELECT id_produto, nm_produto
FROM tb_produtos
ORDER BY nm_produto ASC;

-- Order products by price (higher first)
SELECT id_produto, nm_produto, vl_preco
FROM tb_produtos
ORDER BY vl_preco DESC;


------------------------------------------------------------
-- Date Handling
------------------------------------------------------------

-- Select orders within a date range
SELECT id_pedido, dt_pedido, vl_total
FROM tb_pedidos
WHERE dt_pedido BETWEEN TO_DATE('2024-01-01', 'YYYY-MM-DD')
                    AND TO_DATE('2024-12-31', 'YYYY-MM-DD');

-- Extract year and month from date
SELECT id_pedido,
       EXTRACT(YEAR FROM dt_pedido) AS order_year,
       EXTRACT(MONTH FROM dt_pedido) AS order_month
FROM tb_pedidos;

-- Group orders by month
SELECT EXTRACT(MONTH FROM dt_pedido) AS month_number,
       COUNT(*) AS total_orders
FROM tb_pedidos
GROUP BY EXTRACT(MONTH FROM dt_pedido)
ORDER BY month_number;


------------------------------------------------------------
-- End of Script
------------------------------------------------------------
PROMPT Script execution completed.