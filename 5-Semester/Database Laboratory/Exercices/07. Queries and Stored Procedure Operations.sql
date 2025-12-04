-- 01
SELECT
  e.nome,
  f.ds_funcao,
  e.data_admissao
FROM
  tb_empregado e
  JOIN tb_funcao f ON e.id_funcao = f.id_funcao
WHERE
  e.data_admissao BETWEEN TO_DATE('1987-02-20', 'YYYY-MM-DD') AND TO_DATE('1989-05-01', 'YYYY-MM-DD')
ORDER BY
  3 ASC;
 
-- 02
SELECT
  UPPER(e.nome) AS NOME_EMPREGADO,
  LENGTH(e.sobrenome) AS TAMANHO_SOBRENOME,
  d.nm_departamento AS DEPARTAMENTO,
  p.nm_pais AS PAIS
FROM
  tb_empregado e
  JOIN tb_departamento d ON e.id_departamento = d.id_departamento
  JOIN tb_localizacao l ON d.id_localizacao = l.id_localizacao
  JOIN tb_pais p ON l.id_pais = p.id_pais
WHERE
  e.nome LIKE 'B%' OR e.nome LIKE 'L%' OR e.nome LIKE 'A%';
 
-- 03
SELECT
  e.nome,
  d.nm_departamento,
  l.cidade,
  l.estado
FROM
  tb_empregado e
  JOIN tb_departamento d ON e.id_departamento = d.id_departamento
  JOIN tb_localizacao l ON d.id_localizacao = l.id_localizacao
WHERE
  e.percentual_comissao IS NOT NULL;
 
-- 04
SELECT
  e.nome AS Empregado,
  NVL(g.nome, 'os acionistas') AS Gerente
FROM
  tb_empregado e
  LEFT JOIN tb_empregado g ON e.id_gerente = g.id_empregado
ORDER BY
  Gerente DESC;
 
-- 05
CREATE OR REPLACE PROCEDURE sp_get_emp (
  p_id IN tb_empregado.id_empregado%TYPE
)
IS
  v_nome_completo VARCHAR2(100);
  v_ds_funcao     tb_funcao.ds_funcao%TYPE;
BEGIN
  SELECT
    e.nome || ' ' || e.sobrenome,
    f.ds_funcao
  INTO
    v_nome_completo,
    v_ds_funcao
  FROM
    tb_empregado e
    JOIN tb_funcao f ON e.id_funcao = f.id_funcao
  WHERE
    e.id_empregado = p_id;
 
  DBMS_OUTPUT.PUT_LINE('Nome: ' || v_nome_completo || ' Função: ' || v_ds_funcao);
 
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('Empregado ' || p_id || ' não localizado!!!');
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Ocorreu um erro inesperado: ' || SQLERRM);
END sp_get_emp;
/