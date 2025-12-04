-- 1. Criação da tabela TB_FUNCAO e consultas

CREATE TABLE TB_FUNCAO (
    id_funcao INT,
    ds_funcao VARCHAR(100) CONSTRAINT nn_tb_funcao_ds_funcao NOT NULL,
    base_salario NUMBER(15, 2),
    teto_salario NUMBER(15, 2),
    CONSTRAINT pk_tb_funcao_id_funcao PRIMARY KEY (id_funcao)
);

INSERT INTO TB_FUNCAO (id_funcao, ds_funcao, base_salario, teto_salario) 
VALUES (1, 'Administrador', 5000.00, 8000.00);

INSERT INTO TB_FUNCAO (id_funcao, ds_funcao, base_salario, teto_salario) 
VALUES (2, 'Analista de Sistemas', 4000.00, 7000.00);

INSERT INTO TB_FUNCAO (id_funcao, ds_funcao, base_salario, teto_salario) 
VALUES (3, 'Técnico de Suporte', 2500.00, 4000.00);

INSERT INTO TB_FUNCAO (id_funcao, ds_funcao, base_salario, teto_salario) 
VALUES (4, 'Gerente de RH', 5000.00, 8000.00);

INSERT INTO TB_FUNCAO (id_funcao, ds_funcao, base_salario, teto_salario) 
VALUES (5, 'Presidente Geral', 8000.00, 9000.00);

SELECT 'O identificador da ' || ds_funcao || ' é o ID: ' || id_funcao AS "Descrição da Função"
FROM TB_FUNCAO;

-- 2. Cálculo de área

SELECT (22.0/7.0) * 6000 * 6000 AS "m² Área"
FROM DUAL;

-- 3. Criação da tabela TB_DEPARTAMENTO e consulta com REGEXP

CREATE TABLE TB_DEPARTAMENTO (
    id_departamento INT,
    nm_departamento VARCHAR(100) CONSTRAINT nn_tb_departamento_nm_departamento NOT NULL,
    CONSTRAINT pk_tb_departamento_id_departamento PRIMARY KEY (id_departamento)
);

INSERT INTO TB_DEPARTAMENTO (id_departamento, nm_departamento) VALUES (1, 'Marketing');

INSERT INTO TB_DEPARTAMENTO (id_departamento, nm_departamento) VALUES (2, 'Recursos Humanos');

INSERT INTO TB_DEPARTAMENTO (id_departamento, nm_departamento) VALUES (3, 'Suporte Ao Cliente');

SELECT nm_departamento
FROM TB_DEPARTAMENTO
WHERE REGEXP_LIKE(nm_departamento, 'ing$', 'i');

-- 4. Consulta com filtro REGEXP

SELECT ds_funcao, base_salario, (teto_salario - base_salario) AS "Diferença"
FROM TB_FUNCAO
WHERE REGEXP_LIKE(ds_funcao, '(presidente|gerente)', 'i')
ORDER BY "Diferença" DESC, ds_funcao DESC;

-- 5. Criação da tabela TB_EMPREGADOS e consulta com variáveis

CREATE TABLE TB_EMPREGADOS(
    id_empregado INT,
    nome VARCHAR2(50) NOT NULL,
    salario NUMBER(6,2) NOT NULL,
    CONSTRAINT pk_tb_empregados_id_empregado PRIMARY KEY(id_empregado)
);

INSERT INTO TB_EMPREGADOS (id_empregado, nome, salario)
VALUES (1, 'João Silva', 4500.00);

INSERT INTO TB_EMPREGADOS (id_empregado, nome, salario)
VALUES (2, 'Maria Oliveira', 6200.00);

INSERT INTO TB_EMPREGADOS (id_empregado, nome, salario)
VALUES (3, 'Carlos Pereira', 3800.00);
SELECT 
    id_empregado,
    nome,
    salario,
    salario * 12 AS salario_anual,
    &percentual_aliquota AS aliquota,
    salario * 12 * &percentual_aliquota / 100 AS aliquota_salario
FROM TB_EMPREGADOS
WHERE id_empregado = &id_empregado;