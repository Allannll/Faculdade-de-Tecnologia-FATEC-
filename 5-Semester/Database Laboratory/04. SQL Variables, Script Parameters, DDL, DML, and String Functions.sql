------------------------------------------------------------
-- VARIABLES AND BASIC COMMANDS
------------------------------------------------------------

-- Define a substitution variable
DEFINE v_id_product = 7;

SELECT product_name, product_id
FROM tb_products
WHERE product_id = &v_id_product;

-- Remove variable
UNDEFINE v_id_product;

-- Show current user
SHOW USER;


------------------------------------------------------------
-- SCRIPT 1 (Using DEFINE variable)
------------------------------------------------------------
SET ECHO OFF
SET VERIFY OFF

SELECT product_id, product_name, price
FROM tb_products
WHERE product_id = &v_id_product;

-- End of script 1

-- Script 1 call example
-- @ C:\temp\test_1.sql


------------------------------------------------------------
-- SCRIPT 2 (Using ACCEPT)
------------------------------------------------------------
SET ECHO OFF
SET VERIFY OFF

ACCEPT v_id_product NUMBER FORMAT 99 PROMPT 'Enter the product ID: '

SELECT product_id, product_name, price
FROM tb_products
WHERE product_id = &v_id_product;

-- End of script 2

-- Script 2 call example:
-- @ C:\temp\test_2.sql


------------------------------------------------------------
-- SCRIPT 3 (Using positional parameter &1)
------------------------------------------------------------
SET ECHO OFF
SET VERIFY OFF

SELECT product_id, product_name, price
FROM tb_products
WHERE product_id = &1;

-- End of script 3

-- Script 3 call example:
-- @ C:\temp\test_3.sql 10


------------------------------------------------------------
-- SCRIPT 4 (Multiple parameters)
------------------------------------------------------------
SET ECHO OFF
SET VERIFY OFF

SELECT product_id, product_name, price
FROM tb_products
WHERE product_id = &1
AND price > &2;

-- End of script 4

-- Script 4 call example:
-- @ C:\temp\test_4.sql 6 19.99


------------------------------------------------------------
-- CREATING A TEST TABLE
------------------------------------------------------------
CREATE TABLE tb_test (
    id      INTEGER,
    value   VARCHAR2(100)
);

------------------------------------------------------------
-- ANONYMOUS BLOCK: Loading data in loop
------------------------------------------------------------
BEGIN
    FOR v_loop IN 1..100000 LOOP
        INSERT INTO tb_test(id, value)
        VALUES (v_loop, 'DBA_' || v_loop);
    END LOOP;

    COMMIT;
END;


-- Query test table
SELECT *
FROM tb_test
ORDER BY 1 DESC;


------------------------------------------------------------
-- DELETE vs TRUNCATE EXPLANATION
------------------------------------------------------------
-- DELETE = DML, slower, scans rows, allows ROLLBACK
-- TRUNCATE = DDL, faster, no row scanning, does NOT allow ROLLBACK
-- TRUNCATE internally performs DROP TABLE + CREATE TABLE


------------------------------------------------------------
-- WORKING WITH PROCEDURES
------------------------------------------------------------

-- Table for procedure tests
CREATE TABLE tb_customer_test(
    id_customer INTEGER,
    ds_customer VARCHAR2(40),
    nm_customer VARCHAR2(40),
    value       NUMBER(5,2),
    fg_active   INTEGER,
    CONSTRAINT pk_tb_customer_test PRIMARY KEY (id_customer)
);


------------------------------------------------------------
-- PROCEDURE: manipulates INSERT / UPDATE / DELETE
------------------------------------------------------------
CREATE OR REPLACE PROCEDURE manipulate_data(
    p_id_customer IN tb_customer_test.id_customer%TYPE,
    p_description IN tb_customer_test.ds_customer%TYPE,
    p_name        IN tb_customer_test.nm_customer%TYPE,
    p_value       IN tb_customer_test.value%TYPE,
    p_fg_active   IN tb_customer_test.fg_active%TYPE,
    p_option      IN CHAR
)
AS
    v_control INTEGER;
