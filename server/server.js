const restify = require('restify');
const errors = require('restify-errors');
const mysql = require('mysql');

const port = process.env.PORT || 3000;

const connection = mysql.createConnection({
    host: process.env.MYSQL_HOST,
    user: process.env.MYSQL_USER,
    password: process.env.MYSQL_PASSWORD
});

const server = restify.createServer();

// container liveness and readiness probe
server.get('/health', function (request, response) {
    response.end();
});

server.use(restify.plugins.bodyParser());

// get all packages
server.get('/packages', function (request, response, next) {
    connection.query('select * from packages.offer order by Id desc', function (error, results, fields) {
        if (error) throw error;
        response.end(JSON.stringify(results));
    });
});

// create packages
server.post('/packages', function (request, response, next) {
    if(!request.body) { return next(new errors.BadRequestError("texto inválido")); }
    connection.query('insert into packages.offer (Text) values ("?")', [request.body], function (error, results, fields) {
        if (error) throw error;
        response.end("Ok");
    });
});

// delete packages
server.del('/packages/:id', function (request, response, next) {
    const id = request.params.id;
    
    if(!id || id <= 0) { return next(new errors.BadRequestError("id inválido")); }
    
    connection.query('delete from packages.offer WHERE Id=?', [id], function (error, results, fields) {
        if (error) throw error;
        if(!results.affectedRows) { next(new errors.BadRequestError("id inválido")); return; }
        response.end("Ok");
    });
});

server.listen(port, function () {
    console.log('%s listening at %s', server.name, server.url);
});

module.exports = server;
