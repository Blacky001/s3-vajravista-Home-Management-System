use bridgedb;
SET FOREIGN_KEY_CHECKS=0;

UPDATE `bridgedb`.`thisdbversion` SET `Version`='8.0.6' WHERE `Id`='1';

-- -----------------------------------------------------
-- Table `bridgedb`.`Trader`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bridgedb`.`Trader` ;

CREATE TABLE IF NOT EXISTS `bridgedb`.`Trader` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Tenant` INT NOT NULL,
  `Marketer` INT NOT NULL,
  `OpportunityType` VARCHAR(255) NOT NULL,
  `updatedChannel` INT NULL,
  `updatedVenture` INT NULL,
  `updatedIE` DECIMAL(20,0) NULL,
  `createdDateTime` DATETIME(3) NULL,
  `notes` VARCHAR(500) NULL,
  `createdIE` DECIMAL(20,0) NULL,
  `updatedUser` INT NULL,
  `inActiveReason` VARCHAR(500) NULL,
  `appCreatedDateTime` DATETIME(3) NULL,
  `inActiveDateTime` DATETIME(3) NULL,
  `createdTenant` INT NULL,
  `createdChannel` INT NULL,
  `updatedTenant` INT NULL,
  `updatedDateTime` DATETIME(3) NULL,
  `createdUser` INT NULL,
  `appUpdatedDateTime` DATETIME(3) NULL,
  `aliasId` VARCHAR(50) NULL,
  `iconpic` VARCHAR(225) NULL,
  `isActive` TINYINT(1) NULL,
  `createdVenture` INT NULL,
  PRIMARY KEY (`Id`),
  CONSTRAINT `fk_trader_trader`
    FOREIGN KEY (`Marketer`)
    REFERENCES `bridgedb`.`Actor` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_trader_tenant`
    FOREIGN KEY (`Tenant`)
    REFERENCES `bridgedb`.`Tenant` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_trader_trader_idx` ON `bridgedb`.`Trader` (`Marketer` ASC);

CREATE INDEX `fk_trader_tenant_idx` ON `bridgedb`.`Trader` (`Tenant` ASC);


-- -----------------------------------------------------
-- Table `bridgedb`.`TraderProduct`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bridgedb`.`TraderProduct` ;

CREATE TABLE IF NOT EXISTS `bridgedb`.`TraderProduct` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Trader` INT NULL,
  `Tenant` INT NOT NULL,
  `Product` INT NOT NULL,
  `Quantity` INT NULL,
  `Frequency` INT NULL,
  `Price` INT NULL,
  `PriceUOM` INT NULL,
  `updatedChannel` INT NULL,
  `updatedVenture` INT NULL,
  `updatedIE` DECIMAL(20,0) NULL,
  `createdDateTime` DATETIME(3) NULL,
  `notes` VARCHAR(500) NULL,
  `createdIE` DECIMAL(20,0) NULL,
  `updatedUser` INT NULL,
  `inActiveReason` VARCHAR(500) NULL,
  `appCreatedDateTime` DATETIME(3) NULL,
  `inActiveDateTime` DATETIME(3) NULL,
  `createdTenant` INT NULL,
  `createdChannel` INT NULL,
  `updatedTenant` INT NULL,
  `updatedDateTime` DATETIME(3) NULL,
  `createdUser` INT NULL,
  `appUpdatedDateTime` DATETIME(3) NULL,
  `aliasId` VARCHAR(50) NULL,
  `iconpic` VARCHAR(225) NULL,
  `isActive` TINYINT(1) NULL,
  `createdVenture` INT NULL,
  PRIMARY KEY (`Id`),
  CONSTRAINT `fk_traderproduct_trader`
    FOREIGN KEY (`Trader`)
    REFERENCES `bridgedb`.`Trader` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_traderproduct_product`
    FOREIGN KEY (`Product`)
    REFERENCES `bridgedb`.`Product` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_traderproduct_quantity`
    FOREIGN KEY (`Quantity`)
    REFERENCES `bridgedb`.`UOMValue` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_traderproduct_frequency`
    FOREIGN KEY (`Frequency`)
    REFERENCES `bridgedb`.`UOMValue` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_traderproduct_price`
    FOREIGN KEY (`Price`)
    REFERENCES `bridgedb`.`CurrencyValue` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_traderproduct_priceuom`
    FOREIGN KEY (`PriceUOM`)
    REFERENCES `bridgedb`.`UOM` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_traderproduct_tenant`
    FOREIGN KEY (`Tenant`)
    REFERENCES `bridgedb`.`Tenant` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_traderproduct_product_idx` ON `bridgedb`.`TraderProduct` (`Product` ASC);

CREATE INDEX `fk_traderproduct_quantity_idx` ON `bridgedb`.`TraderProduct` (`Quantity` ASC);

CREATE INDEX `fk_traderproduct_frequency_idx` ON `bridgedb`.`TraderProduct` (`Frequency` ASC);

CREATE INDEX `fk_traderproduct_price_idx` ON `bridgedb`.`TraderProduct` (`Price` ASC);

CREATE INDEX `fk_traderproduct_tenant_idx` ON `bridgedb`.`TraderProduct` (`Tenant` ASC);

CREATE INDEX `fk_traderproduct_priceuom_idx` ON `bridgedb`.`TraderProduct` (`PriceUOM` ASC);


-- -----------------------------------------------------
-- Table `bridgedb`.`OrderLineItemSpec`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bridgedb`.`OrderLineItemSpec` ;

