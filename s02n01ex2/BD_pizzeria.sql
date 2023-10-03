-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema pizzeria
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema pizzeria
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `pizzeria` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `pizzeria` ;

-- -----------------------------------------------------
-- Table `pizzeria`.`Categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`Categoria` (
  `idCategoria` INT NOT NULL AUTO_INCREMENT,
  `nombreCategoria` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`idCategoria`))
ENGINE = InnoDB
AUTO_INCREMENT = 10
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pizzeria`.`Provincias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`Provincias` (
  `idProvincia` INT NOT NULL AUTO_INCREMENT,
  `nombreProvincia` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`idProvincia`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pizzeria`.`Localidades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`Localidades` (
  `idLocalidad` INT NOT NULL AUTO_INCREMENT,
  `nombreLocalidad` VARCHAR(255) NOT NULL,
  `idProvincia` INT NOT NULL,
  PRIMARY KEY (`idLocalidad`),
  INDEX `idProvinciaL_idx` (`idProvincia` ASC) VISIBLE,
  CONSTRAINT `idProvinciaL`
    FOREIGN KEY (`idProvincia`)
    REFERENCES `pizzeria`.`Provincias` (`idProvincia`))
ENGINE = InnoDB
AUTO_INCREMENT = 13
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pizzeria`.`Clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`Clientes` (
  `idCliente` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(255) NOT NULL,
  `apellidos` VARCHAR(255) NOT NULL,
  `direccion` VARCHAR(255) NOT NULL,
  `codigoPostal` VARCHAR(10) NOT NULL,
  `telefono` VARCHAR(15) NOT NULL,
  `idLocalidad` INT NOT NULL,
  PRIMARY KEY (`idCliente`),
  INDEX `idLocalidad_idx` (`idLocalidad` ASC) VISIBLE,
  CONSTRAINT `idLocalidad`
    FOREIGN KEY (`idLocalidad`)
    REFERENCES `pizzeria`.`Localidades` (`idLocalidad`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pizzeria`.`Empleados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`Empleados` (
  `idEmpleado` INT NOT NULL AUTO_INCREMENT,
  `nombreEmpleado` VARCHAR(255) NOT NULL,
  `apellidosEmpleados` VARCHAR(255) NOT NULL,
  `nif` VARCHAR(15) NOT NULL,
  `telefono` VARCHAR(15) NOT NULL,
  `rolEmpleado` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`idEmpleado`))
ENGINE = InnoDB
AUTO_INCREMENT = 49
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pizzeria`.`Productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`Productos` (
  `idProducto` INT NOT NULL AUTO_INCREMENT,
  `nombreProducto` VARCHAR(255) NOT NULL,
  `descripcion` VARCHAR(300) NOT NULL,
  `imagen` VARCHAR(255) NULL DEFAULT NULL,
  `precio` DECIMAL(10,2) NOT NULL,
  `idCategoria` INT NULL DEFAULT NULL,
  PRIMARY KEY (`idProducto`),
  INDEX `idCategoria_idx` (`idCategoria` ASC) VISIBLE,
  CONSTRAINT `idCategoria`
    FOREIGN KEY (`idCategoria`)
    REFERENCES `pizzeria`.`Categoria` (`idCategoria`))
ENGINE = InnoDB
AUTO_INCREMENT = 10
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pizzeria`.`Pedidos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`Pedidos` (
  `idPedido` INT NOT NULL AUTO_INCREMENT,
  `fechaHora` DATETIME NULL DEFAULT NULL,
  `tipoPedido` VARCHAR(255) NOT NULL,
  `cantidadPizza` INT NOT NULL,
  `cantidadHamburguesa` INT NOT NULL,
  `cantidadBebida` INT NOT NULL,
  `fechaHoraEntrega` DATETIME NULL DEFAULT NULL,
  `idCliente` INT NULL DEFAULT NULL,
  `idProducto` INT NULL DEFAULT NULL,
  `idLocalidad` INT NULL DEFAULT NULL,
  `idEmpleadoRepartidor` INT NULL DEFAULT NULL,
  `precioTotal` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`idPedido`),
  INDEX `idCliente_idx` (`idCliente` ASC) VISIBLE,
  INDEX `idProducto_idx` (`idProducto` ASC) VISIBLE,
  INDEX `idLocalidad_idx` (`idLocalidad` ASC) VISIBLE,
  INDEX `idLocalidadP_idx` (`idLocalidad` ASC) VISIBLE,
  INDEX `idEmpleadoRepartidor_idx` (`idEmpleadoRepartidor` ASC) VISIBLE,
  CONSTRAINT `idCliente`
    FOREIGN KEY (`idCliente`)
    REFERENCES `pizzeria`.`Clientes` (`idCliente`),
  CONSTRAINT `idEmpleadoRepartidor`
    FOREIGN KEY (`idEmpleadoRepartidor`)
    REFERENCES `pizzeria`.`Empleados` (`idEmpleado`),
  CONSTRAINT `idLocalidadP`
    FOREIGN KEY (`idLocalidad`)
    REFERENCES `pizzeria`.`Localidades` (`idLocalidad`),
  CONSTRAINT `idProducto`
    FOREIGN KEY (`idProducto`)
    REFERENCES `pizzeria`.`Productos` (`idProducto`))
ENGINE = InnoDB
AUTO_INCREMENT = 14
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pizzeria`.`Tiendas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`Tiendas` (
  `idTienda` INT NOT NULL AUTO_INCREMENT,
  `direccionTienda` VARCHAR(255) NOT NULL,
  `codigoPostal` VARCHAR(10) NOT NULL,
  `idLocalidad` INT NULL DEFAULT NULL,
  PRIMARY KEY (`idTienda`),
  INDEX `idLocalidadT_idx` (`idLocalidad` ASC) VISIBLE,
  CONSTRAINT `idLocalidadT`
    FOREIGN KEY (`idLocalidad`)
    REFERENCES `pizzeria`.`Localidades` (`idLocalidad`))
ENGINE = InnoDB
AUTO_INCREMENT = 13
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
