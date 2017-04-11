use bridgedb;

-- Trade Management Process
INSERT INTO `bridgedb`.`process` (`ProcessAreaCode`, `ProcessCode`, `Name`, `isActive`) VALUES ('SALES', 'PROCESS.TRADE_MGMT', 'Trade Management', '1');

-- GlobalRefClass for Opportunity Type 
INSERT INTO `bridgedb`.`globalrefclass` (`Name`, `ClassCode`, `isActive`) VALUES ('Opportunity Type', 'GREF.OPPORTUNITY_TYPE', '1');

-- GRDs for Opportunity Type 
INSERT INTO `bridgedb`.`globalrefdata` (`ClassCode`, `DataCode`, `Label`, `LanguageCode`, `isActive`) VALUES ('GREF.OPPORTUNITY_TYPE', 'OPPORTUNITY_TYPE.BUY', 'Buyer', 'ENG', '1');
INSERT INTO `bridgedb`.`globalrefdata` (`ClassCode`, `DataCode`, `Label`, `LanguageCode`, `isActive`) VALUES ('GREF.OPPORTUNITY_TYPE', 'OPPORTUNITY_TYPE.SELL', 'Seller', 'ENG', '1');

-- GRD for Frequency Mesurement Type
INSERT INTO `bridgedb`.`globalrefdata` (`ClassCode`, `DataCode`, `Label`, `LanguageCode`, `isActive`) VALUES ('GREF.MEASUREMENT_TYPE', 'MEASUREMENT_TYPE.FREQUENCY', 'Frequency', 'ENG', '1');

-- GRD for Finance Account Type
INSERT INTO `bridgedb`.`globalrefdata` (`ClassCode`, `DataCode`, `Label`, `LanguageCode`, `isActive`) VALUES ('GREF.FINANCE_ACCOUNT_TYPE', 'FINANCE_ACCOUNT_TYPE.SILVER', 'Silver', 'ENG', '1');
INSERT INTO `bridgedb`.`globalrefdata` (`ClassCode`, `DataCode`, `Label`, `LanguageCode`, `isActive`) VALUES ('GREF.FINANCE_ACCOUNT_TYPE', 'FINANCE_ACCOUNT_TYPE.GOLD', 'Gold', 'ENG', '1');
INSERT INTO `bridgedb`.`globalrefdata` (`ClassCode`, `DataCode`, `Label`, `LanguageCode`, `isActive`) VALUES ('GREF.FINANCE_ACCOUNT_TYPE', 'FINANCE_ACCOUNT_TYPE.PLATINUM', 'Platinum', 'ENG', '1');
