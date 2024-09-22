-- Selección de la base de datos
USE nietodb;


-- Inserción de valores adicionales en la tabla "Miembros" (usuarios registrados)

INSERT INTO Miembros (nombre, apellido, email, usuario, password)
VALUES
('Marina', 'López', 'marina.lopez@example.com', 'marinal', 'password123'),
('Roberto', 'García', 'roberto.garcia@example.com', 'robertog', 'password456'),
('Carmen', 'Martínez', 'carmen.martinez@example.com', 'carmenm', 'password789'),
('Javier', 'Fernández', 'javier.fernandez@example.com', 'javierf', 'passwordABC'),
('Sofía', 'Rodríguez', 'sofia.rodriguez@example.com', 'sofiar', 'passwordXYZ'),
('Manuel', 'Sánchez', 'manuel.sanchez@example.com', 'manuels', 'password321'),
('Luisa', 'Pérez', 'luisa.perez@example.com', 'luisap', 'password789'),
('Antonio', 'Gómez', 'antonio.gomez@example.com', 'antoniog', 'passwordABC'),
('Isabel', 'Martín', 'isabel.martin@example.com', 'isabelm', 'password1234'),
('Diego', 'Hernández', 'diego.hernandez@example.com', 'diegoh', 'password567'),
('Celia', 'Fernández', 'celia.fernandez@example.com', 'celiaf', 'password890'),
('Miguel', 'González', 'miguel.gonzalez@example.com', 'miguelg', 'passwordDEF'),
('Elena', 'López', 'elena.lopez@example.com', 'elenal', 'password123'),
('Luis', 'Ruiz', 'luis.ruiz@example.com', 'luisr', 'password456'),
('Ana', 'Gómez', 'ana.gomez@example.com', 'anag', 'password789'),
('Juan', 'Sánchez', 'juan.sanchez@example.com', 'juans', 'passwordABC'),
('Laura', 'Pérez', 'laura.perez@example.com', 'laurap', 'passwordXYZ'),
('Carlos', 'Martínez', 'carlos.martinez@example.com', 'carlosm', 'password321'),
('Carmen', 'García', 'carmen.garcia@example.com', 'carmeng', 'password789'),
('Javier', 'Gómez', 'javier.gomez@example.com', 'javierg', 'passwordABC'),
('María', 'Martínez', 'maria.martinez@example.com', 'mariam', 'password1234'),
('Sara', 'Fernández', 'sara.fernandez@example.com', 'saraf', 'password567'),
('Diego', 'López', 'diego.lopez@example.com', 'diegol', 'password890'),
('Natalia', 'Sánchez', 'natalia.sanchez@example.com', 'natalias', 'passwordDEF'),
('Pablo', 'Martín', 'pablo.martin@example.com', 'pablom', 'password123'),
('Ana', 'López', 'ana.lopez@example.com', 'anal', 'password456'),
('Manuel', 'González', 'manuel.gonzalez@example.com', 'manuelg', 'password789'),
('Elena', 'Sánchez', 'elena.sanchez@example.com', 'elenas', 'passwordABC'),
('Luis', 'Martínez', 'luis.martinez@example.com', 'luism', 'passwordXYZ'),
('Carmen', 'Fernández', 'carmen.fernandez@example.com', 'carmenf', 'password321'),
('Marcos', 'Gómez', 'marcos.gomez@example.com', 'marcosg', 'password789'),
('Laura', 'Martínez', 'laura.martinez@example.com', 'lauram', 'passwordABC'),
('Javier', 'López', 'javier.lopez@example.com', 'javierl', 'password1234'),
('Sara', 'García', 'sara.garcia@example.com', 'sarag', 'password567'),
('Diego', 'Gómez', 'diego.gomez@example.com', 'diegog', 'password890'),
('Natalia', 'Martínez', 'natalia.martinez@example.com', 'nataliam', 'passwordDEF'),
('Pablo', 'Fernández', 'pablo.fernandez@example.com', 'pablof', 'password123'),
('Natalia', 'Gómez', 'natalia.gomez@example.com', 'nataliag', 'password654'),
('Pedro', 'Martínez', 'pedro.martinez@example.com', 'pedrom', 'password987'),
('Carmen', 'López', 'carmen.lopez@example.com', 'carmenl', 'password321')
ON DUPLICATE KEY UPDATE
email = VALUES(email),
usuario = VALUES(usuario);




