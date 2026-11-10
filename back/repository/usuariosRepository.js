const BD = require("../datos/usuarios.js")

const listarUsuariosRepository = () => BD;

const crearUsuarioRepository = 
(nuevoUsuario) =>{
    const idAsignado = nuevoUsuario.id || BD.length +1
    const usuario = {id:idAsignado, ...nuevoUsuario}

    BD.push(usuario)
    return usuario
}








module.exports = {listarUsuariosRepository,
                  crearUsuarioRepository
                }

