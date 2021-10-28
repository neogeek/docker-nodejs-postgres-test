const restify = require('restify');

const { Client } = require('pg');

const server = restify.createServer();

const client = new Client({
    database: 'postgres',
    user: 'postgres',
    password: 'postgres',
    host: 'postgres',
    port: 5432
});

server.get('/', (_, res) => {
    res.send('Hello, world!');
});

let connected = false;

server.get('/db', async (_, res) => {
    try {
        if (!connected) {
            await client.connect();
            connected = true;
        }

        const results = await client.query('SELECT $1::text as message', [
            'Hello, postgres!'
        ]);

        res.send(results.rows[0].message);
    } catch (error) {
        res.send(500, error.message);
    }
});

server.listen(8080);
