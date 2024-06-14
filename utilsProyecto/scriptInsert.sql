-- Insertar datos en la tabla `sede`
INSERT INTO `pappdelBBDD`.`sede` (`id_sede`, `nombre_sede`, `localidad`, `provincia`, `calle`, `numero`, `codigo_postal`) VALUES
(1, 'Sede Central', 'Madrid', 'Madrid', 'Gran Via', 1, 28001),
(2, 'Sede Norte', 'Bilbao', 'Vizcaya', 'Avenida Libertad', 20, 48001),
(3, 'Sede Sur', 'Sevilla', 'Sevilla', 'Calle Feria', 10, 41001);

-- Insertar datos en la tabla `categoria`
INSERT INTO `pappdelBBDD`.`categoria` (`id_categoria`) VALUES
(1), (2), (3);

-- Insertar datos en la tabla `grupo`
INSERT INTO `pappdelBBDD`.`grupo` (`id_grupo`, `nombre_grupo`, `id_categoria`) VALUES
(1, 'Grupo A', 1),
(2, 'Grupo B', 2),
(3, 'Grupo C', 3);

-- Insertar datos en la tabla `equipo`
INSERT INTO `pappdelBBDD`.`equipo` (`id_equipo`, `nombre_equipo`, `logo`, `id_sede`, `id_grupo`) VALUES
(1, 'Equipo Alpha', NULL, 1, 1),
(2, 'Equipo Beta', NULL, 1, 1),
(3, 'Equipo Gamma', NULL, 2, 2),
(4, 'Equipo Delta', NULL, 2, 2),
(5, 'Equipo Epsilon', NULL, 3, 3),
(6, 'Equipo Zeta', NULL, 3, 3);

-- Insertar datos en la tabla `usuario`
INSERT INTO `pappdelBBDD`.`usuario` (`id_usuario`, `nombre_usuario`, `password`, `nombre`, `apellidos`, `email`, `genero`, `telefono`, `DNI`, `fecha_nacimiento`, `foto_perfil`, `id_equipo`) VALUES
-- Jugadores del Equipo Alpha
(1, 'usuario1', 'pass1', 'Juan', 'Pérez', 'juan.perez@example.com', 'M', 600123456, '12345678A', '1990-01-01', NULL, 1),
(2, 'usuario2', 'pass2', 'Ana', 'García', 'ana.garcia@example.com', 'F', 600123457, '12345678B', '1992-02-02', NULL, 1),
(3, 'usuario3', 'pass3', 'Luis', 'Martínez', 'luis.martinez@example.com', 'M', 600123458, '12345678C', '1988-03-03', NULL, 1),
(4, 'usuario4', 'pass4', 'María', 'López', 'maria.lopez@example.com', 'F', 600123459, '12345678D', '1991-04-04', NULL, 1),
(5, 'usuario5', 'pass5', 'Carlos', 'Fernández', 'carlos.fernandez@example.com', 'M', 600123460, '12345678E', '1989-05-05', NULL, 1),
(6, 'usuario6', 'pass6', 'Laura', 'Sánchez', 'laura.sanchez@example.com', 'F', 600123461, '12345678F', '1993-06-06', NULL, 1),

-- Jugadores del Equipo Beta
(7, 'usuario7', 'pass7', 'Antonio', 'Hernández', 'antonio.hernandez@example.com', 'M', 600123462, '12345678G', '1990-07-07', NULL, 2),
(8, 'usuario8', 'pass8', 'Marta', 'Ruiz', 'marta.ruiz@example.com', 'F', 600123463, '12345678H', '1992-08-08', NULL, 2),
(9, 'usuario9', 'pass9', 'José', 'Gómez', 'jose.gomez@example.com', 'M', 600123464, '12345678I', '1988-09-09', NULL, 2),
(10, 'usuario10', 'pass10', 'Lucía', 'Jiménez', 'lucia.jimenez@example.com', 'F', 600123465, '12345678J', '1991-10-10', NULL, 2),
(11, 'usuario11', 'pass11', 'David', 'Ortiz', 'david.ortiz@example.com', 'M', 600123466, '12345678K', '1989-11-11', NULL, 2),
(12, 'usuario12', 'pass12', 'Sofía', 'Ramos', 'sofia.ramos@example.com', 'F', 600123467, '12345678L', '1993-12-12', NULL, 2),

