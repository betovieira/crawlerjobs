/* Inicializando os pacotes importados */
var express = require('express');
var fs = require('fs');
var request = require('request');
var cheerio = require('cheerio');
var app     = express();    
var existeProximo = true;
var arrayVagas = [];

/* Onde é definida a url para que seja executado o código */
    
    /* URL a ser retirada */

var buscaPagina = function (error, response, html){
            /* É colocado primeiro para verificar se não há erros */
    var stringCompleta = "";
    var vetorLinksAtual = new Array();

    if(!error){

        

        var $ = cheerio.load(html);

        var titulo, data, empresa, localizacao;
        
        // var vagaJson = { 
        //     titulo : "", 
        //     jornada : "", 
        //     empresa : "", 
        //     tipoContrato : "",
        //     salario : ""
        // };

       
        /* Pegar os links de toda a pagina */
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

                $('.summary').filter(function() {
                    var vagaJson = {
                        titulo : $(this).find('#ctl00_phMasterPage_cVacancySummary_litVacancyTitle').text(),
                        jornada : $(this).find('#ctl00_phMasterPage_cVacancySummary_litWorkingHours').text(),
                        empresa : $(this).find('#ctl00_phMasterPage_cVacancySummary_litCompany').text(),
                        tipoContrato : $(this).find('#ctl00_phMasterPage_cVacancySummary_litContractType').text(),
                        salario : $(this).find('#ctl00_phMasterPage_cVacancySummary_litSalary').text()
                    }

                    // console.log(vagaJson.empresa);

                    // var empresa = $(this).find('#ctl00_phMasterPage_cVacancySummary_litCompany').text();
                    // var tituloVaga = $(this).find('#ctl00_phMasterPage_cVacancySummary_litVacancyTitle').text();
                    // var jornada = $(this).find('#ctl00_phMasterPage_cVacancySummary_litWorkingHours').text();
                    // var tipoContrato = $(this).find('#ctl00_phMasterPage_cVacancySummary_litContractType').text();
                    // var salario = $(this).find('#ctl00_phMasterPage_cVacancySummary_litSalary').text();
                    // Grau de escolaridade fazer procura de palavras 
                    // Proximo - id ctl00_phMasterPage_cGrid_Paginator1_lnkNext

                    if (vagaJson.titulo != "") {
                        fs.appendFile('output.json', JSON.stringify(vagaJson) + ',\n', function(err){
                                // console.log('Escrito em um arquivo com sucesso - Olhe seu projeto dentro do arquivo output.qqc');
                        });
                    }
                    arrayVagas.push(vagaJson);
                });

                /* Só imprime para testes */
                
            });


        }

        // console.log(j + "ok" + $('#ctl00_phMasterPage_cGrid_Paginator1_divPaginator').find("#ctl00_phMasterPage_cGrid_Paginator1_lnkNext"));

        if ($('#ctl00_phMasterPage_cGrid_Paginator1_divPaginator').find("#ctl00_phMasterPage_cGrid_Paginator1_lnkNext") != "") {
            // console.log("OMG");
            j++;
            url = 'http://www.infojobs.com.br/empregos.aspx?Page=' + j;
            request(url, buscaPagina);
        }

        // fs.writeFile('output.txt', vetorLinksAtual, function(err){
        //     console.log('Escrito em um arquivo com sucesso - Olhe seu projeto dentro do arquivo output.qqc');
        // });
        
        // if ($('#ctl00_phMasterPage_cGrid_Paginator1_divPaginator').find("#ctl00_phMasterPage_cGrid_Paginator1_lnkNext")) {
        //     existeProximo = false;
        // }
        // console.log("ooasas: " + $('#ctl00_phMasterPage_cGrid_Paginator1_divPaginator').find("#ctl00_phMasterPage_cGrid_Paginator1_lnkNext"));
        
        
    }
}

// for (var j = 100; j < 105; j++) {
var j = 1;
app.get('/scrape', function(req, res){
    url = 'http://www.infojobs.com.br/empregos.aspx?Page=' + j;

    /* 
        Estrutura do request
            - Primeiro parâmetro é a URL a ser acessada
            - Segundo é callback
                - Dentro do callback existem 3 parâmetros 
                    (error, response e o html que for retirado)
     */
    // var stringCompleta = "";
    // var vetorLinksAtual = new Array();


    /* Faz request na pagina */ 
    request(url, buscaPagina)
    res.send('Check your console!');
})
// }





/* fs.writeFile('output.html', dataVaga, function(err){
                    console.log('Escrito em um arquivo com sucesso - Olhe seu projeto dentro do arquivo output.json ');
                });

                console.log(dataVaga);
                 */

/* Liga o servidor na porta 8081 */
app.listen('8081');

/* Escreve no console quando o servidor liga */
console.log('A porta usada é a 8081');

/* Deixa possivel de exportar esse código */
exports = module.exports = app;

