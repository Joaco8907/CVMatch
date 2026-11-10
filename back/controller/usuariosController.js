const usuarioServicio = require("../service/usuariosService.js");

const obtenerUsuarios = (req, res) => {
  const resultado = usuarioServicio.listarUsuariosServicio();
  res.json(resultado);
};

const crearUsuario = (req, res) => {
  const nuevoUsuario = req.body;
  const respuesta = usuarioServicio.crearUsuarioServicio(nuevoUsuario);
  if (respuesta === null) {
    return res.status(400).json({
      mensaje: "Datos del usuario incompletos",
    });
  }
  res.status(201).json(respuesta);
};



module.exports = {
  obtenerUsuarios,
  crearUsuario
};











