-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema optica
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema optica
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `optica` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `optica` ;

-- -----------------------------------------------------
-- Table `optica`.`clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`clientes` (
  `idclientes` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(255) NOT NULL,
  `direccion_postal` VARCHAR(255) NULL DEFAULT NULL,
  `telefono` VARCHAR(20) NULL DEFAULT NULL,
  `correo_electronico` VARCHAR(255) NULL DEFAULT NULL,
  `fecha_registro` DATE NOT NULL,
  `idClienteRecomendado` INT NOT NULL,
  PRIMARY KEY (`idclientes`, `idClienteRecomendado`),
  INDEX `idClienteRecomendado_idx` (`idClienteRecomendado` ASC) VISIBLE,
  CONSTRAINT `idClienteRecomendado`
    FOREIGN KEY (`idClienteRecomendado`)
    REFERENCES `optica`.`clientes` (`idclientes`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `optica`.`empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`empleado` (
  `idempleado` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`idempleado`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `optica`.`marcas_gafas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`marcas_gafas` (
  `idmarcas` INT NOT NULL AUTO_INCREMENT,
  `nombre_marca` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`idmarcas`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `optica`.`proveedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`proveedor` (
  `idproveedor` INT NOT NULL AUTO_INCREMENT,
  `nombre_proveedor` VARCHAR(100) NOT NULL,
  `direccion` TEXT NULL DEFAULT NULL,
  `telefono` VARCHAR(20) NOT NULL,
  `fax` VARCHAR(20) NULL DEFAULT NULL,
  `nif` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`idproveedor`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `optica`.`gafas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`gafas` (
  `idgafas` INT NOT NULL AUTO_INCREMENT,
  `graduacion_cristal_izquierdo` VARCHAR(50) NOT NULL,
  `graduacion_cristal_derecho` VARCHAR(50) NOT NULL,
  `tipo_montura` VARCHAR(50) NOT NULL,
  `color_montura` VARCHAR(50) NOT NULL,
  `color_cristal_izquierdo` VARCHAR(50) NOT NULL,
  `color_cristal_derecho` VARCHAR(50) NOT NULL,
  `precio` DECIMAL(10,2) NOT NULL,
  `idmarcas` INT NOT NULL,
  `idproveedor` INT NOT NULL,
  PRIMARY KEY (`idgafas`, `idproveedor`, `idmarcas`),
  INDEX `idmarcas_idx` (`idmarcas` ASC) VISIBLE,
  INDEX `idproveedor_idx` (`idproveedor` ASC) VISIBLE,
  CONSTRAINT `idmarcas`
    FOREIGN KEY (`idmarcas`)
    REFERENCES `optica`.`marcas_gafas` (`idmarcas`),
  CONSTRAINT `idproveedor`
    FOREIGN KEY (`idproveedor`)
    REFERENCES `optica`.`proveedor` (`idproveedor`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `optica`.`ventas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`ventas` (
  `idventas` INT NOT NULL AUTO_INCREMENT,
  `fecha_venta` DATETIME NOT NULL,
  `idgafas` INT NOT NULL,
  `idcliente` INT NOT NULL,
  `idempleado` INT NOT NULL,
  PRIMARY KEY (`idventas`, `idcliente`, `idempleado`, `idgafas`),
  INDEX `idgafas_idx` (`idgafas` ASC) VISIBLE,
  INDEX `idcliente_idx` (`idcliente` ASC) VISIBLE,
  INDEX `idempleado_idx` (`idempleado` ASC) VISIBLE,
  CONSTRAINT `idcliente`
    FOREIGN KEY (`idcliente`)
    REFERENCES `optica`.`clientes` (`idclientes`),
  CONSTRAINT `idempleado`
    FOREIGN KEY (`idempleado`)
    REFERENCES `optica`.`empleado` (`idempleado`),
  CONSTRAINT `idgafas`
    FOREIGN KEY (`idgafas`)
    REFERENCES `optica`.`gafas` (`idgafas`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
