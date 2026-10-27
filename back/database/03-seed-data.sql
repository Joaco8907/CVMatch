
USE CVMatch;
GO


/* =====================================================
   DATOS INICIALES - SKILLS TÉCNICAS
   ===================================================== */

IF NOT EXISTS (
    SELECT 1
    FROM skills
    WHERE nombre = 'JavaScript'
)
BEGIN
    INSERT INTO skills (nombre, tipo)
    VALUES ('JavaScript', 'TECNICA');
END;
GO


IF NOT EXISTS (
    SELECT 1
    FROM skills
    WHERE nombre = 'TypeScript'
)
BEGIN
    INSERT INTO skills (nombre, tipo)
    VALUES ('TypeScript', 'TECNICA');
END;
GO


IF NOT EXISTS (
    SELECT 1
    FROM skills
    WHERE nombre = 'Angular'
)
BEGIN
    INSERT INTO skills (nombre, tipo)
    VALUES ('Angular', 'TECNICA');
END;
GO


IF NOT EXISTS (
    SELECT 1
    FROM skills
    WHERE nombre = 'Node.js'
)
BEGIN
    INSERT INTO skills (nombre, tipo)
    VALUES ('Node.js', 'TECNICA');
END;
GO


IF NOT EXISTS (
    SELECT 1
    FROM skills
    WHERE nombre = 'Express'
)
BEGIN
    INSERT INTO skills (nombre, tipo)
    VALUES ('Express', 'TECNICA');
END;
GO


IF NOT EXISTS (
    SELECT 1
    FROM skills
    WHERE nombre = 'SQL'
)
BEGIN
    INSERT INTO skills (nombre, tipo)
    VALUES ('SQL', 'TECNICA');
END;
GO


IF NOT EXISTS (
    SELECT 1
    FROM skills
    WHERE nombre = 'Git'
)
BEGIN
    INSERT INTO skills (nombre, tipo)
    VALUES ('Git', 'TECNICA');
END;
GO


/* =====================================================
   DATOS INICIALES - SKILLS BLANDAS
   ===================================================== */

IF NOT EXISTS (
    SELECT 1
    FROM skills
    WHERE nombre = 'Trabajo en equipo'
)
BEGIN
    INSERT INTO skills (nombre, tipo)
    VALUES ('Trabajo en equipo', 'BLANDA');
END;
GO


IF NOT EXISTS (
    SELECT 1
    FROM skills
    WHERE nombre = 'Comunicación'
)
BEGIN
    INSERT INTO skills (nombre, tipo)
    VALUES ('Comunicación', 'BLANDA');
END;
GO