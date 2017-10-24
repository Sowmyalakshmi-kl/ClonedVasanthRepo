-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: branding
-- ------------------------------------------------------
-- Server version	5.7.19-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts` (
  `AccountID` int(11) NOT NULL,
  `AccountName` varchar(45) DEFAULT NULL,
  `KeyAccount` varchar(45) DEFAULT NULL,
  `IndustryIDFK_AS` int(11) NOT NULL,
  `UserIDFK_UR` int(11) NOT NULL,
  `Active` int(11) DEFAULT NULL,
  `Description` varchar(45) DEFAULT NULL,
  `EntityIDFK_AS` int(11) NOT NULL,
  `CreatedBy` varchar(45) DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT NULL,
  `UpdatedBy` varchar(45) DEFAULT NULL,
  `UpdatedDate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`AccountID`,`IndustryIDFK_AS`,`UserIDFK_UR`,`EntityIDFK_AS`),
  KEY `EntityIDFK_AS_idx` (`EntityIDFK_AS`),
  KEY `IndustryIDFK_AS_idx` (`IndustryIDFK_AS`),
  KEY `UserIDFK_UR_idx` (`UserIDFK_UR`),
  CONSTRAINT `EntityIDFK_AS` FOREIGN KEY (`EntityIDFK_AS`) REFERENCES `entity_setup` (`EntityID`),
  CONSTRAINT `IndustryIDFK_AS` FOREIGN KEY (`IndustryIDFK_AS`) REFERENCES `industries` (`IndustryID`),
  CONSTRAINT `UserIDFK_UR` FOREIGN KEY (`UserIDFK_UR`) REFERENCES `users` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aggrement`
--

DROP TABLE IF EXISTS `aggrement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aggrement` (
  `AggrementID` int(11) NOT NULL,
  `AggrementName` varchar(45) DEFAULT NULL,
  `AggCreatedDate` varchar(45) DEFAULT NULL,
  `Description` varchar(45) DEFAULT NULL,
  `Active` int(11) DEFAULT NULL,
  `EntityIDFK_AT` int(11) NOT NULL,
  `CreatedBy` varchar(45) DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT NULL,
  `UpdatedBy` varchar(45) DEFAULT NULL,
  `UpdatedDate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`AggrementID`,`EntityIDFK_AT`),
  KEY `EntityIDFK_AT_idx` (`EntityIDFK_AT`),
  CONSTRAINT `EntityIDFK_AT` FOREIGN KEY (`EntityIDFK_AT`) REFERENCES `entity_setup` (`EntityID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aggrement`
--

LOCK TABLES `aggrement` WRITE;
/*!40000 ALTER TABLE `aggrement` DISABLE KEYS */;
/*!40000 ALTER TABLE `aggrement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `apptypes`
--

DROP TABLE IF EXISTS `apptypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `apptypes` (
  `TypeID` int(11) NOT NULL,
  `TypeName` varchar(45) DEFAULT NULL,
  `Description` varchar(45) DEFAULT NULL,
  `Active` int(11) DEFAULT NULL,
  `EntityIDFK_TE` int(11) NOT NULL,
  `CreatedBy` varchar(45) DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT NULL,
  `UpdatedBy` varchar(45) DEFAULT NULL,
  `UpdatedDate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`TypeID`,`EntityIDFK_TE`),
  KEY `EntityIDFK_TS_idx` (`EntityIDFK_TE`),
  CONSTRAINT `EntityIDFK_TE` FOREIGN KEY (`EntityIDFK_TE`) REFERENCES `entity_setup` (`EntityID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apptypes`
--

LOCK TABLES `apptypes` WRITE;
/*!40000 ALTER TABLE `apptypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `apptypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `competitor_threat`
--

DROP TABLE IF EXISTS `competitor_threat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `competitor_threat` (
  `CompThreatD` int(11) NOT NULL,
  `CompThreatName` varchar(45) DEFAULT NULL,
  `DisplayOrder` int(11) DEFAULT NULL,
  `Description` varchar(45) DEFAULT NULL,
  `Active` int(11) DEFAULT NULL,
  `EntityIDFK_CT` int(11) NOT NULL,
  `CreatedBy` varchar(45) DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT NULL,
  `UpdatedBy` varchar(45) DEFAULT NULL,
  `UpdatedDate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`CompThreatD`,`EntityIDFK_CT`),
  KEY `EntityIDFK_CT_idx` (`EntityIDFK_CT`),
  CONSTRAINT `EntityIDFK_CT` FOREIGN KEY (`EntityIDFK_CT`) REFERENCES `entity_setup` (`EntityID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `competitor_threat`
--

LOCK TABLES `competitor_threat` WRITE;
/*!40000 ALTER TABLE `competitor_threat` DISABLE KEYS */;
/*!40000 ALTER TABLE `competitor_threat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `competitors`
--

DROP TABLE IF EXISTS `competitors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `competitors` (
  `CompetitorsID` int(11) NOT NULL,
  `CompetitorsName` varchar(45) DEFAULT NULL,
  `OrgName` varchar(45) DEFAULT NULL,
  `URL` varchar(45) DEFAULT NULL,
  `Description` varchar(45) DEFAULT NULL,
  `Active` int(11) DEFAULT NULL,
  `EntityIDFK_CO` int(11) NOT NULL,
  `CreatedBy` varchar(45) DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT NULL,
  `UpdatedBy` varchar(45) DEFAULT NULL,
  `UpdatedDate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`CompetitorsID`,`EntityIDFK_CO`),
  KEY `EntityIDFK_CRS_idx` (`EntityIDFK_CO`),
  CONSTRAINT `EntityIDFK_CO` FOREIGN KEY (`EntityIDFK_CO`) REFERENCES `entity_setup` (`EntityID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `competitors`
--

LOCK TABLES `competitors` WRITE;
/*!40000 ALTER TABLE `competitors` DISABLE KEYS */;
/*!40000 ALTER TABLE `competitors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacts` (
  `ContactID` int(11) NOT NULL,
  `ContactsName` varchar(45) DEFAULT NULL,
  `Title` varchar(45) DEFAULT NULL,
  `AccountIDFK_CS` int(11) NOT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `PhoneNo` varchar(45) DEFAULT NULL,
  `MobileNo` varchar(45) DEFAULT NULL,
  `Address` varchar(45) DEFAULT NULL,
  `Description` varchar(45) DEFAULT NULL,
  `Active` varchar(45) DEFAULT NULL,
  `SocialMediaIDFK_CS` int(11) NOT NULL,
  `EntityIDFK_CS` int(11) NOT NULL,
  `CreatedBy` varchar(45) DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT NULL,
  `UpdatedDate` timestamp NULL DEFAULT NULL,
  `UpdatedBy` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ContactID`,`AccountIDFK_CS`,`SocialMediaIDFK_CS`,`EntityIDFK_CS`),
  KEY `AccountIDFK_CS_idx` (`AccountIDFK_CS`),
  KEY `EntityIDFK_CS_idx` (`EntityIDFK_CS`),
  KEY `SocialMediaIDFK_CS_idx` (`SocialMediaIDFK_CS`),
  CONSTRAINT `AccountIDFK_CS` FOREIGN KEY (`AccountIDFK_CS`) REFERENCES `accounts` (`AccountID`),
  CONSTRAINT `EntityIDFK_CS` FOREIGN KEY (`EntityIDFK_CS`) REFERENCES `entity_setup` (`EntityID`),
  CONSTRAINT `SocialMediaIDFK_CS` FOREIGN KEY (`SocialMediaIDFK_CS`) REFERENCES `social_media` (`SocialMediaID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country` (
  `CountryID` int(11) NOT NULL,
  `CountryCode` varchar(45) DEFAULT NULL,
  `CountryName` varchar(45) DEFAULT NULL,
  `Active` int(11) DEFAULT NULL,
  `EntityIDFK_CY` int(11) NOT NULL,
  `CreatedBy` varchar(45) DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT NULL,
  `UpdatedBy` varchar(45) DEFAULT NULL,
  `UpdatedDate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`CountryID`,`EntityIDFK_CY`),
  KEY `EntityID_idx` (`EntityIDFK_CY`),
  CONSTRAINT `EntityIDFK_CY` FOREIGN KEY (`EntityIDFK_CY`) REFERENCES `entity_setup` (`EntityID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currency`
--

DROP TABLE IF EXISTS `currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currency` (
  `CurrencyID` int(11) NOT NULL,
  `CurrencyCode` varchar(45) DEFAULT NULL,
  `Description` varchar(45) DEFAULT NULL,
  `Active` int(11) DEFAULT NULL,
  `EntityIDFK_CY` int(11) NOT NULL,
  `CreatedBy` varchar(45) DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT NULL,
  `UpdatedBy` varchar(45) DEFAULT NULL,
  `UpdatedDate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`CurrencyID`,`EntityIDFK_CY`),
  KEY `EntityIDFK_CY_idx` (`EntityIDFK_CY`),
  CONSTRAINT `EntityIDFK_CR` FOREIGN KEY (`EntityIDFK_CY`) REFERENCES `entity_setup` (`EntityID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currency`
--

LOCK TABLES `currency` WRITE;
/*!40000 ALTER TABLE `currency` DISABLE KEYS */;
/*!40000 ALTER TABLE `currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity_setup`
--

DROP TABLE IF EXISTS `entity_setup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entity_setup` (
  `EntityID` int(11) NOT NULL,
  `EntityName` varchar(45) DEFAULT NULL,
  `Active` int(11) DEFAULT NULL,
  `Description` varchar(45) DEFAULT NULL,
  `CreatedBy` varchar(45) DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT NULL,
  `UpdatedBy` varchar(45) DEFAULT NULL,
  `UpdatedDate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`EntityID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_setup`
--

LOCK TABLES `entity_setup` WRITE;
/*!40000 ALTER TABLE `entity_setup` DISABLE KEYS */;
/*!40000 ALTER TABLE `entity_setup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `financial_assessment`
--

DROP TABLE IF EXISTS `financial_assessment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `financial_assessment` (
  `FinancialID` int(11) NOT NULL,
  `FinancialName` varchar(45) DEFAULT NULL,
  `DisplayOrder` int(11) DEFAULT NULL,
  `Description` varchar(45) DEFAULT NULL,
  `Active` int(11) DEFAULT NULL,
  `EntityIDFK_FT` int(11) NOT NULL,
  `CreatedBy` varchar(45) DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT NULL,
  `UpdatedBy` varchar(45) DEFAULT NULL,
  `UpdatedDate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`FinancialID`,`EntityIDFK_FT`),
  KEY `EntityIDFK_FT_idx` (`EntityIDFK_FT`),
  CONSTRAINT `EntityIDFK_FT` FOREIGN KEY (`EntityIDFK_FT`) REFERENCES `entity_setup` (`EntityID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `financial_assessment`
--

LOCK TABLES `financial_assessment` WRITE;
/*!40000 ALTER TABLE `financial_assessment` DISABLE KEYS */;
/*!40000 ALTER TABLE `financial_assessment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fiscal_settings`
--

DROP TABLE IF EXISTS `fiscal_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fiscal_settings` (
  `FiscalID` int(11) NOT NULL,
  `FiscalName` varchar(45) DEFAULT NULL,
  `StartDate` varchar(45) DEFAULT NULL,
  `EndDate` varchar(45) DEFAULT NULL,
  `FiscalYear` varchar(45) DEFAULT NULL,
  `Description` varchar(45) DEFAULT NULL,
  `Active` int(11) DEFAULT NULL,
  `EntityIDFK_FS` int(11) NOT NULL,
  `CreatedBy` varchar(45) DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT NULL,
  `UpdatedBy` varchar(45) DEFAULT NULL,
  `UpdatedDate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`FiscalID`,`EntityIDFK_FS`),
  KEY `EntityIDFK_FS_idx` (`EntityIDFK_FS`),
  CONSTRAINT `EntityIDFK_FS` FOREIGN KEY (`EntityIDFK_FS`) REFERENCES `entity_setup` (`EntityID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fiscal_settings`
--

LOCK TABLES `fiscal_settings` WRITE;
/*!40000 ALTER TABLE `fiscal_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `fiscal_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `industries`
--

DROP TABLE IF EXISTS `industries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `industries` (
  `IndustryID` int(11) NOT NULL,
  `IndustryName` varchar(45) DEFAULT NULL,
  `Description` varchar(45) DEFAULT NULL,
  `Active` int(11) DEFAULT NULL,
  `EntityIDFK_IS` int(11) NOT NULL,
  `CreatedBy` varchar(45) DEFAULT NULL,
  `CreatedDate` varchar(45) DEFAULT NULL,
  `UpdatedBy` varchar(45) DEFAULT NULL,
  `UpdatedDate` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`IndustryID`,`EntityIDFK_IS`),
  KEY `EntityIDFK_IS_idx` (`EntityIDFK_IS`),
  CONSTRAINT `EntityIDFK_IS` FOREIGN KEY (`EntityIDFK_IS`) REFERENCES `entity_setup` (`EntityID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `industries`
--

LOCK TABLES `industries` WRITE;
/*!40000 ALTER TABLE `industries` DISABLE KEYS */;
/*!40000 ALTER TABLE `industries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lead`
--

DROP TABLE IF EXISTS `lead`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lead` (
  `LeadID` int(11) NOT NULL,
  `LeadName` varchar(45) DEFAULT NULL,
  `AccountIDFK_LD` int(11) NOT NULL,
  `LeadSourceIDFK_LD` int(11) NOT NULL,
  `LeadStatusIDFK_LD` int(11) NOT NULL,
  `LeadPriorityID` int(11) NOT NULL,
  `Description` varchar(45) DEFAULT NULL,
  `Active` int(11) DEFAULT NULL,
  `EntityIDFK_LD` int(11) NOT NULL,
  `CreatedBy` varchar(45) DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT NULL,
  `UpdatedBy` varchar(45) DEFAULT NULL,
  `UpdatedDate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`LeadID`,`AccountIDFK_LD`,`LeadSourceIDFK_LD`,`LeadStatusIDFK_LD`,`LeadPriorityID`,`EntityIDFK_LD`),
  KEY `AccountIDFK_LD_idx` (`AccountIDFK_LD`),
  KEY `LeadSourceIDFK_LD_idx` (`LeadSourceIDFK_LD`),
  KEY `LeadStatusIDFK_LD_idx` (`LeadStatusIDFK_LD`),
  KEY `EntityIDFK_LD_idx` (`EntityIDFK_LD`),
  CONSTRAINT `AccountIDFK_LD` FOREIGN KEY (`AccountIDFK_LD`) REFERENCES `accounts` (`AccountID`),
  CONSTRAINT `EntityIDFK_LD` FOREIGN KEY (`EntityIDFK_LD`) REFERENCES `entity_setup` (`EntityID`),
  CONSTRAINT `LeadSourceIDFK_LD` FOREIGN KEY (`LeadSourceIDFK_LD`) REFERENCES `lead_source` (`LeadSourceID`),
  CONSTRAINT `LeadStatusIDFK_LD` FOREIGN KEY (`LeadStatusIDFK_LD`) REFERENCES `lead_status` (`StatusID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lead`
--

LOCK TABLES `lead` WRITE;
/*!40000 ALTER TABLE `lead` DISABLE KEYS */;
/*!40000 ALTER TABLE `lead` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lead_source`
--

DROP TABLE IF EXISTS `lead_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lead_source` (
  `LeadSourceID` int(11) NOT NULL,
  `LeadSourceName` varchar(45) DEFAULT NULL,
  `EntityIDFK_LS` int(11) NOT NULL,
  `Description` varchar(45) DEFAULT NULL,
  `Active` int(11) DEFAULT NULL,
  `CreatedBy` varchar(45) DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT NULL,
  `UpdatedBy` varchar(45) DEFAULT NULL,
  `UpdatedDate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`LeadSourceID`,`EntityIDFK_LS`),
  KEY `EntityIDFK_LS_idx` (`EntityIDFK_LS`),
  CONSTRAINT `EntityIDFK_LS` FOREIGN KEY (`EntityIDFK_LS`) REFERENCES `entity_setup` (`EntityID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lead_source`
--

LOCK TABLES `lead_source` WRITE;
/*!40000 ALTER TABLE `lead_source` DISABLE KEYS */;
/*!40000 ALTER TABLE `lead_source` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lead_status`
--

DROP TABLE IF EXISTS `lead_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lead_status` (
  `StatusID` int(11) NOT NULL,
  `StatusCode` varchar(45) DEFAULT NULL,
  `Description` varchar(45) DEFAULT NULL,
  `DisplayOrder` int(11) DEFAULT NULL,
  `EntityIDFK_SS` int(11) NOT NULL,
  `Active` varchar(45) DEFAULT NULL,
  `CreatedBy` varchar(45) DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT NULL,
  `UpdatedBy` varchar(45) DEFAULT NULL,
  `UpdatedDate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`StatusID`,`EntityIDFK_SS`),
  KEY `EntityIDFK_SS_idx` (`EntityIDFK_SS`),
  CONSTRAINT `EntityIDFK_SS` FOREIGN KEY (`EntityIDFK_SS`) REFERENCES `entity_setup` (`EntityID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lead_status`
--

LOCK TABLES `lead_status` WRITE;
/*!40000 ALTER TABLE `lead_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `lead_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lob`
--

DROP TABLE IF EXISTS `lob`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lob` (
  `LobID` int(11) NOT NULL,
  `LobName` varchar(45) DEFAULT NULL,
  `Description` varchar(45) DEFAULT NULL,
  `Active` int(11) DEFAULT NULL,
  `EntityIDFK_LB` int(11) NOT NULL,
  `CreatedBy` varchar(45) DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT NULL,
  `UpdatedBy` varchar(45) DEFAULT NULL,
  `UpdatedDate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`LobID`,`EntityIDFK_LB`),
  KEY `EntityIDFK_LB_idx` (`EntityIDFK_LB`),
  CONSTRAINT `EntityIDFK_LB` FOREIGN KEY (`EntityIDFK_LB`) REFERENCES `entity_setup` (`EntityID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lob`
--

LOCK TABLES `lob` WRITE;
/*!40000 ALTER TABLE `lob` DISABLE KEYS */;
/*!40000 ALTER TABLE `lob` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opportunities`
--

DROP TABLE IF EXISTS `opportunities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opportunities` (
  `OpportunityID` int(11) NOT NULL,
  `OpportunityName` varchar(45) DEFAULT NULL,
  `Description` varchar(45) DEFAULT NULL,
  `Active` int(11) DEFAULT NULL,
  `EntityIDFK_OS` int(11) NOT NULL,
  `AccountIDFK_OS` int(11) NOT NULL,
  `OppStageIDFK_OS` int(11) NOT NULL,
  `UserIDFK_OS` int(11) NOT NULL,
  `CreatedBy` varchar(45) DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT NULL,
  `UpdatedBy` varchar(45) DEFAULT NULL,
  `UpdatedDate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`OpportunityID`,`EntityIDFK_OS`,`AccountIDFK_OS`,`OppStageIDFK_OS`,`UserIDFK_OS`),
  UNIQUE KEY `AccountIDFK_OS_UNIQUE` (`AccountIDFK_OS`),
  KEY `EntityIDFK_OS_idx` (`EntityIDFK_OS`),
  KEY `AccountIDFK_OS_idx` (`AccountIDFK_OS`),
  KEY `OppStageIDFK_OS_idx` (`OppStageIDFK_OS`),
  CONSTRAINT `AccountIDFK_OS` FOREIGN KEY (`AccountIDFK_OS`) REFERENCES `accounts` (`AccountID`),
  CONSTRAINT `EntityIDFK_OS` FOREIGN KEY (`EntityIDFK_OS`) REFERENCES `entity_setup` (`EntityID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `OppStageIDFK_OS` FOREIGN KEY (`OppStageIDFK_OS`) REFERENCES `opportunity_stage` (`OpportunityStageID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opportunities`
--

LOCK TABLES `opportunities` WRITE;
/*!40000 ALTER TABLE `opportunities` DISABLE KEYS */;
/*!40000 ALTER TABLE `opportunities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opportunity_stage`
--

DROP TABLE IF EXISTS `opportunity_stage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opportunity_stage` (
  `OpportunityStageID` int(11) NOT NULL,
  `OpportunityStageName` varchar(45) DEFAULT NULL,
  `EntityIDFK_OY` int(11) NOT NULL,
  `Description` varchar(45) DEFAULT NULL,
  `Active` int(11) DEFAULT NULL,
  `Probability` varchar(45) DEFAULT NULL,
  `CreatedBy` varchar(45) DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT NULL,
  `UpdatedBy` varchar(45) DEFAULT NULL,
  `UpdatedDate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`OpportunityStageID`,`EntityIDFK_OY`),
  KEY `EntityIDFK_OY_idx` (`EntityIDFK_OY`),
  CONSTRAINT `EntityIDFK_OY` FOREIGN KEY (`EntityIDFK_OY`) REFERENCES `entity_setup` (`EntityID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opportunity_stage`
--

LOCK TABLES `opportunity_stage` WRITE;
/*!40000 ALTER TABLE `opportunity_stage` DISABLE KEYS */;
/*!40000 ALTER TABLE `opportunity_stage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_family`
--

DROP TABLE IF EXISTS `product_family`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_family` (
  `ProductFamilyID` int(11) NOT NULL,
  `ProductFamilyName` varchar(45) DEFAULT NULL,
  `LOBID_FK` int(11) NOT NULL,
  `Description` varchar(45) DEFAULT NULL,
  `Active` int(11) DEFAULT NULL,
  `EntityIDFK_PY` int(11) NOT NULL,
  `CreatedBy` varchar(45) DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT NULL,
  `UpdatedBy` varchar(45) DEFAULT NULL,
  `UpdatedDate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ProductFamilyID`,`LOBID_FK`,`EntityIDFK_PY`),
  KEY `LOBID_FK_idx` (`LOBID_FK`),
  KEY `EntityIDFK_PY_idx` (`EntityIDFK_PY`),
  CONSTRAINT `EntityIDFK_PY` FOREIGN KEY (`EntityIDFK_PY`) REFERENCES `entity_setup` (`EntityID`),
  CONSTRAINT `LOBID_FK` FOREIGN KEY (`LOBID_FK`) REFERENCES `lob` (`LobID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_family`
--

LOCK TABLES `product_family` WRITE;
/*!40000 ALTER TABLE `product_family` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_family` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `ProductID` int(11) NOT NULL,
  `ProductName` varchar(45) DEFAULT NULL,
  `ProductFamilyIDFK_PS` int(11) NOT NULL,
  `AccountIDFK_PS` int(11) NOT NULL,
  `OppStageIDFK_PS` int(11) NOT NULL,
  `Description` varchar(45) DEFAULT NULL,
  `Active` int(11) DEFAULT NULL,
  `EntityIDFK_PS` int(11) NOT NULL,
  `CreatedBy` varchar(45) DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT NULL,
  `UpdatedBy` varchar(45) DEFAULT NULL,
  `UpdatedDate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ProductID`,`ProductFamilyIDFK_PS`,`AccountIDFK_PS`,`OppStageIDFK_PS`,`EntityIDFK_PS`),
  KEY `AccountIDFK_PS_idx` (`AccountIDFK_PS`),
  KEY `OppStageIDFK_PS_idx` (`OppStageIDFK_PS`),
  KEY `EntityIDFK_PS_idx` (`EntityIDFK_PS`),
  KEY `ProductFamilyIDFK_PS_idx` (`ProductFamilyIDFK_PS`),
  CONSTRAINT `AccountIDFK_PS` FOREIGN KEY (`AccountIDFK_PS`) REFERENCES `accounts` (`AccountID`),
  CONSTRAINT `EntityIDFK_PS` FOREIGN KEY (`EntityIDFK_PS`) REFERENCES `entity_setup` (`EntityID`),
  CONSTRAINT `OppStageIDFK_PS` FOREIGN KEY (`OppStageIDFK_PS`) REFERENCES `opportunity_stage` (`OpportunityStageID`),
  CONSTRAINT `ProductFamilyIDFK_PS` FOREIGN KEY (`ProductFamilyIDFK_PS`) REFERENCES `product_family` (`ProductFamilyID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `region`
--

DROP TABLE IF EXISTS `region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `region` (
  `RegionID` int(11) NOT NULL,
  `RegionCode` varchar(45) DEFAULT NULL,
  `RegionName` varchar(45) DEFAULT NULL,
  `Description` varchar(45) DEFAULT NULL,
  `Active` int(11) DEFAULT NULL,
  `EntityIDFK_RN` int(11) NOT NULL,
  `CreatedBy` varchar(45) DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT NULL,
  `UpdatedBy` varchar(45) DEFAULT NULL,
  `UpdatedDate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`RegionID`,`EntityIDFK_RN`),
  KEY `EntityIDFK_RN_idx` (`EntityIDFK_RN`),
  CONSTRAINT `EntityIDFK_RN` FOREIGN KEY (`EntityIDFK_RN`) REFERENCES `entity_setup` (`EntityID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `region`
--

LOCK TABLES `region` WRITE;
/*!40000 ALTER TABLE `region` DISABLE KEYS */;
/*!40000 ALTER TABLE `region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `risk_assessment`
--

DROP TABLE IF EXISTS `risk_assessment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `risk_assessment` (
  `RiskID` int(11) NOT NULL,
  `RiskName` varchar(45) DEFAULT NULL,
  `Description` varchar(45) DEFAULT NULL,
  `DisplayOrder` int(11) DEFAULT NULL,
  `Active` int(11) DEFAULT NULL,
  `EntityIDFK_RK` int(11) NOT NULL,
  `CreatedBy` varchar(45) DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT NULL,
  `UpdatedBy` varchar(45) DEFAULT NULL,
  `UpdatedDate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`RiskID`,`EntityIDFK_RK`),
  KEY `EntityIDFK_RK_idx` (`EntityIDFK_RK`),
  CONSTRAINT `EntityIDFK_RK` FOREIGN KEY (`EntityIDFK_RK`) REFERENCES `entity_setup` (`EntityID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `risk_assessment`
--

LOCK TABLES `risk_assessment` WRITE;
/*!40000 ALTER TABLE `risk_assessment` DISABLE KEYS */;
/*!40000 ALTER TABLE `risk_assessment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `RoleID` int(11) NOT NULL,
  `RoleName` varchar(45) DEFAULT NULL,
  `Description` varchar(45) DEFAULT NULL,
  `Active` int(11) DEFAULT NULL,
  `EntityIDFK_RS` int(11) NOT NULL,
  `CreatedBy` varchar(45) DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT NULL,
  `UpdatedBy` varchar(45) DEFAULT NULL,
  `UpdatedDate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`RoleID`,`EntityIDFK_RS`),
  KEY `EntityIDFK_RS_idx` (`EntityIDFK_RS`),
  CONSTRAINT `EntityIDFK_RS` FOREIGN KEY (`EntityIDFK_RS`) REFERENCES `entity_setup` (`EntityID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_media`
--

DROP TABLE IF EXISTS `social_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_media` (
  `SocialMediaID` int(11) NOT NULL,
  `Twitter` varchar(45) DEFAULT NULL,
  `Facebook` varchar(45) DEFAULT NULL,
  `LinkedIn` varchar(45) DEFAULT NULL,
  `Instagram` varchar(45) DEFAULT NULL,
  `Gmail` varchar(45) DEFAULT NULL,
  `Youtube` varchar(45) DEFAULT NULL,
  `Description` varchar(45) DEFAULT NULL,
  `Active` int(11) DEFAULT NULL,
  `EntityIDFK_SA` int(11) NOT NULL,
  `CreatedBy` varchar(45) DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT NULL,
  `UpdatedBy` varchar(45) DEFAULT NULL,
  `UpdatedDate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`SocialMediaID`,`EntityIDFK_SA`),
  KEY `EntityIDFK_SA_idx` (`EntityIDFK_SA`),
  CONSTRAINT `EntityIDFK_SA` FOREIGN KEY (`EntityIDFK_SA`) REFERENCES `entity_setup` (`EntityID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_media`
--

LOCK TABLES `social_media` WRITE;
/*!40000 ALTER TABLE `social_media` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `state`
--

DROP TABLE IF EXISTS `state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `state` (
  `StateID` int(11) NOT NULL,
  `StateCode` varchar(45) DEFAULT NULL,
  `StateName` varchar(45) DEFAULT NULL,
  `Description` varchar(45) DEFAULT NULL,
  `Active` int(11) DEFAULT NULL,
  `EntityIDFK_SE` int(11) NOT NULL,
  `CreatedBy` varchar(45) DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT NULL,
  `UpdatedBy` varchar(45) DEFAULT NULL,
  `UpdatedDate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`StateID`,`EntityIDFK_SE`),
  KEY `EntityIDFK_SE_idx` (`EntityIDFK_SE`),
  CONSTRAINT `EntityIDFK_SE` FOREIGN KEY (`EntityIDFK_SE`) REFERENCES `entity_setup` (`EntityID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state`
--

LOCK TABLES `state` WRITE;
/*!40000 ALTER TABLE `state` DISABLE KEYS */;
/*!40000 ALTER TABLE `state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status_assesment`
--

DROP TABLE IF EXISTS `status_assesment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `status_assesment` (
  `StatusID` int(11) NOT NULL,
  `StatusName` varchar(45) DEFAULT NULL,
  `EntityIDFK_ST` int(11) NOT NULL,
  `Active` int(11) DEFAULT NULL,
  `Description` varchar(45) DEFAULT NULL,
  `DisplayOrder` int(11) DEFAULT NULL,
  `CreatedBy` varchar(45) DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT NULL,
  `UpdatedBy` varchar(45) DEFAULT NULL,
  `UpdatedDate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`StatusID`,`EntityIDFK_ST`),
  KEY `EntityIDFK_ST_idx` (`EntityIDFK_ST`),
  CONSTRAINT `EntityIDFK_ST` FOREIGN KEY (`EntityIDFK_ST`) REFERENCES `entity_setup` (`EntityID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status_assesment`
--

LOCK TABLES `status_assesment` WRITE;
/*!40000 ALTER TABLE `status_assesment` DISABLE KEYS */;
/*!40000 ALTER TABLE `status_assesment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `terms`
--

DROP TABLE IF EXISTS `terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `terms` (
  `TermsID` int(11) NOT NULL,
  `TermsName` varchar(45) DEFAULT NULL,
  `Description` varchar(45) DEFAULT NULL,
  `TermsMonth` int(11) DEFAULT NULL,
  `Active` int(11) DEFAULT NULL,
  `EntityIDFK_TS` int(11) DEFAULT NULL,
  `CreatedBy` timestamp NULL DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT NULL,
  `UpdatedBy` varchar(45) DEFAULT NULL,
  `UpdatedDate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`TermsID`),
  KEY `EntityIDFK_TS_idx` (`EntityIDFK_TS`),
  CONSTRAINT `EntityIDFK_TS` FOREIGN KEY (`EntityIDFK_TS`) REFERENCES `entity_setup` (`EntityID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `terms`
--

LOCK TABLES `terms` WRITE;
/*!40000 ALTER TABLE `terms` DISABLE KEYS */;
/*!40000 ALTER TABLE `terms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `territory`
--

DROP TABLE IF EXISTS `territory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `territory` (
  `TerritoryID` int(11) NOT NULL,
  `TerritoryName` varchar(45) DEFAULT NULL,
  `Description` varchar(45) DEFAULT NULL,
  `Active` int(11) DEFAULT NULL,
  `EntityIDFK_TY` int(11) NOT NULL,
  `CreatedBy` varchar(45) DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT NULL,
  `UpdatedBy` varchar(45) DEFAULT NULL,
  `UpdatedDate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`TerritoryID`,`EntityIDFK_TY`),
  KEY `EntityIDFK_TY_idx` (`EntityIDFK_TY`),
  CONSTRAINT `EntityIDFK_TY` FOREIGN KEY (`EntityIDFK_TY`) REFERENCES `entity_setup` (`EntityID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `territory`
--

LOCK TABLES `territory` WRITE;
/*!40000 ALTER TABLE `territory` DISABLE KEYS */;
/*!40000 ALTER TABLE `territory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_roles` (
  `UserRoleID` int(11) NOT NULL,
  `UserRoleName` varchar(45) DEFAULT NULL,
  `UserIDFK_USR` int(11) NOT NULL,
  `RoleIDFK_USR` int(11) NOT NULL,
  `Description` varchar(45) DEFAULT NULL,
  `Active` int(11) DEFAULT NULL,
  `EntityIDFK_USR` int(11) NOT NULL,
  `CreatedBy` varchar(45) DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT NULL,
  `UpdatedBy` varchar(45) DEFAULT NULL,
  `UpdatedDate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`UserRoleID`,`UserIDFK_USR`,`RoleIDFK_USR`,`EntityIDFK_USR`),
  KEY `UserIDFK_US_idx` (`UserIDFK_USR`),
  KEY `EntityIDFK_US_idx` (`EntityIDFK_USR`),
  KEY `RoleIDFK_USR_idx` (`RoleIDFK_USR`),
  CONSTRAINT `EntityIDFK_USR` FOREIGN KEY (`EntityIDFK_USR`) REFERENCES `entity_setup` (`EntityID`),
  CONSTRAINT `RoleIDFK_USR` FOREIGN KEY (`RoleIDFK_USR`) REFERENCES `roles` (`RoleID`),
  CONSTRAINT `UserIDFK_USR` FOREIGN KEY (`UserIDFK_USR`) REFERENCES `users` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `UserID` int(11) NOT NULL,
  `UserName` varchar(45) DEFAULT NULL,
  `Description` varchar(45) DEFAULT NULL,
  `Password` varchar(45) DEFAULT NULL,
  `PwdExpiryDate` timestamp NULL DEFAULT NULL,
  `EmailAddress` varchar(45) DEFAULT NULL,
  `DOB` varchar(45) DEFAULT NULL,
  `PhoneNo` varchar(45) DEFAULT NULL,
  `MobileNo` varchar(45) DEFAULT NULL,
  `Active` int(11) DEFAULT NULL,
  `EntityIDFK_US` int(11) NOT NULL,
  `CreatedBy` varchar(45) DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT NULL,
  `UpdatedBy` varchar(45) DEFAULT NULL,
  `UpdatedDate` timestamp NULL DEFAULT NULL,
  `MaxAttempts` int(11) DEFAULT NULL,
  PRIMARY KEY (`UserID`,`EntityIDFK_US`),
  KEY `EntityIDFK_US_idx` (`EntityIDFK_US`),
  CONSTRAINT `EntityIDFK_US` FOREIGN KEY (`EntityIDFK_US`) REFERENCES `entity_setup` (`EntityID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-09-11 11:49:13
