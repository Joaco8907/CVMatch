USE CVMatch;
GO


/* =====================================================
   TABLA: usuarios

   Contiene los datos básicos para todos los usuarios
   del sistema.

   Un usuario puede tener rol:
   - CANDIDATO
   - EMPRESA
   - ADMIN
   ===================================================== */

CREATE TABLE usuarios (
    id INT IDENTITY(1,1) PRIMARY KEY,

    nombre NVARCHAR(100) NOT NULL,

    apellido NVARCHAR(100) NOT NULL,

    email NVARCHAR(150) NOT NULL UNIQUE,

    password_hash NVARCHAR(255),

    rol NVARCHAR(20) NOT NULL,

    activo BIT NOT NULL DEFAULT 1,

    fecha_creacion DATETIME2 NOT NULL
        DEFAULT SYSDATETIME()
);
GO


/* =====================================================
   TABLA: perfiles

   Contiene la información profesional de los usuarios
   con rol CANDIDATO.
   ===================================================== */

CREATE TABLE perfiles (
    id INT IDENTITY(1,1) PRIMARY KEY,

    usuario_id INT NOT NULL,

    titulo_profesional NVARCHAR(150),

    resumen NVARCHAR(1000),

    ubicacion NVARCHAR(150),

    telefono NVARCHAR(30),

    linkedin_url NVARCHAR(300),

    github_url NVARCHAR(300),

    disponibilidad NVARCHAR(50),

    visible BIT NOT NULL DEFAULT 0
);
GO


/* =====================================================
   TABLA: empresas

   Contiene la información de las empresas registradas.
   ===================================================== */

CREATE TABLE empresas (
    id INT IDENTITY(1,1) PRIMARY KEY,

    usuario_id INT NOT NULL,

    nombre NVARCHAR(150) NOT NULL,

    descripcion NVARCHAR(1000),

    sitio_web NVARCHAR(300),

    ubicacion NVARCHAR(150),

    verificada BIT NOT NULL DEFAULT 0
);
GO


/* =====================================================
   TABLA: skills

   Catálogo general de habilidades.

   Ejemplos:
   JavaScript
   Angular
   SQL
   Git
   Comunicación
   ===================================================== */

CREATE TABLE skills (
    id INT IDENTITY(1,1) PRIMARY KEY,

    nombre NVARCHAR(100) NOT NULL UNIQUE,

    tipo NVARCHAR(30),

    activo BIT NOT NULL DEFAULT 1
);
GO


/* =====================================================
   TABLA: perfil_skills

   Tabla intermedia entre perfiles y skills.

   Permite una relación muchos a muchos:

   un perfil puede tener muchas skills
   una skill puede pertenecer a muchos perfiles
   ===================================================== */

CREATE TABLE perfil_skills (
    perfil_id INT NOT NULL,

    skill_id INT NOT NULL,

    nivel NVARCHAR(30),

    anios_experiencia DECIMAL(4,1),

    PRIMARY KEY (
        perfil_id,
        skill_id
    )
);
GO


/* =====================================================
   TABLA: experiencias

   Experiencias laborales pertenecientes a un perfil.
   ===================================================== */

CREATE TABLE experiencias (
    id INT IDENTITY(1,1) PRIMARY KEY,

    perfil_id INT NOT NULL,

    empresa NVARCHAR(150) NOT NULL,

    puesto NVARCHAR(150) NOT NULL,

    fecha_inicio DATE,

    fecha_fin DATE,

    descripcion NVARCHAR(1000),

    trabajo_actual BIT NOT NULL DEFAULT 0
);
GO


/* =====================================================
   TABLA: educaciones

   Estudios o formación académica del candidato.
   ===================================================== */

CREATE TABLE educaciones (
    id INT IDENTITY(1,1) PRIMARY KEY,

    perfil_id INT NOT NULL,

    institucion NVARCHAR(200) NOT NULL,

    titulo NVARCHAR(200) NOT NULL,

    fecha_inicio DATE,

    fecha_fin DATE,

    estado NVARCHAR(50)
);
GO


/* =====================================================
   TABLA: cvs

   Permite que un candidato tenga distintas versiones
   de su currículum utilizando el mismo perfil.
   ===================================================== */

CREATE TABLE cvs (
    id INT IDENTITY(1,1) PRIMARY KEY,

    perfil_id INT NOT NULL,

    nombre NVARCHAR(150) NOT NULL,

    titulo_objetivo NVARCHAR(150),

    resumen_personalizado NVARCHAR(1000),

    fecha_creacion DATETIME2 NOT NULL
        DEFAULT SYSDATETIME(),

    fecha_actualizacion DATETIME2 NOT NULL
        DEFAULT SYSDATETIME()
);
GO


/* =====================================================
   TABLA: ofertas

   Ofertas laborales publicadas por las empresas.
   ===================================================== */

CREATE TABLE ofertas (
    id INT IDENTITY(1,1) PRIMARY KEY,

    empresa_id INT NOT NULL,

    titulo NVARCHAR(200) NOT NULL,

    descripcion NVARCHAR(2000) NOT NULL,

    modalidad NVARCHAR(30),

    seniority NVARCHAR(30),

    ubicacion NVARCHAR(150),

    estado NVARCHAR(30) NOT NULL
        DEFAULT 'ACTIVA',

    fecha_creacion DATETIME2 NOT NULL
        DEFAULT SYSDATETIME()
);
GO


/* =====================================================
   TABLA: oferta_skills

   Relación muchos a muchos entre ofertas y skills.

   También permite indicar si una skill es obligatoria
   o solamente deseable.
   ===================================================== */

CREATE TABLE oferta_skills (
    oferta_id INT NOT NULL,

    skill_id INT NOT NULL,

    obligatoria BIT NOT NULL DEFAULT 0,

    PRIMARY KEY (
        oferta_id,
        skill_id
    )
);
GO


/* =====================================================
   TABLA: postulaciones

   Relaciona:

   candidato/perfil
   oferta
   CV utilizado
   estado de la postulación
   ===================================================== */

CREATE TABLE postulaciones (
    id INT IDENTITY(1,1) PRIMARY KEY,

    oferta_id INT NOT NULL,

    perfil_id INT NOT NULL,

    cv_id INT NOT NULL,

    estado NVARCHAR(30) NOT NULL
        DEFAULT 'RECIBIDA',

    fecha_postulacion DATETIME2 NOT NULL
        DEFAULT SYSDATETIME()
);
GO