-- Inserción de valores en la tabla "Contactos" (mensajes recibidos)

INSERT INTO Contactos (nombre_completo, email, telefono, mensaje)
VALUES
('Daniel Ruiz', 'daniel.ruiz@example.com', '444555666', '¿Qué derechos tengo si me despiden sin causa?'),
('Sofía Fernández', 'sofia.fernandez@example.com', '555666777', '¿Cómo puedo reclamar horas extras no pagadas?'),
('Miguel García', 'miguel.garcia@example.com', '666777888', '¿Cuántos días de vacaciones me corresponden por ley?'),
('Elena López', 'elena.lopez@example.com', '777888999', '¿Qué debo hacer si mi empleador no respeta mi contrato?'),
('Alejandro Martínez', 'alejandro.martinez@example.com', '888999000', '¿Puedo ser despedido durante una baja por enfermedad?'),
('Marta Gómez', 'marta.gomez@example.com', '999000111', '¿Cómo denunciar acoso laboral en mi empresa?'),
('Lucía Sánchez', 'lucia.sanchez@example.com', '111222333', '¿Qué indemnización me corresponde por despido improcedente?'),
('Andrés García', 'andres.garcia@example.com', '222333444', '¿Cuáles son mis derechos durante el periodo de prueba?'),
('Cristina Ruiz', 'cristina.ruiz@example.com', '333444555', '¿Puedo solicitar reducción de jornada por cuidado de un hijo?'),
('Pablo Fernández', 'pablo.fernandez@example.com', '444555666', '¿Qué hacer si mi empleador no me paga el salario mínimo?'),
('Ana López', 'ana.lopez@example.com', '555666777', '¿Cómo se calcula la indemnización por despido objetivo?'),
('Carlos García', 'carlos.garcia@example.com', '666777888', '¿Puedo negarme a hacer horas extras?'),
('Teresa Martínez', 'teresa.martinez@example.com', '777888999', '¿Qué derechos tengo durante una baja por maternidad?'),
('Felipe Gómez', 'felipe.gomez@example.com', '888999000', '¿Cuáles son las consecuencias de un despido disciplinario?'),
('Sergio Sánchez', 'sergio.sanchez@example.com', '999000111', '¿Qué hacer si mi empleador cambia mis condiciones laborales sin avisar?'),
('Clara García', 'clara.garcia@example.com', '111222333', '¿Puedo trabajar para otra empresa durante mis vacaciones?'),
('Jorge Ruiz', 'jorge.ruiz@example.com', '222333444', '¿Cuántos días de permiso tengo por matrimonio?'),
('María Fernández', 'maria.fernandez@example.com', '333444555', '¿Cómo puedo saber si mi contrato es temporal o indefinido?'),
('Antonio López', 'antonio.lopez@example.com', '444555666', '¿Puedo pedir una excedencia voluntaria y por cuánto tiempo?'),
('Raquel Gómez', 'raquel.gomez@example.com', '555666777', '¿Qué hacer si mi empleador me debe varios meses de salario?'),
('Luis Pérez', 'luis.perez@example.com', '444555667', '¿Qué es un despido colectivo y cuáles son mis derechos?'),
('Laura Torres', 'laura.torres@example.com', '555666778', '¿Cómo se calcula el finiquito en caso de despido?'),
('David Navarro', 'david.navarro@example.com', '666777889', '¿Qué hacer si me despiden verbalmente?'),
('Patricia Vega', 'patricia.vega@example.com', '777888990', '¿Puedo solicitar un cambio de puesto por motivos de salud?'),
('Javier Romero', 'javier.romero@example.com', '888999011', '¿Cuántos días de permiso tengo por nacimiento de un hijo?'),
('Susana Herrera', 'susana.herrera@example.com', '999000122', '¿Cuáles son mis derechos si trabajo de forma remota?'),
('Adrián Díaz', 'adrian.diaz@example.com', '111222334', '¿Qué hacer si mi contrato tiene cláusulas abusivas?'),
('Isabel Martín', 'isabel.martin@example.com', '222333445', '¿Cómo reclamar el pago de horas complementarias?'),
('Fernando López', 'fernando.lopez@example.com', '333444556', '¿Puedo solicitar una reducción de jornada por motivos familiares?'),
('Natalia Pérez', 'natalia.perez@example.com', '444555667', '¿Cuáles son los requisitos para un despido procedente?'),
('Óscar García', 'oscar.garcia@example.com', '555666778', '¿Qué hacer si me obligan a firmar mi renuncia?'),
('Victoria Sánchez', 'victoria.sanchez@example.com', '666777889', '¿Cuánto tiempo tengo para reclamar una deuda laboral?'),
('Mario Gutiérrez', 'mario.gutierrez@example.com', '777888990', '¿Puedo solicitar un anticipo de salario?'),
('Rocío Gómez', 'rocio.gomez@example.com', '888999011', '¿Qué hacer si me reducen el salario sin previo aviso?'),
('Álvaro Jiménez', 'alvaro.jimenez@example.com', '999000122', '¿Puedo trabajar durante una baja médica?'),
('Beatriz Ruiz', 'beatriz.ruiz@example.com', '111222334', '¿Cómo reclamar el pago de una indemnización?'),
('Tomás García', 'tomas.garcia@example.com', '222333445', '¿Qué hacer si mi empleador me discrimina por razones de género?'),
('Carmen Rodríguez', 'carmen.rodriguez@example.com', '333444556', '¿Cuántos días de permiso me corresponden por mudanza?'),
('Ignacio Morales', 'ignacio.morales@example.com', '444555667', '¿Qué hacer si no me pagan la nómina a tiempo?'),
('Sara Flores', 'sara.flores@example.com', '555666778', '¿Puedo solicitar una revisión de mi contrato laboral?')
ON DUPLICATE KEY UPDATE
email = VALUES(email),
telefono = VALUES(telefono);




