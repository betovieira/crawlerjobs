/* Criando Objetos */
function User() {
	this.name = "";
	this.life = 100;
	this.giveLife = function giveLife(targetPlayer) {
		targetPlayer.life += 1;
		this.life -= 1;

		console.log(this.name + " gave 1 life to " + targetPlayer.name);
	}
}

/* Instanciando objetos */
var Parca1 = new User();
var Parca2 = new User();

/* Mudando o nome do atributos */
Parca1.name = "Beto";
Parca2.name = "Sidney";

/* Chama um método da classe */
Parca1.giveLife(Parca2);

/* Printando o conteúdo de objetos */
console.log(Parca1);
console.log(Parca2);

/* Prototipando */
/* Adicionando funções de todos os objetos */
User.prototype.uppercut = function uppercut(targetPlayer){
	targetPlayer.life -= 3;
	console.log(this.name + " just uppercutted " + targetPlayer.name);
};

// Chama o método criado
Parca1.uppercut(Parca2);

/* Printa o conteúdo dos objetos */
console.log(Parca1);
console.log(Parca2);

/* Adicionando valores aos atributos */
User.prototype.magic = 60;

console.log("1: " + Parca1.magic);
console.log("2: " + Parca2.magic);