const express = require("express");
const app = express();

const HOSTNAME = "127.0.0.1";
const PORT = 3001;

app.get("/", (req,res) => {
    res.status(200).send("Bienvenido a ........");
})


app.listen(PORT,HOSTNAME, ()=>{
    console.log(`Servidor corriendo en HTTP://${HOSTNAME}:${PORT}`);
})