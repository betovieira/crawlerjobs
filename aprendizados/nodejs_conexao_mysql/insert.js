var mysql = require('mysql');
var connection = mysql.createConnection({
	host: 'localhost',
	user: 'root',
	password: 'password',
	database: 'bancoPI_schema'
});

connection.connect();
console.log("funfo");

var empresa = {
    id_empresa: null,
    nome: 'Empresa 1'
};

var query = connection.query('insert into Empresa set ? ', empresa, function(err, result){
    if (err) {
        console.error(err);
        return;
    }
    console.log(query.sql);
    console.log(result.affectedRows); 
});
