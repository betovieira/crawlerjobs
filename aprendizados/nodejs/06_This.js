/* This */

/* O segundo print é verdade porque a classe chamada é parca */
var Parca = {
	printFirstName: function() {
		console.log("My name is Parca");
		console.log(this === Parca);
	}
}
/* Printando */
Parca.printFirstName();

/* Quando a função é global */
function doAnything() {
	console.log("Doing Anything");
	console.log(this === global);
}

doAnything();