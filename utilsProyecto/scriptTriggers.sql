USE pappdelbbdd;

-- Verifica que el capitán asignado al equipo, pertenezca a ese mismo equipo

DELIMITER //

CREATE TRIGGER `before_insert_equipo`
BEFORE INSERT ON `Equipo`
FOR EACH ROW
BEGIN
    DECLARE msg VARCHAR(255);

    -- Verificar que el idCapitan pertenece al equipo
    IF NEW.`id_capitan` IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 
                       FROM `Usuario` 
                       WHERE `id_usuario` = NEW.`id_capitan` 
                         AND `id_equipo` = NEW.`id_equipo`) THEN
            SET msg = 'El capitán no pertenece al equipo especificado';
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
        END IF;
    END IF;
END//

CREATE TRIGGER `before_update_equipo`
BEFORE UPDATE ON `Equipo`
FOR EACH ROW
BEGIN
    DECLARE msg VARCHAR(255);

    -- Verificar que el idCapitan pertenece al equipo
    IF NEW.`id_capitan` IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 
                       FROM `Usuario` 
                       WHERE `id_usuario` = NEW.`id_capitan` 
                         AND `id_equipo` = NEW.`id_equipo`) THEN
            SET msg = 'El capitán no pertenece al equipo especificado';
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
        END IF;
    END IF;
END//

DELIMITER ;




DELIMITER //

CREATE TRIGGER verificar_jugadores_locales
BEFORE INSERT ON Partido
FOR EACH ROW
BEGIN
    DECLARE equipo_local INT;

    -- Obtener el equipo local del enfrentamiento
    SELECT id_equipo_local INTO equipo_local
    FROM Enfrentamiento
    WHERE id_enfrentamiento = NEW.id_enfrentamiento;

    -- Verificar que los jugadores locales pertenezcan al equipo local
    IF (SELECT id_equipo FROM Usuario WHERE id_usuario = NEW.id_jugador_local1) != equipo_local THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El jugador local 1 no pertenece al equipo local';
    END IF;

    IF (SELECT id_equipo FROM Usuario WHERE id_usuario = NEW.id_jugador_local2) != equipo_local THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El jugador local 2 no pertenece al equipo local';
    END IF;
END;

//

DELIMITER ;



DELIMITER //

CREATE TRIGGER verificar_jugadores_visitantes
BEFORE INSERT ON Partido
FOR EACH ROW
BEGIN
    DECLARE equipo_visitante INT;

    -- Obtener el equipo visitante del enfrentamiento
    SELECT id_equipo_visitante INTO equipo_visitante
    FROM Enfrentamiento
    WHERE id_enfrentamiento = NEW.id_enfrentamiento;

    -- Verificar que los jugadores visitantes pertenezcan al equipo visitante
    IF (SELECT id_equipo FROM Usuario WHERE id_usuario = NEW.id_jugador_visitante1) != equipo_visitante THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El jugador visitante 1 no pertenece al equipo visitante';
    END IF;

    IF (SELECT id_equipo FROM Usuario WHERE id_usuario = NEW.id_jugador_visitante2) != equipo_visitante THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El jugador visitante 2 no pertenece al equipo visitante';
    END IF;
END;

//

DELIMITER ;



DELIMITER //

