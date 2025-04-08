-- MySQL Script generated by MySQL Workbench
-- Tue Apr  8 02:35:42 2025
-- Model: New Model    Version: 1.0
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
-- Table `mydb`.`Customers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Customers` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Customers` (
  `CustomerID` INT NOT NULL AUTO_INCREMENT,
  `FullName` VARCHAR(100) NOT NULL,
  `Phone` VARCHAR(20) NOT NULL,
  `Email` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`CustomerID`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `Email_UNIQUE` ON `mydb`.`Customers` (`Email` ASC) ;


-- -----------------------------------------------------
-- Table `mydb`.`Staff`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Staff` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Staff` (
  `StaffID` INT NOT NULL AUTO_INCREMENT,
  `FullName` VARCHAR(100) NOT NULL,
  `Role` VARCHAR(45) NOT NULL,
  `Salary` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`StaffID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Menu`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Menu` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Menu` (
  `MenuItemID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(100) NOT NULL,
  `Category` VARCHAR(45) NOT NULL,
  `Price` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`MenuItemID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Orders`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Orders` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Orders` (
  `OrderID` INT NOT NULL AUTO_INCREMENT,
  `CurstomerID` INT NOT NULL,
  `StaffID` INT NOT NULL,
  `OrderDate` DATE NOT NULL,
  `TotalCost` DECIMAL(10,2) NOT NULL,
  `Staff_StaffID` INT NOT NULL,
  PRIMARY KEY (`OrderID`),
  CONSTRAINT `fk_Orders_Staff1`
    FOREIGN KEY (`Staff_StaffID`)
    REFERENCES `mydb`.`Staff` (`StaffID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Orders_Staff1_idx` ON `mydb`.`Orders` (`Staff_StaffID` ASC) ;


-- -----------------------------------------------------
-- Table `mydb`.`OrdersDetails`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`OrdersDetails` ;

CREATE TABLE IF NOT EXISTS `mydb`.`OrdersDetails` (
  `OrderDetailID` INT NOT NULL AUTO_INCREMENT,
  `OrderID` INT NOT NULL,
  `MenuItemID` INT NOT NULL,
  `Quantity` INT NOT NULL,
  `Menu_MenuItemID` INT NOT NULL,
  PRIMARY KEY (`OrderDetailID`),
  CONSTRAINT `fk_OrdersDetails_Menu1`
    FOREIGN KEY (`Menu_MenuItemID`)
    REFERENCES `mydb`.`Menu` (`MenuItemID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_OrdersDetails_Menu1_idx` ON `mydb`.`OrdersDetails` (`Menu_MenuItemID` ASC) ;


-- -----------------------------------------------------
-- Table `mydb`.`DeliveryStatus`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`DeliveryStatus` ;

CREATE TABLE IF NOT EXISTS `mydb`.`DeliveryStatus` (
  `DeliveryID` INT NOT NULL AUTO_INCREMENT,
  `OrderID` INT NOT NULL,
  `DeliveryDate` DATE NOT NULL,
  `Status` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`DeliveryID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Bookings`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Bookings` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Bookings` (
  `BookingID` INT NOT NULL AUTO_INCREMENT,
  `CustomerID` INT NOT NULL,
  `BookingDate` DATE NOT NULL,
  `TableNumber` INT NOT NULL,
  `Customers_CustomerID` INT NOT NULL,
  PRIMARY KEY (`BookingID`),
  CONSTRAINT `fk_Bookings_Customers1`
    FOREIGN KEY (`Customers_CustomerID`)
    REFERENCES `mydb`.`Customers` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Bookings_Customers1_idx` ON `mydb`.`Bookings` (`Customers_CustomerID` ASC);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
