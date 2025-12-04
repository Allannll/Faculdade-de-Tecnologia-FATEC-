--Exercício 1
SELECT nome_mulher FROM tb_mulher;

--Exercício 2
INSERT INTO tb_homens VALUES 'Anderson', 'Jander', 'Rogério';

--Exercício 3
SELECT a.nome_homem, b.nome_mulher
FROM tb_homem a
INNER JOIN tb_mulher b
    ON b.id_mulher =  a.id_homem;

SELECT nome_homem, nome_mulher
FROM tb_homem
NATURAL JOIN tb_mulher;

SELECT a.nome_homem, b.nome_mulher
FROM tb_homem 
JOIN tb_mulher USING (id_mulher);

SELECT a.nome_homem, b.nome_mulher
FROM tb_homem a
JOIN tb_mulher b
    ON b.id_mulher =  a.id_homem;

SELECT a.nome_homem, b.nome_mulher
FROM tb_homem a
CROSS JOIN tb_mulher b;

SELECT a.nome_homem, b.nome_mulher
FROM tb_homem a, tb_mulher b;

--Exercício 4
SELECT a.nome_homem, b.nome_mulher
FROM tb_homem a
LEFT JOIN tb_mulher b
    ON b.id_mulher =  a.id_homem;

SELECT a.nome_homem, b.nome_mulher
FROM tb_homem a
RIGHT JOIN tb_mulher b
    ON b.id_mulher =  a.id_homem;

SELECT nome_homem, nome_mulher
FROM tb_homem
LEFT JOIN tb_mulher USING (id_mulher);

SELECT a.nome_homem, b.nome_mulher
FROM tb_homem a
RIGHT JOIN tb_mulher b
    ON b.id_mulher =  a.id_homem;

SELECT a.nome_homem, b.nome_mulher
FROM tb_homem a
FULL OUTER JOIN tb_mulher b
    ON b.id_mulher =  a.id_homem;

SELECT nome_homem, nome_mulher
FROM homem
FULL OUTER JOIN mulher USING (id_mulher);

SELECT h.nome_homem, m.nome_mulher
FROM homem h
FULL OUTER JOIN mulher m
  ON h.id_mulher = m.id_mulher;

