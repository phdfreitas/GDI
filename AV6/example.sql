-- CRIAÇÃO DOS OBJETOS: exercício pro mongo TEMPORARY-- sharear com lúcio
--pessoas
create or replace type tp_pessoa as object (
    id integer,
    nome varchar,
    endereco varchar,
    telefone integer,
    cpf, integer

    member procedure pessoainfo(self funcionario)
) not final;
/
--subtipos: pacientes, dentistas, funcionários da clínica (chamados de ADM)
create or replace type tp_paciente under tp_pessoa(
    consulta tp_consulta,
    plano_saude varchar

) final;
/
create or replace type tp_dentista under tp_pessoa(
    cro integer,
    consulta tp_consulta,
    agenda tp_agenda,
    lista_materais tp_mat_list

) final;
/
create or replace type tp_funcionario under tp_pessoa(
    contrato tp_contrato

) final;
/
-- consulta
create or replace type tp_consulta(
    data_consulta integer,
    hora_inicio integer,
    hora_fim integer,
    dentista tp_dentista,
    paciente tp_paciente
);
/
-- material
create or replace type tp_material(
    id integer,
    nome varchar,
    quantos integer,
    custo_unitario integer
);
/

-- agenda
create or replace type tp_agenda(
    dentista tp_dentista,
    consultas tp_consulta
);
/


-- CRIAÇÃO DAS TABELAS
-- tabelas pra pessoas

create table tb_pacientes of tp_paciente(
    cpf unique,
    id primary key
);
/
create table tb_dentistas of tp_dentista(
    cpf unique,
    cro unique,
    id primary key
);
/

create table tp_funcionarios of tp_funcionario(
    cpf unique,
    id primary key
);
/

--consulta 
create table tb_consultas of tp_consulta(
    dentista scope is tb_dentistas,
    paciente scope is tb_paciente
);
/

-- agendamentos

create table tb_agendamento of tp_agenda(
    dentista scope is tb_dentistas,
    consulta scope is tb_consulta
);
/
--lista de materiais
create table tb_materiais of tp_material(
    id primary key
);
/

-- nested table
-- alocação de materiais
create table tb_lista_materiais of tp_agenda(
    dentista scope is tb_dentistas,
    consulta scope is tb_consulta
);
/



-- POPULAR E INSERIR
-- QUERIES
