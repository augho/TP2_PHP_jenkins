SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ##DB_NAME##
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `##DB_NAME##`;
CREATE SCHEMA IF NOT EXISTS `##DB_NAME##` DEFAULT CHARACTER SET utf8 ;
USE `##DB_NAME##` ;

-- -----------------------------------------------------
-- Table `##DB_NAME##`.`prof`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `##DB_NAME##`.`prof` (
  `idprof` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(100) NOT NULL,
  `prenom` VARCHAR(100) NOT NULL,
  `datenaiss` VARCHAR(25) NULL,
  `lieunaiss` VARCHAR(100) NULL,
  PRIMARY KEY (`idprof`)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `##DB_NAME##`.`cours`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `##DB_NAME##`.`cours` (
  `idcours` INT NOT NULL AUTO_INCREMENT,
  `intitule` VARCHAR(200) NOT NULL,
  `duree` VARCHAR(10) NOT NULL,
  `idprof` INT NULL,
  PRIMARY KEY (`idcours`),
  INDEX `fk_cours_prof_idx` (`idprof` ASC),
  CONSTRAINT `fk_cours_prof`
    FOREIGN KEY (`idprof`)
    REFERENCES `##DB_NAME##`.`prof` (`idprof`)
    ON DELETE SET NULL
    ON UPDATE CASCADE
) ENGINE = InnoDB;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


INSERT INTO ##DB_NAME##.prof (nom, prenom, datenaiss, lieunaiss)
VALUES 
    ('Bernard', 'Paul', '1985-02-14', 'Nice'),
    ('Petit', 'Anne', '1978-11-23', 'Toulouse'),
    ('Legrand', 'Sophie', '1983-07-19', 'Bordeaux');

INSERT INTO ##DB_NAME##.cours (intitule, duree, idprof)
VALUES 
    ('Informatique', '35h', 1),  -- Professeur avec idprof=1
    ('Biologie', '28h', 2),      -- Professeur avec idprof=2
    ('Géographie', '22h', 3);    -- Professeur avec idprof=3