CREATE TRIGGER actualizar_estadisticas_insertar
AFTER INSERT ON Partido
FOR EACH ROW
BEGIN
    DECLARE ganador_local BOOLEAN;
    DECLARE sets_jugados INT;

    -- Calcular resultados
    SET sets_jugados = NEW.sets_local + NEW.sets_visitante;
    IF NEW.sets_local > NEW.sets_visitante THEN
        SET ganador_local = TRUE;
    ELSE
        SET ganador_local = FALSE;
    END IF;

    -- Actualizar estadísticas para los jugadores locales
    UPDATE estadisticas_jugador
    SET partidos_jugados = partidos_jugados + 1,
        partidos_ganados = partidos_ganados + (CASE WHEN ganador_local THEN 1 ELSE 0 END),
        partidos_perdidos = partidos_perdidos + (CASE WHEN NOT ganador_local THEN 1 ELSE 0 END),
        partidos_ganados_2_set = partidos_ganados_2_set + (CASE WHEN ganador_local AND sets_jugados = 2 THEN 1 ELSE 0 END),
        partidos_ganados_3_set = partidos_ganados_3_set + (CASE WHEN ganador_local AND sets_jugados = 3 THEN 1 ELSE 0 END),
        partidos_perdidos_2_set = partidos_perdidos_2_set + (CASE WHEN NOT ganador_local AND sets_jugados = 2 THEN 1 ELSE 0 END),
        partidos_perdidos_3_set = partidos_perdidos_3_set + (CASE WHEN NOT ganador_local AND sets_jugados = 3 THEN 1 ELSE 0 END),
        sets_ganados = sets_ganados + NEW.sets_local,
        sets_perdidos = sets_perdidos + NEW.sets_visitante,
        juegos_ganados = juegos_ganados + (NEW.juegos_set1_local + NEW.juegos_set2_local + COALESCE(NEW.juegos_set3_local, 0)),
        juegos_perdidos = juegos_perdidos + (NEW.juegos_set1_visitante + NEW.juegos_set2_visitante + COALESCE(NEW.juegos_set3_visitante, 0))
    WHERE id_usuario IN (NEW.id_jugador_local1, NEW.id_jugador_local2);

    -- Actualizar estadísticas para los jugadores visitantes
    UPDATE estadisticas_jugador
    SET partidos_jugados = partidos_jugados + 1,
        partidos_ganados = partidos_ganados + (CASE WHEN NOT ganador_local THEN 1 ELSE 0 END),
        partidos_perdidos = partidos_perdidos + (CASE WHEN ganador_local THEN 1 ELSE 0 END),
        partidos_ganados_2_set = partidos_ganados_2_set + (CASE WHEN NOT ganador_local AND sets_jugados = 2 THEN 1 ELSE 0 END),
        partidos_ganados_3_set = partidos_ganados_3_set + (CASE WHEN NOT ganador_local AND sets_jugados = 3 THEN 1 ELSE 0 END),
        partidos_perdidos_2_set = partidos_perdidos_2_set + (CASE WHEN ganador_local AND sets_jugados = 2 THEN 1 ELSE 0 END),
        partidos_perdidos_3_set = partidos_perdidos_3_set + (CASE WHEN ganador_local AND sets_jugados = 3 THEN 1 ELSE 0 END),
        sets_ganados = sets_ganados + NEW.sets_visitante,
        sets_perdidos = sets_perdidos + NEW.sets_local,
        juegos_ganados = juegos_ganados + (NEW.juegos_set1_visitante + NEW.juegos_set2_visitante + COALESCE(NEW.juegos_set3_visitante, 0)),
        juegos_perdidos = juegos_perdidos + (NEW.juegos_set1_local + NEW.juegos_set2_local + COALESCE(NEW.juegos_set3_local, 0))
    WHERE id_usuario IN (NEW.id_jugador_visitante1, NEW.id_jugador_visitante2);
END;

//

DELIMITER ;





-- Primero revierte las estadísticas antiguas para los jugadores locales y visitantes usando los valores previos a la actualización (OLD). 
-- Luego, aplica las nuevas estadísticas usando los valores actualizados (NEW).
DELIMITER //

