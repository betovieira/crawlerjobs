/* Referências */

/* Objeto Javascript */
var Parca = {
	favFood: "Macarrão",
	favMovie: "Focus"
}


var FriendOfParca = Parca;
FriendOfParca.favFood = "Feijão doido";


/* 
	Mudando os atributos FriendOfParca, serão trocados também os atributos de parça
		pois FriendOfParca é uma copia de referencia do Parcam então o conteudo é o mesmo
 */
console.log("Parca Food: ", Parca.favFood);




/* Comparando tipo */

/* Compara apenas valores, é verdadeiro*/
console.log(19 == '19');

/*Compara valores e os tipos, é falso*/
console.log(19 === '19');


