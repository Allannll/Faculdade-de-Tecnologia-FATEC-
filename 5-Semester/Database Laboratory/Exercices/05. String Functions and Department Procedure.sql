--Exercício 1
SELECT nome, sobrenome
FROM tb_clientes
WHERE nome LIKE '%li%';

--Exercício 2
SELECT 
    nome,
    sobrenome,
    CONCAT(LEFT(nome, 1), LEFT(sobrenome, 10)) AS nome_formal
FROM tb_funcionarios
WHERE LENGTH(nome) + 1 + LENGTH(sobrenome) > 10;

--Exercício 3
SELECT
    EXTRACT(YEAR FROM data_saida) AS ano_saida,
    id_funcao,
    COUNT(id_funcao) AS qtd_funcionarios
FROM tb_funcionarios
GROUP BY EXTRACT(YEAR FROM data_saida), id_funcao
GROUP BY 1 ASC;

--Exercício 4
SELECT 
    DATENAME(WEEKDAY, data_admissao) AS dia_semana,
    COUNT(*) AS total_contratados
FROM tb_funcionarios
GROUP BY DATENAME(WEEKDAY, data_admissao)
HAVING COUNT(*) >= 20
ORDER BY total_contratados DESC;

--Exercício 5
CREATE OR REPLACE PROCEDURE sp_questao_05 (
    id_departamento IN tb_departamento_cp.id_departamento%TYPE
) IS
    v_nome      tb_departamento_cp.nome_departamento%TYPE;
    v_primeira  CHAR(1);
BEGIN
    -- Buscar o nome do departamento
    SELECT nome_departamento
    INTO v_nome
    FROM tb_departamento_cp
    WHERE id_departamento = id_departamento;

    -- Capturar a primeira letra
    v_primeira := SUBSTR(v_nome, 1, 1);

    -- Verificar vogal ou consoante e atualizar
    IF v_primeira IN ('A','E','I','O','U','a','e','i','o','u') THEN

        UPDATE tb_departamento_cp
        SET nome_departamento = UPPER(nome_departamento)
        WHERE id_departamento = id_departamento;

        DBMS_OUTPUT.PUT_LINE(
            'O nome do Depto ' || v_nome ||
            ' foi convertido para maiúsculo'
        );

    ELSE

        UPDATE tb_departamento_cp
        SET nome_departamento = LOWER(nome_departamento)
        WHERE id_departamento = id_departamento;

        DBMS_OUTPUT.PUT_LINE(
            'O nome do Depto ' || v_nome ||
            ' foi convertido para minúsculo'
        );

    END IF;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Depto: ' || id_departamento || ' não encontrado!!');
END;
/
