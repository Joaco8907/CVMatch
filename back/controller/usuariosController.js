const usuarioServicio = require("../service/usuariosService.js");

const obtenerUsuarios = (req, res) => {
  const resultado = usuarioServicio.listarUsuariosServicio();
  res.json(resultado);
};


module.exports = {
  obtenerUsuarios
};