-- Inserción de valores en la tabla "Citas" (citas concertadas por formulario)

INSERT INTO Citas (nombre, apellido, email, telefono, id_provincia, detalles, plazo, id_motivo, fecha_cita, hora_cita)
VALUES
('Ana', 'González', 'ana.gonzalez@example.com', '123456789', 9, 'Despido improcedente en empresa de tecnología', '30 días', 6, '2024-06-01', 'presencial_mañanas'),
('Pedro', 'Martínez', 'pedro.martinez@example.com', '987654321', 34, 'Reclamación de cantidad por horas extras no pagadas', '60 días', 9, '2024-06-05', 'presencial_tarde'),
('María', 'López', 'maria.lopez@example.com', '456789123', 1, 'Accidente laboral en obra de construcción', '15 días', 1, '2024-06-08', 'telefónica'),
('José', 'Fernández', 'jose.fernandez@example.com', '741852963', 22, 'Modificaciones de las condiciones de trabajo sin previo aviso', '45 días', 8, '2024-06-10', 'presencial_mañanas'),
('Laura', 'Sánchez', 'laura.sanchez@example.com', '369258147', 48, 'Reclamación del personal estatutario por incumplimiento de contrato', '30 días', 10, '2024-06-12', 'presencial_tarde'),
('Carlos', 'Gómez', 'carlos.gomez@example.com', '159263478', 14, 'Sanciones injustificadas en el entorno laboral', '20 días', 12, '2024-06-15', 'telefónica'),
('Sara', 'Pérez', 'sara.perez@example.com', '258147369', 37, 'Conflicto colectivo por recorte de beneficios laborales', '60 días', 5, '2024-06-18', 'presencial_mañanas'),
('Javier', 'Díaz', 'javier.diaz@example.com', '147369258', 40, 'Despido por discriminación laboral', '30 días', 6, '2024-06-20', 'presencial_tarde'),
('Elena', 'Ruiz', 'elena.ruiz@example.com', '963852741', 2, 'Baja médica prolongada sin justificación por parte del empleador', '90 días', 2, '2024-06-22', 'telefónica'),
('Diego', 'Hernández', 'diego.hernandez@example.com', '852963741', 19, 'Clasificación profesional errónea en empresa de marketing', '45 días', 3, '2024-06-25', 'presencial_mañanas'),
('Isabel', 'Torres', 'isabel.torres@example.com', '632541879', 51, 'Conciliación de la vida familiar tras cambios en horario laboral', '30 días', 4, '2024-06-28', 'presencial_tarde'),
('Manuel', 'Romero', 'manuel.romero@example.com', '741258963', 32, 'Reclamación del personal funcionario por impagos salariales', '60 días', 11, '2024-07-01', 'telefónica'),
('Carmen', 'Moreno', 'carmen.moreno@example.com', '369741852', 4, 'Accidente laboral por falta de medidas de seguridad en fábrica', '15 días', 1, '2024-07-05', 'presencial_mañanas'),
('Francisco', 'Álvarez', 'francisco.alvarez@example.com', '985632147', 33, 'Despido colectivo en empresa de transporte', '30 días', 6, '2024-07-08', 'presencial_tarde'),
('Lucía', 'Gutiérrez', 'lucia.gutierrez@example.com', '852147963', 45, 'Reclamación de cantidad por salario no abonado en empresa de hostelería', '45 días', 9, '2024-07-10', 'telefónica'),
('Daniel', 'Molina', 'daniel.molina@example.com', '147852369', 13, 'Conciliación de la vida familiar tras cambio de turno en fábrica', '30 días', 4, '2024-07-12', 'presencial_mañanas'),
('Patricia', 'Suárez', 'patricia.suarez@example.com', '369852147', 28, 'Sanciones laborales injustas en empresa de telecomunicaciones', '20 días', 12, '2024-07-15', 'presencial_tarde'),
('Antonio', 'Ortega', 'antonio.ortega@example.com', '987123654', 41, 'Despido por represalias tras denunciar irregularidades laborales', '30 días', 6, '2024-07-18', 'telefónica'),
('Paula', 'García', 'paula.garcia@example.com', '123987654', 10, 'Accidente laboral en el sector agrícola por falta de equipos de protección', '15 días', 1, '2024-07-20', 'presencial_mañanas'),
('Juan', 'Navarro', 'juan.navarro@example.com', '456123789', 27, 'Baja médica prolongada por estrés laboral en empresa de consultoría', '90 días', 2, '2024-07-22', 'presencial_tarde'),
('Silvia', 'Cortés', 'silvia.cortes@example.com', '789456123', 52, 'Conciliación de la vida familiar tras reducción de jornada en despacho de abogados', '30 días', 4, '2024-07-25', 'telefónica'),
('David', 'Santos', 'david.santos@example.com', '321654987', 16, 'Reclamación de cantidad por horas extras no reconocidas en empresa de logística', '60 días', 9, '2024-07-28', 'presencial_mañanas'),
('Eva', 'Castro', 'eva.castro@example.com', '654789321', 44, 'Sanciones laborales tras ejercicio del derecho de huelga en empresa de comercio', '20 días', 12, '2024-07-30', 'presencial_tarde'),
('Luis', 'Reyes', 'luis.reyes@example.com', '987321654', 3, 'Despido improcedente en empresa de construcción', '30 días', 6, '2024-07-01', 'telefónica'),
('Ana', 'Martínez', 'ana.martinez@example.com', '123456789', 36, 'Despido improcedente en empresa de turismo', '30 días', 6, '2024-07-05', 'presencial_mañanas'),
('Sergio', 'Herrera', 'sergio.herrera@example.com', '987654321', 15, 'Reclamación de cantidad por salario no abonado en empresa de restauración', '60 días', 9, '2024-07-08', 'presencial_tarde'),
('Marta', 'Fuentes', 'marta.fuentes@example.com', '456789123', 21, 'Accidente laboral en almacén por falta de medidas de seguridad', '15 días', 1, '2024-07-10', 'telefónica'),
('Pablo', 'Vega', 'pablo.vega@example.com', '741852963', 8, 'Conciliación de la vida familiar tras cambio de horario en empresa de software', '30 días', 4, '2024-07-12', 'presencial_mañanas'),
('Elena', 'Serrano', 'elena.serrano@example.com', '258147369', 47, 'Sanciones laborales tras protestas por condiciones de trabajo en empresa de telecomunicaciones', '20 días', 12, '2024-07-15', 'presencial_tarde'),
('Adrián', 'Gallardo', 'adrian.gallardo@example.com', '147369258', 31, 'Despido colectivo en empresa de tecnología', '30 días', 6, '2024-07-18', 'telefónica'),
('Nuria', 'Vidal', 'nuria.vidal@example.com', '963852741', 18, 'Accidente laboral por fallo en equipo de protección en empresa de construcción', '15 días', 1, '2024-07-20', 'presencial_mañanas'),
('Jorge', 'Giménez', 'jorge.gimenez@example.com', '852147963', 39, 'Reclamación de cantidad por impagos en empresa de marketing', '60 días', 9, '2024-07-22', 'presencial_tarde'),
('Cristina', 'Méndez', 'cristina.mendez@example.com', '369852147', 24, 'Baja médica prolongada por estrés laboral en empresa de publicidad', '90 días', 2, '2024-07-25', 'telefónica'),
('Marcos', 'Ibáñez', 'marcos.ibanez@example.com', '987123654', 42, 'Conciliación de la vida familiar tras recorte de jornada en empresa de consultoría', '30 días', 4, '2024-07-28', 'presencial_mañanas'),
('Natalia', 'López', 'natalia.lopez@example.com', '123987654', 7, 'Reclamación de cantidad por horas extras no remuneradas en empresa de hostelería', '60 días', 9, '2024-07-30', 'presencial_tarde'),
('Roberto', 'Sanchez', 'roberto.sanchez@example.com', '654789321', 20, 'Sanciones laborales tras denunciar irregularidades en condiciones de trabajo en empresa de logística', '20 días', 12, '2024-08-01', 'telefónica'),
('Lorena', 'Torres', 'lorena.torres@example.com', '987321654', 35, 'Despido por discriminación de género en empresa de ingeniería', '30 días', 6, '2024-08-05', 'presencial_mañanas'),
('Alejandro', 'García', 'alejandro.garcia@example.com', '369741852', 12, 'Accidente laboral en fábrica de automóviles por negligencia empresarial', '15 días', 1, '2024-08-08', 'presencial_tarde'),
('Celia', 'Rodríguez', 'celia.rodriguez@example.com', '985632147', 30, 'Conciliación de la vida familiar tras cambio de turno en empresa de alimentación', '30 días', 4, '2024-08-10', 'telefónica'),
('Alberto', 'Fernández', 'alberto.fernandez@example.com', '147852369', 46, 'Reclamación de cantidad por comisiones no abonadas en empresa de ventas', '60 días', 9, '2024-08-12', 'presencial_mañanas'),
('Alicia', 'Martín', 'alicia.martin@example.com', '632541879', 26, 'Baja médica prolongada por acoso laboral en empresa de recursos humanos', '90 días', 2, '2024-08-15', 'presencial_tarde'),
('Rubén', 'Pérez', 'ruben.perez@example.com', '159263478', 11, 'Sanciones laborales tras participación en protestas sindicales en empresa de construcción', '20 días', 12, '2024-08-18', 'telefónica'),
('Teresa', 'Gómez', 'teresa.gomez@example.com', '258369147', 48, 'Despido colectivo en empresa de transporte público', '30 días', 6, '2024-08-20', 'presencial_mañanas'),
('Raul', 'Hernandez', 'raul.hernandez@example.com', '987654321', 14, 'Accidente laboral por falta de señalización en empresa de electricidad', '15 días', 1, '2024-08-22', 'presencial_tarde'),
('Rosa', 'Díaz', 'rosa.diaz@example.com', '123456789', 38, 'Conciliación de la vida familiar tras reducción de jornada en empresa de telecomunicaciones', '30 días', 4, '2024-08-25', 'telefónica'),
('Gonzalo', 'Sánchez', 'gonzalo.sanchez@example.com', '987123654', 25, 'Reclamación de cantidad por horas extras no pagadas en empresa de informática', '60 días', 9, '2024-08-28', 'presencial_mañanas'),
('Sandra', 'Martínez', 'sandra.martinez@example.com', '369258147', 53, 'Baja médica prolongada por enfermedad laboral en empresa de salud', '90 días', 2, '2024-08-30', 'presencial_tarde')
ON DUPLICATE KEY UPDATE
email = VALUES(email),
telefono = VALUES(telefono);
