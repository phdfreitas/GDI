// Criando coleção de funcionários
db.funcionarios.insert([
    {
        _id: 1,
        nome : "Aline Costa",
        cpf : "111.111.111-11",
        dataNascimento : "14/08/1999",
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
        dataNascimento: "11/07/2000",
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
        dataNascimento: "04/01/1989",
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
        dataNascimento : "03/04/1994",
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
        dataNascimento : "23/04/1996",
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
        dataNascimento: "24/12/2000",
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
        dataNascimento: "13/11/1997",
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
        dataNascimento: "06/06/2004",
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
        dataNascimento: "24/05/2002",
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
        dataConsulta: "04/09/2021",
        paciente: 1,
        dentista: 1,
        procedimentos: [1, 5, 4]
    },
    {
        _id: 2,
        dataConsulta: "01/09/2021",
        paciente: 2,
        dentista: 1,
        procedimentos: [1,4]
    },
    {
        _id: 3,
        dataConsulta: "01/09/2021",
        paciente: 4,
        dentista: 2,
        procedimentos: [2]
    },
    {
        _id: 4,
        dataConsulta: "03/11/2021",
        paciente: 1,
        dentista: 1,
        procedimentos: [1]
    }
])
// Corrigindo array de procedimentos
//db.consultas.update({paciente: 1}, {$set: {procedimentos: [1, 5, 4]}})
//db.consultas.update({paciente: 2}, {$set: {procedimentos: [1, 4]}})
//db.consultas.update({paciente: 4}, {$set: {procedimentos: [2]}})

// Queries
//1.use - seleciona um banco de dados
use nome_do_banco;

// 4, 5 e 15
db.consultas.aggregate([
    { $match: {dentista: 1}}, { $limit : 1 }
])

// 3.size
db.consultas.aggregate([
    {
        $project:{
            paciente: 1,
            nProcedimentos: {$size: "$procedimentos"}
        }
    }
])

//$6.project - mostra o documento apenas com as especificações pedidas. mostrar apenas o nome, email e telefone do pacinte sem o id
db.pacientes.aggregate([{ $project: {_id: 0, nome: 1, email: 1, telefone: 1}}]).pretty()

// 9.sum
db.procedimentos.aggregate(
    [
        {
            group:{
                _id: 1, totalProcedimentos: {$sum: "$valorProcedimento"}
            }
        }
    ]
)

// 10.count
db.funcionarios.aggregate(
    [
      {
        $match: {
          salario: {
            $gt: 3000
          }
        }
      },
      {
        $count: "privilegiados"
      }
    ]
)

//12.avg - Media salarial agrupado por genero
db.funcionarios.aggregate([{ $group: {_id:"$sexo", MediaSalarial: {$avg:"$salario"}} }])

// 13.exists
db.funcionarios.find( { cro: { $exists: true, $ne: ""}}).pretty()

// 16.where
db.pacientes.find({$where: function(){
    return this.sexo == "M"
}}).pretty()

// 17.mapReduce
function map(){
    emit (this.dentista, this.paciente)
}

function reduce(key, value){
    return value.join()
}

db.consultas.mapReduce(map, reduce, {out: {inline: 1}})
// fim 17 e 18


//21.set
db.pacientes.insert({ 
    _id: 5, 
    nome: "Maria Garibalda", 
    cpf: "495-375-284-43", 
    dataNascimento: "26/04/1994", 
    email: "mg@gmail.com", 
    telefone: 94654599436, 
    sexo: "F", 
    endereco:[{
        cep: "948593958", 
        rua: "Rua 20", 
        bairro: "Bairro 40", 
        cidade: "Recife", 
        estado: "PE",
    }
]})

db.pacientes.update({_id: 5}, {$set: {nome: "João Paulino", email: "jp@gmail.com", sexo: "M"}})
// Fim 21


// 22.text
db.procedimentos.createIndex( { tipoProcedimento: "text"} )
db.procedimentos.find({$text: {$search: "raspagem dentária"}})

//23.search
db.procedimentos.find({
    $text: { $search: "Prótese Tártaro" }
})

//24.filter - Retorna informações de acordo com as condiçoes sujeridas. mostrar o id do dentista e mostrar os que realizaram o procedimento 2
db.consultas.aggregate([{"$project": {"dentista": 1,"procedimentos": {"$filter": {"input": "$procedimentos", "as": "pro", "cond": { "$eq": ["$$pro", 2]}}}}}])

//$26.save - Faz um update no documento ou insereum novo documento. adiciona um novo item em consultas
db.consultas.save( { _id: 4, dataConsulta: "07/10/2021", paciente: 3, dentista: 3, procedimentos: [2, 3]})

//27.renameCollection- renomeia uma coleção. Renomeando procedimentos para exames
db.procedimentos.renameCollection("exames")


// 28.cond
db.funcionarios.aggregate(
    [
       {
          $project:
            {
              nome:1, 
              salario: 1,
              aumento:
                {
                  $cond: { if: { $eq: [ "$salario", 5500 ] }, then: 10, else: 30 }
                }
            }
       }
    ]
)

//29.lookup - Faz um left outer join de uma coleção da mesma base de dados. Printar as informações do paciente de uma determinada consulta
db.consultas.aggregate([{ $lookup: { 
    from:"pacientes", 
    localField: "paciente", 
    foreignField: "_id", 
    as: "inform_paciente"}}])

//31.addtoset    
db.consultas.update(
    {_id:4},
    {$addToSet:{procedimentos:{$each:["3","5"]}}}
)