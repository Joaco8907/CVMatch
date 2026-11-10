const usuariosRepository = require("../repository/usuariosRepository.js");

const listarUsuariosServicio = () => {
  const listaUsuarios = usuariosRepository.listarUsuariosRepository();
  listaUsuarios.sort((a, b) => a.id - b.id);
  return listaUsuarios;
};

const crearUsuarioServicio = (nuevoUsuario) => {
  if (
    !nuevoUsuario ||
    typeof nuevoUsuario !== "object" ||
    Array.isArray(nuevoUsuario)
  ) {
    return null;
  }
  if (
    Object.values(nuevoUsuario).some(
      (valor) => valor === null || valor === undefined,
    )
  ) {
    return null;
  }
  if (nuevoUsuario.id !== undefined) {
    return null;
  }
  return usuariosRepository.crearUsuarioRepository(nuevoUsuario);
};




module.exports = {
  listarUsuariosServicio,
  crearUsuarioServicio
};