CREATE TRIGGER actualizar_estadisticas_modificacion
AFTER UPDATE ON Partido
FOR EACH ROW
BEGIN
    DECLARE ganador_local_old BOOLEAN;
    DECLARE ganador_local_new BOOLEAN;
    DECLARE sets_jugados_old INT;
    DECLARE sets_jugados_new INT;

    -- Calcular resultados para el registro antiguo
    SET sets_jugados_old = OLD.sets_local + OLD.sets_visitante;
    IF OLD.sets_local > OLD.sets_visitante THEN
        SET ganador_local_old = TRUE;
    ELSE
        SET ganador_local_old = FALSE;
    END IF;

    -- Calcular resultados para el nuevo registro
    SET sets_jugados_new = NEW.sets_local + NEW.sets_visitante;
    IF NEW.sets_local > NEW.sets_visitante THEN
        SET ganador_local_new = TRUE;
    ELSE
        SET ganador_local_new = FALSE;
    END IF;

    -- Revertir estadísticas antiguas para los jugadores locales
    UPDATE estadisticas_jugador
    SET partidos_jugados = partidos_jugados - 1,
        partidos_ganados = partidos_ganados - (CASE WHEN ganador_local_old THEN 1 ELSE 0 END),
        partidos_perdidos = partidos_perdidos - (CASE WHEN NOT ganador_local_old THEN 1 ELSE 0 END),
        partidos_ganados_2_set = partidos_ganados_2_set - (CASE WHEN ganador_local_old AND sets_jugados_old = 2 THEN 1 ELSE 0 END),
        partidos_ganados_3_set = partidos_ganados_3_set - (CASE WHEN ganador_local_old AND sets_jugados_old = 3 THEN 1 ELSE 0 END),
        partidos_perdidos_2_set = partidos_perdidos_2_set - (CASE WHEN NOT ganador_local_old AND sets_jugados_old = 2 THEN 1 ELSE 0 END),
        partidos_perdidos_3_set = partidos_perdidos_3_set - (CASE WHEN NOT ganador_local_old AND sets_jugados_old = 3 THEN 1 ELSE 0 END),
        sets_ganados = sets_ganados - OLD.sets_local,
        sets_perdidos = sets_perdidos - OLD.sets_visitante,
        juegos_ganados = juegos_ganados - (OLD.juegos_set1_local + OLD.juegos_set2_local + COALESCE(OLD.juegos_set3_local, 0)),
        juegos_perdidos = juegos_perdidos - (OLD.juegos_set1_visitante + OLD.juegos_set2_visitante + COALESCE(OLD.juegos_set3_visitante, 0))
    WHERE id_usuario IN (OLD.id_jugador_local1, OLD.id_jugador_local2);

    -- Revertir estadísticas antiguas para los jugadores visitantes
    UPDATE estadisticas_jugador
    SET partidos_jugados = partidos_jugados - 1,
        partidos_ganados = partidos_ganados - (CASE WHEN NOT ganador_local_old THEN 1 ELSE 0 END),
        partidos_perdidos = partidos_perdidos - (CASE WHEN ganador_local_old THEN 1 ELSE 0 END),
        partidos_ganados_2_set = partidos_ganados_2_set - (CASE WHEN NOT ganador_local_old AND sets_jugados_old = 2 THEN 1 ELSE 0 END),
        partidos_ganados_3_set = partidos_ganados_3_set - (CASE WHEN NOT ganador_local_old AND sets_jugados_old = 3 THEN 1 ELSE 0 END),
        partidos_perdidos_2_set = partidos_perdidos_2_set - (CASE WHEN ganador_local_old AND sets_jugados_old = 2 THEN 1 ELSE 0 END),
        partidos_perdidos_3_set = partidos_perdidos_3_set - (CASE WHEN ganador_local_old AND sets_jugados_old = 3 THEN 1 ELSE 0 END),
        sets_ganados = sets_ganados - OLD.sets_visitante,
        sets_perdidos = sets_perdidos - OLD.sets_local,
        juegos_ganados = juegos_ganados - (OLD.juegos_set1_visitante + OLD.juegos_set2_visitante + COALESCE(OLD.juegos_set3_visitante, 0)),
        juegos_perdidos = juegos_perdidos - (OLD.juegos_set1_local + OLD.juegos_set2_local + COALESCE(OLD.juegos_set3_local, 0))
    WHERE id_usuario IN (OLD.id_jugador_visitante1, OLD.id_jugador_visitante2);

    -- Aplicar nuevas estadísticas para los jugadores locales
    UPDATE estadisticas_jugador
    SET partidos_jugados = partidos_jugados + 1,
        partidos_ganados = partidos_ganados + (CASE WHEN ganador_local_new THEN 1 ELSE 0 END),
        partidos_perdidos = partidos_perdidos + (CASE WHEN NOT ganador_local_new THEN 1 ELSE 0 END),
        partidos_ganados_2_set = partidos_ganados_2_set + (CASE WHEN ganador_local_new AND sets_jugados_new = 2 THEN 1 ELSE 0 END),
        partidos_ganados_3_set = partidos_ganados_3_set + (CASE WHEN ganador_local_new AND sets_jugados_new = 3 THEN 1 ELSE 0 END),
        partidos_perdidos_2_set = partidos_perdidos_2_set + (CASE WHEN NOT ganador_local_new AND sets_jugados_new = 2 THEN 1 ELSE 0 END),
        partidos_perdidos_3_set = partidos_perdidos_3_set + (CASE WHEN NOT ganador_local_new AND sets_jugados_new = 3 THEN 1 ELSE 0 END),
        sets_ganados = sets_ganados + NEW.sets_local,
        sets_perdidos = sets_perdidos + NEW.sets_visitante,
        juegos_ganados = juegos_ganados + (NEW.juegos_set1_local + NEW.juegos_set2_local + COALESCE(NEW.juegos_set3_local, 0)),
        juegos_perdidos = juegos_perdidos + (NEW.juegos_set1_visitante + NEW.juegos_set2_visitante + COALESCE(NEW.juegos_set3_visitante, 0))
    WHERE id_usuario IN (NEW.id_jugador_local1, NEW.id_jugador_local2);

    -- Aplicar nuevas estadísticas para los jugadores visitantes
    UPDATE estadisticas_jugador
    SET partidos_jugados = partidos_jugados + 1,
        partidos_ganados = partidos_ganados + (CASE WHEN NOT ganador_local_new THEN 1 ELSE 0 END),
        partidos_perdidos = partidos_perdidos + (CASE WHEN ganador_local_new THEN 1 ELSE 0 END),
        partidos_ganados_2_set = partidos_ganados_2_set + (CASE WHEN NOT ganador_local_new AND sets_jugados_new = 2 THEN 1 ELSE 0 END),
        partidos_ganados_3_set = partidos_ganados_3_set + (CASE WHEN NOT ganador_local_new AND sets_jugados_new = 3 THEN 1 ELSE 0 END),
        partidos_perdidos_2_set = partidos_perdidos_2_set + (CASE WHEN ganador_local_new AND sets_jugados_new = 2 THEN 1 ELSE 0 END),
        partidos_perdidos_3_set = partidos_perdidos_3_set + (CASE WHEN ganador_local_new AND sets_jugados_new = 3 THEN 1 ELSE 0 END),
        sets_ganados = sets_ganados + NEW.sets_visitante,
        sets_perdidos = sets_perdidos + NEW.sets_local,
        juegos_ganados = juegos_ganados + (NEW.juegos_set1_visitante + NEW.juegos_set2_visitante + COALESCE(NEW.juegos_set3_visitante, 0)),
        juegos_perdidos = juegos_perdidos + (NEW.juegos_set1_local + NEW.juegos_set2_local + COALESCE(NEW.juegos_set3_local, 0))
    WHERE id_usuario IN (NEW.id_jugador_visitante1, NEW.id_jugador_visitante2);

