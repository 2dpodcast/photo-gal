-- MySQL Script generated by MySQL Workbench
-- Thu 10 Nov 2016 06:06:43 PM MST
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema photo_db
-- -----------------------------------------------------
DROP TABLE IF EXISTS `photo_db`.`faves`;
-- -----------------------------------------------------


-- -----------------------------------------------------
-- Schema photo_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `photo_db` DEFAULT CHARACTER SET latin1 ;
USE `photo_db` ;

DROP TABLE IF EXISTS `photo_db`.`users`;
-- -----------------------------------------------------
-- Table `photo_db`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `photo_db`.`users` (
  `user_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `firstname` VARCHAR(45) NULL,
  `lastname` VARCHAR(45) NULL,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(128) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `is_admin` TINYINT(1) NULL DEFAULT 0,
  PRIMARY KEY (`user_id`))
ENGINE = InnoDB;


DROP TABLE IF EXISTS `photo_db`.`hidden_albums`;
-- -----------------------------------------------------
-- Table `photo_db`.`hidden_albums`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `photo_db`.`hidden_albums` (
  `hidden_album_id` INT NOT NULL AUTO_INCREMENT,
  `album_name` VARCHAR(45) NOT NULL,
  `is_hidden` TINYINT(1) NULL DEFAULT 1,
  PRIMARY KEY (`hidden_album_id`))
ENGINE = InnoDB;


DROP TABLE IF EXISTS `photo_db`.`hidden_images`;
-- -----------------------------------------------------
-- Table `photo_db`.`hidden_images`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `photo_db`.`hidden_images` (
  `hidden_image_id` INT NOT NULL AUTO_INCREMENT,
  `image_name` VARCHAR(45) NOT NULL,
  `is_hidden` TINYINT(1) NULL DEFAULT 1,
  PRIMARY KEY (`hidden_image_id`))
ENGINE = InnoDB;

-- Table `photo_db`.`faves`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `photo_db`.`faves` (
  `faves_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` INT UNSIGNED NOT NULL,
  `photo_name` VARCHAR(45) NOT NULL,
  `album_name` VARCHAR(45) NOT NULL,
  `reviewed` TINYINT(1) NULL DEFAULT 0,
  `request_hidden` TINYINT(1) NULL DEFAULT 0,
  PRIMARY KEY (`faves_id`),
  INDEX `index2` (`user_id` ASC),
  CONSTRAINT `fk_faves_1`
    FOREIGN KEY (`user_id`)
    REFERENCES `photo_db`.`users` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
