/*
Greencamp ist eine Applikation bei der man ein Campingplatz reservieren kann.

Author: Bleron Regja
Date: 09.05.2023

History:

version	 Date			Who		Changes
1.1		 09.05.2023		Bleron	Script überarbeitet
1.0		 11.04.2023		Bleron	created Script
*/

-- -----------------------------------------------------
-- Schema greencamp
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS greencamp DEFAULT CHARACTER SET utf8mb4 collate utf8mb4_unicode_ci;
USE greencamp ;

-- -----------------------------------------------------
-- Table greencamp.TCampsite
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS greencamp.TCampsite (
  CampNr INT NOT NULL,
  CampActuallNr VARCHAR(4) NOT NULL,
  PRIMARY KEY (CampNr))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table greencamp.TKunden
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS greencamp.TKunden (
  KundId INT NOT NULL AUTO_INCREMENT,
  KundVorname VARCHAR(16) NOT NULL,
  KundName VARCHAR(16) NOT NULL,
  KundStrasse VARCHAR(30) NOT NULL,
  KundPlzOrt VARCHAR(16) NOT NULL,
  KundLand Varchar(25) NOT NULL,
  KundKreditkartenNr VARCHAR(19) NOT NULL,
  KundEMail VARCHAR(45) NOT NULL,
  KundTelefonNr VARCHAR(20) NOT NULL,
  KundBeginMiete date NOT NULL,
  KundEndeMiete date NOT NULL,
  PRIMARY KEY (KundId))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table greencamp.TBelege
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS greencamp.TBelege (
  BelegId INT NOT NULL AUTO_INCREMENT,
  KundId INT NOT NULL,
  CampNr INT NOT NULL,
  PRIMARY KEY (BelegId)
 
  
    )
ENGINE = InnoDB;