END;
//

DELIMITER ;





DELIMITER ;

-- -----------------------------------------------------
-- Trigger `actualiza_partidos_ganados_enfrentamiento`
-- -----------------------------------------------------
DELIMITER $$

CREATE TRIGGER `actualiza_partidos_ganados_enfrentamiento`
AFTER INSERT ON `partido`
FOR EACH ROW
BEGIN
  DECLARE partidos_local INT;
  DECLARE partidos_visitante INT;

  -- Calcular los partidos ganados por cada equipo en el enfrentamiento actual
  SELECT COUNT(*) INTO partidos_local
  FROM partido
  WHERE id_enfrentamiento = NEW.id_enfrentamiento
    AND sets_local > sets_visitante;

  SELECT COUNT(*) INTO partidos_visitante
  FROM partido
  WHERE id_enfrentamiento = NEW.id_enfrentamiento
    AND sets_visitante > sets_local;

  -- Actualizar los partidos ganados en la tabla enfrentamiento
  UPDATE enfrentamiento
  SET partidos_ganados_local = partidos_local,
      partidos_ganados_visitante = partidos_visitante
  WHERE id_enfrentamiento = NEW.id_enfrentamiento;
END$$

DELIMITER ;



-- -----------------------------------------------------
-- Trigger `actualiza_jugado_enfrentamiento`
-- -----------------------------------------------------
DELIMITER $$

