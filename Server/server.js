// imports
let express = require('express');       // express module
const app = express();
let cors = require('cors');             // cross origin requests (localhost -> localhost:3000)
app.use(cors());                        // allow all origins -> Access-Control-Allow-Origin: *

let cfg = require('./config.json')      // config file
const db = require("./db");             // database connector

// set routes
const videoRoutes = require('./video');
app.use("/videos", videoRoutes);

// default route (has to be defined last)
app.use("/", (req, res) => {
    res.send("Welcome to gallery server 1.0");
});

// db connection and listening on port
db.initDb.then(() => {
    app.listen(cfg.server.port, () => {
        console.log("Listening on port " + cfg.server.port + "...");
    });
}, () => {console.log("Failed to connect to DB!")});
