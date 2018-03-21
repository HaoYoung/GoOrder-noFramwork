-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema goorder
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema goorder
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `goorder` DEFAULT CHARACTER SET utf8 ;
USE `goorder` ;

-- -----------------------------------------------------
-- Table `goorder`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `goorder`.`users` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `fname` VARCHAR(45) NOT NULL,
  `lname` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `phone` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `company_name` VARCHAR(45) NULL,
  `type` VARCHAR(45) NOT NULL,
  `regdate` DATE NOT NULL,
  PRIMARY KEY (`user_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `goorder`.`address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `goorder`.`address` (
  `address_id` INT NOT NULL AUTO_INCREMENT,
  `street` VARCHAR(45) NOT NULL,
  `user_id` INT NOT NULL,
  `suit` VARCHAR(45) NULL,
  `city` VARCHAR(45) NOT NULL,
  `state` VARCHAR(45) NOT NULL,
  `zip` INT NOT NULL,
  PRIMARY KEY (`address_id`),
  INDEX `fk_address_users_idx` (`user_id` ASC),
  CONSTRAINT `fk_address_users`
    FOREIGN KEY (`user_id`)
    REFERENCES `goorder`.`users` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `goorder`.`dish`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `goorder`.`dish` (
  `dish_id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `category` VARCHAR(45) NOT NULL,
  `price` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`dish_id`),
  INDEX `fk_dish_users1_idx` (`user_id` ASC),
  CONSTRAINT `fk_dish_users1`
    FOREIGN KEY (`user_id`)
    REFERENCES `goorder`.`users` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `goorder`.`order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `goorder`.`order` (
  `order_id` INT NOT NULL AUTO_INCREMENT,
  `regdate` DATE NOT NULL,
  `customer_id` INT NOT NULL,
  `business_id` INT NOT NULL,
  `driver_id` INT NOT NULL,
  `ordercol` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`order_id`),
  INDEX `fk_order_users1_idx` (`customer_id` ASC),
  INDEX `fk_order_users2_idx` (`business_id` ASC),
  INDEX `fk_order_users3_idx` (`driver_id` ASC),
  CONSTRAINT `fk_order_users1`
    FOREIGN KEY (`customer_id`)
    REFERENCES `goorder`.`users` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_users2`
    FOREIGN KEY (`business_id`)
    REFERENCES `goorder`.`users` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_users3`
    FOREIGN KEY (`driver_id`)
    REFERENCES `goorder`.`users` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;