-- ID, NOME DOS FUNCIONARIOS QUE BATERAM PONTO
SELECT VALUE(P).ponto_funcionario.id_pessoa AS ID, 
    VALUE(P).ponto_funcionario.nome AS NOME FROM TB_PONTO P;

-- Quais os funcionários que NÃO bateram ponto e que moram em Recife.
SELECT VALUE(F).nome FROM TB_FUNCIONARIO F 
    WHERE VALUE(F).endereco_pessoa.cep IN('12345678') AND 
        VALUE(F).id_pessoa NOT IN (SELECT VALUE(P).ponto_funcionario.id_pessoa FROM TB_PONTO P); -- não bateram ponto.

-- Numero, Nome e a Empresa que um departamente pertece ordenado em ordem alfabetica do departamento
SELECT D.numero AS NUMERO, D.nome NOME, D.empresa_dep.nome_fantasia AS EMPRESA 
    FROM TB_DEPARTAMENTO D WHERE D.empresa_dep.nome_fantasia 
        NOT IN ('APPLE', 'SAMSUNG') ORDER BY D.nomeDepartamento();

-- Nome e Salário dos funcionários com salários entre 1500 e 3000
SELECT F.nome AS NOME, VALUE(F).numero_contrato_func.salario_bruto_mensal AS SALARIO 
    FROM TB_FUNCIONARIO F WHERE VALUE(F).numero_contrato_func.salario_bruto_mensal BETWEEN 1500 AND 3000; 


--testar queries
-- 5 quais sócios investem na empresa antes de 2019

SELECT S.nome AS NOME FROM TB_SOCIO S WHERE VALUE(S).data_afiliacao < 01 JAN-2019; --checar formato da data

-- quais sócios não moram em SP
SELECT S.nome AS NOME FROM TB_SOCIO S WHERE VALUE(S).endereco_pessoa.estado NOT IN ('SP');

-- gerentes (clt3) em ordem alfabética
SELECT F.nome AS NOME FROM TB_FUNCIONARIO F WHERE VALUE(F).numero_contrato_func.cargo = 'CLT 3' ORDER BY NOME;

-- quantos funcionários DA DISNEY (id = 9) são vendedores (clt1)
SELECT COUNT(F.nome) AS NOME FROM TB_FUNCIONARIO F WHERE VALUE(F).numero_contrato_func.cargo = 'CLT 1' AND  VALUE(F).id_empresa_func = 9;

-- quantos funcionários largam antes das 16h no dia 28/02
SELECT COUNT(S.protocolo_ponto) AS protocolo_ponto FROM TB_SAIDA S WHERE VALUE(S).hora_saida < 16:00:00; --checar formato da hora

-- 10) quantos funcionários ganham pelo menos 8000/mes

SELECT COUNT(F.nome) AS NOME FROM TB_FUNCIONARIO F VALUE(F).numero_contrato_func.salario_bruto_mensal >= 8000

-- qual o dia de pagamento mais frequente?

SELECT COUNT(P.pag_data) AS PAGAMENTO FROM TB_PAGAMENTO P GROUP BY P.pag_data ORDER BY PAGAMENTO DESC LIMIT 1;

-- quais os diferentes tipos de contrato

SELECT DISTINCT C.tipo_contrato AS TIPO FROM TB_CONTRATO;

-- quantos funcionários são pj e tem benefícios listados em ordem alfabética

SELECT F.nome AS NOME FROM TB_FUNCIONARIO F WHERE VALUE(F).numero_contrato_func.cargo = 'CLT 3' ORDER BY NOME;

-- quais funcionários ganharam acrescimo e quais os cargos
SELECT F.nome AS NOME, F.numero_contrato_func.cargo AS CARGO, A.num_contrato FROM TB_FUNCIONARIO F, TB_ACRESCIMO A WHERE 
    VALUE(F).numero_contrato_func.numero_contrato = A.num_contrato
        ORDER BY CARGO;

-- 15) selecionar todos os gerentes (CLT 3) da empresa 6
SELECT F.numero_contrato_func.cargo FROM TB_FUNCIONARIO AS F WHERE VALUE(F).numero_contrato_func.cargo = 'CLT 3' 
    INNER JOIN F.id_empresa_func = 6;

-- selecionar todas as empresas que tem dept de mkt
SELECT E.nome_fantasia AS NOME, D.nome FROM TB_EMPRESA E, TB_DEPARTAMENTO AS D WHERE VALUE(D).empresa_dep = E.id 
    INNER JOIN D.nome = 'MARKETING';


-- CONSULTAS NESTED_TABLE
    SELECT * FROM TABLE(SELECT E.lista_emails FROM TB_EMAILS_FUNCIONARIOS E WHERE E.id_pessoa_email = 17);

    SELECT E.id_pessoa_email, T.* FROM TB_EMAILS_FUNCIONARIOS E, TABLE(E.lista_emails) T;
