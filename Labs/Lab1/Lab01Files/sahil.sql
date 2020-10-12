-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Shah_SalesOrders
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Shah_SalesOrders
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Shah_SalesOrders` DEFAULT CHARACTER SET utf8 ;
USE `Shah_SalesOrders` ;

-- -----------------------------------------------------
-- Table `Shah_SalesOrders`.`CUSTOMER TYPE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Shah_SalesOrders`.`CUSTOMER TYPE` (
  `custTypeId` CHAR(1) NOT NULL,
  `typename` VARCHAR(20) NULL,
  PRIMARY KEY (`custTypeId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Shah_SalesOrders`.`CUSTOMER`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Shah_SalesOrders`.`CUSTOMER` (
  `customerID` INT NOT NULL,
  `name` VARCHAR(50) NULL,
  `addr1` VARCHAR(50) NULL,
  `addr2` VARCHAR(50) NULL,
  `city` VARCHAR(20) NULL,
  `state` CHAR(2) NULL,
  `zip` CHAR(2) NULL,
  `custTypeID` CHAR(1) NULL,
  PRIMARY KEY (`customerID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Shah_SalesOrders`.`INVOICEHDR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Shah_SalesOrders`.`INVOICEHDR` (
  `invoiceID` INT NOT NULL,
  `customerID` INT NULL,
  `salesDate` DATE NULL,
  PRIMARY KEY (`invoiceID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Shah_SalesOrders`.`PRODTYPE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Shah_SalesOrders`.`PRODTYPE` (
  `prodTypeID` INT NOT NULL,
  `typeDescription` VARCHAR(20) NULL,
  `BUID` CHAR(1) NULL,
  `PRODTYPEcol` VARCHAR(45) NULL,
  PRIMARY KEY (`prodTypeID`))
ENGINE = InnoDB
COMMENT = '	';


-- -----------------------------------------------------
-- Table `Shah_SalesOrders`.`INVOICEDTL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Shah_SalesOrders`.`INVOICEDTL` (
  `invoiceID` INT NOT NULL,
  `prodID` INT NULL,
  `amt` DECIMAL(10,2) NULL,
  `qty` DECIMAL(8,2) NULL,
  `discounted` TINYINT NULL,
  PRIMARY KEY (`invoiceID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Shah_SalesOrders`.`PRODUCT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Shah_SalesOrders`.`PRODUCT` (
  `prodID` INT NOT NULL,
  `description` VARCHAR(50) NULL,
  `price1` DECIMAL(10,2) NULL,
  `price2` DECIMAL(10,2) NULL,
  `prodTypeID` INT NULL,
  `unitCost` DECIMAL(10,2) NULL,
  `supplierID` INT NULL,
  PRIMARY KEY (`prodID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Shah_SalesOrders`.`SUPPLIER`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Shah_SalesOrders`.`SUPPLIER` (
  `supplierID` INT NOT NULL,
  `name` VARCHAR(50) NULL,
  `addr1` VARCHAR(50) NULL,
  `addr2` VARCHAR(50) NULL,
  `city` VARCHAR(50) NULL,
  `state` CHAR(2) NULL,
  `zip` CHAR(5) NULL,
  PRIMARY KEY (`supplierID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Shah_SalesOrders`.`BUSINESS_UNIT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Shah_SalesOrders`.`BUSINESS_UNIT` (
  `BUID` CHAR(1) NOT NULL,
  `name` VARCHAR(25) NULL,
  `abbrev` VARCHAR(10) NULL,
  PRIMARY KEY (`BUID`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
