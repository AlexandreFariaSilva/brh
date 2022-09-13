-- excluir departamento SECAP
delete from atribuicao 
 where colaborador in ('H123', 'M123', 'R123', 'W123');
  
delete from telefone_colaborador 
 where colaborador in ('H123', 'M123', 'R123', 'W123');
  
delete from dependente
 where colaborador in ('H123', 'M123', 'R123', 'W123');

update departamento 
   set chefe = 'A123'
 where sigla = 'SECAP';
 
delete from colaborador 
 where departamento = 'SECAP';
 
delete from departamento 
 where sigla = 'SECAP';
 
 -- RELATORIO DE DEPENDENTES

SELECT C.MATRICULA, C.NOME AS "Nome Colaborador", D.NOME AS "Nome Dependente", D.DATA_NASCIMENTO, D.PARENTESCO
FROM COLABORADOR C, DEPENDENTE D
WHERE C.MATRICULA = D.COLABORADOR
ORDER BY C.NOME, D.NOME;


-- RELATORIO DE DEPARTAMENTOS
SELECT NOME, SIGLA FROM DEPARTAMENTO
ORDER BY NOME;

-- NOVO COLABORADOR EM PROJETO
INSERT INTO PAPEL VALUES (
8,
"Especialista de Negócios");

INSERT INTO COLABORADOR VALUES (
"F124",
"000.123.456.99",
"Fulano de Tal",
"fulano@email.com",
"fulano@corp.com",
"9999.99",
"DEPTI",
"71222-100",
"Casa 10");

INSERT INTO TELEFONE_COLABORADOR VALUES (
"(61) 9 9999-9999",
"F124",
"M"
);

INSERT INTO PROJETO VALUES (
"5",
"BI",
"F124",
"2022-08-24",
"2023-08-14"
);

INSERT INTO ATRIBUICAO VALUES (
"F124",
"5",
"8"
);

