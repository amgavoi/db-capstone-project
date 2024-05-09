-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema LittleLemonDB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema LittleLemonDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `LittleLemonDB` DEFAULT CHARACTER SET utf8 ;
USE `LittleLemonDB` ;

-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Clients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Clients` (
  `ClientID` INT NOT NULL AUTO_INCREMENT,
  `FullName` VARCHAR(255) NOT NULL,
  `ContactNumber` INT NOT NULL,
  `Email` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`ClientID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Bookings` (
  `BookingID` INT NOT NULL AUTO_INCREMENT,
  `BookingDate` DATETIME NOT NULL,
  `TableNo` INT NOT NULL,
  `ClientID` INT NOT NULL,
  PRIMARY KEY (`BookingID`),
  INDEX `clientid_fk_idx` (`ClientID` ASC) VISIBLE,
  CONSTRAINT `clientid_fk`
    FOREIGN KEY (`ClientID`)
    REFERENCES `LittleLemonDB`.`Clients` (`ClientID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`MenuItems`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`MenuItems` (
  `MenuItemsID` INT NOT NULL AUTO_INCREMENT,
  `Starter` VARCHAR(255) NOT NULL,
  `Course` VARCHAR(255) NOT NULL,
  `Drink` VARCHAR(255) NOT NULL,
  `Dessert` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`MenuItemsID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Menu` (
  `MenuID` INT NOT NULL AUTO_INCREMENT,
  `MenuName` VARCHAR(45) NOT NULL,
  `Cuisine` VARCHAR(45) NOT NULL,
  `MenuItemsID` INT NOT NULL,
  PRIMARY KEY (`MenuID`),
  INDEX `menuitemsid_fk_idx` (`MenuItemsID` ASC) VISIBLE,
  CONSTRAINT `menuitemsid_fk`
    FOREIGN KEY (`MenuItemsID`)
    REFERENCES `LittleLemonDB`.`MenuItems` (`MenuItemsID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Delivery`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Delivery` (
  `DeliveryID` INT NOT NULL AUTO_INCREMENT,
  `DeliveryDate` DATETIME NOT NULL,
  `DeliveryStatus` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`DeliveryID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Orders` (
  `OrderID` INT NOT NULL AUTO_INCREMENT,
  `Date` DATETIME NOT NULL,
  `Quantity` INT NOT NULL,
  `TotalCost` DECIMAL(7,2) NOT NULL,
  `BookingID` INT NOT NULL,
  `ClientID` INT NOT NULL,
  `MenuID` INT NOT NULL,
  `DeliveryID` INT NOT NULL,
  PRIMARY KEY (`OrderID`),
  INDEX `bookingid_fk_idx` (`BookingID` ASC) VISIBLE,
  INDEX `clientid2_fk_idx` (`ClientID` ASC) VISIBLE,
  INDEX `menuid_fk_idx` (`MenuID` ASC) VISIBLE,
  INDEX `deliveryid_fk_idx` (`DeliveryID` ASC) VISIBLE,
  CONSTRAINT `bookingid_fk`
    FOREIGN KEY (`BookingID`)
    REFERENCES `LittleLemonDB`.`Bookings` (`BookingID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `clientid2_fk`
    FOREIGN KEY (`ClientID`)
    REFERENCES `LittleLemonDB`.`Clients` (`ClientID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `menuid_fk`
    FOREIGN KEY (`MenuID`)
    REFERENCES `LittleLemonDB`.`Menu` (`MenuID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `deliveryid_fk`
    FOREIGN KEY (`DeliveryID`)
    REFERENCES `LittleLemonDB`.`Delivery` (`DeliveryID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Staff` (
  `StaffID` INT NOT NULL AUTO_INCREMENT,
  `FullName` VARCHAR(255) NOT NULL,
  `ContactNumber` INT NOT NULL,
  `Email` VARCHAR(255) NOT NULL,
  `Role` VARCHAR(45) NOT NULL,
  `Salary` DECIMAL(9,2) NOT NULL,
  `ClientID` INT NOT NULL,
  PRIMARY KEY (`StaffID`),
  INDEX `clientid3_fk_idx` (`ClientID` ASC) VISIBLE,
  CONSTRAINT `clientid3_fk`
    FOREIGN KEY (`ClientID`)
    REFERENCES `LittleLemonDB`.`Clients` (`ClientID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
