-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema ass11
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ass11
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ass11` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
-- -----------------------------------------------------
-- Schema assign1
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema assign1
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `assign1` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `ass11` ;

-- -----------------------------------------------------
-- Table `ass11`.`company1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ass11`.`company1` (
  `CompanyID` INT NOT NULL AUTO_INCREMENT,
  `CompanyName` VARCHAR(45) NULL DEFAULT NULL,
  `Street` VARCHAR(45) NULL DEFAULT NULL,
  `City` VARCHAR(45) NULL DEFAULT NULL,
  `State` VARCHAR(2) NULL DEFAULT NULL,
  `Zip` VARCHAR(10) NULL DEFAULT NULL,
  PRIMARY KEY (`CompanyID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ass11`.`contact1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ass11`.`contact1` (
  `ContactID` INT NOT NULL AUTO_INCREMENT,
  `CompanyID` INT NULL DEFAULT NULL,
  `FirstName` VARCHAR(45) NULL DEFAULT NULL,
  `LastName` VARCHAR(45) NULL DEFAULT NULL,
  `Street` VARCHAR(45) NULL DEFAULT NULL,
  `City` VARCHAR(45) NULL DEFAULT NULL,
  `State` VARCHAR(2) NULL DEFAULT NULL,
  `Zip` VARCHAR(10) NULL DEFAULT NULL,
  `IsMain` TINYINT(1) NULL DEFAULT NULL,
  `Email` VARCHAR(45) NULL DEFAULT NULL,
  `Phone` VARCHAR(12) NULL DEFAULT NULL,
  `company1_CompanyID` INT NOT NULL,
  PRIMARY KEY (`ContactID`),
  INDEX `fk_contact1_company11_idx` (`company1_CompanyID` ASC) VISIBLE,
  CONSTRAINT `fk_contact1_company11`
    FOREIGN KEY (`company1_CompanyID`)
    REFERENCES `ass11`.`company1` (`CompanyID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ass11`.`employee1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ass11`.`employee1` (
  `EmployeeID` INT NOT NULL AUTO_INCREMENT,
  `FirstName` VARCHAR(45) NULL DEFAULT NULL,
  `LastName` VARCHAR(45) NULL DEFAULT NULL,
  `Salary` DECIMAL(10,2) NULL DEFAULT NULL,
  `HireDate` DATE NULL DEFAULT NULL,
  `JobTitle` VARCHAR(25) NULL DEFAULT NULL,
  `Email` VARCHAR(45) NULL DEFAULT NULL,
  `Phone` VARCHAR(12) NULL DEFAULT NULL,
  PRIMARY KEY (`EmployeeID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ass11`.`contactemployee1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ass11`.`contactemployee1` (
  `ContactEmployeeID` INT NOT NULL AUTO_INCREMENT,
  `ContactID` INT NULL DEFAULT NULL,
  `CompanyID` INT NULL DEFAULT NULL,
  `EmployeeID` INT NULL DEFAULT NULL,
  `ContactDate` DATE NULL DEFAULT NULL,
  `Description` VARCHAR(100) NULL DEFAULT NULL,
  `employee1_EmployeeID` INT NOT NULL,
  `contact1_ContactID` INT NOT NULL,
  PRIMARY KEY (`ContactEmployeeID`),
  INDEX `fk_contactemployee1_employee1_idx` (`employee1_EmployeeID` ASC) VISIBLE,
  INDEX `fk_contactemployee1_contact11_idx` (`contact1_ContactID` ASC) VISIBLE,
  CONSTRAINT `fk_contactemployee1_employee1`
    FOREIGN KEY (`employee1_EmployeeID`)
    REFERENCES `ass11`.`employee1` (`EmployeeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_contactemployee1_contact11`
    FOREIGN KEY (`contact1_ContactID`)
    REFERENCES `ass11`.`contact1` (`ContactID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

USE `assign1` ;

-- -----------------------------------------------------
-- Table `assign1`.`company`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assign1`.`company` (
  `CompanyID` INT NOT NULL,
  `CompanyName` VARCHAR(45) NULL DEFAULT NULL,
  `Street` VARCHAR(45) NULL DEFAULT NULL,
  `City` VARCHAR(45) NULL DEFAULT NULL,
  `State` VARCHAR(2) NULL DEFAULT NULL,
  `Zip` VARCHAR(10) NULL DEFAULT NULL,
  PRIMARY KEY (`CompanyID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `assign1`.`contact`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assign1`.`contact` (
  `ContactID` INT NOT NULL,
  `CompanyID` INT NULL DEFAULT NULL,
  `FirstName` VARCHAR(45) NULL DEFAULT NULL,
  `LastName` VARCHAR(45) NULL DEFAULT NULL,
  `Street` VARCHAR(45) NULL DEFAULT NULL,
  `City` VARCHAR(45) NULL DEFAULT NULL,
  `State` VARCHAR(2) NULL DEFAULT NULL,
  `Zip` VARCHAR(10) NULL DEFAULT NULL,
  `IsMain` TINYINT(1) NULL DEFAULT NULL,
  `Email` VARCHAR(45) NULL DEFAULT NULL,
  `Phone` VARCHAR(12) NULL DEFAULT NULL,
  `company_CompanyID` INT NOT NULL,
  PRIMARY KEY (`ContactID`),
  INDEX `fk_contact_company1_idx` (`company_CompanyID` ASC) VISIBLE,
  CONSTRAINT `fk_contact_company1`
    FOREIGN KEY (`company_CompanyID`)
    REFERENCES `assign1`.`company` (`CompanyID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `assign1`.`employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assign1`.`employee` (
  `EmployeeID` INT NOT NULL,
  `FirstName` VARCHAR(45) NULL DEFAULT NULL,
  `LastName` VARCHAR(45) NULL DEFAULT NULL,
  `Salary` DECIMAL(10,2) NULL DEFAULT NULL,
  `HireDate` DATE NULL DEFAULT NULL,
  `JobTitle` VARCHAR(25) NULL DEFAULT NULL,
  `Email` VARCHAR(45) NULL DEFAULT NULL,
  `Phone` VARCHAR(12) NULL DEFAULT NULL,
  PRIMARY KEY (`EmployeeID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `assign1`.`contactemployee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assign1`.`contactemployee` (
  `ContactEmployeeID` INT NOT NULL,
  `ContactID` INT NULL DEFAULT NULL,
  `EmployeeID` INT NULL DEFAULT NULL,
  `ContactDate` DATE NULL DEFAULT NULL,
  `Description` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`ContactEmployeeID`),
  INDEX `ContactID` (`ContactID` ASC) VISIBLE,
  INDEX `EmployeeID` (`EmployeeID` ASC) VISIBLE,
  CONSTRAINT `contactemployee_ibfk_1`
    FOREIGN KEY (`ContactID`)
    REFERENCES `assign1`.`contact` (`ContactID`),
  CONSTRAINT `contactemployee_ibfk_2`
    FOREIGN KEY (`EmployeeID`)
    REFERENCES `assign1`.`employee` (`EmployeeID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
