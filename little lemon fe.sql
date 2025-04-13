-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`menu items`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`menu items` (
  `menu item id` INT NOT NULL,
  `course name` VARCHAR(45) NULL,
  `cuisine name` VARCHAR(45) NULL,
  `starter name` VARCHAR(45) NULL,
  `desert name` VARCHAR(45) NULL,
  `drink` VARCHAR(45) NULL,
  `sides` VARCHAR(45) NULL,
  PRIMARY KEY (`menu item id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`customers` (
  `customer id` INT NOT NULL,
  `customer name` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `country` VARCHAR(45) NULL,
  `postal code` VARCHAR(45) NULL,
  `country code` VARCHAR(45) NULL,
  PRIMARY KEY (`customer id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`orders` (
  `order id` INT NOT NULL,
  `order date` VARCHAR(45) NULL,
  `delivery date` VARCHAR(45) NULL,
  `cost` VARCHAR(45) NULL,
  `sales` INT NULL,
  `quantity` VARCHAR(45) NULL,
  `discount` VARCHAR(45) NULL,
  `delivery cost` VARCHAR(45) NULL,
  `customer id` INT NULL,
  `menu item id` INT NULL,
  PRIMARY KEY (`order id`),
  INDEX `menu item id_idx` (`menu item id` ASC) VISIBLE,
  INDEX `customer id_idx` (`customer id` ASC) VISIBLE,
  CONSTRAINT `menu item id`
    FOREIGN KEY (`menu item id`)
    REFERENCES `mydb`.`menu items` (`menu item id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `customer id`
    FOREIGN KEY (`customer id`)
    REFERENCES `mydb`.`customers` (`customer id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
