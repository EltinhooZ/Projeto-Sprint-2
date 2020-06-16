const configuracoes = {
    banco: {
        server: "serveruminosidade1a.database.windows.net",
<<<<<<< HEAD
        user: "Elton Silva",
        password: "123456",
=======
        user: "adminlocal",
        password: "20020302@Heric",
>>>>>>> d5a474d614077e209a108394a2481e0956b57306
        database: "bdluminosidade1",
        options: {
            encrypt: true
        },
        pool: {
            max: 4,
            min: 1,
            idleTimeoutMillis: 30000,
            connectionTimeout: 5000
        }
    }
}

const sql = require('mssql');
sql.on('error', err => {
    console.error(`Erro de Conexão: ${err}`);
});


function conectar() {
    sql.close();
    return sql.connect(configuracoes.banco)
}

module.exports = {
    conectar: conectar,
    sql: sql
}