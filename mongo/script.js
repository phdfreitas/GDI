// Criando coleção de funcionários
db.funcionarios.insert([
    {
        _id: 1,
        nome : "Aline Costa",
        cpf : "111.111.111-11",
        dataNascimento : new Date(),
        email : "aline@clinica.com.br",
        telefone : 81912345678,
        sexo : "F",
        salario : 5000,
        funcao : "Dentista",
        cro : "123456/PE",
        endereco : [{
            cep : "12345678",
            rua : "Rua 1",
            bairro : "Bairro 1",
            cidade : "Recife",
            estado : "PE"
        }]
    },
    {
        _id: 2,
        nome: "João Guilherme",
        cpf: "222.111.111-22",
        dataNascimento: new Date(),
        email: "joaog@clinica.com.br",
        telefone: 81912346789,
        sexo: "M",
        salario: 5000,
        funcao: "Dentista",
        cro: "123455/PE",
        endereco:[{
            cep: "12345679",
            rua: "Rua 2", 
            bairro: "Bairro 2", 
            cidade: "Recife", 
            estado: "PE",
        }]
    },
    {
        _id: 3,
        nome: "Helena Alves",
        cpf: "221.333.333-22",
        dataNascimento: new Date(),
        email: "helena@clinica.com.br",
        telefone: 81923456789,
        sexo: "F",
        salario: 3250.44,
        funcao: "Recepcionista",
        cro: "",
        endereco:[{
            cep: "12345670",
            rua: "Rua 3", 
            bairro: "Bairro 3", 
            cidade: "Recife", 
            estado: "PE",
        }]
    },
    {
        _id: 4,
        nome : "Alex Silva",
        cpf : "911.811.711-11",
        dataNascimento : new Date(),
        email : "alex@clinica.com.br",
        telefone : 81822345677,
        sexo : "M",
        salario : 5500,
        funcao : "Dentista",
        cro : "123444/PE",
        endereco : [{
            cep : "12345678",
            rua : "Rua 1",
            bairro : "Bairro 1",
            cidade : "Recife",
            estado : "PE"
        }]
    },
    {
        _id: 5,
        nome : "Jaime Smith",
        cpf : "411.822.311-33",
        dataNascimento : new Date(),
        email : "jaime@clinica.com.br",
        telefone : 81911223344,
        sexo : "M",
        salario : 2500,
        funcao : "Serviços Gerais",
        cro : "",
        endereco : [{
            cep : "12345678",
            rua : "Rua 1",
            bairro : "Bairro 1",
            cidade : "Recife",
            estado : "PE"
        }]
    }
])
// =-=-=-= DELETE =-=-=-=
db.funcionarios.deleteMany({salario: {$gt: 3000}})


// Criando coleção de pacientes
db.pacientes.insert([
    {
        _id: 1,
        nome: "Jonatas Ferreira",
        cpf: "444.444.444-44",
        dataNascimento: new Date(),
        email: "jonatas@gmail.com",
        telefone: 81998765432,
        sexo: "M",
        endereco:[{
            cep: "12345741",
            rua: "Rua 2", 
            bairro: "Bairro 21", 
            cidade: "Lagoa", 
            estado: "PE",
        }]
    },
    {
        _id: 2,
        nome: "Milena Macedo",
        cpf: "555.555.555-55",
        dataNascimento: new Date(),
        email: "milena@gmail.com",
        telefone: 81998764321,
        sexo: "F",
        endereco:[{
            cep: "42345612",
            rua: "Rua 4", 
            bairro: "Bairro 5", 
            cidade: "Recife", 
            estado: "PE",
        }]
    },
    {
        _id: 3,
        nome: "Gabriel Henrique",
        cpf: "655.655.655-45",
        dataNascimento: new Date(),
        email: "gabriel.h@gmail.com",
        telefone: 81998764312,
        sexo: "F",
        endereco:[{
            cep: "22345612",
            rua: "Rua 41", 
            bairro: "Bairro 15", 
            cidade: "Recife", 
            estado: "PE",
        }]
    },
    {
        _id: 4,
        nome: "João Paulo",
        cpf: "711-511-321-05",
        dataNascimento: new Date(),
        email: "jp@gmail.com",
        telefone: 81934764312,
        sexo: "M",
        endereco:[{
            cep: "22415612",
            rua: "Rua 14", 
            bairro: "Bairro 11", 
            cidade: "Recife", 
            estado: "PE",
        }]
    }
])

// =-=-=-= UPDATE =-=-=-=
db.pacientes.update({nome: "Milena Macedo"}, {$set: {nome: "Mayara Macedo"}})
db.pacientes.update({nome: "Gabriel Henrique"}, {$set: {sexo: "M"}})

// Coleção de Procedimentos
db.procedimentos.insert([
    {
        _id: 1,
        tipoProcedimento: "Extração",
        valorProcedimento: 300
    },
    {
        _id: 2,
        tipoProcedimento: "Bichectomia",
        valorProcedimento: 10000
    },
    {
        _id: 3,
        tipoProcedimento: "Implante de Prótese Dentária",
        valorProcedimento: 5000
    },
    {
        _id: 4,
        tipoProcedimento: "Profilaxia",
        valorProcedimento: 600
    },
    {
        _id: 5,
        tipoProcedimento: "Raspagem de Tártaro",
        valorProcedimento: 50
    },
])

// Coleção de consultas
db.consultas.insert([
    {
        _id: 1,
        dataConsulta: new Date(),
        paciente: 1,
        dentista: 1,
        procedimentos: [{
            procedimento1: 1,
            procedimento2: 5,
            procedimento2: 4
        }]
    },
    {
        _id: 2,
        dataConsulta: new Date(),
        paciente: 2,
        dentista: 1,
        procedimentos: [{
            procedimento1: 1,
            procedimento2: 4
        }]
    },
    {
        _id: 3,
        dataConsulta: new Date(),
        paciente: 4,
        dentista: 2,
        procedimentos: [{
            procedimento1: 2
        }]
    }
])