CREATE TRIGGER `actualiza_jugado_enfrentamiento`
AFTER INSERT ON `partido`
FOR EACH ROW
BEGIN
  DECLARE total_partidos INT;
  DECLARE partidos_jugados INT;

  -- Obtener el número total de partidos y los partidos jugados en el enfrentamiento actual
  SELECT COUNT(*) INTO total_partidos
  FROM partido
  WHERE id_enfrentamiento = NEW.id_enfrentamiento;

  SELECT COUNT(*) INTO partidos_jugados
  FROM partido
  WHERE id_enfrentamiento = NEW.id_enfrentamiento
    AND (sets_local > 0 OR sets_visitante > 0);

  -- Si todos los partidos se han jugado, actualizar el campo jugado en la tabla enfrentamiento
  IF total_partidos = partidos_jugados THEN
    UPDATE enfrentamiento
    SET jugado = 1
    WHERE id_enfrentamiento = NEW.id_enfrentamiento;
  END IF;
END$$

DELIMITER ;



-- -----------------------------------------------------
-- Trigger `actualiza_partido_ganador`
-- actualiza el campo partidos_ganados_local o visitante en enfrentamiento
-- -----------------------------------------------------
DELIMITER $$

CREATE TRIGGER `actualiza_partido_ganador`
AFTER INSERT ON `partido`
FOR EACH ROW
BEGIN
  DECLARE ganador_local BOOLEAN;
  DECLARE ganador_visitante BOOLEAN;

  -- Verificar si el equipo local ganó el partido
  SET ganador_local = (NEW.sets_local > NEW.sets_visitante);
  
  -- Verificar si el equipo visitante ganó el partido
  SET ganador_visitante = (NEW.sets_visitante > NEW.sets_local);

  -- Actualizar el campo partidos_ganados en la tabla enfrentamiento
  IF ganador_local THEN
    UPDATE enfrentamiento
    SET partidos_ganados_local = partidos_ganados_local + 1
    WHERE id_enfrentamiento = NEW.id_enfrentamiento;
  ELSEIF ganador_visitante THEN
    UPDATE enfrentamiento
    SET partidos_ganados_visitante = partidos_ganados_visitante + 1
    WHERE id_enfrentamiento = NEW.id_enfrentamiento;
  END IF;
END$$

DELIMITER ;


