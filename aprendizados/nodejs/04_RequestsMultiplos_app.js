/* Requests e Callbacks */

/* Essaa função chama o próximo cliente*/
function placeAnOrder(orderNumber) {
	/* Imprime o consumidor atual */
	console.log("Costumer Order", orderNumber);

	/* Essa função terá uma função anonima, 
		depois assim depois que ele terminar a sua execução
		é executado o que tem dentro (callback)*/
	cookAndDeliveryFood(function() {
		console.log("Delivery Food order: ", orderNumber);
		
	});
}


/* 
	Nessa função temos que retornar em 5 segundos o máximo de dados que ele conseguir pegar
	uma vez que haverão requests multiplos, ele colocará todos em um fila e pegará o máximo 
	que puder para o retorno.
  */
function cookAndDeliveryFood(callback) {
	/* Como ele funciona
		- O programa não para;
		- O setTimeout pega o maximo de requests e retorna todos os dados que conseguir em 5 segundos
	*/
	setTimeout(callback, 5000);
}

/* Simulação de usuários em um web request */
placeAnOrder(1);
placeAnOrder(2);
placeAnOrder(3);
placeAnOrder(4);
placeAnOrder(5);
placeAnOrder(6);

