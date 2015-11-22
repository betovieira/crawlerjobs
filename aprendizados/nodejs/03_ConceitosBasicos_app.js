/* Objetos em Javascript */
var person = {
	firstName: "Humberto",
	lastName: "Vieira de Castro",
	age: 18 
};

/* Print em Javascript */
console.log(person)


/* Funções JavaScript */
function addNumber(a , b) {
	return a + b;
}

console.log(addNumber(1, 2));

/* Funções sem retorno, retornam UNDEFINDED */
function withoutReturn() {
	// Sem retorno definido
}

console.log(withoutReturn());

/* Funções em varáveis */
var printAnything = function() {
	console.log("Printing Anything");
}

/* A variavel é igual ao tipo de retorno na função */
printAnything();

/*A função será executada em um intervalo de 5 segundos, 
	ou melhor sua resposta será devolvida em um intervalo de 
	5 segundos
*/
setTimeout(printAnything, 5000);