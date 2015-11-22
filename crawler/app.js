/* Inicializando os pacotes importados */
var express = require('express');
var fs = require('fs');
var request = require('request');
var cheerio = require('cheerio');
var app     = express();    
var existeProximo = true;
var arrayVagas = [];

/* 
    Estrutura do request
        - Primeiro parâmetro é a URL a ser acessada
        - Segundo é callback
            - Dentro do callback existem 3 parâmetros 
                (error, response e o html que for retirado)

    Colocamos em uma variavel para que ela possa ser chamada de forma recursiva
*/

var buscaPagina = function (error, response, html){
    
    /* É colocado primeiro para verificar se não há erros */
    var stringCompleta = "";
    var vetorLinksAtual = new Array();

    if(!error){
        var $ = cheerio.load(html);

        var titulo, data, empresa, localizacao;
 
        
        /* Pegar os links de toda a pagina e coloca em um array */
        $('ul.unstyled.left').filter(function() {
            var link = $(this).find('.vaga').find('a').attr('href') + '\n';
            if (link != null && link != "") {
                vetorLinksAtual.push(link);
            }
        });

        /* Fazer request a pagina do link */
        for (var i = 0; i < vetorLinksAtual.length; i++) {
            /* Faz request de cada um dos links */ 
            var linkAtual = vetorLinksAtual[i];

            request(linkAtual, function(err, resp, htmlVaga){
                
                /* Pegar dos dados necessários */
                var $ = cheerio.load(htmlVaga);
                
                /* Coloca todos em um objeto json */
                $('.summary').filter(function() {
                    var vagaJson = {
                        titulo : $(this).find('#ctl00_phMasterPage_cVacancySummary_litVacancyTitle').text(),
                        jornada : $(this).find('#ctl00_phMasterPage_cVacancySummary_litWorkingHours').text(),
                        empresa : $(this).find('#ctl00_phMasterPage_cVacancySummary_litCompany').text(),
                        tipoContrato : $(this).find('#ctl00_phMasterPage_cVacancySummary_litContractType').text(),
                        salario : $(this).find('#ctl00_phMasterPage_cVacancySummary_litSalary').text(),
                        localidade: $(this).find('#ctl00_phMasterPage_cVacancySummary_litLocation').text(),
                        grauEscolaridade : $('.descriptionItems').
                                            find("#ctl00_phMasterPage_cVacancyManager_cVacancyRequeriments_liMinimunStudies").text(),
                        tags: $('.descriptionItems').find('li').eq(1).text()
                    
                    }
                    
                    /* Coloca em um arquivo json os objetos */
                    if (vagaJson.titulo != "") {
                        fs.appendFile('output.json', JSON.stringify(vagaJson) + ',\n', function(err){
                            // console.log('Escrito em um arquivo com sucesso - Olhe seu projeto dentro do arquivo output.qqc');
                        });
                    }
                    arrayVagas.push(vagaJson);
                });                
            });


        }
        
        /* Se existir um próximo na pagina, ele vai para a proxima e procura os novos links */
        if ($('#ctl00_phMasterPage_cGrid_Paginator1_divPaginator').find("#ctl00_phMasterPage_cGrid_Paginator1_lnkNext") != "") {
            numPagina++;
            console.log('Pagina: ' + numPagina);
            url = 'http://www.infojobs.com.br/empregos.aspx?Page=' + numPagina;
            request(url, buscaPagina); // Recursivo
            
        }

       
        
    }
}




var numPagina = 2901;
app.get('/crawler', function(req, res){
    /* Onde é definida a url para que seja executado o código */
    url = 'http://www.infojobs.com.br/empregos.aspx?Page=' + numPagina;

    /* Faz request na pagina */ 
    request(url, buscaPagina);
    
    /* Quando termina de crawlear ele executa a pagina */
    res.send('Check your console!');
});

/* Liga o servidor na porta 8081 */
app.listen('8081');

/* Escreve no console quando o servidor liga */
console.log('A porta usada é a 8081');

/* Deixa possivel de exportar esse código */
exports = module.exports = app;


