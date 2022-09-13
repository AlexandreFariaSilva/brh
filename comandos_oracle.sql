--novo_colaborador
INSERT INTO BRH.PAPEL (ID, NOME) 
VALUES (
8,
'Especialista de Negócios');

INSERT INTO brh.colaborador (
    matricula,
    cpf,
    nome,
    email_pessoal,
    email_corporativo,
    salario,
    departamento,
    cep,
    complemento_endereco
) VALUES (
    'F124',
    '000.123.456-99',
    'Fulano de Tal',
    'fulano@email.com',
    'fulano@corp.com',
    '9999',
    'DEPTI',
    '71222-100',
    'Casa 10'
);

INSERT INTO brh.telefone_colaborador (NUMERO, COLABORADOR, TIPO) 
VALUES (
    '(61) 9 9999-9999',
    'F124',
    'M'
);

INSERT INTO brh.projeto (ID, NOME, RESPONSAVEL, INICIO, FIM) 
VALUES (
    '9',
    'BI',
    'F124',
     '24/08/22',
    '24/08/23'
);

INSERT INTO brh.atribuicao (COLABORADOR, PROJETO, PAPEL)
VALUES (
    'F124',
    '9',
    '8'
);


-- relatorio de departamento 
SELECT NOME, SIGLA FROM brh.DEPARTAMENTO
ORDER BY NOME;

-- relatorio de dependentes
SELECT C.MATRICULA, C.NOME AS "Nome Colaborador", D.NOME AS "Nome Dependente", D.DATA_NASCIMENTO, D.PARENTESCO
FROM brh.COLABORADOR C, brh.DEPENDENTE D
WHERE C.MATRICULA = D.COLABORADOR
ORDER BY C.NOME, D.NOME;

--relatorio analitico
SELECT C.NOME AS "Nome colaborador",
P.NOME AS "NOME DO PROJETO",
D.NOME AS "NOME DEPARTAMENTO",
B.NOME AS "NOME DO CHEFE",
L.NOME AS "PAPEL",
T.NUMERO AS "NUMERO COLABORADOR",
N.NOME AS "NOME DEPENDENTE"
FROM BRH.ATRIBUICAO A
RIGHT JOIN BRH.COLABORADOR C
ON C.MATRICULA = A.COLABORADOR
INNER JOIN BRH.PROJETO P
ON P.ID = A.PROJETO
INNER JOIN BRH.DEPARTAMENTO D
ON D.SIGLA = C.DEPARTAMENTO 
INNER JOIN BRH.COLABORADOR B
ON B.MATRICULA = D.CHEFE
INNER JOIN BRH.PAPEL L
ON A.PAPEL = L.ID
INNER JOIN BRH.TELEFONE_COLABORADOR T
ON C.MATRICULA = T.COLABORADOR
INNER JOIN BRH.DEPENDENTE N
ON C.MATRICULA = N.COLABORADOR
;