-- Jugadores del Equipo Gamma
(13, 'usuario13', 'pass13', 'Alberto', 'Castro', 'alberto.castro@example.com', 'M', 600123468, '12345678M', '1990-01-13', NULL, 3),
(14, 'usuario14', 'pass14', 'Cristina', 'Romero', 'cristina.romero@example.com', 'F', 600123469, '12345678N', '1992-02-14', NULL, 3),
(15, 'usuario15', 'pass15', 'Roberto', 'Vargas', 'roberto.vargas@example.com', 'M', 600123470, '12345678O', '1988-03-15', NULL, 3),
(16, 'usuario16', 'pass16', 'Elena', 'Navarro', 'elena.navarro@example.com', 'F', 600123471, '12345678P', '1991-04-16', NULL, 3),
(17, 'usuario17', 'pass17', 'Pablo', 'Domínguez', 'pablo.dominguez@example.com', 'M', 600123472, '12345678Q', '1989-05-17', NULL, 3),
(18, 'usuario18', 'pass18', 'Susana', 'Gil', 'susana.gil@example.com', 'F', 600123473, '12345678R', '1993-06-18', NULL, 3),

-- Jugadores del Equipo Delta
(19, 'usuario19', 'pass19', 'Fernando', 'Muñoz', 'fernando.munoz@example.com', 'M', 600123474, '1234567S', '1990-07-19', NULL, 4),
(20, 'usuario20', 'pass20', 'Patricia', 'Alonso', 'patricia.alonso@example.com', 'F', 600123475, '1234578T', '1992-08-20', NULL, 4),
(21, 'usuario21', 'pass21', 'Javier', 'Serrano', 'javier.serrano@example.com', 'M', 600123476, '12345678U', '1988-09-21', NULL, 4),
(22, 'usuario22', 'pass22', 'Rosa', 'Díaz', 'rosa.diaz@example.com', 'F', 600123477, '12345678V', '1991-10-22', NULL, 4),
(23, 'usuario23', 'pass23', 'Miguel', 'Torres', 'miguel.torres@example.com', 'M', 600123478, '12345678W', '1989-11-23', NULL, 4),
(24, 'usuario24', 'pass24', 'Teresa', 'Crespo', 'teresa.crespo@example.com', 'F', 600123479, '12345678X', '1993-12-24', NULL, 4),

-- Jugadores del Equipo Epsilon
(25, 'usuario25', 'pass25', 'Enrique', 'Molina', 'enrique.molina@example.com', 'M', 600123480, '12345678Y', '1990-01-25', NULL, 5),
(26, 'usuario26', 'pass26', 'Beatriz', 'Garrido', 'beatriz.garrido@example.com', 'F', 600123481, '12345678Z', '1992-02-26', NULL, 5),
(27, 'usuario27', 'pass27', 'Jorge', 'Suárez', 'jorge.suarez@example.com', 'M', 600123482, '12345679A', '1988-03-27', NULL, 5),
(28, 'usuario28', 'pass28', 'Sonia', 'Morales', 'sonia.morales@example.com', 'F', 600123483, '12345679B', '1991-04-28', NULL, 5),
(29, 'usuario29', 'pass29', 'Héctor', 'Ramírez', 'hector.ramirez@example.com', 'M', 600123484, '12345679C', '1989-05-29', NULL, 5),
(30, 'usuario30', 'pass30', 'Carmen', 'Santos', 'carmen.santos@example.com', 'F', 600123485, '12345679D', '1993-06-30', NULL, 5),