CREATE TABLE IF NOT EXISTS `bridgedb`.`OrderLineItemSpec` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Value` VARCHAR(255) NOT NULL,
  `OrderLineItem` INT NULL DEFAULT NULL,
  `SpecificationMaster` INT NOT NULL,
  `Tenant` INT NOT NULL,
  `updatedChannel` INT NULL,
  `updatedVenture` INT NULL,
  `updatedIE` DECIMAL(20,0) NULL,
  `createdDateTime` DATETIME(3) NULL,
  `notes` VARCHAR(500) NULL,
  `createdIE` DECIMAL(20,0) NULL,
  `updatedUser` INT NULL,
  `inActiveReason` VARCHAR(500) NULL,
  `appCreatedDateTime` DATETIME(3) NULL,
  `inActiveDateTime` DATETIME(3) NULL,
  `createdTenant` INT NULL,
  `createdChannel` INT NULL,
  `updatedTenant` INT NULL,
  `updatedDateTime` DATETIME(3) NULL,
  `createdUser` INT NULL,
  `appUpdatedDateTime` DATETIME(3) NULL,
  `aliasId` VARCHAR(50) NULL,
  `iconpic` VARCHAR(225) NULL,
  `isActive` TINYINT(1) NULL,
  `createdVenture` INT NULL,
  PRIMARY KEY (`Id`),
  CONSTRAINT `fk_olispec_oli`
    FOREIGN KEY (`OrderLineItem`)
    REFERENCES `bridgedb`.`OrderLineItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_olispec_specificationmaster`
    FOREIGN KEY (`SpecificationMaster`)
    REFERENCES `bridgedb`.`SpecificationMaster` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_olispec_tenant`
    FOREIGN KEY (`Tenant`)
    REFERENCES `bridgedb`.`Tenant` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE INDEX `fk_olispec_specificationmaster_idx` ON `bridgedb`.`OrderLineItemSpec` (`SpecificationMaster` ASC);

CREATE INDEX `fk_olispec_oli_idx` ON `bridgedb`.`OrderLineItemSpec` (`OrderLineItem` ASC);

CREATE INDEX `fk_olispec_tenant_idx` ON `bridgedb`.`OrderLineItemSpec` (`Tenant` ASC);


