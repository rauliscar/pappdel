-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema pappdelBBDD
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema pappdelBBDD
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `pappdelBBDD` DEFAULT CHARACTER SET utf8 ;
USE `pappdelBBDD` ;

-- -----------------------------------------------------
-- Table `pappdelBBDD`.`sede`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pappdelBBDD`.`sede` (
  `id_sede` INT NOT NULL AUTO_INCREMENT,
  `nombre_sede` VARCHAR(45) NOT NULL,
  `localidad` VARCHAR(45) NOT NULL,
  `provincia` VARCHAR(45) NOT NULL,
  `calle` VARCHAR(45) NOT NULL,
  `numero` INT NOT NULL,
  `codigo_postal` INT NOT NULL,
  PRIMARY KEY (`id_sede`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pappdelBBDD`.`categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pappdelBBDD`.`categoria` (
  `id_categoria` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_categoria`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pappdelBBDD`.`grupo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pappdelBBDD`.`grupo` (
  `id_grupo` INT NOT NULL AUTO_INCREMENT,
  `nombre_grupo` VARCHAR(45) NULL,
  `id_categoria` INT NOT NULL,
  PRIMARY KEY (`id_grupo`),
  INDEX `fk_grupo_categoria1_idx` (`id_categoria` ASC) VISIBLE,
  CONSTRAINT `fk_grupo_categoria1`
    FOREIGN KEY (`id_categoria`)
    REFERENCES `pappdelBBDD`.`categoria` (`id_categoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pappdelBBDD`.`equipo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pappdelBBDD`.`equipo` (
  `id_equipo` INT NOT NULL AUTO_INCREMENT,
  `nombre_equipo` VARCHAR(45) NOT NULL,
  `logo` LONGTEXT NULL,
  `id_sede` INT NOT NULL,
  `id_grupo` INT NOT NULL,
  `id_capitan` INT NULL,
  PRIMARY KEY (`id_equipo`),
  INDEX `fk_equipo_sede1_idx` (`id_sede` ASC) VISIBLE,
  INDEX `fk_equipo_grupo1_idx` (`id_grupo` ASC) INVISIBLE,
  INDEX `fk_equipo_usuario_capitan_idx` (`id_capitan` ASC) VISIBLE,
  CONSTRAINT `fk_equipo_sede1`
    FOREIGN KEY (`id_sede`)
    REFERENCES `pappdelBBDD`.`sede` (`id_sede`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_equipo_grupo1`
    FOREIGN KEY (`id_grupo`)
    REFERENCES `pappdelBBDD`.`grupo` (`id_grupo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_equipo_usuario_capitan`
    FOREIGN KEY (`id_capitan`)
    REFERENCES `pappdelBBDD`.`usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pappdelBBDD`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pappdelBBDD`.`usuario` (
  `id_usuario` INT NOT NULL AUTO_INCREMENT,
  `nombre_usuario` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `apellidos` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `genero` ENUM("M", "F") NOT NULL,
  `telefono` INT NULL,
  `dni` VARCHAR(9) NOT NULL,
  `fecha_nacimiento` DATE NOT NULL,
  `foto_perfil` LONGTEXT NULL,
  `id_equipo` INT NULL,
  UNIQUE INDEX `nombre_usuario_UNIQUE` (`nombre_usuario` ASC) VISIBLE,
  PRIMARY KEY (`id_usuario`),
  INDEX `fk_usuario_equipo1_idx` (`id_equipo`ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  CONSTRAINT `fk_usuario_equipo1`
    FOREIGN KEY (`id_equipo`)
    REFERENCES `pappdelBBDD`.`equipo` (`id_equipo`)
    ON DELETE SET NULL
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pappdelBBDD`.`enfrentamiento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pappdelBBDD`.`enfrentamiento` (
  `id_enfrentamiento` INT NOT NULL AUTO_INCREMENT,
  `id_equipo_local` INT NOT NULL,
  `id_equipo_visitante` INT NOT NULL,
  `fecha` DATETIME NULL,
  `jugado` TINYINT NOT NULL DEFAULT 0,
  `aplazado` TINYINT NOT NULL DEFAULT 0,
  `confirmado_local` TINYINT NOT NULL DEFAULT 0,
  `confirmado_visitante` TINYINT NOT NULL DEFAULT 0,
  `id_grupo` INT NOT NULL,
  `partidos_ganados_local` INT NOT NULL DEFAULT 0,
  `partidos_ganados_visitante` INT NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_enfrentamiento`),
  INDEX `fk_enfrentamiento_grupo1_idx` (`id_grupo` ASC) VISIBLE,
  INDEX `fk_enfrentamiento_equipo_local_idx` (`id_equipo_local` ASC) VISIBLE,
  INDEX `fk_enfrentamiento_equipo_visitante_idx` (`id_equipo_visitante` ASC) VISIBLE,
  CONSTRAINT `fk_enfrentamiento_grupo1`
    FOREIGN KEY (`id_grupo`)
    REFERENCES `pappdelBBDD`.`grupo` (`id_grupo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_enfrentamiento_equipo_local`
    FOREIGN KEY (`id_equipo_local`)
    REFERENCES `pappdelBBDD`.`equipo` (`id_equipo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_enfrentamiento_equipo_visitante`
    FOREIGN KEY (`id_equipo_visitante`)
    REFERENCES `pappdelBBDD`.`equipo` (`id_equipo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pappdelBBDD`.`partido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pappdelBBDD`.`partido` (
  `id_partido` INT NOT NULL AUTO_INCREMENT,
  `nivel_partido` INT NOT NULL,
  `id_enfrentamiento` INT NOT NULL,
  `id_jugador_local1` INT NOT NULL,
  `id_jugador_local2` INT NOT NULL,
  `id_jugador_visitante1` INT NOT NULL,
  `id_jugador_visitante2` INT NOT NULL,
  `sets_local` INT NOT NULL DEFAULT 0,
  `sets_visitante` INT NOT NULL DEFAULT 0,
  `juegos_set1_local` INT NOT NULL DEFAULT 0,
  `juegos_set1_visitante` INT NOT NULL DEFAULT 0,
  `juegos_set2_local` INT NOT NULL DEFAULT 0,
  `juegos_set2_visitante` INT NOT NULL DEFAULT 0,
  `juegos_set3_local` INT NOT NULL DEFAULT 0,
  `juegos_set3_visitante` INT NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_partido`),
  INDEX `fk_partido_enfrentamiento1_idx` (`id_enfrentamiento` ASC) VISIBLE,
  INDEX `fk_partido_usuario1_idx` (`id_jugador_local1` ASC) VISIBLE,
  INDEX `fk_partido_usuario2_idx` (`id_jugador_local2` ASC) VISIBLE,
  INDEX `fk_partido_usuario3_idx` (`id_jugador_visitante1` ASC) VISIBLE,
  INDEX `fk_partido_usuario4_idx` (`id_jugador_visitante2` ASC) VISIBLE,
  CONSTRAINT `fk_partido_enfrentamiento1`
    FOREIGN KEY (`id_enfrentamiento`)
    REFERENCES `pappdelBBDD`.`enfrentamiento` (`id_enfrentamiento`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_partido_jugador_local1`
    FOREIGN KEY (`id_jugador_local1`)
    REFERENCES `pappdelBBDD`.`usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_partido_jugador_local2`
    FOREIGN KEY (`id_jugador_local2`)
    REFERENCES `pappdelBBDD`.`usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_partido_jugador_visitante1`
    FOREIGN KEY (`id_jugador_visitante1`)
    REFERENCES `pappdelBBDD`.`usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_partido_jugador_visitante2`
    FOREIGN KEY (`id_jugador_visitante2`)
    REFERENCES `pappdelBBDD`.`usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pappdelBBDD`.`clasificacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pappdelBBDD`.`clasificacion` (
  `id_clasificacion` INT NOT NULL AUTO_INCREMENT,
  `id_grupo` INT NOT NULL,
  `id_equipo` INT NOT NULL,
  `puntos` INT NOT NULL DEFAULT 0,
  `partidos_jugados` INT NOT NULL DEFAULT 0,
  `partidos_ganados` INT NOT NULL DEFAULT 0,
  `partidos_perdidos` INT NOT NULL DEFAULT 0,
  `sets_ganados` INT NOT NULL DEFAULT 0,
  `sets_perdidos` INT NOT NULL DEFAULT 0,
  `juegos_ganados` INT NOT NULL DEFAULT 0,
  `juegos_perdidos` INT NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_clasificacion`),
  INDEX `id_grupo_idx` (`id_grupo` ASC) VISIBLE,
  INDEX `id_equipo_idx` (`id_equipo` ASC) VISIBLE,
  CONSTRAINT `id_grupo`
    FOREIGN KEY (`id_grupo`)
    REFERENCES `pappdelBBDD`.`grupo` (`id_grupo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_equipo`
    FOREIGN KEY (`id_equipo`)
    REFERENCES `pappdelBBDD`.`equipo` (`id_equipo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pappdelBBDD`.`estadisticas_jugador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pappdelBBDD`.`estadisticas_jugador` (
  `id_estadistica` INT NOT NULL AUTO_INCREMENT,
  `id_usuario` INT NOT NULL,
  `partidos_jugados` INT NOT NULL DEFAULT 0,
  `partidos_ganados` INT NOT NULL DEFAULT 0,
  `partidos_perdidos` INT NOT NULL DEFAULT 0,
  `sets_ganados` INT NOT NULL DEFAULT 0,
  `sets_perdidos` INT NOT NULL DEFAULT 0,
  `juegos_ganados` INT NOT NULL DEFAULT 0,
  `juegos_perdidos` INT NOT NULL DEFAULT 0,
  `partidos_ganados_2_set` INT NOT NULL DEFAULT 0,
  `partidos_ganados_3_set` INT NOT NULL DEFAULT 0,
  `partidos_perdidos_2_set` INT NOT NULL DEFAULT 0,
  `partidos_perdidos_3_set` INT NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_estadistica`),
  INDEX `id_usuario_idx` (`id_usuario` ASC) VISIBLE,
  CONSTRAINT `id_usuario`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `pappdelBBDD`.`usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


