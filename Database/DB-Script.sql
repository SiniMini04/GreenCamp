/*
Greencamp ist eine Applikation bei der man ein Campingplatz reservieren kann.

Author: Bleron Regja
Date: 09.05.2023

History:

version	 Date			Who		Changes
1.2		 19.06.2023		Bleron	Anpassung des Scriptes, hinzufügen von TBenutzer
1.1		 09.05.2023		Bleron	Script überarbeitet
1.0		 11.04.2023		Bleron	created Script
*/

-- -----------------------------------------------------
-- Schema greencamp
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS greencamp DEFAULT CHARACTER SET utf8mb4 collate utf8mb4_unicode_ci;
USE greencamp ;

-- -----------------------------------------------------
-- Table `mydb`.`TCampsite`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS greencamp.TCampsite (
  CampNr INT NOT NULL AUTO_INCREMENT,
  CampActuallNr VARCHAR(4) NOT NULL,
  PRIMARY KEY (CampNr))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS greencamp.TKunden (
  KundId INT NOT NULL AUTO_INCREMENT,
  KundVorname VARCHAR(20) NOT NULL,
  KundName VARCHAR(20) NOT NULL,
  KundStrasse VARCHAR(30) NOT NULL,
  KundPlzOrt VARCHAR(20) NOT NULL,
  KundLand Varchar(25) NOT NULL,
  KundKreditkartenNr VARCHAR(19) NOT NULL,
  KundEMail VARCHAR(45) NOT NULL,
  KundTelefonNr VARCHAR(25) NOT NULL,
  PRIMARY KEY (KundId))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TBelege`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS greencamp.TBelege (
  BelegId INT NOT NULL AUTO_INCREMENT,
  KundenId INT NOT NULL,
  CampNr INT NOT NULL,
  BelegBeginMiete DATE NOT NULL,
  BelegEndeMiete DATE NOT NULL,
  PRIMARY KEY (BelegId))
  
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TBenutzer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS greencamp.TBenutzer (
  BenutzerId INT NOT NULL AUTO_INCREMENT,
  BenutzerName VARCHAR(45) NOT NULL,
  BenutzerPasswort VARCHAR(45) NOT NULL,
  PRIMARY KEY (BenutzerId))
ENGINE = InnoDB;


