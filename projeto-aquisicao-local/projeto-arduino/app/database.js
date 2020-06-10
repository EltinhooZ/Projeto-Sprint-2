var mysql = require('mysql');
var connection = mysql.createConnection({
    host: '127.0.0.1',
    port: '3306',
    user: 'teste2',
    password: 'Eltinho10',
    database: 'testebanco'
});

connection.connect(function(err) {
    if (err) throw err;
    console.log('Conectado com sucesso!')
});



module.exports = connection;