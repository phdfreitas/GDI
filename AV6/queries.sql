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

-- Nome e valor do investimento dos sócios com data de afiliação de 2018 para trás. 
SELECT S.nome AS NOME, S.valor_investimento FROM TB_SOCIO S 
    WHERE data_afiliacao < '01-JAN-2019';

-- quais sócios não moram em SP
SELECT S.nome AS NOME FROM TB_SOCIO S WHERE VALUE(S).endereco_pessoa.estado NOT IN ('SP');

-- Funcionários de cargo clt3 em ordem alfabética
SELECT F.nome AS NOME, VALUE(F).numero_contrato_func.salario_bruto_mensal AS SALARIO 
    FROM TB_FUNCIONARIO F WHERE VALUE(F).numero_contrato_func.cargo = 'CLT 3' ORDER BY NOME;

-- Quantos funcionários DA DISNEY (id = 9) são (clt1)
SELECT COUNT(F.nome) AS QTD FROM TB_FUNCIONARIO F 
    WHERE VALUE(F).numero_contrato_func.cargo = 'CLT 1' AND  VALUE(F).id_empresa_func.id_pessoa = 9;

-- Quantos funcionários ganham pelo menos 8000 reais. 
SELECT COUNT(F.nome) AS QTD FROM TB_FUNCIONARIO F WHERE 
    VALUE(F).numero_contrato_func.salario_bruto_mensal >= 8000;
    
-- Qual o dia de pagamento mais frequente?
SELECT P.pag_data AS DATA_PAGAMENTO, COUNT(P.pag_data) AS QNT_PAGAMENTOS FROM 
    TB_PAGAMENTO P GROUP BY P.pag_data ORDER BY P.pag_data DESC;

-- Quais os diferentes tipos de contrato
SELECT DISTINCT C.tipo_contrato AS TIPO FROM TB_CONTRATO C;

-- Quais funcionários ganharam acrescimo e quais seus cargos 
SELECT F.nome AS NOME, F.numero_contrato_func.cargo AS CARGO, A.codigo_vantagem.descricao AS VANTAGEM 
    FROM TB_FUNCIONARIO F, TB_ACRESCIMO A WHERE 
        VALUE(F).numero_contrato_func.numero_contrato = A.num_contrato.numero_contrato ORDER BY CARGO;

-- Todos os (CLT 3) da empresa 6
SELECT F.numero_contrato_func.cargo FROM TB_FUNCIONARIO F WHERE 
    VALUE(F).numero_contrato_func.cargo = 'CLT 3' AND VALUE(F).id_empresa_func.id_pessoa = 6;

-- Selecionar todas as empresas que tem dept de mkt
SELECT DEREF(empresa_dep).nome_fantasia AS EMPRESA, D.nome DEP FROM TB_DEPARTAMENTO D WHERE D.nome = 'MARKETING';

-- Os departamentos da empresa 1 usando REF 
SELECT DEREF(empresa_dep).nome_fantasia AS EMPRESA, D.nome DEP FROM TB_DEPARTAMENTO D 
    WHERE D.empresa_dep = (SELECT REF(E) FROM TB_EMPRESA E WHERE id_pessoa = 1);


SELECT S.numero_registro, S.porcetagem_nos_lucros, T.* FROM TB_SOCIO S, TABLE (SELECT E.lista_emails FROM TB_EMAILS_FUNCIONARIOS) T;

-- CONSULTAS NESTED_TABLE
    SELECT * FROM TABLE(SELECT E.lista_emails FROM TB_EMAILS_FUNCIONARIOS E WHERE E.id_pessoa_email = 17);

    SELECT E.id_pessoa_email, T.* FROM TB_EMAILS_FUNCIONARIOS E, TABLE(E.lista_emails) T;

-- CONSULTA VARRAY
SELECT F.id_func, T.* FROM TB_TELEFONES_FUNC F, TABLE(F.lista_telefones) T ORDER BY F.id_func;

SELECT D.nome, VALUE(D).empresa_dep.nome_fantasia AS EMPRESA FROM TB_DEPARTAMENTO D
    WHERE situacao = 'A' ORDER BY D.nomeDepartamento();

DECLARE
mb TP_CONTRATO;
m NUMBER;
BEGIN
SELECT VALUE(C) INTO mb FROM TB_CONTRATO C 
    WHERE C.numero_contrato = 1;

SELECT F.comparaSalario(mb) INTO m FROM TB_CONTRATO F 
    WHERE F.numero_contrato = 2;

END;
/

CREATE OR REPLACE TYPE TP_SOCIO UNDER TP_PESSOA_FISICA(
    numero_registro INTEGER,
    data_afiliacao DATE,
    valor_investimento NUMBER(10,2), 
    porcentagem_nos_lucros FLOAT(2)
    
    FINAL MAP MEMBER FUNCTION percentSocio RETURN FLOAT
    
)NOT FINAL;
/

CREATE OR REPLACE TP BODY TP_SOCIO AS 
    FINAL MAP MEMBER FUNCTION percentSocio RETURN FLOAT IS 
        d FLOAT := porcentagem_nos_lucros
    BEGIN
        RETURN d;
    END;
END;
/

SELECT VALUE(S).numero_registro, VALUE(S).porcetagem_nos_lucros, VALUE(S).lista_emails FROM TB_SOCIO S
    ORDER BY S.percentSocio(); 
