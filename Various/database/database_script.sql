

-- AUTOR: JOSE FRANCISCO NIETO BARCELÓ
-- TODOS LOS DERECHOS RESERVADOS.


-- -----------------------------------------------------------------------------
-- Creación de la base de datos
CREATE DATABASE IF NOT EXISTS nietodb;

-- Selección de la base de datos
USE nietodb;


-- -----------------------------------------------------------------------------
-- CREACIÓN DE LAS TABLAS DE LA BASE DE DATOS (y algunas inserciones predeterminadas: "provincias" y "motivos")

-- Tabla para almacenar la información de contacto de los usuarios
CREATE TABLE IF NOT EXISTS Contactos (
    contacto_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_completo VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    telefono VARCHAR(15),
    mensaje TEXT,
    fecha_contacto DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Tabla para almacenar la información de los miembros registrados en la web
CREATE TABLE IF NOT EXISTS Miembros (
    miembro_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    usuario VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    fecha_registro DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Tabla para almacenar las provincias
CREATE TABLE IF NOT EXISTS Provincias (
    id_provincia INT AUTO_INCREMENT PRIMARY KEY,
    nombre_provincia VARCHAR(50) NOT NULL
);

-- Inserta todas provincias, islas, Ceuta y Melilla como valores predefinidos
INSERT INTO Provincias (nombre_provincia) VALUES
('Almería'), ('A Coruña'), ('Álava'), ('Albacete'), ('Alicante'), ('Asturias'), ('Ávila'),
('Badajoz'), ('Barcelona'), ('Burgos'), ('Cáceres'), ('Cádiz'), ('Cantabria'), ('Castellón'),
('Ceuta'), ('Ciudad Real'), ('Córdoba'), ('Cuenca'), ('Gerona'), ('Gomera'), ('Granada'),
('Guadalajara'), ('Guipúzcoa'), ('Huelva'), ('Huesca'), ('Ibiza'), ('Jaén'), ('La Palma'),
('La Rioja'), ('Las Palmas'), ('León'), ('Lérida'), ('Lugo'), ('Madrid'), ('Málaga'), ('Mallorca'),
('Melilla'), ('Menorca'), ('Murcia'), ('Navarra'), ('Orense'), ('Palencia'), ('Pontevedra'),
('Salamanca'), ('Segovia'), ('Sevilla'), ('Soria'), ('Tarragona'), ('Tenerife'), ('Teruel'),
('Toledo'), ('Valencia'), ('Valladolid'), ('Vizcaya'), ('Zamora'), ('Zaragoza')
ON DUPLICATE KEY UPDATE nombre_provincia = nombre_provincia;

-- Tabla para almacenar los motivos de las citas
CREATE TABLE IF NOT EXISTS MotivosCita (
    id_motivo INT AUTO_INCREMENT PRIMARY KEY,
    motivo VARCHAR(100) NOT NULL
);

-- Inserta motivos de la cita tasados
INSERT INTO MotivosCita (motivo) VALUES
('Accidente laboral'), ('Baja médica'), ('Clasificación profesional'),
('Conciliación de la vida familiar'), ('Conflicto colectivo'), ('Despido'),
('Invalidez'), ('Modificaciones de las condiciones de trabajo'),
('Reclamación de cantidad'), ('Reclamación del personal estatutario'),
('Reclamación del personal funcionario'), ('Sanciones'), ('Tutela de derechos fundamentales')
ON DUPLICATE KEY UPDATE motivo = motivo;

-- Tabla para almacenar las solicitudes de citas
CREATE TABLE IF NOT EXISTS Citas (
    cita_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    telefono VARCHAR(15) NOT NULL,
    id_provincia INT,
    detalles TEXT,
    plazo VARCHAR(50) NOT NULL,
    id_motivo INT,
    fecha_cita DATE NOT NULL,
    hora_cita ENUM('telefónica', 'presencial_mañanas', 'presencial_tarde') NOT NULL,
    fecha_solicitud DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_provincia) REFERENCES Provincias(id_provincia),
    FOREIGN KEY (id_motivo) REFERENCES MotivosCita(id_motivo)
);




-- -----------------------------------------------------------------------------
-- CREACIÓN DE USUARIOS Y OTORGAMIENTO DE PERMISOS

-- Crear usuario "ADMIN" con permisos de consulta y borrado:
-- CREATE USER 'usuario_admin'@'localhost' IDENTIFIED BY '1234';
-- GRANT SELECT, DELETE ON nietodb.* TO 'usuario_admin'@'localhost';

-- Crear usuario "CLIENTE" con permisos solo de escritura (inserción):

-- CREATE USER 'usuario_cliente'@'localhost' IDENTIFIED BY '1234';
-- GRANT INSERT ON nietodb.* TO 'usuario_cliente'@'localhost';

-- Aplicar los cambios de permisos
-- FLUSH PRIVILEGES;



-- Comprueba que los usuarios existen en la base de datos:
-- SELECT User, Host FROM mysql.user WHERE User = 'usuario_consulta' OR User = 'usuario_insercion';

-- Eliminar los permisos de los usuarios
-- REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'usuario_insercion'@'localhost';
-- REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'usuario_consulta'@'localhost';

-- Eliminar los usuarios
-- DROP USER 'usuario_admin'@'localhost';
-- DROP USER 'usuario_cliente'@'localhost';

-- Aplicar los cambios
-- FLUSH PRIVILEGES;


-- -----------------------------------------------------------------------------
-- SCRIPTS TRIGGERS (automatizan registros secundarios de auditoria):

-- Tabla para almacenar registros de auditoría de la tabla Citas
CREATE TABLE IF NOT EXISTS AuditoriaCitas (
    id_registro INT AUTO_INCREMENT PRIMARY KEY,
    tabla_afectada VARCHAR(50) NOT NULL,
    accion_realizada VARCHAR(50) NOT NULL,
    fecha_hora DATETIME DEFAULT CURRENT_TIMESTAMP
);


-- Crea el trigger AFTER INSERT para la tabla Citas
DELIMITER //
CREATE TRIGGER after_insert_citas
AFTER INSERT ON Citas
FOR EACH ROW
BEGIN
    INSERT INTO AuditoriaCitas (tabla_afectada, accion_realizada)
    VALUES ('Citas', 'Inserción');
END;
//
DELIMITER ;


-- Crea el trigger AFTER DELETE para la tabla Citas
DELIMITER //
CREATE TRIGGER after_delete_citas
AFTER DELETE ON Citas
FOR EACH ROW
BEGIN
    INSERT INTO AuditoriaCitas (tabla_afectada, accion_realizada)
    VALUES ('Citas', 'Eliminación');
END;
//
DELIMITER ;


-- -----------------------------------------------------------------------------
-- SCRIPTS PROCEDIMIENTOS:

-- PROCEDIMIENTO 1: Definición del procedimiento almacenado para insertar una nueva cita

DELIMITER //
CREATE PROCEDURE InsertarCita(
    IN p_nombre VARCHAR(100),
    IN p_apellido VARCHAR(100),
    IN p_email VARCHAR(100),
    IN p_telefono VARCHAR(15),
    IN p_id_provincia INT,
    IN p_detalles TEXT,
    IN p_plazo VARCHAR(50),
    IN p_id_motivo INT,
    IN p_fecha_cita DATE,
    IN p_hora_cita ENUM('telefónica', 'presencial_mañanas', 'presencial_tarde')
)
BEGIN
    -- Inserta la nueva cita en la tabla Citas
    INSERT INTO Citas (nombre, apellido, email, telefono, id_provincia, detalles, plazo, id_motivo, fecha_cita, hora_cita)
    VALUES (p_nombre, p_apellido, p_email, p_telefono, p_id_provincia, p_detalles, p_plazo, p_id_motivo, p_fecha_cita, p_hora_cita);

    -- Registrar la acción en la tabla de auditoría
    INSERT INTO AuditoriaCitas (tabla_afectada, accion_realizada)
    VALUES ('Citas', 'Inserción');
END;
//
DELIMITER ;


-- PROCEDIMIENTO 2: Crea el procedimiento almacenado para insertar un nuevo miembro

DELIMITER //

CREATE PROCEDURE InsertarMiembro(
    IN p_nombre VARCHAR(100),
    IN p_apellido VARCHAR(100),
    IN p_email VARCHAR(100),
    IN p_usuario VARCHAR(50),
    IN p_password VARCHAR(255)
)
BEGIN
    INSERT INTO Miembros (nombre, apellido, email, usuario, password)
    VALUES (p_nombre, p_apellido, p_email, p_usuario, p_password);
END;
//
DELIMITER ;


-- PROCEDIMIENTO 3: Crea el procedimiento almacenado para insertar un nuevo mensaje de contacto

DELIMITER //

CREATE PROCEDURE InsertarMensajeContacto(
    IN p_nombre_completo VARCHAR(100),
    IN p_email VARCHAR(100),
    IN p_telefono VARCHAR(15),
    IN p_mensaje TEXT
)
BEGIN
    INSERT INTO Contactos (nombre_completo, email, telefono, mensaje)
    VALUES (p_nombre_completo, p_email, p_telefono, p_mensaje);
END;
//
DELIMITER ;


