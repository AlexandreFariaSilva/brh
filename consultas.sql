--Filtrar dependentes
SELECT C.NOME AS "NOME_COLABORADOR",
       D.NOME AS "NOME_DEPENDENTE",
       D.DATA_NASCIMENTO
FROM BRH.DEPENDENTE D
INNER JOIN BRH.COLABORADOR C ON C.MATRICULA = D.COLABORADOR
WHERE (D.NOME LIKE '%h%'
       OR D.NOME LIKE '%H%')
  OR TO_CHAR (D.DATA_NASCIMENTO,
              'MM') IN ('04',
                        '05',
                        '06')
ORDER BY C.NOME,
         D.NOME;
--listar colaborador com maior salario
SELECT C.NOME,
       C.SALARIO
FROM BRH.COLABORADOR C
WHERE C.SALARIO =
    (SELECT MAX(C.SALARIO)
     FROM BRH.COLABORADOR C);

--Relatório de Senioridade
SELECT C.MATRICULA,
       C.NOME,
       C.SALARIO,
       (CASE
            WHEN C.SALARIO <= 3000 THEN 'Júnior'
            WHEN C.SALARIO > 3000
                 AND C.SALARIO <= 6000 THEN 'Pleno'
            WHEN C.SALARIO > 6000
                 AND C.SALARIO <= 20000 THEN 'Sênior'
            ELSE 'Corpo diretor'
        END) AS SENIORIDADE
FROM BRH.COLABORADOR C
ORDER BY SENIORIDADE,
         C.NOME;

--Listar Colaboradores em projetos
SELECT DISTINCT D.NOME as "Nome_Departamento",
                P.NOME as "Nome_Projeto",
                COUNT(*)
FROM BRH.COLABORADOR C
INNER JOIN BRH.DEPARTAMENTO D ON C.DEPARTAMENTO = D.SIGLA
INNER JOIN BRH.ATRIBUICAO A ON A.COLABORADOR = C.MATRICULA
INNER JOIN BRH.PROJETO P ON P.ID = A.PROJETO
GROUP BY D.NOME,
         P.NOME
ORDER BY D.NOME,
         P.NOME;

--listar colaboradores com mais dependentes 
SELECT C.NOME,
       COUNT(*) QUANTIDADE_DEPENDENTES
FROM BRH.COLABORADOR C
INNER JOIN BRH.DEPENDENTE D ON C.MATRICULA = D.COLABORADOR
GROUP BY C.NOME
HAVING COUNT (*) >= 2
ORDER BY QUANTIDADE_DEPENDENTES DESC,
         C.NOME;

-- Listar faixa et�ria dos dependentes
SELECT CPF AS "CPF_Dependente",
       NOME AS "Nome_dependente",
       TO_CHAR(DATA_NASCIMENTO, 'DD/MM/YYYY'),
       PARENTESCO,
       COLABORADOR AS "Matricula",
       TRUNC((SYSDATE - DATA_NASCIMENTO)/365) IDADE_DEPENDENTE,
       (CASE
            WHEN TRUNC((SYSDATE - DATA_NASCIMENTO)/365) < 18 THEN 'Menor de idade'
            ELSE 'Maior de idade'
        END) AS "Faixa Etária"
FROM BRH.DEPENDENTE
ORDER BY COLABORADOR, 
         NOME;











