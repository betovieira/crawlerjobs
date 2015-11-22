/* Inicializando os pacotes importados */
var express = require('express');
var fs = require('fs');
var request = require('request');
var cheerio = require('cheerio');
var app     = express();

/* Onde é definida a url para que seja executado o código */
app.get('/scrape', function(req, res){
	
	/* URL a ser retirada */
    url = 'http://www.imdb.com/title/tt1229340/';

    /* 
		Estrutura do request
			- Primeiro parâmetro é a URL a ser acessada
			- Segundo é callback
				- Dentro do callback existem 3 parâmetros 
					(error, response e o html que for retirado)
     */
    request(url, function(error, response, html){

        /* É colocado primeiro para verificar se não há erros */
        if(!error){

            /* Agora, utilizamos a biblioteca cheerio para retornar o html da página
            	e também nos possibilita utilizar código do JQuery para achar as tags */
            var $ = cheerio.load(html);

            /* Inicializamos as variaveis de captura de dados */
            var title, release, rating;
            var json = { title : "", release : "", rating : ""};

            // We'll use the unique header class as a starting point.
            /* Começamos a utilizar Jquery para acessar os dados 
				a partir de um único header
            */
            $('.header').filter(function(){

           		/* Começamos a gravar os dados através da função filter dentro da variavel, então nós podemos 
           			acessá-las mais facilmente*/
                var data = $(this);
                title = data.children().first().text();

                /* É repetido o mesmo processo pra achar o outro dado "release", para pegar os outros dados é assim também */ 
                release = data.children().last().children().text();


                /* Colocando os dados estraídos no formato json */
                json.title = title;
                json.release = release;

            });

            /* Acessando outra classe do css, para pegar rating */
            $('.star-box-giga-star').filter(function(){
                var data = $(this);

                /* Para pegar o texto é só colocar .text() porque já a classe já nos da onde está o dado, não é necessário
                	acessar seus subelementos */
                rating = data.text();

                /* Coloca no no JSON */
                json.rating = rating;
            });

			/* Escreve em um arquivo .json o objeto
				WriteFile tem 3 parametros:
					- O nome do arquivo
					- O tipo de dado que será gravado
					- Callback, quando terminar o que acontece. */
			fs.writeFile('output.json', JSON.stringify(json, null, 4), function(err){

			    console.log('Escrito em um arquivo com sucesso - Olhe seu projeto dentro do arquivo output.json ');

			});

			// E pra finalizar, responde para o servidor, para que ele pare de rodar este processo!
			res.send('Check your console!');
        }
    })


})

/* Liga o servidor na porta 8081 */
app.listen('8081');

/* Escreve no console quando o servidor liga */
console.log('A porta usada é a 8081');

/* Deixa possivel de exportar esse código */
exports = module.exports = app;