DELIMITER $$
-- Trigger para actualizar la clasificación después de que un enfrentamiento se marque como jugado
CREATE TRIGGER actualiza_clasificacion
AFTER UPDATE ON enfrentamiento
FOR EACH ROW
BEGIN
  -- Declarar las variables
  DECLARE puntos_local INT DEFAULT 0;
  DECLARE puntos_visitante INT DEFAULT 0;
  DECLARE partidos_ganados_local INT DEFAULT 0;
  DECLARE partidos_ganados_visitante INT DEFAULT 0;
  DECLARE sets_ganados_local INT DEFAULT 0;
  DECLARE sets_ganados_visitante INT DEFAULT 0;
  DECLARE juegos_ganados_local INT DEFAULT 0;
  DECLARE juegos_ganados_visitante INT DEFAULT 0;
  DECLARE sets_perdidos_local INT DEFAULT 0;
  DECLARE sets_perdidos_visitante INT DEFAULT 0;
  DECLARE juegos_perdidos_local INT DEFAULT 0;
  DECLARE juegos_perdidos_visitante INT DEFAULT 0;

  -- Solo actualizar si el campo jugado cambia a 1
  IF NEW.jugado = 1 AND OLD.jugado = 0 THEN
    -- Obtener el número de partidos ganados por cada equipo en el enfrentamiento
    SELECT COUNT(*) INTO partidos_ganados_local 
    FROM partido 
    WHERE id_enfrentamiento = NEW.id_enfrentamiento 
    AND sets_local > sets_visitante;

    SELECT COUNT(*) INTO partidos_ganados_visitante 
    FROM partido 
    WHERE id_enfrentamiento = NEW.id_enfrentamiento 
    AND sets_local < sets_visitante;

    -- Obtener el número de sets y juegos ganados y perdidos por cada equipo en el enfrentamiento
    SELECT 
      SUM(sets_local), SUM(sets_visitante), 
      SUM(juegos_local), SUM(juegos_visitante),
      SUM(sets_visitante), SUM(sets_local),
      SUM(juegos_visitante), SUM(juegos_local)
    INTO 
      sets_ganados_local, sets_ganados_visitante, 
      juegos_ganados_local, juegos_ganados_visitante,
      sets_perdidos_local, sets_perdidos_visitante,
      juegos_perdidos_local, juegos_perdidos_visitante
    FROM partido 
    WHERE id_enfrentamiento = NEW.id_enfrentamiento;

    -- Calcular los puntos: 3 puntos por victoria en el enfrentamiento
    IF partidos_ganados_local > partidos_ganados_visitante THEN
      SET puntos_local = 3;
      SET puntos_visitante = 0;
    ELSEIF partidos_ganados_local < partidos_ganados_visitante THEN
      SET puntos_local = 0;
      SET puntos_visitante = 3;
    ELSE
      SET puntos_local = 1;
      SET puntos_visitante = 1;
    END IF;

    -- Actualizar las estadísticas del equipo local
    UPDATE equipo
    SET puntos = puntos + puntos_local,
        partidos_ganados = partidos_ganados + partidos_ganados_local,
        partidos_perdidos = partidos_perdidos + partidos_ganados_visitante,
        partidos_jugados = partidos_jugados + 1,
        sets_ganados = sets_ganados + sets_ganados_local,
        sets_perdidos = sets_perdidos + sets_perdidos_local,
        juegos_ganados = juegos_ganados + juegos_ganados_local,
        juegos_perdidos = juegos_perdidos + juegos_perdidos_local
    WHERE id_equipo = NEW.id_equipo_local;

    -- Actualizar las estadísticas del equipo visitante
    UPDATE equipo
    SET puntos = puntos + puntos_visitante,
        partidos_ganados = partidos_ganados + partidos_ganados_visitante,
        partidos_perdidos = partidos_perdidos + partidos_ganados_local,
        partidos_jugados = partidos_jugados + 1,
        sets_ganados = sets_ganados + sets_ganados_visitante,
        sets_perdidos = sets_perdidos + sets_perdidos_visitante,
        juegos_ganados = juegos_ganados + juegos_ganados_visitante,
        juegos_perdidos = juegos_perdidos + juegos_perdidos_visitante
    WHERE id_equipo = NEW.id_equipo_visitante;
  END IF;
END$$

DELIMITER ;