-- Jugadores del Equipo Zeta
(31, 'usuario31', 'pass31', 'Víctor', 'Ríos', 'victor.rios@example.com', 'M', 600123486, '12345679E', '1990-07-31', NULL, 6),
(32, 'usuario32', 'pass32', 'Natalia', 'Méndez', 'natalia.mendez@example.com', 'F', 600123487, '12345679F', '1992-08-01', NULL, 6),
(33, 'usuario33', 'pass33', 'Raúl', 'Ortega', 'raul.ortega@example.com', 'M', 600123488, '12345679G', '1988-09-02', NULL, 6),
(34, 'usuario34', 'pass34', 'Isabel', 'Vega', 'isabel.vega@example.com', 'F', 600123489, '12345679H', '1991-10-03', NULL, 6),
(35, 'usuario35', 'pass35', 'Álvaro', 'Reyes', 'alvaro.reyes@example.com', 'M', 600123490, '12345679I', '1989-11-04', NULL, 6),
(36, 'usuario36', 'pass36', 'Paula', 'Campos', 'paula.campos@example.com', 'F', 600123491, '12345679J', '1993-12-05', NULL, 6);

-- Update seteando los capitanes de cada equipo
UPDATE pappdelBBDD.equipo SET id_capitan = '5' WHERE (id_equipo = '1') and (id_sede = '1') and (id_grupo = '1');
UPDATE pappdelBBDD.equipo SET id_capitan = '8' WHERE (id_equipo = '2') and (id_sede = '1') and (id_grupo = '1');
UPDATE pappdelBBDD.equipo SET id_capitan = '14' WHERE (id_equipo = '3') and (id_sede = '2') and (id_grupo = '2');
UPDATE pappdelBBDD.equipo SET id_capitan = '19' WHERE (id_equipo = '4') and (id_sede = '2') and (id_grupo = '2');
UPDATE pappdelBBDD.equipo SET id_capitan = '26' WHERE (id_equipo = '5') and (id_sede = '3') and (id_grupo = '3');
UPDATE pappdelBBDD.equipo SET id_capitan = '35' WHERE (id_equipo = '6') and (id_sede = '3') and (id_grupo = '3');

-- Insertar datos en la tabla enfrentamiento
INSERT INTO pappdelBBDD.enfrentamiento (id_enfrentamiento, id_equipo_local, id_equipo_visitante, fecha, jugado, aplazado, confirmado_local, confirmado_visitante, id_grupo, partidos_ganados_local, partidos_ganados_visitante) VALUES
(1, 1, 2, '2024-06-01 10:00:00', 1, 0, 1, 1, 1, 2, 1),
(2, 3, 4, '2024-06-02 15:00:00', 0, 1, 0, 0, 2, 0, 0),
(3, 5, 6, '2024-06-03 18:00:00', 1, 0, 1, 1, 3, 2, 1);

-- Insertar datos en la tabla partido
INSERT INTO pappdelBBDD.partido (id_partido, nivel_partido, id_enfrentamiento, id_jugador_local1, id_jugador_local2, id_jugador_visitante1, id_jugador_visitante2, sets_local, sets_visitante, juegos_set1_local, juegos_set1_visitante, juegos_set2_local, juegos_set2_visitante, juegos_set3_local, juegos_set3_visitante) VALUES
-- Partidos para el Enfrentamiento 1
(10, 1, 1, 1, 2, 7, 8, 2, 1, 6, 4, 3, 6, 6, 7),
(11, 2, 1, 3, 4, 9, 10, 2, 0, 6, 2, 6, 1, 0, 0),
(12, 3, 1, 5, 6, 11, 12, 2, 0, 6, 1, 6, 4, 0, 0),

-- Partidos para el Enfrentamiento 2 (No jugado)
-- (4, 1, 2, 13, 14, 19, 20, 2, 1, 6, 4, 6, 3, NULL, NULL),
-- (5, 2, 2, 15, 16, 21, 22, 2, 0, 6, 2, 6, 1, NULL, NULL),
-- (6, 3, 2, 17, 18, 23, 24, 2, 1, 6, 3, 6, 4, NULL, NULL),

-- Partidos para el Enfrentamiento 3
(7, 1, 3, 25, 26, 31, 32, 2, 0, 6, 3, 6, 4, 0, 0),
(8, 2, 3, 27, 28, 33, 34, 2, 0, 6, 2, 6, 1, 0, 0),
(9, 3, 3, 29, 30, 35, 36, 1, 2, 3, 6, 4, 6, 0, 0);