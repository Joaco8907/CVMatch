const usuariosRepository = require("../repository/usuariosRepository.js");

const listarUsuariosServicio = () => {
  const listaUsuarios = usuariosRepository.listarUsuariosRepository();
  listaUsuarios.sort((a, b) => a.id - b.id);
  return listaUsuarios;
};






module.exports = {
  listarUsuariosServicio
};
