USE CVMatch;
GO


/* =====================================================
   RELACIÓN: perfiles -> usuarios

   Cada perfil pertenece a un usuario.
   Además, un usuario no puede tener más de un perfil.
   ===================================================== */

ALTER TABLE perfiles
ADD CONSTRAINT FK_perfiles_usuarios
FOREIGN KEY (usuario_id)
REFERENCES usuarios(id);
GO

ALTER TABLE perfiles
ADD CONSTRAINT UQ_perfiles_usuario
UNIQUE (usuario_id);
GO


/* =====================================================
   RELACIÓN: empresas -> usuarios

   Cada empresa pertenece a un usuario con rol EMPRESA.
   Un usuario no puede estar asociado a más de una empresa.
   ===================================================== */

ALTER TABLE empresas
ADD CONSTRAINT FK_empresas_usuarios
FOREIGN KEY (usuario_id)
REFERENCES usuarios(id);
GO

ALTER TABLE empresas
ADD CONSTRAINT UQ_empresas_usuario
UNIQUE (usuario_id);
GO


/* =====================================================
   RELACIÓN: perfil_skills -> perfiles
   ===================================================== */

ALTER TABLE perfil_skills
ADD CONSTRAINT FK_perfil_skills_perfiles
FOREIGN KEY (perfil_id)
REFERENCES perfiles(id);
GO


/* =====================================================
   RELACIÓN: perfil_skills -> skills
   ===================================================== */

ALTER TABLE perfil_skills
ADD CONSTRAINT FK_perfil_skills_skills
FOREIGN KEY (skill_id)
REFERENCES skills(id);
GO


/* =====================================================
   RELACIÓN: experiencias -> perfiles

   Un perfil puede tener muchas experiencias laborales.
   ===================================================== */

ALTER TABLE experiencias
ADD CONSTRAINT FK_experiencias_perfiles
FOREIGN KEY (perfil_id)
REFERENCES perfiles(id);
GO


/* =====================================================
   RELACIÓN: educaciones -> perfiles

   Un perfil puede tener múltiples estudios.
   ===================================================== */

ALTER TABLE educaciones
ADD CONSTRAINT FK_educaciones_perfiles
FOREIGN KEY (perfil_id)
REFERENCES perfiles(id);
GO


/* =====================================================
   RELACIÓN: cvs -> perfiles

   Un perfil puede tener varias versiones de CV.
   ===================================================== */

ALTER TABLE cvs
ADD CONSTRAINT FK_cvs_perfiles
FOREIGN KEY (perfil_id)
REFERENCES perfiles(id);
GO


/* =====================================================
   RELACIÓN: ofertas -> empresas

   Una empresa puede publicar muchas ofertas.
   ===================================================== */

ALTER TABLE ofertas
ADD CONSTRAINT FK_ofertas_empresas
FOREIGN KEY (empresa_id)
REFERENCES empresas(id);
GO


/* =====================================================
   RELACIÓN: oferta_skills -> ofertas
   ===================================================== */

ALTER TABLE oferta_skills
ADD CONSTRAINT FK_oferta_skills_ofertas
FOREIGN KEY (oferta_id)
REFERENCES ofertas(id);
GO


/* =====================================================
   RELACIÓN: oferta_skills -> skills
   ===================================================== */

ALTER TABLE oferta_skills
ADD CONSTRAINT FK_oferta_skills_skills
FOREIGN KEY (skill_id)
REFERENCES skills(id);
GO


/* =====================================================
   RELACIÓN: postulaciones -> ofertas
   ===================================================== */

ALTER TABLE postulaciones
ADD CONSTRAINT FK_postulaciones_ofertas
FOREIGN KEY (oferta_id)
REFERENCES ofertas(id);
GO


/* =====================================================
   RELACIÓN: postulaciones -> perfiles
   ===================================================== */

ALTER TABLE postulaciones
ADD CONSTRAINT FK_postulaciones_perfiles
FOREIGN KEY (perfil_id)
REFERENCES perfiles(id);
GO


/* =====================================================
   RELACIÓN: postulaciones -> cvs

   Guarda qué versión del CV utilizó el candidato.
   ===================================================== */

ALTER TABLE postulaciones
ADD CONSTRAINT FK_postulaciones_cvs
FOREIGN KEY (cv_id)
REFERENCES cvs(id);
GO


/* =====================================================
   REGLA: evitar postulaciones duplicadas

   El mismo perfil no puede postularse dos veces
   a la misma oferta.
   ===================================================== */

ALTER TABLE postulaciones
ADD CONSTRAINT UQ_postulaciones_perfil_oferta
UNIQUE (perfil_id, oferta_id);
GO


/* =====================================================
   REGLA: roles válidos
   ===================================================== */

ALTER TABLE usuarios
ADD CONSTRAINT CK_usuarios_rol
CHECK (
    rol IN (
        'CANDIDATO',
        'EMPRESA',
        'ADMIN'
    )
);
GO


/* =====================================================
   REGLA: modalidad válida de oferta
   ===================================================== */

ALTER TABLE ofertas
ADD CONSTRAINT CK_ofertas_modalidad
CHECK (
    modalidad IS NULL
    OR modalidad IN (
        'PRESENCIAL',
        'HIBRIDO',
        'REMOTO'
    )
);
GO


/* =====================================================
   REGLA: estado válido de postulación
   ===================================================== */

ALTER TABLE postulaciones
ADD CONSTRAINT CK_postulaciones_estado
CHECK (
    estado IN (
        'RECIBIDA',
        'EN_REVISION',
        'ENTREVISTA',
        'RECHAZADA',
        'FINALIZADA'
    )
);
GO