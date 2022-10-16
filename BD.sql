-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Producto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Producto` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Producto` (
  `Id_producto` INT NOT NULL,
  `Nombre_producto` VARCHAR(45) NOT NULL,
  `Precio_producto` DECIMAL(12) NOT NULL,
  `Stock_producto` INT NOT NULL,
  PRIMARY KEY (`Id_producto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Cliente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Cliente` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Cliente` (
  `Id_cliente` INT NOT NULL,
  `Nombre_cliente` VARCHAR(45) NOT NULL,
  `Contraseña_cliente` VARCHAR(45) NOT NULL,
  `Edad_cliente` INT(3) NOT NULL,
  `Nequi_cliente` INT(10) NULL,
  PRIMARY KEY (`Id_cliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Producto_Cliente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Producto_Cliente` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Producto_Cliente` (
  `Producto_Id_producto` INT NOT NULL,
  `Cliente_Id_cliente` INT NOT NULL,
  PRIMARY KEY (`Producto_Id_producto`, `Cliente_Id_cliente`),
  INDEX `fk_Producto_Cliente_Cliente1_idx` (`Cliente_Id_cliente` ASC) VISIBLE,
  CONSTRAINT `fk_Producto_Cliente_Producto`
    FOREIGN KEY (`Producto_Id_producto`)
    REFERENCES `mydb`.`Producto` (`Id_producto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Producto_Cliente_Cliente1`
    FOREIGN KEY (`Cliente_Id_cliente`)
    REFERENCES `mydb`.`Cliente` (`Id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Factura`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Factura` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Factura` (
  `Id_factura` INT NOT NULL,
  `Total_factura` DECIMAL(13) NULL,
  PRIMARY KEY (`Id_factura`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Producto_Factura`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Producto_Factura` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Producto_Factura` (
  `Producto_Id_producto` INT NOT NULL,
  `Factura_Id_factura` INT NOT NULL,
  PRIMARY KEY (`Producto_Id_producto`, `Factura_Id_factura`),
  INDEX `fk_Producto_Factura_Factura1_idx` (`Factura_Id_factura` ASC) VISIBLE,
  CONSTRAINT `fk_Producto_Factura_Producto1`
    FOREIGN KEY (`Producto_Id_producto`)
    REFERENCES `mydb`.`Producto` (`Id_producto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Producto_Factura_Factura1`
    FOREIGN KEY (`Factura_Id_factura`)
    REFERENCES `mydb`.`Factura` (`Id_factura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Cliente_Factura`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Cliente_Factura` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Cliente_Factura` (
  `Factura_Id_factura` INT NOT NULL,
  `Cliente_Id_cliente` INT NOT NULL,
  PRIMARY KEY (`Factura_Id_factura`, `Cliente_Id_cliente`),
  INDEX `fk_Cliente_Factura_Cliente1_idx` (`Cliente_Id_cliente` ASC) VISIBLE,
  CONSTRAINT `fk_Cliente_Factura_Factura1`
    FOREIGN KEY (`Factura_Id_factura`)
    REFERENCES `mydb`.`Factura` (`Id_factura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cliente_Factura_Cliente1`
    FOREIGN KEY (`Cliente_Id_cliente`)
    REFERENCES `mydb`.`Cliente` (`Id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Admin`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Admin` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Admin` (
  `Id_admin` INT NOT NULL,
  `Nombre_admin` VARCHAR(45) NOT NULL,
  `Contra_admin` VARCHAR(45) NOT NULL,
  `Edad_admin` INT(3) NOT NULL,
  PRIMARY KEY (`Id_admin`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Producto_Admin`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Producto_Admin` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Producto_Admin` (
  `Producto_Id_producto` INT NOT NULL,
  `Admin_Id_admin` INT NOT NULL,
  PRIMARY KEY (`Producto_Id_producto`, `Admin_Id_admin`),
  INDEX `fk_Producto_Admin_Admin1_idx` (`Admin_Id_admin` ASC) VISIBLE,
  CONSTRAINT `fk_Producto_Admin_Producto1`
    FOREIGN KEY (`Producto_Id_producto`)
    REFERENCES `mydb`.`Producto` (`Id_producto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Producto_Admin_Admin1`
    FOREIGN KEY (`Admin_Id_admin`)
    REFERENCES `mydb`.`Admin` (`Id_admin`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
