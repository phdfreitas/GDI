-- CRIAÇÃO DOS OBJETOS

-- =-=-= Tipos que vão compor Pessoa
CREATE OR REPLACE TYPE ENDERECO AS OBJECT(
    cep VARCHAR2(10),
    rua VARCHAR2(100),
    bairro VARCHAR2(100),
    cidade VARCHAR2(100),
    estado CHAR(2)
)NOT FINAL;
/

CREATE OR REPLACE TYPE TELEFONE AS OBJECT(
    numero VARCHAR2(15)
)NOT FINAL;
/

CREATE OR REPLACE TYPE TELEFONES AS VARRAY(5) OF TELEFONE; -- 1:n (Pessoa:Telefone)
/

CREATE OR REPLACE TYPE EMAIL AS OBJECT(
    endereco_email VARCHAR2(50)
)NOT FINAL;
/

CREATE OR REPLACE TYPE EMAILS AS VARRAY(3) OF EMAIL; -- 1:n (Pessoa:Email)
/
-- =-=-= Fim composição =-=-=

CREATE OR REPLACE TYPE PESSOA AS OBJECT(
    id_pessoa INTEGER,
    endereco_pessoa ENDERECO,
    numero_pessoa INTEGER,
    telefones_pessoa TELEFONES,
    emails_pessoa EMAILS
)NOT FINAL;
/

-- =-=-= Especializações de Pessoa =-=-=
CREATE OR REPLACE TYPE EMPRESA UNDER PESSOA(
    cnpj VARCHAR2(20), 
    razao_social VARCHAR2(50),
    nome_fantasia VARCHAR2(50)
)NOT FINAL;
/

CREATE OR REPLACE TYPE PESSOA_FISICA UNDER PESSOA(
    cpf VARCHAR2(15),
    nome VARCHAR2(100),
    data_de_nascimento DATE
)NOT FINAL;
/
-- =-=-= Fim Especializações Pessoa =-=-=

CREATE OR REPLACE TYPE SOCIO UNDER PESSOA_FISICA(
    numero_registro INTEGER,
    data_afiliacao DATE,
    valor_investimento NUMBER(10,2), 
    porcentagem_nos_lucros FLOAT(2)
)NOT FINAL;
/

CREATE OR REPLACE TYPE DEPARTAMENTO AS OBJECT(
    numero INTEGER,
    empresa_dep EMPRESA, 
    nome VARCHAR2(80),
    data_criacao DATE,
    situacao CHAR(1)
)NOT FINAL;
/

CREATE OR REPLACE TYPE CONTRATO AS OBJECT(
    numero_contrato INTEGER,
    tipo_contrato VARCHAR2(80),
    data_admissao DATE, 
    cargo VARCHAR2(50), 
    salario_bruto_mensal NUMBER(10,2),
    jornada_trabalho_semanal INTEGER
)NOT FINAL;
/

CREATE OR REPLACE TYPE FUNCIONARIO UNDER PESSOA_FISICA(
    ctps VARCHAR2(15),
    numero_departamento DEPARTAMENTO,  
    numero_contrato_func CONTRATO, 
    id_empresa_func EMPRESA
)NOT FINAL;
/

CREATE OR REPLACE TYPE GERENTE UNDER FUNCIONARIO(
);
/

ALTER TYPE FUNCIONARIO ADD ATTRIBUTE (gerente_func REF GERENTE) CASCADE;

CREATE OR REPLACE TYPE CONTA_BANCARIA AS OBJECT(
    agencia INTEGER, 
    numero_conta INTEGER,
    numero_banco INTEGER, 
    id_titular PESSOA 
)NOT FINAL;
/

CREATE OR REPLACE TYPE VANTAGEM AS OBJECT(
    codigo INTEGER, 
    descricao VARCHAR2(50),
    valor NUMBER(10,2) 
)NOT FINAL;
/

CREATE OR REPLACE TYPE DESCONTO AS OBJECT(
    codigo INTEGER, 
    descricao VARCHAR2(50),
    valor NUMBER(10,2) 
)NOT FINAL;
/

CREATE OR REPLACE TYPE PONTO AS OBJECT(
    protocolo INTEGER,
    data_atual DATE, 
    ponto_funcionario FUNCIONARIO 
)NOT FINAL;
/

CREATE OR REPLACE TYPE ENTRADA AS OBJECT(
    hora_entrada VARCHAR2(12), 
    protocolo_ponto PONTO 
)NOT FINAL;
/

CREATE OR REPLACE TYPE SAIDA AS OBJECT(
    hora_entrada VARCHAR2(12), 
    protocolo_ponto PONTO 
)NOT FINAL;
/

CREATE OR REPLACE TYPE PARTICIPACAO AS OBJECT(
    part_socio SOCIO, 
    part_empresa EMPRESA 
)NOT FINAL;
/

CREATE OR REPLACE TYPE BONUS AS OBJECT(
    identificador INTEGER, 
    porcentagem_bonus FLOAT(2), 
    socio_empresa PARTICIPACAO 
)NOT FINAL;
/

-- Confirmar o not instantiable
CREATE OR REPLACE TYPE ACRESCIMO AS OBJECT(
    codigo_vantagem VANTAGEM, 
    num_contrato CONTRATO
)NOT FINAL NOT INSTANTIABLE;
/

-- Confirmar o not instantiable
CREATE OR REPLACE TYPE APLICACAO AS OBJECT(
    codigo_vantagem DESCONTO, 
    num_contrato CONTRATO
)NOT FINAL NOT INSTANTIABLE;
/

CREATE OR REPLACE TYPE PAGAMENTO AS OBJECT(
    pag_empresa EMPRESA, 
    pag_funcionario FUNCIONARIO,
    pag_data DATE
)NOT FINAL;
/
-- FIM CRIAÇÃO OBJETOS
