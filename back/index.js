const express = require("express")
const app = express()

const HOSTNAME = "127.0.0.1"
const PORT = 3000

app.get("/", (req,res) =>{
    res.send("servidor funcionando")
})

app.listen(PORT, HOSTNAME, () => {
    console.log(`Servidor corriendo en HTTP://${HOSTNAME}:${PORT}`);
})