-- -----------------------------------------------------
-- Table `bridgedb`.`CustomerLead`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bridgedb`.`CustomerLead` ;

CREATE TABLE IF NOT EXISTS `bridgedb`.`CustomerLead` (
  `Customer` INT NOT NULL,
  `Lead` INT NOT NULL,
  PRIMARY KEY (`Customer`, `Lead`),
  CONSTRAINT `fk_customerlead_customer`
    FOREIGN KEY (`Customer`)
    REFERENCES `bridgedb`.`Customer` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_customerlead_lead`
    FOREIGN KEY (`Lead`)
    REFERENCES `bridgedb`.`Lead` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_customerlead_lead_idx` ON `bridgedb`.`CustomerLead` (`Lead` ASC);



ALTER TABLE `bridgedb`.`BridgeOrder` 
ADD COLUMN `AmountPaid` INT(11) NULL AFTER `CreatedByActor`,
ADD INDEX `fk_order_amountpaid_idx` (`AmountPaid` ASC);
ALTER TABLE `bridgedb`.`BridgeOrder` 
ADD CONSTRAINT `fk_order_amountpaid`
  FOREIGN KEY (`AmountPaid`)
  REFERENCES `bridgedb`.`CurrencyValue` (`Id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
ALTER TABLE `bridgedb`.`BridgeOrder` 
ADD COLUMN `TotalAmount` INT(11) NULL AFTER `CreatedByActor`,
ADD INDEX `fk_order_totalamount_idx` (`TotalAmount` ASC);
ALTER TABLE `bridgedb`.`BridgeOrder` 
ADD CONSTRAINT `fk_order_totalamount`
  FOREIGN KEY (`TotalAmount`)
  REFERENCES `bridgedb`.`CurrencyValue` (`Id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

-- -----------------------------------------------------
-- Table `bridgedb`.`RefDataConfigScopeMaster`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bridgedb`.`RefDataConfigScopeMaster` ;

CREATE TABLE IF NOT EXISTS `bridgedb`.`RefDataConfigScopeMaster` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Code` VARCHAR(100) NOT NULL,
  `Name` VARCHAR(100) NOT NULL,
  `Description` VARCHAR(100) NULL,
  `DataType` VARCHAR(45) NULL,
  `Reference` TEXT NULL,
  `Priority` INT NULL,
  `updatedChannel` INT NULL,
  `updatedVenture` INT NULL,
  `updatedIE` DECIMAL(20,0) NULL,
  `createdDateTime` DATETIME(3) NULL,
  `notes` VARCHAR(500) NULL,
  `createdIE` DECIMAL(20,0) NULL,
  `updatedUser` INT NULL,
  `inActiveReason` VARCHAR(500) NULL,
  `appCreatedDateTime` DATETIME(3) NULL,
  `inActiveDateTime` DATETIME(3) NULL,
  `createdTenant` INT NULL,
  `createdChannel` INT NULL,
  `updatedTenant` INT NULL,
  `updatedDateTime` DATETIME(3) NULL,
  `createdUser` INT NULL,
  `appUpdatedDateTime` DATETIME(3) NULL,
  `aliasId` VARCHAR(50) NULL,
  `iconpic` VARCHAR(225) NULL,
  `isActive` TINYINT(1) NULL,
  `createdVenture` INT NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bridgedb`.`RefDataConfig`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bridgedb`.`RefDataConfig` ;

CREATE TABLE IF NOT EXISTS `bridgedb`.`RefDataConfig` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `ScopeCode` VARCHAR(100) NOT NULL,
  `ScopeValue` TEXT NOT NULL,
  `ConfigKey` VARCHAR(100) NOT NULL,
  `ConfigValue` TEXT NOT NULL,
  `updatedChannel` INT NULL,
  `updatedVenture` INT NULL,
  `updatedIE` DECIMAL(20,0) NULL,
  `createdDateTime` DATETIME(3) NULL,
  `notes` VARCHAR(500) NULL,
  `createdIE` DECIMAL(20,0) NULL,
  `updatedUser` INT NULL,
  `inActiveReason` VARCHAR(500) NULL,
  `appCreatedDateTime` DATETIME(3) NULL,
  `inActiveDateTime` DATETIME(3) NULL,
  `createdTenant` INT NULL,
  `createdChannel` INT NULL,
  `updatedTenant` INT NULL,
  `updatedDateTime` DATETIME(3) NULL,
  `createdUser` INT NULL,
  `appUpdatedDateTime` DATETIME(3) NULL,
  `aliasId` VARCHAR(50) NULL,
  `iconpic` VARCHAR(225) NULL,
  `isActive` TINYINT(1) NULL,
  `createdVenture` INT NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;  

SET FOREIGN_KEY_CHECKS=1;