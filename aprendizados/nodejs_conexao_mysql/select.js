var mysql = require('mysql');
var connection = mysql.createConnection({
	host: 'localhost',
	user: 'root',
	password: 'password',
	database: 'bancoPI_schema'
});

connection.connect();
console.log("funfo");

//meusite.com/id=1
//Connection.escape impede o sql injection
var id = '1';
var query = connection.query('select * from Empresa where id_empresa = ' + connection.escape(id), function(err, result) {
    console.log(result);
});