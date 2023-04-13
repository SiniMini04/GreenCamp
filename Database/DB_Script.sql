

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS mydb DEFAULT CHARACTER SET utf8mb4 collate utf8mb4_unicode_ci;
USE mydb ;

-- -----------------------------------------------------
-- Table mydb.TCampsite
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS mydb.TCampsite (
  CampNr INT NOT NULL,
  CampActuallNr VARCHAR(4) NOT NULL,
  CampBesetzt ENUM("Ja", "Nein") NOT NULL,
  PRIMARY KEY (CampNr))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table mydb.TKunden
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS mydb.TKunden (
  KundId INT NOT NULL AUTO_INCREMENT,
  KundVorname VARCHAR(45) NOT NULL,
  KundName VARCHAR(45) NOT NULL,
  KundAdresse VARCHAR(45) NOT NULL,
  KundKreditkartenNr INT NOT NULL,
  KundEMail VARCHAR(45) NOT NULL,
  KundTelefonNr INT NOT NULL,
  KundBeginMiete VARCHAR(45) NOT NULL,
  KundEndeMiete VARCHAR(45) NOT NULL,
  PRIMARY KEY (KundId))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table mydb.TBelege
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS mydb.TBelege (
  BelegId INT NOT NULL AUTO_INCREMENT,
  KundenId INT NOT NULL,
  CampNr INT NOT NULL,
  PRIMARY KEY (BelegId)
 
  
    )
ENGINE = InnoDB;

