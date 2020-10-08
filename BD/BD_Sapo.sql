-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema ach_gym
-- -----------------------------------------------------
-- Sistema de gestion para gimnasio ach_gym (sapo)

-- -----------------------------------------------------
-- Schema ach_gym
--
-- Sistema de gestion para gimnasio ach_gym (sapo)
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ach_gym` ;
USE `ach_gym` ;

-- -----------------------------------------------------
-- Table `ach_gym`.`Personas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ach_gym`.`Personas` (
  `IdPersona` INT NOT NULL,
  `Apellidos` VARCHAR(60) NULL,
  `Nombres` VARCHAR(60) NULL,
  `Sexo` CHAR(1) NULL,
  `FechaNac` DATE NULL,
  `Telefono` INT(11) NULL,
  `Email` VARCHAR(60) NULL,
  `Localidad` VARCHAR(70) NULL,
  `Calle` VARCHAR(60) NULL,
  `DNI` VARCHAR(45) NULL,
  `FechaAlta` DATE NULL,
  `FechaBaja` DATE NULL,
  `EstadoPer` CHAR(1) NULL DEFAULT 'A' COMMENT 'A: Alta\nB: Baja',
  `Observaciones` VARCHAR(255) NULL,
  PRIMARY KEY (`IdPersona`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ach_gym`.`Planes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ach_gym`.`Planes` (
  `IdPlan` INT NOT NULL,
  `Plan` VARCHAR(100) NULL,
  `Precio` DECIMAL(13,5) NULL,
  `Descripcion` VARCHAR(255) NULL,
  `EstadoPlan` CHAR(1) NULL,
  `HorarioInicio` VARCHAR(45) NULL,
  `HorarioFin` VARCHAR(45) NULL,
  `CantClases` INT NULL,
  PRIMARY KEY (`IdPlan`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ach_gym`.`Clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ach_gym`.`Clientes` (
  `IdCliente` INT NOT NULL,
  `IdPlan` INT NOT NULL COMMENT 'Se crea el cliente con IdPlan = 1 (Sin plan)',
  `Certificado` CHAR(1) NULL COMMENT 'Indica si el cliente presento un certificado.\n\nS: Si\nN: No',
  PRIMARY KEY (`IdCliente`, `IdPlan`),
  INDEX `fk_Clientes_Planes1_idx` (`IdPlan` ASC) ,
  CONSTRAINT `fk_Clientes_Personas1`
    FOREIGN KEY (`IdCliente`)
    REFERENCES `ach_gym`.`Personas` (`IdPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Clientes_Planes1`
    FOREIGN KEY (`IdPlan`)
    REFERENCES `ach_gym`.`Planes` (`IdPlan`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ach_gym`.`Mediciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ach_gym`.`Mediciones` (
  `IdMedicion` INT NOT NULL,
  `IdCliente` INT NOT NULL,
  `Altura` DECIMAL(5,2) NULL,
  `Peso` DECIMAL(5,2) NULL,
  `IMC` FLOAT NULL,
  `Musc` FLOAT NULL,
  `Grasa` FLOAT NULL,
  `GV` FLOAT NULL,
  `Fecha` DATE NULL,
  `EstadoMed` VARCHAR(45) NULL,
  PRIMARY KEY (`IdMedicion`),
  INDEX `fk_Mediciones_Clientes1_idx` (`IdCliente` ASC) ,
  CONSTRAINT `fk_Mediciones_Clientes1`
    FOREIGN KEY (`IdCliente`)
    REFERENCES `ach_gym`.`Clientes` (`IdCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ach_gym`.`Profesionales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ach_gym`.`Profesionales` (
  `IdProfesional` INT NOT NULL,
  `Especialidad` VARCHAR(200) NULL,
  `Observaciones` VARCHAR(255) NULL,
  INDEX `fk_Empleados_Personas1_idx` (`IdProfesional` ASC) ,
  CONSTRAINT `fk_Empleados_Personas1`
    FOREIGN KEY (`IdProfesional`)
    REFERENCES `ach_gym`.`Personas` (`IdPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ach_gym`.`Usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ach_gym`.`Usuarios` (
  `IdUsuario` INT NOT NULL,
  `Usuario` VARCHAR(60) NULL,
  `Password` CHAR(32) NULL,
  `FechaBaja` DATE NULL,
  `EstadoUs` CHAR(1) NULL,
  PRIMARY KEY (`IdUsuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ach_gym`.`Transacciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ach_gym`.`Transacciones` (
  `IdTransaccion` INT NOT NULL,
  `IdUsuario` INT NOT NULL,
  `IdCliente` INT NOT NULL,
  `IdPlan` INT NOT NULL,
  `Cantidad` INT NULL,
  `Monto` DECIMAL(13,2) NULL,
  PRIMARY KEY (`IdTransaccion`),
  INDEX `fk_Transacciones_Usuarios1_idx` (`IdUsuario` ASC) ,
  INDEX `fk_Transacciones_Clientes1_idx` (`IdCliente` ASC, `IdPlan` ASC) ,
  CONSTRAINT `fk_Transacciones_Usuarios1`
    FOREIGN KEY (`IdUsuario`)
    REFERENCES `ach_gym`.`Usuarios` (`IdUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Transacciones_Clientes1`
    FOREIGN KEY (`IdCliente` , `IdPlan`)
    REFERENCES `ach_gym`.`Clientes` (`IdCliente` , `IdPlan`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ach_gym`.`Egresos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ach_gym`.`Egresos` (
  `IdEgreso` INT NOT NULL,
  INDEX `fk_Egresos_Transacciones1_idx` (`IdEgreso` ASC) ,
  CONSTRAINT `fk_Egresos_Transacciones1`
    FOREIGN KEY (`IdEgreso`)
    REFERENCES `ach_gym`.`Transacciones` (`IdTransaccion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ach_gym`.`HistoricoPlanes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ach_gym`.`HistoricoPlanes` (
  `IdCliente` INT NOT NULL,
  `IdPlan` INT NOT NULL,
  INDEX `fk_HistoricoPlanes_Clientes1_idx` (`IdCliente` ASC, `IdPlan` ASC) ,
  CONSTRAINT `fk_HistoricoPlanes_Clientes1`
    FOREIGN KEY (`IdCliente` , `IdPlan`)
    REFERENCES `ach_gym`.`Clientes` (`IdCliente` , `IdPlan`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
