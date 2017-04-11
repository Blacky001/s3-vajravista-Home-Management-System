use bridgedb;
SET FOREIGN_KEY_CHECKS=0;

  
ALTER TABLE `bridgedb`.`GlobalRefClassHierarchy` 
ADD UNIQUE INDEX `uq_parent_child_grch` (`ParentClassCode` ASC, `ClassCode` ASC);

ALTER TABLE `bridgedb`.`GlobalRefDataHierarchy` 
ADD UNIQUE INDEX `uq_parent_child_grdh` (`ParentDataCode` ASC, `DataCode` ASC);


ALTER TABLE `bridgedb`.`TenantRefDataHierarchy` 
ADD UNIQUE INDEX `uq_parent_child_trdh` (`DataCode` ASC, `ParentDataCode` ASC, `TenantId` ASC);


ALTER TABLE `bridgedb`.`TenantRefClassHierarchy` 
ADD UNIQUE INDEX `uq_parent_child_trch` (`ClassCode` ASC, `ParentClassCode` ASC);  

-- -----------------------------------------------------
-- Table `bridgedb`.`QCQuestionAttachment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bridgedb`.`QCQuestionAttachment` ;

CREATE TABLE IF NOT EXISTS `bridgedb`.`QCQuestionAttachment` (
  `QCQuestion` INT NOT NULL,
  `Attachment` INT NOT NULL,
  PRIMARY KEY (`QCQuestion`, `Attachment`),
  CONSTRAINT `fk_qcquestionattachment_qcquestion`
    FOREIGN KEY (`QCQuestion`)
    REFERENCES `bridgedb`.`QCQuestion` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_qcquestionattachment_attachment`
    FOREIGN KEY (`Attachment`)
    REFERENCES `bridgedb`.`Attachment` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_qcquestionattachment_attachment_idx` ON `bridgedb`.`QCQuestionAttachment` (`Attachment` ASC);


-- -----------------------------------------------------
-- Table `bridgedb`.`QCQuestionOptionAttachment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bridgedb`.`QCQuestionOptionAttachment` ;

CREATE TABLE IF NOT EXISTS `bridgedb`.`QCQuestionOptionAttachment` (
  `QCQuestionOption` INT NOT NULL,
  `Attachment` INT NOT NULL,
  PRIMARY KEY (`QCQuestionOption`, `Attachment`),
  CONSTRAINT `fk_qcqoa_qcquestionoption`
    FOREIGN KEY (`QCQuestionOption`)
    REFERENCES `bridgedb`.`QCQuestionOption` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_qcqoa_attachment`
    FOREIGN KEY (`Attachment`)
    REFERENCES `bridgedb`.`Attachment` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_qcqoa_attachment_idx` ON `bridgedb`.`QCQuestionOptionAttachment` (`Attachment` ASC);


-- -----------------------------------------------------
-- Table `bridgedb`.`QCQuestionResponseAttachment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bridgedb`.`QCQuestionResponseAttachment` ;

CREATE TABLE IF NOT EXISTS `bridgedb`.`QCQuestionResponseAttachment` (
  `QCQuestionResponse` INT NOT NULL,
  `Attachment` INT NOT NULL,
  PRIMARY KEY (`QCQuestionResponse`, `Attachment`),
  CONSTRAINT `fk_qcqra_qcquestionresponse`
    FOREIGN KEY (`QCQuestionResponse`)
    REFERENCES `bridgedb`.`QCQuestionResponse` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_qcqra_attachment`
    FOREIGN KEY (`Attachment`)
    REFERENCES `bridgedb`.`Attachment` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_qcqra_attachment_idx` ON `bridgedb`.`QCQuestionResponseAttachment` (`Attachment` ASC);

ALTER TABLE `bridgedb`.`qcquestionresponse` 
CHANGE COLUMN `QCOption` `QCOption` INT(11) NULL DEFAULT NULL;

SET FOREIGN_KEY_CHECKS=1;