BEGIN
    -- Check if active record exists
    SELECT COUNT(1) INTO v_control
    FROM tb_customer_test
    WHERE id_customer = p_id_customer
    AND fg_active = 1;

    -- INSERT option
    IF (p_option = 'I') THEN
        IF (v_control != 1) THEN
            INSERT INTO tb_customer_test
                (id_customer, ds_customer, nm_customer, value, fg_active)
            VALUES
                (p_id_customer, p_description, p_name, p_value, p_fg_active);

            COMMIT;
            dbms_output.put_line('Customer inserted successfully');
        ELSE
            dbms_output.put_line('Customer ID already exists');
        END IF;
    END IF;

    -- UPDATE option
    IF (p_option = 'U') THEN
        IF (v_control = 1) THEN
            UPDATE tb_customer_test
            SET ds_customer = p_description,
                nm_customer = p_name,
                value       = p_value,
                fg_active   = p_fg_active
            WHERE id_customer = p_id_customer
            AND fg_active = 1;

            COMMIT;
            dbms_output.put_line('Customer updated successfully');
        ELSE
            dbms_output.put_line('Customer ID not found');
        END IF;
    END IF;

    -- DELETE option
    IF (p_option = 'D') THEN
        IF (v_control = 1) THEN
            DELETE FROM tb_customer_test
            WHERE id_customer = p_id_customer
            AND fg_active = 1;

            COMMIT;
            dbms_output.put_line('Customer deleted successfully');
        ELSE
            dbms_output.put_line('Customer ID not found');
        END IF;
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
END manipulate_data;


------------------------------------------------------------
-- CALLING PROCEDURE
------------------------------------------------------------

-- Insert option
CALL manipulate_data(1, 'Customer 1', 'Name Customer 1', 24, 1, 'I');
CALL manipulate_data(2, 'Customer 2', 'Name Customer 2', 27, 1, 'I');

-- Update option
CALL manipulate_data(2, 'Customer Changed', 'Changed', 99, 1, 'U');

-- Delete option
CALL manipulate_data(2, NULL, NULL, NULL, NULL, 'D');

-- Query table
SELECT *
FROM tb_customer_test;


------------------------------------------------------------
-- TESTING PROCEDURE IN ANONYMOUS BLOCK
------------------------------------------------------------
SET SERVEROUTPUT ON

BEGIN
    manipulate_data(3, NULL, NULL, NULL, NULL, 'D');
END;


------------------------------------------------------------
-- STRING FUNCTIONS
------------------------------------------------------------

-- ASCII / CHR
SELECT A, CHR(65), CHR(122), CHR(90), CHR(48), CHR(57)
FROM dual;

SELECT CHR(97), CHR(65), CHR(122), CHR(90), CHR(48), CHR(57)
FROM dual;

-- CONCAT
SELECT CONCAT(first_name, last_name)
FROM tb_employees;

-- INITCAP
SELECT product_id, INITCAP(product_description)
FROM tb_products;

-- INSTR
SELECT product_name, INSTR(product_name, 'Line')
FROM tb_products
WHERE product_id = 13;

-- LENGTH
SELECT product_name, LENGTH(product_name)
FROM tb_products;

-- UPPER and LOWER
SELECT product_name, UPPER(product_name), LOWER(product_name)
FROM tb_products;

-- RPAD and LPAD
SELECT RPAD(product_name, 30, '.'), LPAD(price, 8, '+')
FROM tb_products
WHERE product_id < 15;

-- TRIM / LTRIM / RTRIM
SELECT product_name, TRIM(product_name), LTRIM(product_name), RTRIM(product_name)
FROM tb_products;

-- NVL
SELECT id_customer, NVL(phone, 'Phone not available')
FROM tb_customers
ORDER BY id_customer DESC;

-- NVL2
SELECT id_customer,
       NVL2(phone, 'Phone exists', 'Phone not available')
FROM tb_customers
ORDER BY id_customer DESC;

-- REPLACE
SELECT REPLACE(product_name, 'Line', 'Brumemo')
FROM tb_products
WHERE product_id = 13;

SELECT *
FROM tb_customers;

-- SOUNDEX
SELECT last_name
FROM tb_customers
WHERE SOUNDEX(last_name) = SOUNDEX('Souza');

-- SUBSTR
SELECT product_name, SUBSTR(product_name, 2, 7)
FROM tb_products
WHERE product_id < 15;