-- ID, NOME DOS FUNCIONARIOS QUE BATERAM PONTO
SELECT VALUE(P).ponto_funcionario.id_pessoa AS ID, 
    VALUE(P).ponto_funcionario.nome AS NOME FROM TB_PONTO P;

-- Quais os funcionários que NÃO bateram ponto e que moram em Recife.
SELECT VALUE(F).nome FROM TB_FUNCIONARIO F 
    WHERE VALUE(F).endereco_pessoa.cep IN('12345678') AND 
        VALUE(F).id_pessoa NOT IN (SELECT VALUE(P).ponto_funcionario.id_pessoa FROM TB_PONTO P) -- não bateram ponto.;

-- Numero, Nome e a Empresa que um departamente pertece ordenado em ordem alfabetica do departamento
SELECT D.numero AS NUMERO, D.nome NOME, D.empresa_dep.nome_fantasia AS EMPRESA 
    FROM TB_DEPARTAMENTO D WHERE D.empresa_dep.nome_fantasia 
        NOT IN ('APPLE', 'SAMSUNG') ORDER BY D.nomeDepartamento();

-- Nome e Salário dos funcionários com salários entre 1500 e 3000
SELECT F.nome AS NOME, VALUE(F).numero_contrato_func.salario_bruto_mensal AS SALARIO 
    FROM TB_FUNCIONARIO F WHERE VALUE(F).numero_contrato_func.salario_bruto_mensal BETWEEN 1500 AND 3000; 

-- CONSULTAS NESTED_TABLE
    SELECT * FROM TABLE(SELECT E.lista_emails FROM TB_EMAILS_FUNCIONARIOS E WHERE E.id_pessoa_email = 17);

    SELECT E.id_pessoa_email, T.* FROM TB_EMAILS_FUNCIONARIOS E, TABLE(E.lista_emails) T;
