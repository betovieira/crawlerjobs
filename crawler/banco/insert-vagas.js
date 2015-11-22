var validacaoDados = require('./validacaoDados.js');
var arquivoJson = require('../testeDados.json');
var fs = require('fs');
var mysql = require('mysql');
var sleep = require('sleep');



var connection = mysql.createConnection({
	host: 'localhost',
	user: 'root',
	password: 'password',
	database: 'bancoPI_schema'
});

connection.connect();
console.log("Banco Conectado!");


var ObjetoVaga = {
    id_vaga : "",
    id_tipo_contrato : "",
    id_grau_escolaridade : "",
    id_jornada : "", 
    id_empresa : "",
    titulo : "",
    salario : 0.0,
    id_cidade: "",
    id_estado: "",
    tags: ""
    // FALTA A CIDADE E O ESTADO 
};

//var tag = 'Área e especialização profissional: Informática, TI, Telecomunicações - Programador / Desenvolvedor';
//console.log(validacao.transformarTags(tag));


var vag = '{"titulo": "Barman Para Botafogo E Jardim Botanico","jornada": "Noturno","empresa": "Entretapas","tipoContrato": "Efetivo – CLT","salario": "R$ 1.800,00 a R$ 2.300,00 (Bruto mensal)","localidade": " Rio de Janeiro, RJ","grauEscolaridade": "Escolaridade Mínima: Ensino Médio (2º Grau)","tags": "Área e especialização profissional: Alimentação / Gastronomia - Atendente / Recepção / Garçom"}';

//console.log(preparaObjetoParaInsercao(arquivoJson));
//console.log(arquivoJson);
console.log(principal());

function preparaObjetoParaInsercao(vaga) {
    var novoObjeto = new Object();
    
    /* TIPO DO CONTRATO - Consegue o id_tipo_contrato da vaga atual */
    var strTipoContrato = vaga.tipoContrato;
    var strGrauEscolaridade = validacaoDados.transformaGrauEscolaridade(vaga.grauEscolaridade);
    var strJornada = vaga.jornada;
    var strEmpresa = vaga.empresa;
//    var strEstado = validacaoDados.transformaLocalidade(vaga.localidade)[1];
    var strCidade = validacaoDados.transformaLocalidade(vaga.localidade)[0];



    var strQuery = 'CALL retornaVagaValidada("' + 
                        strTipoContrato+ '", "'+ 
                        strGrauEscolaridade +'", "' + 
                        strJornada +'", "' +
                        strEmpresa + '","' + 
                        strCidade + '");';
//    fs.appendFile('objetosVagasFinal.txt', strQuery + '\n', function(err){
//        // console.log('Escrito em um arquivo com sucesso - Olhe seu projeto dentro do arquivo output.qqc');
//    });
    
    var quer = connection.query(strQuery, function(err, rows, fields) {
        if (err) throw err;
        
        var linha = rows[0];
        linha = linha[0];

        novoObjeto.id_tipo_contrato = linha.id_tipo_contrato;
        novoObjeto.id_grau_escolaridade = linha.id_grau_escolaridade;
        novoObjeto.id_jornada = linha.id_jornada;
        novoObjeto.id_empresa = linha.id_empresa;
        novoObjeto.id_estado = linha.id_estado;
        novoObjeto.id_cidade = linha.id_cidade;
        
        novoObjeto.id_vaga = null;
        novoObjeto.titulo = vaga.titulo;
        
        novoObjeto.salario = validacaoDados.transformaSalario(vaga.salario);
        
        novoObjeto.tags = validacaoDados.transformaTags(vaga.tags);

        
        insercaoVagasBanco(novoObjeto);
        
        // Agora aqui eu mando para inserir a vaga!
        
        // Não esquecer de depois fazer uma funcao para inserir todas as tags
        //console.log(novoObjeto);
              
    });
    
}

/* Função de inserção no banco de dados */
function insercaoVagasBanco(vaga) {
    var strQuery = 'CALL insereVagaCompleta(' + vaga.id_tipo_contrato + ','+
                        vaga.id_grau_escolaridade + ',' +
                        vaga.id_jornada + ',' +
                        vaga.id_empresa + ',"' +
                        vaga.id_estado + '",' +
                        vaga.id_cidade + ',"' +
                        vaga.titulo + '", ' + 
                        vaga.salario + ');';
    
    
    fs.appendFile('objetosVagasFinal.txt', strQuery + '\n', function(err){
        // console.log('Escrito em um arquivo com sucesso - Olhe seu projeto dentro do arquivo output.qqc');
    });
    

    
    var query = connection.query(strQuery, function(err, rows, fields) {
        if (err) {
            console.error(err);
            return;
        }
        
        
        
        var pidVaga = rows[0];
        pidVaga = pidVaga[0].id_vaga;
        console.log('ROW: ' + pidVaga);
        sleep.usleep(1000000/10);

        
        for(var i = 0;  i < vaga.tags.length; i++) {
            //console.log(vaga.tags[i]);
            var strQueryTag = 'CALL insereTagCompleta("' + vaga.tags[i] + '", '+pidVaga+');';
            var quer = connection.query(strQueryTag, function(err, rows, fields) {
                if (err) throw err;

                //console.log(quer.sql);

//                console.log(result.affectedRows)
            });
        }
        
        
    });
}

module.exports.preparaObjetoParaInsercao = preparaObjetoParaInsercao;




function principal() {
    fs.readFile('../arquivoCrawler.json', 'utf8', function (err, data) {
        if (err) throw err;
        
        var jsonData = JSON.parse(data);
        for (var i = 0; i < jsonData.length; i++) {
            
            preparaObjetoParaInsercao(jsonData[i]);
            console.log('---------VAGA Nº'+i);
//            sleep.usleep(1000000/10);
            
            
        }
    });   
}






/* 
Dados que precisam ser validados 
    - Grau de escolaridade (para id_grau_escolaridade) OK
        - Preencher a tabela de grau de escolaridade 
            para ver quais vamos comparar.
    
    
    
    - Jornada (para id_jornada) OK
        Validação: Comparar strings da tabela de jornada quando inserir.
    
    - Empresa (para id_empresa) OK
        Validação: Verificar se existe a empresa senão cria um novo na tabela de empresa
            E insere a vaga
    
    - Profissão (para id_profissao) NEM TEM MAIS
    
    - Salario (para salario) OK
        Validação: Se não fornecer o salário colocar -1 'A combinar'
            Se fornecer, verifica o cifrão '$' se existir 
                pega o cifrão e a virgula. 
                Assim eu consigo o número.
                
    - Localidade
        Validação: Separa por virgula encontre o estado e a cidade e tire os espaços
            Verifico se a cidade já está associada ao estado, se não estiver adicionar e associar
            Se estiver apenas associar o id.
    
    
*/

/* Grau de escolaridade  OK
    - Valores disponíveis:
        - Escolaridade Mínima: Ensino Médio (2º Grau)
        - Escolaridade Mínima: Curso Técnico
        - Escolaridade Mínima: Ensino Fundamental (1º grau)
        - Escolaridade Mínima: Ensino Superior
        - Escolaridade Mínima: Pós-graduação - Mestrado
        
    Validação: associar o id_grau_escolaridade do banco e inserir a vaga
*/


/* Titulo OK */

