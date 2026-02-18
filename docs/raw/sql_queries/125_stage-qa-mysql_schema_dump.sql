-- MySQL dump 10.13  Distrib 8.4.5, for macos14.7 (arm64)
--
-- Host: localhost    Database: api
-- ------------------------------------------------------
-- Server version	8.4.5

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `api`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `api` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `api`;

--
-- Table structure for table `demo_test5`
--

DROP TABLE IF EXISTS `demo_test5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `demo_test5` (
  `id` char(14) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `demo_test6`
--

DROP TABLE IF EXISTS `demo_test6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `demo_test6` (
  `id` char(14) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `validations`
--

DROP TABLE IF EXISTS `validations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `validations` (
  `id` char(14) NOT NULL,
  `fund_account_id` char(14) NOT NULL,
  `fund_account_type` varchar(32) NOT NULL,
  `merchant_id` char(14) NOT NULL,
  `status` varchar(32) NOT NULL,
  `balance_id` char(14) NOT NULL,
  `notes` json DEFAULT NULL,
  `created_at` bigint NOT NULL,
  `updated_at` bigint NOT NULL,
  `type` varchar(32) NOT NULL,
  `request_mode` varchar(32) NOT NULL,
  `metadata` json DEFAULT NULL,
  `error_code` varchar(64) DEFAULT NULL,
  `account_status` varchar(32) DEFAULT NULL,
  `registered_name` varchar(255) DEFAULT NULL,
  `transaction_id` char(14) DEFAULT NULL,
  `fees` int unsigned DEFAULT NULL,
  `tax` int unsigned DEFAULT NULL,
  `amount` int unsigned DEFAULT NULL,
  `currency` char(3) NOT NULL,
  `refund_transaction_id` char(14) DEFAULT NULL,
  `validation_method` varchar(64) DEFAULT NULL,
  `input_name` varchar(255) DEFAULT NULL,
  `name_match_score` float DEFAULT NULL,
  `reference_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_merchant_id` (`merchant_id`),
  KEY `idx_created_at` (`created_at`),
  KEY `idx_updated_at` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Current Database: `api-test`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `api-test` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `api-test`;

--
-- Table structure for table `cell_demo`
--

DROP TABLE IF EXISTS `cell_demo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cell_demo` (
  `id` char(14) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `merchants`
--

DROP TABLE IF EXISTS `merchants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `merchants` (
  `id` char(14) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `second_factor_auth` tinyint(1) NOT NULL DEFAULT '0',
  `restricted` tinyint(1) NOT NULL DEFAULT '0',
  `parent_id` char(14) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `legal_entity_id` char(14) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `activated` tinyint(1) NOT NULL DEFAULT '0',
  `activated_at` int DEFAULT NULL,
  `archived_at` int DEFAULT NULL,
  `suspended_at` int DEFAULT NULL,
  `live` tinyint(1) NOT NULL DEFAULT '0',
  `live_disable_reason` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `hold_funds` tinyint(1) NOT NULL DEFAULT '0',
  `hold_funds_reason` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `pricing_plan_id` char(14) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `website` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `category` char(4) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `whitelisted_ips_live` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `whitelisted_ips_test` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `whitelisted_domains` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `dashboard_whitelisted_ips_live` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `dashboard_whitelisted_ips_test` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `partnership_url` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `category2` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `invoice_code` char(12) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `notes` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `org_id` char(14) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `international` tinyint(1) DEFAULT '0',
  `billing_label` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `display_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `channel` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT 'kotak',
  `settlement_schedule` int DEFAULT '3',
  `settlement_schedule_id` char(14) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `transaction_report_email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `fee_bearer` tinyint unsigned NOT NULL DEFAULT '0',
  `fee_model` tinyint(1) NOT NULL DEFAULT '0',
  `fee_credits_threshold` bigint unsigned DEFAULT NULL,
  `refund_source` tinyint(1) DEFAULT '0',
  `linked_account_kyc` tinyint(1) NOT NULL DEFAULT '0',
  `has_key_access` tinyint(1) NOT NULL DEFAULT '0',
  `partner_type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `brand_color` varchar(6) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `handle` varchar(4) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `activation_source` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `business_banking` tinyint(1) DEFAULT '0',
  `auto_capture_late_auth` tinyint(1) NOT NULL DEFAULT '0',
  `logo_url` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `icon_url` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `invoice_label_field` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `risk_rating` tinyint unsigned NOT NULL,
  `risk_threshold` tinyint unsigned DEFAULT NULL,
  `receipt_email_enabled` tinyint(1) DEFAULT NULL,
  `receipt_email_trigger_event` tinyint unsigned DEFAULT '1',
  `max_payment_amount` bigint unsigned DEFAULT NULL,
  `auto_refund_delay` int DEFAULT NULL,
  `default_refund_speed` enum('normal','optimum','instant') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'normal',
  `convert_currency` tinyint(1) DEFAULT NULL,
  `created_at` int NOT NULL,
  `updated_at` int NOT NULL,
  `external_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `product_international` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT '0000000000',
  `free_payouts_consumed` int DEFAULT '0',
  `free_payouts_consumed_last_reset_at` int unsigned DEFAULT NULL,
  `signup_source` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `account_code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `refund_credits_threshold` bigint unsigned DEFAULT NULL,
  `amount_credits_threshold` bigint unsigned DEFAULT NULL,
  `purpose_code` varchar(5) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `fetch_coupons_url` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `coupon_validity_url` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `signup_via_email` tinyint(1) NOT NULL DEFAULT '1',
  `balance_threshold` bigint DEFAULT NULL,
  `max_international_payment_amount` bigint unsigned DEFAULT NULL,
  `audit_id` char(14) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `country_code` char(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT 'IN',
  PRIMARY KEY (`id`),
  KEY `merchants_activated_at_index` (`activated_at`),
  KEY `merchants_pricing_plan_id_index` (`pricing_plan_id`),
  KEY `merchants_risk_rating_index` (`risk_rating`),
  KEY `merchants_email_index` (`email`),
  KEY `merchants_settlement_schedule_id_foreign` (`settlement_schedule_id`),
  KEY `merchants_org_id_foreign` (`org_id`),
  KEY `merchants_auto_refund_delay_index` (`auto_refund_delay`),
  KEY `merchants_parent_id_foreign` (`parent_id`),
  KEY `merchants_created_at_index` (`created_at`),
  KEY `merchants_updated_at_index` (`updated_at`),
  KEY `merchants_legal_entity_id_index` (`legal_entity_id`),
  KEY `merchants_external_id_index` (`external_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `poshvine_devrev`
--

DROP TABLE IF EXISTS `poshvine_devrev`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `poshvine_devrev` (
  `id` char(14) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Current Database: `api_views`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `api_views` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `api_views`;

--
-- Current Database: `Chinook`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `Chinook` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `Chinook`;

--
-- Table structure for table `Album`
--

DROP TABLE IF EXISTS `Album`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Album` (
  `AlbumId` int NOT NULL,
  `Title` varchar(160) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `ArtistId` int NOT NULL,
  PRIMARY KEY (`AlbumId`),
  KEY `IFK_AlbumArtistId` (`ArtistId`),
  CONSTRAINT `FK_AlbumArtistId` FOREIGN KEY (`ArtistId`) REFERENCES `Artist` (`ArtistId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Artist`
--

DROP TABLE IF EXISTS `Artist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Artist` (
  `ArtistId` int NOT NULL,
  `Name` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`ArtistId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Customer`
--

DROP TABLE IF EXISTS `Customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Customer` (
  `CustomerId` int NOT NULL,
  `FirstName` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `LastName` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Company` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Address` varchar(70) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `City` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `State` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Country` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `PostalCode` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Phone` varchar(24) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Fax` varchar(24) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Email` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `SupportRepId` int DEFAULT NULL,
  PRIMARY KEY (`CustomerId`),
  KEY `IFK_CustomerSupportRepId` (`SupportRepId`),
  CONSTRAINT `FK_CustomerSupportRepId` FOREIGN KEY (`SupportRepId`) REFERENCES `Employee` (`EmployeeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Employee`
--

DROP TABLE IF EXISTS `Employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Employee` (
  `EmployeeId` int NOT NULL,
  `LastName` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `FirstName` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Title` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `ReportsTo` int DEFAULT NULL,
  `BirthDate` datetime DEFAULT NULL,
  `HireDate` datetime DEFAULT NULL,
  `Address` varchar(70) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `City` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `State` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Country` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `PostalCode` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Phone` varchar(24) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Fax` varchar(24) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Email` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`EmployeeId`),
  KEY `IFK_EmployeeReportsTo` (`ReportsTo`),
  CONSTRAINT `FK_EmployeeReportsTo` FOREIGN KEY (`ReportsTo`) REFERENCES `Employee` (`EmployeeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Genre`
--

DROP TABLE IF EXISTS `Genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Genre` (
  `GenreId` int NOT NULL,
  `Name` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`GenreId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Invoice`
--

DROP TABLE IF EXISTS `Invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Invoice` (
  `InvoiceId` int NOT NULL,
  `CustomerId` int NOT NULL,
  `InvoiceDate` datetime NOT NULL,
  `BillingAddress` varchar(70) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `BillingCity` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `BillingState` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `BillingCountry` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `BillingPostalCode` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Total` decimal(10,2) NOT NULL,
  PRIMARY KEY (`InvoiceId`),
  KEY `IFK_InvoiceCustomerId` (`CustomerId`),
  CONSTRAINT `FK_InvoiceCustomerId` FOREIGN KEY (`CustomerId`) REFERENCES `Customer` (`CustomerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `InvoiceLine`
--

DROP TABLE IF EXISTS `InvoiceLine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `InvoiceLine` (
  `InvoiceLineId` int NOT NULL,
  `InvoiceId` int NOT NULL,
  `TrackId` int NOT NULL,
  `UnitPrice` decimal(10,2) NOT NULL,
  `Quantity` int NOT NULL,
  PRIMARY KEY (`InvoiceLineId`),
  KEY `IFK_InvoiceLineInvoiceId` (`InvoiceId`),
  KEY `IFK_InvoiceLineTrackId` (`TrackId`),
  CONSTRAINT `FK_InvoiceLineInvoiceId` FOREIGN KEY (`InvoiceId`) REFERENCES `Invoice` (`InvoiceId`),
  CONSTRAINT `FK_InvoiceLineTrackId` FOREIGN KEY (`TrackId`) REFERENCES `Track` (`TrackId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `MediaType`
--

DROP TABLE IF EXISTS `MediaType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MediaType` (
  `MediaTypeId` int NOT NULL,
  `Name` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`MediaTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Playlist`
--

DROP TABLE IF EXISTS `Playlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Playlist` (
  `PlaylistId` int NOT NULL,
  `Name` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`PlaylistId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PlaylistTrack`
--

DROP TABLE IF EXISTS `PlaylistTrack`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PlaylistTrack` (
  `PlaylistId` int NOT NULL,
  `TrackId` int NOT NULL,
  PRIMARY KEY (`PlaylistId`,`TrackId`),
  KEY `IFK_PlaylistTrackPlaylistId` (`PlaylistId`),
  KEY `IFK_PlaylistTrackTrackId` (`TrackId`),
  CONSTRAINT `FK_PlaylistTrackPlaylistId` FOREIGN KEY (`PlaylistId`) REFERENCES `Playlist` (`PlaylistId`),
  CONSTRAINT `FK_PlaylistTrackTrackId` FOREIGN KEY (`TrackId`) REFERENCES `Track` (`TrackId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Track`
--

DROP TABLE IF EXISTS `Track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Track` (
  `TrackId` int NOT NULL,
  `Name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `AlbumId` int DEFAULT NULL,
  `MediaTypeId` int NOT NULL,
  `GenreId` int DEFAULT NULL,
  `Composer` varchar(220) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Milliseconds` int NOT NULL,
  `Bytes` int DEFAULT NULL,
  `UnitPrice` decimal(10,2) NOT NULL,
  PRIMARY KEY (`TrackId`),
  KEY `IFK_TrackAlbumId` (`AlbumId`),
  KEY `IFK_TrackGenreId` (`GenreId`),
  KEY `IFK_TrackMediaTypeId` (`MediaTypeId`),
  CONSTRAINT `FK_TrackAlbumId` FOREIGN KEY (`AlbumId`) REFERENCES `Album` (`AlbumId`),
  CONSTRAINT `FK_TrackGenreId` FOREIGN KEY (`GenreId`) REFERENCES `Genre` (`GenreId`),
  CONSTRAINT `FK_TrackMediaTypeId` FOREIGN KEY (`MediaTypeId`) REFERENCES `MediaType` (`MediaTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Current Database: `DEMO`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `DEMO` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `DEMO`;

--
-- Current Database: `demo_db`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `demo_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `demo_db`;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `modified_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `modified_time` datetime DEFAULT NULL,
  `address_type` varchar(16) CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
  `city` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `country` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `state` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `street_1` varchar(200) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `street_2` varchar(200) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `zip` varchar(10) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `lock_id` int DEFAULT '0',
  `org_code` varchar(25) CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
  `bkyc_latitude` decimal(10,0) DEFAULT NULL,
  `vkyc_latitude` decimal(10,0) DEFAULT NULL,
  `bkyc_longitude` decimal(10,0) DEFAULT NULL,
  `vkyc_longitude` decimal(10,0) DEFAULT NULL,
  `bkyc_date` datetime DEFAULT NULL,
  `updated_at` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `address_uk` (`org_code`,`address_type`),
  KEY `idx_address_org` (`org_code`),
  KEY `idx_updated_at` (`updated_at`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `april_nine`
--

DROP TABLE IF EXISTS `april_nine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `april_nine` (
  `id` char(14) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `april_ten`
--

DROP TABLE IF EXISTS `april_ten`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `april_ten` (
  `id` char(14) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `demo_db_v1`
--

DROP TABLE IF EXISTS `demo_db_v1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `demo_db_v1` (
  `id` char(14) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `demo_db_v2`
--

DROP TABLE IF EXISTS `demo_db_v2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `demo_db_v2` (
  `id` char(14) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `demo_testing`
--

DROP TABLE IF EXISTS `demo_testing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `demo_testing` (
  `id` char(14) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `demo_users`
--

DROP TABLE IF EXISTS `demo_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `demo_users` (
  `id` char(14) NOT NULL,
  `name` text,
  `email` varchar(255) DEFAULT NULL,
  `category` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dev_test`
--

DROP TABLE IF EXISTS `dev_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dev_test` (
  `id` char(14) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `employee_records`
--

DROP TABLE IF EXISTS `employee_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_records` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `designation` varchar(50) DEFAULT NULL,
  `department` varchar(50) DEFAULT NULL,
  `salary` bigint DEFAULT NULL,
  `created_at` int DEFAULT NULL,
  `updated_at` int DEFAULT NULL,
  `salary_block_size` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_updated_at` (`updated_at`),
  KEY `idx_created_at` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `finaaaall_test`
--

DROP TABLE IF EXISTS `finaaaall_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `finaaaall_test` (
  `id` char(14) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `finaal_test`
--

DROP TABLE IF EXISTS `finaal_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `finaal_test` (
  `id` char(14) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `final_testing_v1`
--

DROP TABLE IF EXISTS `final_testing_v1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `final_testing_v1` (
  `id` char(14) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `final_testing_v2`
--

DROP TABLE IF EXISTS `final_testing_v2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `final_testing_v2` (
  `id` char(14) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `generic_json_entity`
--

DROP TABLE IF EXISTS `generic_json_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `generic_json_entity` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `json_val` text,
  `beanClass` varchar(200) DEFAULT NULL,
  `version` int DEFAULT NULL,
  `created_at` int DEFAULT NULL,
  `updated_at` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `generic_json_entity_beanclass_idx` (`beanClass`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ip_test`
--

DROP TABLE IF EXISTS `ip_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ip_test` (
  `id` char(14) NOT NULL,
  `demo` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `makethour`
--

DROP TABLE IF EXISTS `makethour`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `makethour` (
  `id` char(14) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_by` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `lock_id` int DEFAULT '0',
  `modified_by` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `modified_time` datetime DEFAULT NULL,
  `allow_override` bit(1) DEFAULT b'0',
  `code` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
  `description` varchar(512) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `entities` varchar(200) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `locale` varchar(16) CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL DEFAULT 'en',
  `message_template` varchar(4096) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `message_type` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `org_code` varchar(25) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `severity` int DEFAULT '0',
  `ref_message_id` bigint DEFAULT NULL,
  `tc_required` bit(1) DEFAULT b'0',
  `custom_config_code` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `message_uk1` (`org_code`,`code`,`locale`,`custom_config_code`),
  KEY `idx_code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=481 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `multiple_create_test_3april`
--

DROP TABLE IF EXISTS `multiple_create_test_3april`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `multiple_create_test_3april` (
  `id` char(14) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `age` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `multiple_create_test_4april`
--

DROP TABLE IF EXISTS `multiple_create_test_4april`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `multiple_create_test_4april` (
  `id` char(14) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `age` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `multiple_create_test_5april`
--

DROP TABLE IF EXISTS `multiple_create_test_5april`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `multiple_create_test_5april` (
  `id` char(14) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `age` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `multiple_create_test_6april`
--

DROP TABLE IF EXISTS `multiple_create_test_6april`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `multiple_create_test_6april` (
  `id` char(14) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `age` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `new_demo_testing`
--

DROP TABLE IF EXISTS `new_demo_testing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `new_demo_testing` (
  `id` char(14) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `new_schedule_testing`
--

DROP TABLE IF EXISTS `new_schedule_testing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `new_schedule_testing` (
  `id` char(14) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `new_test`
--

DROP TABLE IF EXISTS `new_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `new_test` (
  `id` char(14) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `new_utc_test`
--

DROP TABLE IF EXISTS `new_utc_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `new_utc_test` (
  `id` char(14) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `normal_scheduler_test_two`
--

DROP TABLE IF EXISTS `normal_scheduler_test_two`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `normal_scheduler_test_two` (
  `id` char(14) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `payment_offers`
--

DROP TABLE IF EXISTS `payment_offers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_offers` (
  `id` char(14) NOT NULL,
  `payment_id` char(14) NOT NULL,
  `offer_id` char(14) NOT NULL,
  `benefit_applied` int NOT NULL,
  `benefit_type` varchar(50) NOT NULL,
  `merchant_id` char(14) NOT NULL,
  `created_at` bigint NOT NULL,
  `updated_at` bigint DEFAULT NULL,
  `deleted_at` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pos_testing`
--

DROP TABLE IF EXISTS `pos_testing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pos_testing` (
  `id` char(14) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pos_testing_one`
--

DROP TABLE IF EXISTS `pos_testing_one`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pos_testing_one` (
  `id` char(14) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pos_testing_three`
--

DROP TABLE IF EXISTS `pos_testing_three`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pos_testing_three` (
  `id` char(14) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `posAdmin_testing_one`
--

DROP TABLE IF EXISTS `posAdmin_testing_one`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posAdmin_testing_one` (
  `id` char(14) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `postgres_dev`
--

DROP TABLE IF EXISTS `postgres_dev`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `postgres_dev` (
  `id` char(14) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `scd_pos_one`
--

DROP TABLE IF EXISTS `scd_pos_one`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scd_pos_one` (
  `id` char(14) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `schedule_testing`
--

DROP TABLE IF EXISTS `schedule_testing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedule_testing` (
  `id` char(14) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `schedule_testing_upi_one`
--

DROP TABLE IF EXISTS `schedule_testing_upi_one`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedule_testing_upi_one` (
  `id` char(14) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `scheduler`
--

DROP TABLE IF EXISTS `scheduler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scheduler` (
  `id` char(14) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `scheduler_test_one`
--

DROP TABLE IF EXISTS `scheduler_test_one`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scheduler_test_one` (
  `id` char(14) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `schem`
--

DROP TABLE IF EXISTS `schem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schem` (
  `id` char(14) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `schemas`
--

DROP TABLE IF EXISTS `schemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schemas` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `binlog_file` varchar(255) DEFAULT NULL,
  `binlog_position` int unsigned DEFAULT NULL,
  `last_heartbeat_read` bigint DEFAULT '0',
  `gtid_set` varchar(4096) DEFAULT NULL,
  `base_schema_id` bigint DEFAULT NULL,
  `deltas` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `server_id` int unsigned DEFAULT NULL,
  `position_sha` char(40) DEFAULT NULL,
  `charset` varchar(255) DEFAULT NULL,
  `version` smallint unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `position_sha` (`position_sha`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seed_testing`
--

DROP TABLE IF EXISTS `seed_testing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seed_testing` (
  `id` char(14) NOT NULL,
  `test` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seed_testing_us_sg`
--

DROP TABLE IF EXISTS `seed_testing_us_sg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seed_testing_us_sg` (
  `id` char(14) NOT NULL,
  `test` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `test_demo`
--

DROP TABLE IF EXISTS `test_demo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test_demo` (
  `id` char(14) NOT NULL,
  `test` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `test_makethour`
--

DROP TABLE IF EXISTS `test_makethour`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test_makethour` (
  `id` char(14) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `test_new`
--

DROP TABLE IF EXISTS `test_new`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test_new` (
  `id` char(14) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `test_one`
--

DROP TABLE IF EXISTS `test_one`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test_one` (
  `id` char(14) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `test_three`
--

DROP TABLE IF EXISTS `test_three`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test_three` (
  `id` char(14) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `test_two`
--

DROP TABLE IF EXISTS `test_two`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test_two` (
  `id` char(14) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `test_users`
--

DROP TABLE IF EXISTS `test_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test_users` (
  `id` int DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `encrypted_data` varbinary(200) DEFAULT NULL,
  `updated_at` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `testing`
--

DROP TABLE IF EXISTS `testing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testing` (
  `id` char(14) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `testing_merge`
--

DROP TABLE IF EXISTS `testing_merge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testing_merge` (
  `id` char(14) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `testing_merge_10`
--

DROP TABLE IF EXISTS `testing_merge_10`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testing_merge_10` (
  `id` char(14) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `testing_merge_11`
--

DROP TABLE IF EXISTS `testing_merge_11`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testing_merge_11` (
  `id` char(14) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `testing_merge_8`
--

DROP TABLE IF EXISTS `testing_merge_8`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testing_merge_8` (
  `id` char(14) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `testing_merge_9`
--

DROP TABLE IF EXISTS `testing_merge_9`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testing_merge_9` (
  `id` char(14) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `testing_merge_five`
--

DROP TABLE IF EXISTS `testing_merge_five`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testing_merge_five` (
  `id` char(14) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `testing_merge_four`
--

DROP TABLE IF EXISTS `testing_merge_four`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testing_merge_four` (
  `id` char(14) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `testing_merge_one`
--

DROP TABLE IF EXISTS `testing_merge_one`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testing_merge_one` (
  `id` char(14) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `testing_merge_seven`
--

DROP TABLE IF EXISTS `testing_merge_seven`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testing_merge_seven` (
  `id` char(14) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `testing_merge_six`
--

DROP TABLE IF EXISTS `testing_merge_six`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testing_merge_six` (
  `id` char(14) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `testing_merge_three`
--

DROP TABLE IF EXISTS `testing_merge_three`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testing_merge_three` (
  `id` char(14) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `testing_merge_two`
--

DROP TABLE IF EXISTS `testing_merge_two`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testing_merge_two` (
  `id` char(14) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `testing_scd`
--

DROP TABLE IF EXISTS `testing_scd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testing_scd` (
  `id` char(14) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `testing_scd_three`
--

DROP TABLE IF EXISTS `testing_scd_three`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testing_scd_three` (
  `id` char(14) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `testing_scd_two`
--

DROP TABLE IF EXISTS `testing_scd_two`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testing_scd_two` (
  `id` char(14) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `testing_v01`
--

DROP TABLE IF EXISTS `testing_v01`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testing_v01` (
  `id` char(14) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `testing_v1`
--

DROP TABLE IF EXISTS `testing_v1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testing_v1` (
  `id` char(14) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `testing_v2`
--

DROP TABLE IF EXISTS `testing_v2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testing_v2` (
  `id` char(14) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `testing_v222`
--

DROP TABLE IF EXISTS `testing_v222`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testing_v222` (
  `id` char(14) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `testing_v2227`
--

DROP TABLE IF EXISTS `testing_v2227`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testing_v2227` (
  `id` char(14) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `testing_v2228`
--

DROP TABLE IF EXISTS `testing_v2228`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testing_v2228` (
  `id` char(14) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `testing_v3`
--

DROP TABLE IF EXISTS `testing_v3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testing_v3` (
  `id` char(14) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `testing_v6`
--

DROP TABLE IF EXISTS `testing_v6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testing_v6` (
  `id` char(14) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `testing_v7`
--

DROP TABLE IF EXISTS `testing_v7`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testing_v7` (
  `id` char(14) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `testing_v78`
--

DROP TABLE IF EXISTS `testing_v78`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testing_v78` (
  `id` char(14) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `upi_testing`
--

DROP TABLE IF EXISTS `upi_testing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `upi_testing` (
  `id` char(14) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `encrypted_data` varbinary(200) DEFAULT NULL,
  `updated_at` bigint DEFAULT NULL,
  `address` text,
  `new_address` text,
  `age` int DEFAULT NULL,
  `age_block_size` int DEFAULT NULL,
  `test` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_12`
--

DROP TABLE IF EXISTS `v_12`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `v_12` (
  `id` char(14) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_eight`
--

DROP TABLE IF EXISTS `v_eight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `v_eight` (
  `id` char(14) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_five`
--

DROP TABLE IF EXISTS `v_five`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `v_five` (
  `id` char(14) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_four`
--

DROP TABLE IF EXISTS `v_four`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `v_four` (
  `id` char(14) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_nine`
--

DROP TABLE IF EXISTS `v_nine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `v_nine` (
  `id` char(14) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_seven`
--

DROP TABLE IF EXISTS `v_seven`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `v_seven` (
  `id` char(14) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_six`
--

DROP TABLE IF EXISTS `v_six`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `v_six` (
  `id` char(14) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_three`
--

DROP TABLE IF EXISTS `v_three`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `v_three` (
  `id` char(14) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `versiong_fix_v1`
--

DROP TABLE IF EXISTS `versiong_fix_v1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `versiong_fix_v1` (
  `id` char(14) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `versiong_fix_v2`
--

DROP TABLE IF EXISTS `versiong_fix_v2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `versiong_fix_v2` (
  `id` char(14) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Current Database: `env3_ezetap`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `env3_ezetap` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `env3_ezetap`;

--
-- Table structure for table `payment_intent_recipient`
--

DROP TABLE IF EXISTS `payment_intent_recipient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_intent_recipient` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `payment_intent_id` varchar(25) CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
  `sharing_mode` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
  `mode_specific_address` varchar(100) DEFAULT NULL,
  `customer_name` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `created_by` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `lock_id` int NOT NULL,
  `modified_by` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `modified_time` datetime DEFAULT NULL,
  `status` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_intent_id_mode_address` (`payment_intent_id`,`mode_specific_address`)
) ENGINE=InnoDB AUTO_INCREMENT=246214921 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `txn`
--

DROP TABLE IF EXISTS `txn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `txn` (
  `id` varchar(25) CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
  `created_by` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `lock_id` int DEFAULT '0',
  `modified_by` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `modified_time` datetime DEFAULT NULL,
  `label_ids` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `tags` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `acquirer_code` varchar(16) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `aid` varchar(24) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `amount` decimal(15,4) DEFAULT NULL,
  `amount_original` decimal(15,4) DEFAULT NULL,
  `amount_additional` decimal(15,4) DEFAULT NULL,
  `amount_cash_back` decimal(15,4) DEFAULT NULL,
  `app_key` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `app_type` varchar(48) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `auth_code` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `bank_code` varchar(25) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `batch_number` varchar(25) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `card_last_four_digit` varchar(6) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `card_txn_type` varchar(2) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `charge_slip_version` varchar(8) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `cheque_number` varchar(25) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `currency_code` varchar(4) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `customer_email` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `customer_mobile` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `customer_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `device_serial` varchar(16) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `dx_mode` varchar(8) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `emi_id` bigint DEFAULT NULL,
  `error_code` varchar(48) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `error_message` varchar(256) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `external_ref` varchar(56) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `external_ref2` varchar(56) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `external_ref3` varchar(56) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `external_ref4` varchar(56) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `external_ref5` varchar(56) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `is_aggregator` bit(1) NOT NULL DEFAULT b'0',
  `issuer_code` varchar(16) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `latitude` decimal(10,7) DEFAULT NULL,
  `longitude` decimal(10,7) DEFAULT NULL,
  `merchant_code` varchar(25) CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
  `mid` varchar(16) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `middleware_code` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `org_code` varchar(25) CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
  `orig_txn_id` varchar(25) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `parent_rr_number` varchar(16) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `payer_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `payment_card_bin` varchar(6) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `payment_card_brand` varchar(25) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `payment_card_type` varchar(10) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `payment_gateway` varchar(16) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `payment_mode` varchar(8) CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
  `pg_date` varchar(8) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `pg_error_code` varchar(24) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `pg_error_message` varchar(80) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `pg_invoice_number` varchar(25) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `pg_time` varchar(8) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `posting_date` datetime DEFAULT NULL,
  `process_code` varchar(25) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `receipt_number` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `receipt_type` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `receipt_url_shortcode` varchar(8) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `ref_txn_id` varchar(25) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `rr_number` varchar(16) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `settlement_status` varchar(10) CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
  `settlement_time` datetime DEFAULT NULL,
  `signature_id` varchar(25) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `stan` varchar(6) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `status` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
  `tc` varchar(16) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `terminal_info_id` bigint DEFAULT NULL,
  `tid` varchar(16) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `tid_dba_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `tid_location` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `tsi` varchar(8) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `tvr` varchar(16) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `txn_request_id` varchar(25) CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
  `txn_type` varchar(16) CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
  `user_mobile` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `username` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
  `external_ref6` varchar(56) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `external_ref7` varchar(56) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `app_error` varchar(48) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `payment_card_id` varchar(25) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `acq_bank_identifier` varchar(16) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `bank_name` varchar(64) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `state` varchar(24) CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
  `shared_terminal_id` bigint DEFAULT NULL,
  `merchant_name` varchar(80) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `app_key_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_txn_merchant_code_username` (`merchant_code`,`username`),
  KEY `idx_txn_settlement` (`payment_mode`,`acquirer_code`,`settlement_status`,`mid`,`tid`),
  KEY `idx_txn_receipt_no` (`receipt_url_shortcode`),
  KEY `idx_txn_external_ref` (`external_ref`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `txn_request`
--

DROP TABLE IF EXISTS `txn_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `txn_request` (
  `id` varchar(25) CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
  `org_code` varchar(25) CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
  `payment_mode` varchar(8) CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
  `amount` decimal(15,4) DEFAULT NULL,
  `amount_additional` decimal(15,4) DEFAULT NULL,
  `amount_cash_back` decimal(15,4) DEFAULT NULL,
  `external_ref` varchar(56) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `external_ref2` varchar(56) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `external_ref3` varchar(56) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `external_ref4` varchar(56) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `external_ref5` varchar(56) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `app_key` varchar(48) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `app_versions` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `bank_code` varchar(25) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `card_hash` varchar(48) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `cell_id` varchar(12) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `cheque_date` datetime DEFAULT NULL,
  `cheque_number` varchar(25) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `currency_code` varchar(4) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `customer_email` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `customer_mobile` varchar(15) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `device_bad_swipes` int DEFAULT NULL,
  `device_battery_voltage` int DEFAULT NULL,
  `device_info` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `device_serial` varchar(16) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `device_swipe_counter` int DEFAULT NULL,
  `dx_mode` varchar(8) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `emi_id` bigint DEFAULT NULL,
  `error_code` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `imei` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `imsi` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `latitude` decimal(10,7) DEFAULT NULL,
  `longitude` decimal(10,7) DEFAULT NULL,
  `platform` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `network` varchar(16) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `nonce` varchar(48) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `offline` bit(1) DEFAULT NULL,
  `process_code` varchar(25) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `random_number` int DEFAULT NULL,
  `receipt_number` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `remarks` varchar(384) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `request_time` datetime DEFAULT NULL,
  `status` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
  `txn_type` varchar(16) CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
  `user_mobile` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `username` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `created_by` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `lock_id` int DEFAULT '0',
  `modified_by` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `modified_time` datetime DEFAULT NULL,
  `app_key_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_tr_org_nonce` (`org_code`,`nonce`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Current Database: `gandalf`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `gandalf` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `gandalf`;

--
-- Table structure for table `_test_magic_ghc`
--

DROP TABLE IF EXISTS `_test_magic_ghc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_test_magic_ghc` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `hint` varchar(64) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `value` varchar(4096) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hint_uidx` (`hint`)
) ENGINE=InnoDB AUTO_INCREMENT=257 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_test_magic_gho`
--

DROP TABLE IF EXISTS `_test_magic_gho`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_test_magic_gho` (
  `id` char(16) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `modified_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `modified_time` datetime DEFAULT NULL,
  `address_type` varchar(16) CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
  `city` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `country` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `state` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `street_1` varchar(200) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `street_2` varchar(200) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `zip` varchar(10) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `lock_id` int DEFAULT '0',
  `org_code` varchar(25) CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
  `bkyc_latitude` decimal(10,0) DEFAULT NULL,
  `vkyc_latitude` decimal(10,0) DEFAULT NULL,
  `bkyc_longitude` decimal(10,0) DEFAULT NULL,
  `vkyc_longitude` decimal(10,0) DEFAULT NULL,
  `bkyc_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `address_uk` (`org_code`,`address_type`),
  KEY `idx_address_org` (`org_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `adminconsole_owner_info`
--

DROP TABLE IF EXISTS `adminconsole_owner_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adminconsole_owner_info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `instance_name` varchar(50) DEFAULT NULL,
  `owner_email` varchar(50) DEFAULT NULL,
  `approval_type` varchar(25) DEFAULT NULL,
  `secondary_email` varchar(30) DEFAULT NULL,
  `secondaryapprovalType` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `instance_name` (`instance_name`,`owner_email`)
) ENGINE=InnoDB AUTO_INCREMENT=348 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `batch_log`
--

DROP TABLE IF EXISTS `batch_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `batch_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `batch_no` int NOT NULL,
  `total_rows_updated` int DEFAULT '0',
  `log_message` text,
  `log_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_log_time` (`log_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cluster_vpc_mapping`
--

DROP TABLE IF EXISTS `cluster_vpc_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cluster_vpc_mapping` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cluster_name` text,
  `region` text,
  `vpc_group` text,
  `vpc_id` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cronAdminQueries`
--

DROP TABLE IF EXISTS `cronAdminQueries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cronAdminQueries` (
  `id` int NOT NULL AUTO_INCREMENT,
  `issueKey` varchar(20) DEFAULT NULL,
  `cronName` varchar(100) DEFAULT NULL,
  `cronschedule` varchar(20) DEFAULT NULL,
  `createdBy` varchar(50) DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `jobStatus` varchar(20) DEFAULT NULL,
  `instanceIP` varchar(100) GENERATED ALWAYS AS (substring_index(substring_index(`cronName`,_utf8mb4':',2),_utf8mb4':',-(1))) VIRTUAL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `drDrill_status`
--

DROP TABLE IF EXISTS `drDrill_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drDrill_status` (
  `issueID` int NOT NULL AUTO_INCREMENT,
  `issueKey` varchar(20) NOT NULL,
  `clusterList` json DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdBy` varchar(50) NOT NULL,
  `approvedBy` varchar(50) DEFAULT NULL,
  `executedBy` varchar(50) DEFAULT NULL,
  `jobStatus` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`issueID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dsjdsajkfd32`
--

DROP TABLE IF EXISTS `dsjdsajkfd32`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dsjdsajkfd32` (
  `id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `employee_data`
--

DROP TABLE IF EXISTS `employee_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_data` (
  `id` int NOT NULL AUTO_INCREMENT,
  `designation_plain` varchar(255) DEFAULT NULL,
  `designation_encrypted` blob,
  `designation_hex_encrypted` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `employee_record_backup`
--

DROP TABLE IF EXISTS `employee_record_backup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_record_backup` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `designation` varchar(200) DEFAULT NULL,
  `department` varchar(50) DEFAULT NULL,
  `salary` varchar(200) DEFAULT NULL,
  `created_at` int DEFAULT NULL,
  `updated_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2079 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `employee_records`
--

DROP TABLE IF EXISTS `employee_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_records` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `designation` varchar(200) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `salary` varchar(200) DEFAULT NULL,
  `created_at` int DEFAULT NULL,
  `updated_at` int DEFAULT NULL,
  `new_column` text,
  `column_one` text,
  `column_two` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gandalf_aws_account_region`
--

DROP TABLE IF EXISTS `gandalf_aws_account_region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gandalf_aws_account_region` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `aws_account_name` varchar(20) DEFAULT NULL,
  `aws_region` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gandalf_aws_instance_type`
--

DROP TABLE IF EXISTS `gandalf_aws_instance_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gandalf_aws_instance_type` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `aws_instance_type` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gandalf_jira_analytics_flow`
--

DROP TABLE IF EXISTS `gandalf_jira_analytics_flow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gandalf_jira_analytics_flow` (
  `id` char(14) NOT NULL,
  `merchant_name` varchar(20) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `updated_at` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gandalf_ppt`
--

DROP TABLE IF EXISTS `gandalf_ppt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gandalf_ppt` (
  `id` char(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gandalf_query_execution_slots`
--

DROP TABLE IF EXISTS `gandalf_query_execution_slots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gandalf_query_execution_slots` (
  `slot_id` int NOT NULL AUTO_INCREMENT,
  `slotStartTime` datetime DEFAULT NULL,
  `slotEndTime` datetime DEFAULT NULL,
  `query_count` int DEFAULT '0',
  `status` enum('available','full') DEFAULT 'available',
  PRIMARY KEY (`slot_id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gandalf_RSPLAdmins`
--

DROP TABLE IF EXISTS `gandalf_RSPLAdmins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gandalf_RSPLAdmins` (
  `owner_email` varchar(50) NOT NULL,
  PRIMARY KEY (`owner_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gandalf_service_mapping_table`
--

DROP TABLE IF EXISTS `gandalf_service_mapping_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gandalf_service_mapping_table` (
  `id` int NOT NULL AUTO_INCREMENT,
  `databaseName` varchar(100) DEFAULT NULL,
  `MUM_instance_name` varchar(100) DEFAULT NULL,
  `MUM_instance_ip` varchar(225) DEFAULT NULL,
  `SG_instance_name` varchar(100) DEFAULT NULL,
  `SG_instance_ip` varchar(225) DEFAULT NULL,
  `US_instance_name` varchar(100) DEFAULT NULL,
  `US_instance_ip` varchar(225) DEFAULT NULL,
  `exception_owner_email` varchar(100) DEFAULT 'varun.saluja@razorpay.com',
  `datastore` enum('MYSQL','POSTGRESQL') DEFAULT NULL,
  `MUM_instance_reader_ip` varchar(225) DEFAULT NULL,
  `SG_instance_reader_ip` varchar(225) DEFAULT NULL,
  `US_instance_reader_ip` varchar(225) DEFAULT NULL,
  `drift_cron_status` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_databaseName` (`databaseName`)
) ENGINE=InnoDB AUTO_INCREMENT=328 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gandalf_service_type`
--

DROP TABLE IF EXISTS `gandalf_service_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gandalf_service_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `instance_name` text,
  `instance_ip` text,
  `final_score` int DEFAULT NULL,
  `service_type` varchar(10) DEFAULT NULL,
  `is_active` varchar(10) DEFAULT 'active',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gandalf_versioning`
--

DROP TABLE IF EXISTS `gandalf_versioning`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gandalf_versioning` (
  `id` int NOT NULL AUTO_INCREMENT,
  `issueKey` varchar(20) NOT NULL,
  `operationType` varchar(20) DEFAULT 'DDL',
  `instance_name` varchar(100) DEFAULT '',
  `databaseName` varchar(100) DEFAULT '',
  `aws_account_name` varchar(20) DEFAULT 'RSPL',
  `region` varchar(255) DEFAULT 'MUM',
  `version` varchar(20) DEFAULT NULL,
  `pr_link` text,
  `repo_file_path` text,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_region_instance_db_version` (`region`,`instance_name`,`databaseName`,`version`)
) ENGINE=InnoDB AUTO_INCREMENT=270 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gandalf_versioning_old`
--

DROP TABLE IF EXISTS `gandalf_versioning_old`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gandalf_versioning_old` (
  `id` int NOT NULL AUTO_INCREMENT,
  `operationType` varchar(20) DEFAULT 'DDL',
  `instance_name` text,
  `databaseName` text,
  `aws_account_name` varchar(20) DEFAULT 'RSPL',
  `region` varchar(255) DEFAULT 'MUM',
  `version` varchar(20) DEFAULT NULL,
  `pr_link` text,
  `repo_file_path` text,
  `issueKey` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gandalf_versioning_postgres`
--

DROP TABLE IF EXISTS `gandalf_versioning_postgres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gandalf_versioning_postgres` (
  `id` int NOT NULL AUTO_INCREMENT,
  `issueKey` varchar(20) NOT NULL,
  `operationType` varchar(20) DEFAULT 'DDL',
  `instance_name` varchar(100) DEFAULT '',
  `databaseName` varchar(100) DEFAULT '',
  `aws_account_name` varchar(20) DEFAULT 'RSPL',
  `region` varchar(255) DEFAULT 'MUM',
  `version` varchar(20) DEFAULT NULL,
  `pr_link` text,
  `repo_file_path` text,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_region_instance_db_version` (`region`,`instance_name`,`databaseName`,`version`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gandalf_versioning_v2`
--

DROP TABLE IF EXISTS `gandalf_versioning_v2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gandalf_versioning_v2` (
  `id` int NOT NULL AUTO_INCREMENT,
  `issueKey` varchar(20) NOT NULL,
  `operationType` varchar(20) DEFAULT 'DDL',
  `instance_name` text,
  `databaseName` text,
  `aws_account_name` varchar(20) DEFAULT 'RSPL',
  `region` varchar(255) DEFAULT 'MUM',
  `version` varchar(20) DEFAULT NULL,
  `pr_link` text,
  `repo_file_path` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gandalfCrossRegionFailoverQueries`
--

DROP TABLE IF EXISTS `gandalfCrossRegionFailoverQueries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gandalfCrossRegionFailoverQueries` (
  `issueID` int NOT NULL AUTO_INCREMENT,
  `issueKey` varchar(20) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdBy` varchar(50) NOT NULL,
  `approvedBy` varchar(50) DEFAULT NULL,
  `executedBy` varchar(50) DEFAULT NULL,
  `jobStatus` varchar(20) DEFAULT 'PENDING',
  `approvalType` varchar(10) DEFAULT NULL,
  `hadErrors` int DEFAULT '0',
  `clusterNames` text,
  `clusterConfigurations` text,
  PRIMARY KEY (`issueID`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gandalfDataMaskingQueries`
--

DROP TABLE IF EXISTS `gandalfDataMaskingQueries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gandalfDataMaskingQueries` (
  `operation` varchar(255) DEFAULT NULL,
  `instanceName` varchar(255) DEFAULT NULL,
  `instanceIP` text,
  `databaseName` varchar(255) DEFAULT NULL,
  `tableName` varchar(255) DEFAULT NULL,
  `columnNames` varchar(255) DEFAULT NULL,
  `selectedConditionType` varchar(255) DEFAULT NULL,
  `typeOfColumnInWhereCondition` varchar(255) DEFAULT NULL,
  `startDate` varchar(25) DEFAULT NULL,
  `endDate` varchar(25) DEFAULT NULL,
  `whereCondition` varchar(255) DEFAULT NULL,
  `dummyValues` varchar(255) DEFAULT NULL,
  `issueID` int NOT NULL,
  `issueKey` varchar(255) DEFAULT NULL,
  `createdBy` varchar(255) DEFAULT NULL,
  `jobStatus` varchar(50) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `approvedBy` varchar(50) DEFAULT NULL,
  `executedBy` varchar(50) DEFAULT NULL,
  `approvedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `hadErrors` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`issueID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gandalfGlobalClusterCreationDetails`
--

DROP TABLE IF EXISTS `gandalfGlobalClusterCreationDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gandalfGlobalClusterCreationDetails` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `clusterIdentifier` varchar(255) NOT NULL,
  `engine` varchar(50) NOT NULL,
  `globalClusterExists` tinyint(1) NOT NULL,
  `globalClusterName` varchar(255) NOT NULL,
  `hyderabadClusterName` varchar(255) NOT NULL,
  `parameterGroup` varchar(255) NOT NULL,
  `parameterGroupForHyd` varchar(255) NOT NULL,
  `status` varchar(50) NOT NULL,
  `createdAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `headExistsForHyd` varchar(255) DEFAULT NULL,
  `infraSetup` varchar(20) DEFAULT NULL,
  `cellName` varchar(255) DEFAULT NULL,
  `globalClusterEndpoint` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=237 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gandalfGlobalClusterCreationDetailsOLD`
--

DROP TABLE IF EXISTS `gandalfGlobalClusterCreationDetailsOLD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gandalfGlobalClusterCreationDetailsOLD` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `clusterIdentifier` varchar(255) NOT NULL,
  `engine` varchar(50) NOT NULL,
  `globalClusterExists` tinyint(1) NOT NULL,
  `globalClusterName` varchar(255) NOT NULL,
  `hyderabadClusterName` varchar(255) NOT NULL,
  `parameterGroup` varchar(255) NOT NULL,
  `parameterGroupForHyd` varchar(255) NOT NULL,
  `status` varchar(50) NOT NULL,
  `createdAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `headExistsForHyd` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gandalfGlobalClusterCreationQueries`
--

DROP TABLE IF EXISTS `gandalfGlobalClusterCreationQueries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gandalfGlobalClusterCreationQueries` (
  `issueID` int NOT NULL,
  `issueKey` varchar(20) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdBy` varchar(50) NOT NULL,
  `approvedBy` varchar(50) DEFAULT NULL,
  `executedBy` varchar(50) DEFAULT NULL,
  `jobStatus` varchar(20) DEFAULT 'PENDING',
  `approvalType` varchar(10) DEFAULT NULL,
  `hadErrors` int NOT NULL DEFAULT '0',
  `globalClusterCreationConfig` text,
  `cellName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`issueID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gandalfHeaderAutomationQueries`
--

DROP TABLE IF EXISTS `gandalfHeaderAutomationQueries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gandalfHeaderAutomationQueries` (
  `issueID` int NOT NULL,
  `issueKey` varchar(20) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdBy` varchar(50) NOT NULL,
  `approvedBy` varchar(50) DEFAULT NULL,
  `executedBy` varchar(50) DEFAULT NULL,
  `jobStatus` varchar(20) DEFAULT 'PENDING',
  `approvalType` varchar(10) DEFAULT NULL,
  `hadErrors` int NOT NULL DEFAULT '0',
  `mumbaiHeaderConfig` text,
  `hyderabadHeaderConfig` text,
  PRIMARY KEY (`issueID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gandalfInfraSetupQueries`
--

DROP TABLE IF EXISTS `gandalfInfraSetupQueries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gandalfInfraSetupQueries` (
  `issueID` int NOT NULL,
  `issueKey` varchar(20) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdBy` varchar(50) NOT NULL,
  `approvedBy` varchar(50) DEFAULT NULL,
  `executedBy` varchar(50) DEFAULT NULL,
  `aws_account_name` varchar(20) DEFAULT NULL,
  `aws_region` varchar(20) DEFAULT NULL,
  `aws_env` varchar(10) DEFAULT NULL,
  `aws_service_name` varchar(50) DEFAULT NULL,
  `aws_node_type` varchar(20) DEFAULT NULL,
  `aws_instance_type` varchar(20) DEFAULT NULL,
  `carca_jira` varchar(20) DEFAULT NULL,
  `aws_bu` varchar(20) DEFAULT NULL,
  `aws_cost_owner` varchar(50) DEFAULT NULL,
  `aws_engg_manager` varchar(50) DEFAULT NULL,
  `jobStatus` varchar(20) DEFAULT 'PENDING',
  `aws_datastore` varchar(30) DEFAULT NULL,
  `approvalType` varchar(10) DEFAULT NULL,
  `instanceIP` text,
  `hadErrors` int NOT NULL DEFAULT '0',
  `branch_name` text,
  `pr_link` text,
  `aws_cost_value` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`issueID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gandalfInstanceSizeList`
--

DROP TABLE IF EXISTS `gandalfInstanceSizeList`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gandalfInstanceSizeList` (
  `id` int NOT NULL AUTO_INCREMENT,
  `instanceSizeName` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gandalfIssues`
--

DROP TABLE IF EXISTS `gandalfIssues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gandalfIssues` (
  `issueID` varchar(30) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `createdBy` varchar(255) DEFAULT NULL,
  `attachmentID` varchar(30) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `issueKey` varchar(255) DEFAULT NULL,
  `sourceInstanceIP` varchar(50) DEFAULT NULL,
  `sourceDatabase` varchar(50) DEFAULT NULL,
  `migration_type` varchar(50) DEFAULT NULL,
  `source_jira_key_diff` varchar(20) DEFAULT NULL,
  `destinationInstanceIP` varchar(50) DEFAULT NULL,
  `destinationDatabase` varchar(50) DEFAULT NULL,
  `hadErrors` int NOT NULL DEFAULT '0',
  `approvedBy` varchar(50) DEFAULT NULL,
  `executedBy` varchar(50) DEFAULT NULL,
  `sourceRegion` varchar(50) DEFAULT NULL,
  `destinationRegion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`issueID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gandalfMindeedOwners`
--

DROP TABLE IF EXISTS `gandalfMindeedOwners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gandalfMindeedOwners` (
  `owner` varchar(50) NOT NULL,
  PRIMARY KEY (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gandalfMindeedQueries`
--

DROP TABLE IF EXISTS `gandalfMindeedQueries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gandalfMindeedQueries` (
  `issueID` int NOT NULL,
  `issueKey` varchar(20) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdBy` varchar(50) NOT NULL,
  `approvedBy` varchar(50) DEFAULT NULL,
  `executedBy` varchar(50) DEFAULT NULL,
  `jobStatus` varchar(20) DEFAULT 'PENDING',
  `instanceName` text,
  `instanceIP` text,
  `databaseName` varchar(100) DEFAULT '',
  `fileName` text,
  `approvalType` varchar(10) DEFAULT NULL,
  `hadErrors` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`issueID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gandalfPostgresQueries`
--

DROP TABLE IF EXISTS `gandalfPostgresQueries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gandalfPostgresQueries` (
  `issueID` int NOT NULL,
  `issueKey` varchar(20) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdBy` varchar(50) NOT NULL,
  `approvedBy` varchar(50) DEFAULT NULL,
  `executedBy` varchar(50) DEFAULT NULL,
  `instanceName` varchar(100) DEFAULT '',
  `dbName` varchar(100) DEFAULT '',
  `queriesText` text,
  `jobStatus` varchar(20) DEFAULT 'PENDING',
  `hadErrors` int NOT NULL DEFAULT '0',
  `usedGhost` int NOT NULL DEFAULT '0',
  `instanceIP` varchar(100) DEFAULT '',
  `queriesType` varchar(10) DEFAULT '',
  `databaseName` varchar(100) DEFAULT '',
  `cab_approval_required` varchar(10) DEFAULT NULL,
  `secondaryapprovedBy` text,
  `secondaryapprovalType` varchar(30) DEFAULT NULL,
  `gandalfQueriesText` text,
  `tidbChangeStatus` varchar(100) DEFAULT NULL,
  `jiraTiDBTicketNumber` varchar(100) DEFAULT NULL,
  `thirdapprovedBy` text,
  `thirdapprovalType` varchar(30) DEFAULT NULL,
  `isGhostQuery` varchar(10) DEFAULT 'False',
  `slotStartTime` varchar(100) DEFAULT '',
  `slotEndTime` varchar(100) DEFAULT '',
  `isScheduledQuery` varchar(10) DEFAULT 'No',
  `scheduledQueryExecutionTime` varchar(100) DEFAULT '',
  `cron_status` varchar(10) DEFAULT NULL,
  `pr_link` text,
  `aws_account_name` varchar(20) DEFAULT 'RSPL',
  `region` varchar(20) DEFAULT '',
  `flowType` varchar(20) DEFAULT 'normal',
  `cellList` json DEFAULT NULL,
  PRIMARY KEY (`issueID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gandalfQROwners`
--

DROP TABLE IF EXISTS `gandalfQROwners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gandalfQROwners` (
  `owner` varchar(50) NOT NULL,
  PRIMARY KEY (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gandalfQRQueries`
--

DROP TABLE IF EXISTS `gandalfQRQueries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gandalfQRQueries` (
  `issueID` int NOT NULL,
  `issueKey` varchar(20) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdBy` varchar(50) NOT NULL,
  `approvedBy` varchar(50) DEFAULT NULL,
  `executedBy` varchar(50) DEFAULT NULL,
  `jobStatus` varchar(20) DEFAULT 'PENDING',
  `hadErrors` int NOT NULL DEFAULT '0',
  `snapshotList` longtext,
  `secondaryapprovedBy` varchar(30) DEFAULT NULL,
  `secondaryapprovalType` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`issueID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gandalfQueries`
--

DROP TABLE IF EXISTS `gandalfQueries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gandalfQueries` (
  `issueID` int NOT NULL,
  `issueKey` varchar(20) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdBy` varchar(50) NOT NULL,
  `approvedBy` varchar(50) DEFAULT NULL,
  `executedBy` varchar(50) DEFAULT NULL,
  `instanceName` varchar(100) DEFAULT '',
  `dbName` varchar(100) DEFAULT '',
  `queriesText` text NOT NULL,
  `jobStatus` varchar(20) DEFAULT 'PENDING',
  `hadErrors` int NOT NULL DEFAULT '0',
  `usedGhost` int NOT NULL DEFAULT '0',
  `instanceIP` varchar(100) DEFAULT '',
  `queriesType` varchar(10) DEFAULT '',
  `databaseName` varchar(100) DEFAULT '',
  `cab_approval_required` varchar(10) DEFAULT NULL,
  `secondaryapprovedBy` varchar(30) DEFAULT NULL,
  `secondaryapprovalType` varchar(30) DEFAULT NULL,
  `thirdapprovedBy` varchar(130) DEFAULT NULL,
  `thirdapprovalType` varchar(30) DEFAULT 'NA',
  `partition_flag` int NOT NULL DEFAULT '0',
  `partition_type` text,
  `partition_query` text,
  `partition_granularity` varchar(20) DEFAULT NULL,
  `partition_key` varchar(100) DEFAULT NULL,
  `isGhostQuery` varchar(10) DEFAULT 'False',
  `slotStartTime` varchar(100) DEFAULT '',
  `slotEndTime` varchar(100) DEFAULT '',
  `isScheduledQuery` varchar(10) DEFAULT 'No',
  `scheduledQueryExecutionTime` varchar(100) DEFAULT '',
  `cron_status` varchar(10) DEFAULT NULL,
  `application_port` int DEFAULT NULL,
  `bulkQueries` varchar(10) DEFAULT '',
  `fileName` text,
  `pr_link` text,
  `aws_account_name` varchar(20) DEFAULT 'RSPL',
  `region` varchar(20) DEFAULT '',
  `flowType` varchar(20) DEFAULT 'normal',
  `cellList` json DEFAULT NULL,
  PRIMARY KEY (`issueID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gandalfQueries_backup`
--

DROP TABLE IF EXISTS `gandalfQueries_backup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gandalfQueries_backup` (
  `issueID` int NOT NULL,
  `issueKey` varchar(20) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdBy` varchar(50) NOT NULL,
  `approvedBy` varchar(50) DEFAULT NULL,
  `executedBy` varchar(50) DEFAULT NULL,
  `instanceName` varchar(100) DEFAULT '',
  `dbName` varchar(100) DEFAULT '',
  `queriesText` text NOT NULL,
  `jobStatus` varchar(20) DEFAULT 'PENDING',
  `hadErrors` int NOT NULL DEFAULT '0',
  `usedGhost` int NOT NULL DEFAULT '0',
  `instanceIP` varchar(100) DEFAULT '',
  `queriesType` varchar(10) DEFAULT '',
  `databaseName` varchar(100) DEFAULT '',
  `cab_approval_required` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`issueID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gandalfRedashDataSourceOnboardingQueries`
--

DROP TABLE IF EXISTS `gandalfRedashDataSourceOnboardingQueries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gandalfRedashDataSourceOnboardingQueries` (
  `issueID` int NOT NULL,
  `issueKey` varchar(20) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdBy` varchar(50) NOT NULL,
  `approvedBy` varchar(50) DEFAULT NULL,
  `executedBy` varchar(50) DEFAULT NULL,
  `instanceName` varchar(100) DEFAULT '',
  `instanceIP` varchar(100) DEFAULT '',
  `databaseName` varchar(100) DEFAULT '',
  `jobStatus` varchar(20) DEFAULT 'PENDING',
  `hadErrors` int NOT NULL DEFAULT '0',
  `createNewGroup` varchar(10) DEFAULT '',
  `groupName` varchar(100) DEFAULT '',
  `groupOwnerEmail` varchar(50) DEFAULT NULL,
  `datastore` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`issueID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gandalfRedashGroupOwners`
--

DROP TABLE IF EXISTS `gandalfRedashGroupOwners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gandalfRedashGroupOwners` (
  `groupName` varchar(100) DEFAULT '',
  `groupOwnerEmail` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gandalfRedashUserOnboardingQueries`
--

DROP TABLE IF EXISTS `gandalfRedashUserOnboardingQueries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gandalfRedashUserOnboardingQueries` (
  `issueID` int NOT NULL,
  `issueKey` varchar(20) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdBy` varchar(50) NOT NULL,
  `approvedBy` varchar(50) DEFAULT NULL,
  `executedBy` varchar(50) DEFAULT NULL,
  `jobStatus` varchar(20) DEFAULT 'PENDING',
  `hadErrors` int NOT NULL DEFAULT '0',
  `groupNameList` text,
  PRIMARY KEY (`issueID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gandalfRedisQueries`
--

DROP TABLE IF EXISTS `gandalfRedisQueries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gandalfRedisQueries` (
  `issueID` int NOT NULL,
  `issueKey` varchar(20) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdBy` varchar(50) NOT NULL,
  `approvedBy` varchar(50) DEFAULT NULL,
  `executedBy` varchar(50) DEFAULT NULL,
  `instanceName` varchar(200) DEFAULT '',
  `instanceIP` varchar(200) DEFAULT '',
  `operationType` varchar(50) DEFAULT '',
  `clusterMode` varchar(10) DEFAULT '',
  `redisKey` text,
  `redisValue` text,
  `redisPattern` text,
  `jobStatus` varchar(20) DEFAULT 'PENDING',
  `hadErrors` int NOT NULL DEFAULT '0',
  `redisField` text,
  `redisKeyType` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`issueID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gandalfUserQueries`
--

DROP TABLE IF EXISTS `gandalfUserQueries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gandalfUserQueries` (
  `issueID` int NOT NULL,
  `issueKey` varchar(255) DEFAULT NULL,
  `createdBy` varchar(255) DEFAULT NULL,
  `jobStatus` varchar(50) DEFAULT NULL,
  `instanceName` varchar(255) DEFAULT NULL,
  `instanceIP` text,
  `newDatabaseName` varchar(255) DEFAULT NULL,
  `userType` varchar(50) DEFAULT NULL,
  `newUserName` varchar(255) DEFAULT NULL,
  `credstashTableName` varchar(255) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `approvedBy` varchar(50) DEFAULT NULL,
  `executedBy` varchar(50) DEFAULT NULL,
  `approvedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `queryText` text,
  `hadErrors` int NOT NULL DEFAULT '0',
  `applicationUserCredstashKeys` text,
  `de_view_manager_CredstashKeys` text,
  `sqoop_views_CredstashKeys` varchar(255) DEFAULT NULL,
  `datum_replication_CredstashKeys` varchar(255) DEFAULT NULL,
  `maxwell_replication_CredstashKeys` text,
  `userCreationType` varchar(255) DEFAULT NULL,
  `datastore` varchar(10) DEFAULT NULL,
  `commonUserCredstashKeys` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`issueID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `goose_db_version`
--

DROP TABLE IF EXISTS `goose_db_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goose_db_version` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `version_id` bigint NOT NULL,
  `is_applied` tinyint(1) NOT NULL,
  `tstamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `instance_name` varchar(50) NOT NULL,
  `instance_ip` varchar(100) DEFAULT NULL,
  `instance_type` varchar(40) NOT NULL,
  `instance_role` varchar(40) DEFAULT NULL,
  `instance_status` varchar(25) NOT NULL,
  `DATABASE_VERSION` varchar(255) DEFAULT NULL,
  `ARCHIVE_BUCKET_NAME` varchar(255) DEFAULT NULL,
  `TEAM` varchar(255) DEFAULT NULL,
  `PROJECT` varchar(60) DEFAULT NULL,
  `cab_type` varchar(10) DEFAULT 'NON-CAB',
  `approval_type` varchar(25) DEFAULT 'single',
  `secondaryapprovalType` varchar(30) DEFAULT NULL,
  `thirdapprovalType` varchar(30) DEFAULT 'NA',
  `aws_account_name` varchar(20) DEFAULT 'RSPL',
  `allowed_execution_days` json NOT NULL DEFAULT (json_array(_utf8mb4'Monday',_utf8mb4'Thursday')),
  `lock_status` varchar(3) DEFAULT 'No',
  `application_port` int DEFAULT '3306',
  `region` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `merchant_details`
--

DROP TABLE IF EXISTS `merchant_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `merchant_details` (
  `merchant_id` char(14) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `contact_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `contact_email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `contact_mobile` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `contact_landline` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `business_type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `business_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `business_description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `business_dba` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `business_website` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `additional_websites` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `business_international` tinyint(1) NOT NULL DEFAULT '0',
  `business_paymentdetails` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `business_registered_address` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `business_registered_address_l2` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `business_registered_state` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `business_registered_city` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `business_registered_district` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `business_registered_pin` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `business_registered_country` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `business_operation_address` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `business_operation_address_l2` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `business_operation_state` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `business_operation_city` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `business_operation_district` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `business_operation_pin` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `business_operation_country` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `business_doe` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `gstin` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `p_gstin` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `company_cin` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `company_pan` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `company_pan_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `business_category` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `business_subcategory` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `business_model` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `transaction_volume` int unsigned DEFAULT NULL,
  `transaction_value` int unsigned DEFAULT NULL,
  `promoter_pan` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `promoter_pan_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `date_of_birth` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `bank_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `bank_account_number` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `bank_account_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `bank_account_type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `bank_branch` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `bank_branch_ifsc` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `bank_beneficiary_address1` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `bank_beneficiary_address2` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `bank_beneficiary_address3` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `bank_beneficiary_city` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `bank_beneficiary_state` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `bank_beneficiary_pin` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `website_about` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `website_contact` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `website_privacy` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `website_terms` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `website_refund` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `website_pricing` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `website_login` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `business_proof_url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `business_operation_proof_url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `business_pan_url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `address_proof_url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `promoter_proof_url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `promoter_pan_url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `promoter_address_url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `form_12a_url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `form_80g_url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `transaction_report_email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `role` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `department` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `comment` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `steps_finished` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT '[]',
  `activation_progress` int DEFAULT '0',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `activation_status` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `poi_verification_status` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `poa_verification_status` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `bank_details_verification_status` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `activation_flow` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `international_activation_flow` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `live_transaction_done` tinyint(1) DEFAULT '0',
  `clarification_mode` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `kyc_clarification_reasons` json DEFAULT NULL,
  `kyc_additional_details` json DEFAULT NULL,
  `kyc_id` char(14) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `archived_at` int DEFAULT NULL,
  `reviewer_id` char(14) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `issue_fields` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `issue_fields_reason` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `internal_notes` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `custom_fields` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `marketplace_activation_status` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `virtual_accounts_activation_status` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `subscriptions_activation_status` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `submitted` tinyint(1) NOT NULL DEFAULT '0',
  `submitted_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `updated_at` int NOT NULL,
  `estd_year` smallint DEFAULT NULL,
  `authorized_signatory_residential_address` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `authorized_signatory_dob` date DEFAULT NULL,
  `platform` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `fund_account_validation_id` char(14) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `date_of_establishment` date DEFAULT NULL,
  `penny_testing_updated_at` int DEFAULT NULL,
  `company_pan_verification_status` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `gstin_verification_status` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `cin_verification_status` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `personal_pan_doc_verification_status` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `company_pan_doc_verification_status` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `bank_details_doc_verification_status` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `shop_establishment_number` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `shop_establishment_verification_status` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `client_applications` json DEFAULT NULL,
  `onboarding_milestone` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `business_suggested_pin` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `business_suggested_address` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `fraud_type` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `bas_business_id` varchar(14) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `msme_doc_verification_status` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `activation_form_milestone` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `fund_addition_va_ids` json DEFAULT NULL,
  `iec_code` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `audit_id` char(14) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `bank_branch_code_type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `bank_branch_code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `industry_category_code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `industry_category_code_type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`merchant_id`),
  KEY `bank_details_verification_status_index` (`bank_details_verification_status`),
  KEY `merchant_details_activation_status_index` (`activation_status`),
  KEY `merchant_details_archived_at_index` (`archived_at`),
  KEY `merchant_details_created_at_index` (`created_at`),
  KEY `merchant_details_updated_at_index` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `merchant_migration_approvers`
--

DROP TABLE IF EXISTS `merchant_migration_approvers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `merchant_migration_approvers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `approver_email` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `merchantMigrationCrons`
--

DROP TABLE IF EXISTS `merchantMigrationCrons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `merchantMigrationCrons` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cronName` varchar(1000) DEFAULT NULL,
  `cronExpression` varchar(30) DEFAULT NULL,
  `issueKey` varchar(255) DEFAULT NULL,
  `cronStatus` varchar(50) DEFAULT NULL,
  `merchantId` varchar(255) DEFAULT NULL,
  `sourceCell` varchar(255) DEFAULT 'RSPL',
  `targetCell` varchar(255) DEFAULT NULL,
  `createdAt` varchar(30) DEFAULT NULL,
  `createdBy` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `merchantMigrationQueries`
--

DROP TABLE IF EXISTS `merchantMigrationQueries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `merchantMigrationQueries` (
  `id` int NOT NULL AUTO_INCREMENT,
  `issueID` varchar(255) DEFAULT NULL,
  `issueKey` varchar(255) DEFAULT NULL,
  `createdBy` varchar(255) DEFAULT NULL,
  `jobStatus` varchar(50) DEFAULT NULL,
  `merchantId` varchar(255) DEFAULT NULL,
  `sourceCell` varchar(255) DEFAULT 'RSPL',
  `targetCell` varchar(255) DEFAULT NULL,
  `approvedBy` varchar(255) DEFAULT NULL,
  `executedBy` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mysql_instance_owner_info`
--

DROP TABLE IF EXISTS `mysql_instance_owner_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mysql_instance_owner_info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `instance_name` varchar(50) DEFAULT NULL,
  `instance_ip` varchar(100) DEFAULT NULL,
  `instance_role` varchar(20) DEFAULT NULL,
  `owner_email` varchar(50) DEFAULT NULL,
  `approval_type` varchar(25) DEFAULT NULL,
  `secondary_email` varchar(130) DEFAULT NULL,
  `secondaryapprovalType` varchar(30) DEFAULT NULL,
  `third_email` varchar(130) DEFAULT 'NA',
  `thirdapprovalType` varchar(30) DEFAULT 'NA',
  `aws_account_name` varchar(20) DEFAULT 'RSPL',
  `rspl_admin_email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `non_dynamic_params_table`
--

DROP TABLE IF EXISTS `non_dynamic_params_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `non_dynamic_params_table` (
  `id` int NOT NULL AUTO_INCREMENT,
  `instance_name` text,
  `instance_ip` text,
  `params` json DEFAULT NULL,
  `partitions_score` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `postgres_instance_owner_info`
--

DROP TABLE IF EXISTS `postgres_instance_owner_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `postgres_instance_owner_info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `instance_name` varchar(50) DEFAULT NULL,
  `instance_ip` varchar(100) DEFAULT NULL,
  `instance_role` varchar(20) DEFAULT NULL,
  `owner_email` varchar(50) DEFAULT NULL,
  `approval_type` varchar(25) DEFAULT NULL,
  `secondary_email` varchar(130) DEFAULT NULL,
  `secondaryapprovalType` varchar(30) DEFAULT NULL,
  `third_email` varchar(130) DEFAULT 'NA',
  `thirdapprovalType` varchar(30) DEFAULT 'NA',
  `aws_account_name` varchar(20) DEFAULT 'RSPL',
  `rspl_admin_email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `owner_name` (`instance_ip`,`owner_email`,`third_email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `postgresInventory`
--

DROP TABLE IF EXISTS `postgresInventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `postgresInventory` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `instance_name` varchar(50) NOT NULL,
  `instance_ip` varchar(100) NOT NULL,
  `instance_type` varchar(40) NOT NULL,
  `instance_role` varchar(40) DEFAULT NULL,
  `instance_status` varchar(25) NOT NULL,
  `DATABASE_VERSION` varchar(255) DEFAULT NULL,
  `ARCHIVE_BUCKET_NAME` varchar(255) DEFAULT NULL,
  `TEAM` varchar(255) DEFAULT NULL,
  `PROJECT` varchar(60) DEFAULT NULL,
  `cab_type` varchar(40) DEFAULT NULL,
  `approval_type` varchar(40) DEFAULT NULL,
  `secondaryapprovalType` varchar(40) DEFAULT NULL,
  `database_name` varchar(50) DEFAULT NULL,
  `schema_name` varchar(50) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `thirdapprovalType` varchar(100) DEFAULT NULL,
  `aws_account_name` varchar(20) DEFAULT 'RSPL',
  `allowed_execution_days` json NOT NULL DEFAULT (json_array(_utf8mb4'Monday',_utf8mb4'Thursday')),
  `lock_status` varchar(3) DEFAULT 'No',
  `region` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `redis_instance_owner_info`
--

DROP TABLE IF EXISTS `redis_instance_owner_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `redis_instance_owner_info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `instance_name` varchar(50) DEFAULT NULL,
  `instance_ip` varchar(100) DEFAULT NULL,
  `instance_role` varchar(20) DEFAULT NULL,
  `owner_email` varchar(50) DEFAULT NULL,
  `approval_type` varchar(25) DEFAULT NULL,
  `aws_account_name` varchar(20) DEFAULT 'RSPL',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `redisInventory`
--

DROP TABLE IF EXISTS `redisInventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `redisInventory` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `instance_name` varchar(100) NOT NULL,
  `instance_ip` varchar(200) DEFAULT NULL,
  `cluster_mode` varchar(40) NOT NULL,
  `instance_role` varchar(40) DEFAULT NULL,
  `instance_status` varchar(25) NOT NULL,
  `no_of_shards` varchar(25) NOT NULL,
  `no_of_nodes` varchar(25) NOT NULL,
  `DATABASE_VERSION` varchar(255) DEFAULT NULL,
  `ARCHIVE_BUCKET_NAME` varchar(255) DEFAULT NULL,
  `TEAM` varchar(255) DEFAULT NULL,
  `PROJECT` varchar(60) DEFAULT NULL,
  `approval_type` varchar(25) DEFAULT 'single',
  `aws_account_name` varchar(20) DEFAULT 'RSPL',
  `cluster_config` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `scheduled_crons`
--

DROP TABLE IF EXISTS `scheduled_crons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scheduled_crons` (
  `id` int NOT NULL AUTO_INCREMENT,
  `issue_key` varchar(255) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `execution_time` datetime NOT NULL,
  `cron_status` varchar(10) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `score_card_monitoring_table`
--

DROP TABLE IF EXISTS `score_card_monitoring_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `score_card_monitoring_table` (
  `id` int NOT NULL AUTO_INCREMENT,
  `instance_name` text,
  `instance_ip` text,
  `cpu_score` int DEFAULT NULL,
  `connection_score` int DEFAULT NULL,
  `active_transaction_score` int DEFAULT NULL,
  `max_execution_time_score` int DEFAULT NULL,
  `partitions_score` int DEFAULT NULL,
  `read_write_split_score` int DEFAULT NULL,
  `memory_score` int DEFAULT NULL,
  `innodb_history_length_score` int DEFAULT NULL,
  `purging_score` int DEFAULT NULL,
  `db_cache_score` int DEFAULT NULL,
  `final_score` int DEFAULT NULL,
  `score_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `scorecard_graph_data`
--

DROP TABLE IF EXISTS `scorecard_graph_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scorecard_graph_data` (
  `id` int NOT NULL AUTO_INCREMENT,
  `instance_name` text,
  `instance_ip` text,
  `cpu_score` int DEFAULT NULL,
  `connection_score` int DEFAULT NULL,
  `active_transaction_score` int DEFAULT NULL,
  `max_execution_time_score` int DEFAULT NULL,
  `partitions_score` int DEFAULT NULL,
  `read_write_split_score` int DEFAULT NULL,
  `memory_score` int DEFAULT NULL,
  `innodb_history_length_score` int DEFAULT NULL,
  `purging_score` int DEFAULT NULL,
  `db_cache_score` int DEFAULT NULL,
  `final_score` int DEFAULT NULL,
  `score_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `testing`
--

DROP TABLE IF EXISTS `testing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testing` (
  `id` int NOT NULL AUTO_INCREMENT,
  `designation_plain` varchar(255) DEFAULT NULL,
  `designation_encrypted` blob,
  `designation_hex_encrypted` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `testing_versioning`
--

DROP TABLE IF EXISTS `testing_versioning`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testing_versioning` (
  `id` char(14) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vendor_payments`
--

DROP TABLE IF EXISTS `vendor_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendor_payments` (
  `id` varchar(21) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `invoice_number` varchar(140) DEFAULT NULL,
  `account_number` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `contact_id` varchar(19) DEFAULT NULL,
  `fund_account_id` varchar(19) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `merchant_id` varchar(19) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `user_id` varchar(19) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `total_amount` bigint DEFAULT NULL,
  `subtotal_amount` bigint DEFAULT NULL,
  `tds_amount` bigint DEFAULT NULL,
  `sgst` float NOT NULL DEFAULT '0',
  `cgst` float NOT NULL DEFAULT '0',
  `currency` char(3) NOT NULL DEFAULT 'INR',
  `invoice_date` bigint DEFAULT NULL,
  `due_date` bigint DEFAULT NULL,
  `status` char(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `payout_mode` char(5) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `purpose` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `tds_category` int DEFAULT NULL,
  `notes` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `cancelling_user_id` varchar(19) DEFAULT NULL,
  `cancellation_reason` varchar(255) DEFAULT NULL,
  `payment_terms` int DEFAULT NULL,
  `updated_at` bigint DEFAULT NULL,
  `created_at` bigint NOT NULL,
  `cancelled_at` bigint DEFAULT NULL,
  `invoice_file_id` varchar(40) DEFAULT NULL,
  `paid_at` bigint DEFAULT NULL,
  `ocr_reference_id` varchar(40) DEFAULT NULL,
  `manually_paid_user_id` varchar(19) DEFAULT NULL,
  `manually_paid_metadata` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `marked_as_paid` tinyint(1) DEFAULT '0',
  `source_type` varchar(50) DEFAULT NULL,
  `source_id` varchar(50) DEFAULT NULL,
  `gst_amount` bigint DEFAULT NULL,
  `gst_type` varchar(20) DEFAULT NULL,
  `unpaid_at` bigint DEFAULT NULL,
  `draft_created_at` bigint DEFAULT NULL,
  `expense_id` varchar(21) DEFAULT NULL,
  `gstin` char(15) DEFAULT NULL,
  `tds_deduction_on` varchar(21) DEFAULT NULL,
  `approval_id` char(21) DEFAULT NULL,
  `discount` bigint NOT NULL DEFAULT '0',
  `round_off` bigint NOT NULL DEFAULT '0',
  `cost_center_id` char(14) DEFAULT NULL,
  `entity_metadata` json DEFAULT NULL,
  `billing_branch_id` char(14) DEFAULT NULL,
  `merchant_billing_address` json DEFAULT NULL,
  `merchant_gstin` varchar(20) DEFAULT NULL,
  `requester_id` char(14) DEFAULT NULL,
  `is_rcm_applicable` tinyint DEFAULT '0',
  `gstr_2b_recon_status` varchar(50) DEFAULT NULL,
  `total_amount_block_size` bigint DEFAULT NULL,
  PRIMARY KEY (`id`,`created_at`),
  KEY `vendor_payments_created_at_index` (`created_at`),
  KEY `vendor_payments_merchant_id_created_at_index` (`merchant_id`,`created_at`,`invoice_date`,`due_date`),
  KEY `vendor_payments_contact_id_index` (`contact_id`),
  KEY `vendor_payments_tds_category_index` (`tds_category`),
  KEY `vendor_payments_merchant_id_requester_id_index` (`merchant_id`,`requester_id`),
  KEY `vendor_payments_merchant_id_user_id_index` (`merchant_id`,`user_id`),
  KEY `vendor_payments_invoice_number_created_id_index` (`invoice_number`,`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci
/*!50100 PARTITION BY RANGE (`created_at`)
(PARTITION p_vendor_payments_May20 VALUES LESS THAN (1590969600) ENGINE = InnoDB,
 PARTITION p_vendor_payments_Jun20 VALUES LESS THAN (1593561600) ENGINE = InnoDB,
 PARTITION p_vendor_payments_July20 VALUES LESS THAN (1596240000) ENGINE = InnoDB,
 PARTITION p_vendor_payments_Aug20 VALUES LESS THAN (1598918400) ENGINE = InnoDB,
 PARTITION p_vendor_payments_Sep20 VALUES LESS THAN (1601510400) ENGINE = InnoDB,
 PARTITION p_vendor_payments_Oct20 VALUES LESS THAN (1604188800) ENGINE = InnoDB,
 PARTITION p_vendor_payments_Nov20 VALUES LESS THAN (1606780800) ENGINE = InnoDB,
 PARTITION p_vendor_payments_Dec20 VALUES LESS THAN (1609459200) ENGINE = InnoDB,
 PARTITION p_vendor_payments_Max VALUES LESS THAN MAXVALUE ENGINE = InnoDB) */;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vendor_payments_stage`
--

DROP TABLE IF EXISTS `vendor_payments_stage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendor_payments_stage` (
  `id` varchar(21) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `invoice_number` varchar(140) DEFAULT NULL,
  `account_number` varchar(19) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `contact_id` varchar(19) DEFAULT NULL,
  `fund_account_id` varchar(19) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `merchant_id` varchar(19) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `user_id` varchar(19) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `total_amount` bigint DEFAULT NULL,
  `subtotal_amount` bigint DEFAULT NULL,
  `tds_amount` bigint DEFAULT NULL,
  `sgst` float NOT NULL DEFAULT '0',
  `cgst` float NOT NULL DEFAULT '0',
  `currency` char(3) NOT NULL DEFAULT 'INR',
  `invoice_date` bigint DEFAULT NULL,
  `due_date` bigint DEFAULT NULL,
  `status` char(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `payout_mode` varchar(19) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `purpose` varchar(255) DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `tds_category` int DEFAULT NULL,
  `notes` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `payment_terms` int DEFAULT NULL,
  `updated_at` bigint DEFAULT NULL,
  `created_at` bigint DEFAULT NULL,
  `cancelled_at` bigint DEFAULT NULL,
  `paid_at` bigint DEFAULT NULL,
  `cancelling_user_id` varchar(19) DEFAULT NULL,
  `cancellation_reason` varchar(255) DEFAULT NULL,
  `invoice_file_id` varchar(40) DEFAULT NULL,
  `ocr_reference_id` varchar(40) DEFAULT NULL,
  `manually_paid_user_id` varchar(19) DEFAULT NULL,
  `manually_paid_metadata` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `marked_as_paid` tinyint(1) DEFAULT '0',
  `source_type` varchar(50) DEFAULT NULL,
  `source_id` varchar(50) DEFAULT NULL,
  `gst_amount` bigint DEFAULT NULL,
  `gst_type` varchar(20) DEFAULT NULL,
  `unpaid_at` bigint DEFAULT NULL,
  `draft_created_at` bigint DEFAULT NULL,
  `vendor_auto_linked` tinyint DEFAULT '0',
  `fa_auto_linked` tinyint DEFAULT '0',
  `expense_id` varchar(21) DEFAULT NULL,
  `gstin` varchar(40) DEFAULT NULL,
  `tds_deduction_on` varchar(21) DEFAULT NULL,
  `approval_id` char(21) DEFAULT NULL,
  `discount` bigint NOT NULL DEFAULT '0',
  `round_off` bigint NOT NULL DEFAULT '0',
  `cost_center_id` char(14) DEFAULT NULL,
  `entity_metadata` json DEFAULT NULL,
  `billing_branch_id` char(14) DEFAULT NULL,
  `merchant_billing_address` json DEFAULT NULL,
  `merchant_gstin` varchar(20) DEFAULT NULL,
  `requester_id` char(14) DEFAULT NULL,
  `is_rcm_applicable` tinyint DEFAULT '0',
  `gstr_2b_recon_status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vendor_payments_cancelled_at_index` (`cancelled_at`),
  KEY `vendor_payments_created_at_index` (`created_at`),
  KEY `vendor_payments_paid_at_index` (`paid_at`),
  KEY `vendor_payments_purpose_index` (`purpose`),
  KEY `vendor_payments_status_index` (`status`),
  KEY `vendor_payments_due_date_index` (`due_date`),
  KEY `vendor_payments_invoice_date_index` (`invoice_date`),
  KEY `vendor_payments_merchant_id_index` (`merchant_id`),
  KEY `vendor_payments_contact_id_index` (`contact_id`),
  KEY `vendor_payments_invoice_number_index` (`invoice_number`),
  KEY `vendor_payments_tds_category_index` (`tds_category`),
  KEY `vendor_payments_merchant_id_requester_id_index` (`merchant_id`,`requester_id`),
  KEY `vendor_payments_merchant_id_user_id_index` (`merchant_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Current Database: `heartbeat`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `heartbeat` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `heartbeat`;

--
-- Current Database: `innodb`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `innodb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `innodb`;

--
-- Current Database: `mysqldb_monitoring`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `mysqldb_monitoring` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `mysqldb_monitoring`;

--
-- Table structure for table `partition_archiving_monitoring`
--

DROP TABLE IF EXISTS `partition_archiving_monitoring`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partition_archiving_monitoring` (
  `hostname` varchar(100) DEFAULT NULL,
  `dbname` varchar(100) DEFAULT NULL,
  `tablename` varchar(100) DEFAULT NULL,
  `start_time` varchar(50) DEFAULT NULL,
  `last_active_time` varchar(50) DEFAULT NULL,
  `job_status` varchar(50) DEFAULT NULL,
  `end_time` varchar(50) DEFAULT NULL,
  `data_free` varchar(50) DEFAULT NULL,
  `frag_ratio` varchar(50) DEFAULT NULL,
  `dropped_partition` longtext,
  `created_partition` longtext,
  `table_size` varchar(50) DEFAULT NULL,
  `data_archived` varchar(50) DEFAULT NULL,
  `partition_type` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `purging_monitoring`
--

DROP TABLE IF EXISTS `purging_monitoring`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purging_monitoring` (
  `id` int NOT NULL AUTO_INCREMENT,
  `instance_name` varchar(255) NOT NULL,
  `purge_score` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `purging_status_monitoring`
--

DROP TABLE IF EXISTS `purging_status_monitoring`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purging_status_monitoring` (
  `id` int NOT NULL AUTO_INCREMENT,
  `issueKey` text,
  `instance_ip` text,
  `database_name` text,
  `object_type` text,
  `object_name` text,
  `cost_saving` int DEFAULT NULL,
  `backupFlag` text,
  `createdBy` text,
  `jobStatus` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `read_analysis_table`
--

DROP TABLE IF EXISTS `read_analysis_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `read_analysis_table` (
  `id` int NOT NULL AUTO_INCREMENT,
  `instance_name` varchar(255) NOT NULL,
  `db_name` varchar(255) NOT NULL,
  `table_name` varchar(255) NOT NULL,
  `count_read` bigint NOT NULL,
  `ingestion_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `unused_read_tables`
--

DROP TABLE IF EXISTS `unused_read_tables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unused_read_tables` (
  `id` int NOT NULL AUTO_INCREMENT,
  `instance_name` varchar(255) NOT NULL,
  `db_name` varchar(255) NOT NULL,
  `table_name` varchar(255) NOT NULL,
  `unread_flag` int DEFAULT '1',
  `identified_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Current Database: `pg_db_one`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `pg_db_one` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `pg_db_one`;

--
-- Current Database: `prod_cross_border_import_live`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `prod_cross_border_import_live` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `prod_cross_border_import_live`;

--
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addresses` (
  `id` char(14) NOT NULL,
  `type` varchar(50) NOT NULL,
  `line1` varchar(255) NOT NULL,
  `line2` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `country` char(3) NOT NULL,
  `zipcode` varchar(265) NOT NULL,
  `entity_type` varchar(255) NOT NULL,
  `entity_id` char(14) NOT NULL,
  `created_at` bigint NOT NULL,
  `updated_at` bigint NOT NULL,
  `deleted_at` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_entity_id` (`entity_id`),
  KEY `idx_created_at` (`created_at`),
  KEY `idx_updated_at` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Current Database: `prod_pg_router`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `prod_pg_router` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `prod_pg_router`;

--
-- Table structure for table `event_outbox`
--

DROP TABLE IF EXISTS `event_outbox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_outbox` (
  `id` char(14) NOT NULL,
  `entity_id` char(14) NOT NULL,
  `entity_type` char(20) NOT NULL,
  `payload_name` varchar(100) NOT NULL,
  `payload` text,
  `is_deleted` int DEFAULT NULL,
  `deleted_at` bigint DEFAULT NULL,
  `created_at` bigint NOT NULL,
  `updated_at` bigint DEFAULT NULL,
  `retry_count` int DEFAULT '0',
  `priority` int DEFAULT NULL,
  PRIMARY KEY (`id`,`created_at`),
  KEY `event_outbox_entity_id_idx` (`entity_id`),
  KEY `event_outbox_payload_name_idx` (`payload_name`),
  KEY `idx_created_at` (`created_at`),
  KEY `idx_updated_at` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci
/*!50100 PARTITION BY RANGE (`created_at`)
(PARTITION p20250419 VALUES LESS THAN (1745107200000) ENGINE = InnoDB,
 PARTITION p20250420 VALUES LESS THAN (1745193600000) ENGINE = InnoDB,
 PARTITION p20250421 VALUES LESS THAN (1745280000000) ENGINE = InnoDB,
 PARTITION p20250422 VALUES LESS THAN (1745366400000) ENGINE = InnoDB,
 PARTITION p20250423 VALUES LESS THAN (1745452800000) ENGINE = InnoDB,
 PARTITION p20250424 VALUES LESS THAN (1745539200000) ENGINE = InnoDB,
 PARTITION p20250425 VALUES LESS THAN (1745625600000) ENGINE = InnoDB,
 PARTITION p20250426 VALUES LESS THAN (1745712000000) ENGINE = InnoDB,
 PARTITION p20250427 VALUES LESS THAN (1745798400000) ENGINE = InnoDB,
 PARTITION p20250428 VALUES LESS THAN (1745884800000) ENGINE = InnoDB,
 PARTITION p20250429 VALUES LESS THAN (1745971200000) ENGINE = InnoDB,
 PARTITION p20250430 VALUES LESS THAN (1746057600000) ENGINE = InnoDB,
 PARTITION future VALUES LESS THAN MAXVALUE ENGINE = InnoDB) */;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order_meta`
--

DROP TABLE IF EXISTS `order_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_meta` (
  `id` char(14) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `order_id` char(14) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `type` varchar(50) NOT NULL,
  `value` json DEFAULT NULL,
  `created_at` int NOT NULL,
  `updated_at` int NOT NULL,
  PRIMARY KEY (`id`,`created_at`),
  KEY `order_meta_created_at_index` (`created_at`),
  KEY `order_meta_order_id_index` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci
/*!50500 PARTITION BY RANGE  COLUMNS(created_at)
(PARTITION p202207 VALUES LESS THAN (1659312000) ENGINE = InnoDB,
 PARTITION p202208 VALUES LESS THAN (1661990400) ENGINE = InnoDB,
 PARTITION p202209 VALUES LESS THAN (1664582400) ENGINE = InnoDB,
 PARTITION p202210 VALUES LESS THAN (1667260800) ENGINE = InnoDB,
 PARTITION p202211 VALUES LESS THAN (1669852800) ENGINE = InnoDB,
 PARTITION p202212 VALUES LESS THAN (1672531200) ENGINE = InnoDB,
 PARTITION p202301 VALUES LESS THAN (1675209600) ENGINE = InnoDB,
 PARTITION p202302 VALUES LESS THAN (1677628800) ENGINE = InnoDB,
 PARTITION p202303 VALUES LESS THAN (1680307200) ENGINE = InnoDB,
 PARTITION p202304 VALUES LESS THAN (1682899200) ENGINE = InnoDB,
 PARTITION p202305 VALUES LESS THAN (1685577600) ENGINE = InnoDB,
 PARTITION p202306 VALUES LESS THAN (1688169600) ENGINE = InnoDB,
 PARTITION p202307 VALUES LESS THAN (1690848000) ENGINE = InnoDB,
 PARTITION p202308 VALUES LESS THAN (1693526400) ENGINE = InnoDB,
 PARTITION p202309 VALUES LESS THAN (1696118400) ENGINE = InnoDB,
 PARTITION p202310 VALUES LESS THAN (1698796800) ENGINE = InnoDB,
 PARTITION p202311 VALUES LESS THAN (1701388800) ENGINE = InnoDB,
 PARTITION p202312 VALUES LESS THAN (1704067200) ENGINE = InnoDB,
 PARTITION p202401 VALUES LESS THAN (1706745600) ENGINE = InnoDB,
 PARTITION p202402 VALUES LESS THAN (1709251200) ENGINE = InnoDB,
 PARTITION p202403 VALUES LESS THAN (1711929600) ENGINE = InnoDB,
 PARTITION p202404 VALUES LESS THAN (1714521600) ENGINE = InnoDB,
 PARTITION p202405 VALUES LESS THAN (1717200000) ENGINE = InnoDB,
 PARTITION p202406 VALUES LESS THAN (1719792000) ENGINE = InnoDB,
 PARTITION p202407 VALUES LESS THAN (1722470400) ENGINE = InnoDB,
 PARTITION p202408 VALUES LESS THAN (1725148800) ENGINE = InnoDB,
 PARTITION p202409 VALUES LESS THAN (1727740800) ENGINE = InnoDB,
 PARTITION p202410 VALUES LESS THAN (1730419200) ENGINE = InnoDB,
 PARTITION p202411 VALUES LESS THAN (1733011200) ENGINE = InnoDB,
 PARTITION p202412 VALUES LESS THAN (1735689600) ENGINE = InnoDB,
 PARTITION p202501 VALUES LESS THAN (1738368000) ENGINE = InnoDB,
 PARTITION p202502 VALUES LESS THAN (1740787200) ENGINE = InnoDB,
 PARTITION p202503 VALUES LESS THAN (1743465600) ENGINE = InnoDB,
 PARTITION p202504 VALUES LESS THAN (1746057600) ENGINE = InnoDB,
 PARTITION p202505 VALUES LESS THAN (1748736000) ENGINE = InnoDB,
 PARTITION p202506 VALUES LESS THAN (1751328000) ENGINE = InnoDB,
 PARTITION p202507 VALUES LESS THAN (1754006400) ENGINE = InnoDB,
 PARTITION p202508 VALUES LESS THAN (1756684800) ENGINE = InnoDB,
 PARTITION future VALUES LESS THAN (MAXVALUE) ENGINE = InnoDB) */;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order_relations`
--

DROP TABLE IF EXISTS `order_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_relations` (
  `id` char(28) NOT NULL,
  `order_id` char(14) NOT NULL,
  `entity_id` char(14) NOT NULL,
  `entity_type` enum('offer','transfer','notification','offer_applied') DEFAULT NULL,
  `created_at` bigint NOT NULL,
  PRIMARY KEY (`id`,`created_at`),
  KEY `order_id_index` (`order_id`),
  KEY `created_at_index` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci
/*!50100 PARTITION BY RANGE (`created_at`)
(PARTITION p202310 VALUES LESS THAN (1698796800) ENGINE = InnoDB,
 PARTITION p202311 VALUES LESS THAN (1701388800) ENGINE = InnoDB,
 PARTITION p202312 VALUES LESS THAN (1704067200) ENGINE = InnoDB,
 PARTITION p202401 VALUES LESS THAN (1706745600) ENGINE = InnoDB,
 PARTITION p202402 VALUES LESS THAN (1709251200) ENGINE = InnoDB,
 PARTITION p202403 VALUES LESS THAN (1711929600) ENGINE = InnoDB,
 PARTITION p202404 VALUES LESS THAN (1714521600) ENGINE = InnoDB,
 PARTITION p202405 VALUES LESS THAN (1717200000) ENGINE = InnoDB,
 PARTITION p202406 VALUES LESS THAN (1719792000) ENGINE = InnoDB,
 PARTITION p202407 VALUES LESS THAN (1722470400) ENGINE = InnoDB,
 PARTITION p202408 VALUES LESS THAN (1725148800) ENGINE = InnoDB,
 PARTITION p202409 VALUES LESS THAN (1727740800) ENGINE = InnoDB,
 PARTITION p202410 VALUES LESS THAN (1730419200) ENGINE = InnoDB,
 PARTITION p202411 VALUES LESS THAN (1733011200) ENGINE = InnoDB,
 PARTITION p202412 VALUES LESS THAN (1735689600) ENGINE = InnoDB,
 PARTITION p202501 VALUES LESS THAN (1738368000) ENGINE = InnoDB,
 PARTITION p202502 VALUES LESS THAN (1740787200) ENGINE = InnoDB,
 PARTITION p202503 VALUES LESS THAN (1743465600) ENGINE = InnoDB,
 PARTITION p202504 VALUES LESS THAN (1746057600) ENGINE = InnoDB,
 PARTITION p202505 VALUES LESS THAN (1748736000) ENGINE = InnoDB,
 PARTITION p202506 VALUES LESS THAN (1751328000) ENGINE = InnoDB,
 PARTITION p202507 VALUES LESS THAN (1754006400) ENGINE = InnoDB,
 PARTITION p202508 VALUES LESS THAN (1756684800) ENGINE = InnoDB,
 PARTITION future VALUES LESS THAN MAXVALUE ENGINE = InnoDB) */;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` char(14) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `merchant_id` char(14) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `partial_payment` tinyint(1) DEFAULT '0',
  `amount` bigint NOT NULL,
  `currency` char(3) NOT NULL,
  `first_payment_min_amount` bigint DEFAULT NULL,
  `status` varchar(10) NOT NULL,
  `receipt` varchar(40) DEFAULT NULL,
  `notes` json NOT NULL,
  `bank` varchar(10) DEFAULT NULL,
  `account_number` varchar(50) DEFAULT NULL,
  `customer_id` char(14) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `payer_name` varchar(255) DEFAULT NULL,
  `late_auth_config_id` char(14) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `checkout_config_id` char(14) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` int NOT NULL,
  `product_id` char(14) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `product_type` varchar(255) DEFAULT NULL,
  `order_attr` json DEFAULT NULL,
  `history` json DEFAULT NULL,
  `version` char(2) NOT NULL,
  `app_offer` tinyint(1) DEFAULT '0',
  `update_order_req` json DEFAULT NULL,
  `public_key` varchar(255) DEFAULT NULL,
  `provider_context` text,
  `bank_account_id` char(14) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`,`created_at`),
  KEY `orders_created_at_index` (`created_at`),
  KEY `orders_merchant_id_receipt_index` (`merchant_id`,`receipt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci
/*!50100 PARTITION BY RANGE (`created_at`)
(PARTITION p202111 VALUES LESS THAN (1638316800) ENGINE = InnoDB,
 PARTITION p202112 VALUES LESS THAN (1640995200) ENGINE = InnoDB,
 PARTITION p202201 VALUES LESS THAN (1643673600) ENGINE = InnoDB,
 PARTITION p202202 VALUES LESS THAN (1646092800) ENGINE = InnoDB,
 PARTITION p202203 VALUES LESS THAN (1648771200) ENGINE = InnoDB,
 PARTITION p202204 VALUES LESS THAN (1651363200) ENGINE = InnoDB,
 PARTITION p202205 VALUES LESS THAN (1654041600) ENGINE = InnoDB,
 PARTITION p202206 VALUES LESS THAN (1656633600) ENGINE = InnoDB,
 PARTITION p202207 VALUES LESS THAN (1659312000) ENGINE = InnoDB,
 PARTITION p202208 VALUES LESS THAN (1661990400) ENGINE = InnoDB,
 PARTITION p202209 VALUES LESS THAN (1664582400) ENGINE = InnoDB,
 PARTITION p202210 VALUES LESS THAN (1667260800) ENGINE = InnoDB,
 PARTITION p202211 VALUES LESS THAN (1669852800) ENGINE = InnoDB,
 PARTITION p202212 VALUES LESS THAN (1672531200) ENGINE = InnoDB,
 PARTITION p202301 VALUES LESS THAN (1675209600) ENGINE = InnoDB,
 PARTITION p202302 VALUES LESS THAN (1677628800) ENGINE = InnoDB,
 PARTITION p202303 VALUES LESS THAN (1680307200) ENGINE = InnoDB,
 PARTITION p202304 VALUES LESS THAN (1682899200) ENGINE = InnoDB,
 PARTITION p202305 VALUES LESS THAN (1685577600) ENGINE = InnoDB,
 PARTITION p202306 VALUES LESS THAN (1688169600) ENGINE = InnoDB,
 PARTITION p202307 VALUES LESS THAN (1690848000) ENGINE = InnoDB,
 PARTITION p202308 VALUES LESS THAN (1693526400) ENGINE = InnoDB,
 PARTITION p202309 VALUES LESS THAN (1696118400) ENGINE = InnoDB,
 PARTITION p202310 VALUES LESS THAN (1698796800) ENGINE = InnoDB,
 PARTITION p202311 VALUES LESS THAN (1701388800) ENGINE = InnoDB,
 PARTITION p202312 VALUES LESS THAN (1704067200) ENGINE = InnoDB,
 PARTITION p202401 VALUES LESS THAN (1706745600) ENGINE = InnoDB,
 PARTITION p202402 VALUES LESS THAN (1709251200) ENGINE = InnoDB,
 PARTITION p202403 VALUES LESS THAN (1711929600) ENGINE = InnoDB,
 PARTITION p202404 VALUES LESS THAN (1714521600) ENGINE = InnoDB,
 PARTITION p202405 VALUES LESS THAN (1717200000) ENGINE = InnoDB,
 PARTITION p202406 VALUES LESS THAN (1719792000) ENGINE = InnoDB,
 PARTITION p202407 VALUES LESS THAN (1722470400) ENGINE = InnoDB,
 PARTITION p202408 VALUES LESS THAN (1725148800) ENGINE = InnoDB,
 PARTITION p202409 VALUES LESS THAN (1727740800) ENGINE = InnoDB,
 PARTITION p202410 VALUES LESS THAN (1730419200) ENGINE = InnoDB,
 PARTITION p202411 VALUES LESS THAN (1733011200) ENGINE = InnoDB,
 PARTITION p202412 VALUES LESS THAN (1735689600) ENGINE = InnoDB,
 PARTITION p202501 VALUES LESS THAN (1738368000) ENGINE = InnoDB,
 PARTITION p202502 VALUES LESS THAN (1740787200) ENGINE = InnoDB,
 PARTITION p202503 VALUES LESS THAN (1743465600) ENGINE = InnoDB,
 PARTITION p202504 VALUES LESS THAN (1746057600) ENGINE = InnoDB,
 PARTITION p202505 VALUES LESS THAN (1748736000) ENGINE = InnoDB,
 PARTITION p202506 VALUES LESS THAN (1751328000) ENGINE = InnoDB,
 PARTITION p202507 VALUES LESS THAN (1754006400) ENGINE = InnoDB,
 PARTITION p202508 VALUES LESS THAN (1756684800) ENGINE = InnoDB,
 PARTITION future VALUES LESS THAN MAXVALUE ENGINE = InnoDB) */;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` char(14) NOT NULL,
  `order_id` char(14) NOT NULL,
  `product_type` varchar(255) NOT NULL,
  `product` json NOT NULL,
  `created_at` bigint NOT NULL,
  `updated_at` bigint NOT NULL,
  PRIMARY KEY (`id`,`created_at`),
  KEY `product_order_id_index` (`order_id`),
  KEY `idx_created_at` (`created_at`),
  KEY `idx_updated_at` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci
/*!50500 PARTITION BY RANGE  COLUMNS(created_at)
(PARTITION p202408 VALUES LESS THAN (1725148800) ENGINE = InnoDB,
 PARTITION p202409 VALUES LESS THAN (1727740800) ENGINE = InnoDB,
 PARTITION p202410 VALUES LESS THAN (1730419200) ENGINE = InnoDB,
 PARTITION p202411 VALUES LESS THAN (1733011200) ENGINE = InnoDB,
 PARTITION p202412 VALUES LESS THAN (1735689600) ENGINE = InnoDB,
 PARTITION p202501 VALUES LESS THAN (1738368000) ENGINE = InnoDB,
 PARTITION p202502 VALUES LESS THAN (1740787200) ENGINE = InnoDB,
 PARTITION p202503 VALUES LESS THAN (1743465600) ENGINE = InnoDB,
 PARTITION p202504 VALUES LESS THAN (1746057600) ENGINE = InnoDB,
 PARTITION p202505 VALUES LESS THAN (1748736000) ENGINE = InnoDB,
 PARTITION p202506 VALUES LESS THAN (1751328000) ENGINE = InnoDB,
 PARTITION p202507 VALUES LESS THAN (1754006400) ENGINE = InnoDB,
 PARTITION future VALUES LESS THAN (MAXVALUE) ENGINE = InnoDB) */;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Current Database: `rzp`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `rzp` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `rzp`;

--
-- Current Database: `sakila`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `sakila` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `sakila`;

--
-- Table structure for table `actor`
--

DROP TABLE IF EXISTS `actor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actor` (
  `actor_id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`actor_id`),
  KEY `idx_actor_last_name` (`last_name`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `actor_info`
--

DROP TABLE IF EXISTS `actor_info`;
/*!50001 DROP VIEW IF EXISTS `actor_info`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `actor_info` AS SELECT 
 1 AS `actor_id`,
 1 AS `first_name`,
 1 AS `last_name`,
 1 AS `film_info`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `address_id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `address` varchar(50) NOT NULL,
  `address2` varchar(50) DEFAULT NULL,
  `district` varchar(20) NOT NULL,
  `city_id` smallint unsigned NOT NULL,
  `postal_code` varchar(10) DEFAULT NULL,
  `phone` varchar(20) NOT NULL,
  `location` blob,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`address_id`),
  KEY `idx_fk_city_id` (`city_id`),
  CONSTRAINT `fk_address_city` FOREIGN KEY (`city_id`) REFERENCES `city` (`city_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=606 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `category_id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city` (
  `city_id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `city` varchar(50) NOT NULL,
  `country_id` smallint unsigned NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`city_id`),
  KEY `idx_fk_country_id` (`country_id`),
  CONSTRAINT `fk_city_country` FOREIGN KEY (`country_id`) REFERENCES `country` (`country_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=601 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country` (
  `country_id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `country` varchar(50) NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customer_id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `store_id` tinyint unsigned NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `address_id` smallint unsigned NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `create_date` datetime NOT NULL,
  `last_update` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`customer_id`),
  KEY `idx_fk_store_id` (`store_id`),
  KEY `idx_fk_address_id` (`address_id`),
  KEY `idx_last_name` (`last_name`),
  CONSTRAINT `fk_customer_address` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_customer_store` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=600 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`sakshi`@`localhost`*/ /*!50003 TRIGGER `customer_create_date` BEFORE INSERT ON `customer` FOR EACH ROW SET NEW.create_date = NOW() */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `customer_list`
--

DROP TABLE IF EXISTS `customer_list`;
/*!50001 DROP VIEW IF EXISTS `customer_list`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `customer_list` AS SELECT 
 1 AS `ID`,
 1 AS `name`,
 1 AS `address`,
 1 AS `zip code`,
 1 AS `phone`,
 1 AS `city`,
 1 AS `country`,
 1 AS `notes`,
 1 AS `SID`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `film`
--

DROP TABLE IF EXISTS `film`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `film` (
  `film_id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `description` text,
  `release_year` year DEFAULT NULL,
  `language_id` tinyint unsigned NOT NULL,
  `original_language_id` tinyint unsigned DEFAULT NULL,
  `rental_duration` tinyint unsigned NOT NULL DEFAULT '3',
  `rental_rate` decimal(4,2) NOT NULL DEFAULT '4.99',
  `length` smallint unsigned DEFAULT NULL,
  `replacement_cost` decimal(5,2) NOT NULL DEFAULT '19.99',
  `rating` enum('G','PG','PG-13','R','NC-17') DEFAULT 'G',
  `special_features` set('Trailers','Commentaries','Deleted Scenes','Behind the Scenes') DEFAULT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`film_id`),
  KEY `idx_title` (`title`),
  KEY `idx_fk_language_id` (`language_id`),
  KEY `idx_fk_original_language_id` (`original_language_id`),
  CONSTRAINT `fk_film_language` FOREIGN KEY (`language_id`) REFERENCES `language` (`language_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_film_language_original` FOREIGN KEY (`original_language_id`) REFERENCES `language` (`language_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`sakshi`@`localhost`*/ /*!50003 TRIGGER `ins_film` AFTER INSERT ON `film` FOR EACH ROW BEGIN
    INSERT INTO film_text (film_id, title, description)
        VALUES (new.film_id, new.title, new.description);
  END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`sakshi`@`localhost`*/ /*!50003 TRIGGER `upd_film` AFTER UPDATE ON `film` FOR EACH ROW BEGIN
    IF (old.title != new.title) OR (old.description != new.description) OR (old.film_id != new.film_id)
    THEN
        UPDATE film_text
            SET title=new.title,
                description=new.description,
                film_id=new.film_id
        WHERE film_id=old.film_id;
    END IF;
  END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`sakshi`@`localhost`*/ /*!50003 TRIGGER `del_film` AFTER DELETE ON `film` FOR EACH ROW BEGIN
    DELETE FROM film_text WHERE film_id = old.film_id;
  END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `film_actor`
--

DROP TABLE IF EXISTS `film_actor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `film_actor` (
  `actor_id` smallint unsigned NOT NULL,
  `film_id` smallint unsigned NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`actor_id`,`film_id`),
  KEY `idx_fk_film_id` (`film_id`),
  CONSTRAINT `fk_film_actor_actor` FOREIGN KEY (`actor_id`) REFERENCES `actor` (`actor_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_film_actor_film` FOREIGN KEY (`film_id`) REFERENCES `film` (`film_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `film_category`
--

DROP TABLE IF EXISTS `film_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `film_category` (
  `film_id` smallint unsigned NOT NULL,
  `category_id` tinyint unsigned NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`film_id`,`category_id`),
  KEY `fk_film_category_category` (`category_id`),
  CONSTRAINT `fk_film_category_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_film_category_film` FOREIGN KEY (`film_id`) REFERENCES `film` (`film_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `film_list`
--

DROP TABLE IF EXISTS `film_list`;
/*!50001 DROP VIEW IF EXISTS `film_list`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `film_list` AS SELECT 
 1 AS `FID`,
 1 AS `title`,
 1 AS `description`,
 1 AS `category`,
 1 AS `price`,
 1 AS `length`,
 1 AS `rating`,
 1 AS `actors`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `film_text`
--

DROP TABLE IF EXISTS `film_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `film_text` (
  `film_id` smallint unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text,
  PRIMARY KEY (`film_id`),
  FULLTEXT KEY `idx_title_description` (`title`,`description`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory` (
  `inventory_id` mediumint unsigned NOT NULL AUTO_INCREMENT,
  `film_id` smallint unsigned NOT NULL,
  `store_id` tinyint unsigned NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`inventory_id`),
  KEY `idx_fk_film_id` (`film_id`),
  KEY `idx_store_id_film_id` (`store_id`,`film_id`),
  CONSTRAINT `fk_inventory_film` FOREIGN KEY (`film_id`) REFERENCES `film` (`film_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_inventory_store` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4582 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `language`
--

DROP TABLE IF EXISTS `language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `language` (
  `language_id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `name` char(20) NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `nicer_but_slower_film_list`
--

DROP TABLE IF EXISTS `nicer_but_slower_film_list`;
/*!50001 DROP VIEW IF EXISTS `nicer_but_slower_film_list`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `nicer_but_slower_film_list` AS SELECT 
 1 AS `FID`,
 1 AS `title`,
 1 AS `description`,
 1 AS `category`,
 1 AS `price`,
 1 AS `length`,
 1 AS `rating`,
 1 AS `actors`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `payment_id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` smallint unsigned NOT NULL,
  `staff_id` tinyint unsigned NOT NULL,
  `rental_id` int DEFAULT NULL,
  `amount` decimal(5,2) NOT NULL,
  `payment_date` datetime NOT NULL,
  `last_update` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`payment_id`),
  KEY `idx_fk_staff_id` (`staff_id`),
  KEY `idx_fk_customer_id` (`customer_id`),
  KEY `fk_payment_rental` (`rental_id`),
  CONSTRAINT `fk_payment_customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_payment_rental` FOREIGN KEY (`rental_id`) REFERENCES `rental` (`rental_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_payment_staff` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16050 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`sakshi`@`localhost`*/ /*!50003 TRIGGER `payment_date` BEFORE INSERT ON `payment` FOR EACH ROW SET NEW.payment_date = NOW() */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `rental`
--

DROP TABLE IF EXISTS `rental`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rental` (
  `rental_id` int NOT NULL AUTO_INCREMENT,
  `rental_date` datetime NOT NULL,
  `inventory_id` mediumint unsigned NOT NULL,
  `customer_id` smallint unsigned NOT NULL,
  `return_date` datetime DEFAULT NULL,
  `staff_id` tinyint unsigned NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`rental_id`),
  UNIQUE KEY `rental_date` (`rental_date`,`inventory_id`,`customer_id`),
  KEY `idx_fk_inventory_id` (`inventory_id`),
  KEY `idx_fk_customer_id` (`customer_id`),
  KEY `idx_fk_staff_id` (`staff_id`),
  CONSTRAINT `fk_rental_customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_rental_inventory` FOREIGN KEY (`inventory_id`) REFERENCES `inventory` (`inventory_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_rental_staff` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16050 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`sakshi`@`localhost`*/ /*!50003 TRIGGER `rental_date` BEFORE INSERT ON `rental` FOR EACH ROW SET NEW.rental_date = NOW() */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `sales_by_film_category`
--

DROP TABLE IF EXISTS `sales_by_film_category`;
/*!50001 DROP VIEW IF EXISTS `sales_by_film_category`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `sales_by_film_category` AS SELECT 
 1 AS `category`,
 1 AS `total_sales`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `sales_by_store`
--

DROP TABLE IF EXISTS `sales_by_store`;
/*!50001 DROP VIEW IF EXISTS `sales_by_store`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `sales_by_store` AS SELECT 
 1 AS `store`,
 1 AS `manager`,
 1 AS `total_sales`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `staff_id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `address_id` smallint unsigned NOT NULL,
  `picture` blob,
  `email` varchar(50) DEFAULT NULL,
  `store_id` tinyint unsigned NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `username` varchar(16) NOT NULL,
  `password` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`staff_id`),
  KEY `idx_fk_store_id` (`store_id`),
  KEY `idx_fk_address_id` (`address_id`),
  CONSTRAINT `fk_staff_address` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_staff_store` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `staff_list`
--

DROP TABLE IF EXISTS `staff_list`;
/*!50001 DROP VIEW IF EXISTS `staff_list`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `staff_list` AS SELECT 
 1 AS `ID`,
 1 AS `name`,
 1 AS `address`,
 1 AS `zip code`,
 1 AS `phone`,
 1 AS `city`,
 1 AS `country`,
 1 AS `SID`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `store`
--

DROP TABLE IF EXISTS `store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store` (
  `store_id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `manager_staff_id` tinyint unsigned NOT NULL,
  `address_id` smallint unsigned NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`store_id`),
  UNIQUE KEY `idx_unique_manager` (`manager_staff_id`),
  KEY `idx_fk_address_id` (`address_id`),
  CONSTRAINT `fk_store_address` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_store_staff` FOREIGN KEY (`manager_staff_id`) REFERENCES `staff` (`staff_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Current Database: `sms`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `sms` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `sms`;

--
-- Current Database: `sud`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `sud` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `sud`;

--
-- Current Database: `syntax_checker`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `syntax_checker` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `syntax_checker`;

--
-- Table structure for table `syntax_checker`
--

DROP TABLE IF EXISTS `syntax_checker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `syntax_checker` (
  `syntax_checker` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Current Database: `test_db`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `test_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `test_db`;

--
-- Table structure for table `v1_test_db`
--

DROP TABLE IF EXISTS `v1_test_db`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `v1_test_db` (
  `id` char(14) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Current Database: `TIDB`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `TIDB` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `TIDB`;

--
-- Table structure for table `multiple_create_test_3april`
--

DROP TABLE IF EXISTS `multiple_create_test_3april`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `multiple_create_test_3april` (
  `id` char(14) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `age` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Current Database: `tmp`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `tmp` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `tmp`;

--
-- Current Database: `vajra_demo`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `vajra_demo` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `vajra_demo`;

--
-- Current Database: `vendor_payments`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `vendor_payments` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `vendor_payments`;

--
-- Current Database: `vendor_payments_test`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `vendor_payments_test` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `vendor_payments_test`;

--
-- Current Database: `wallet_live`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `wallet_live` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `wallet_live`;

--
-- Current Database: `wallet_test`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `wallet_test` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `wallet_test`;

--
-- Current Database: `api`
--

USE `api`;

--
-- Current Database: `api-test`
--

USE `api-test`;

--
-- Current Database: `api_views`
--

USE `api_views`;

--
-- Current Database: `Chinook`
--

USE `Chinook`;

--
-- Current Database: `DEMO`
--

USE `DEMO`;

--
-- Current Database: `demo_db`
--

USE `demo_db`;

--
-- Current Database: `env3_ezetap`
--

USE `env3_ezetap`;

--
-- Current Database: `gandalf`
--

USE `gandalf`;

--
-- Current Database: `heartbeat`
--

USE `heartbeat`;

--
-- Current Database: `innodb`
--

USE `innodb`;

--
-- Current Database: `mysqldb_monitoring`
--

USE `mysqldb_monitoring`;

--
-- Current Database: `pg_db_one`
--

USE `pg_db_one`;

--
-- Current Database: `prod_cross_border_import_live`
--

USE `prod_cross_border_import_live`;

--
-- Current Database: `prod_pg_router`
--

USE `prod_pg_router`;

--
-- Current Database: `rzp`
--

USE `rzp`;

--
-- Current Database: `sakila`
--

USE `sakila`;

--
-- Final view structure for view `actor_info`
--

/*!50001 DROP VIEW IF EXISTS `actor_info`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`sakshi`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `actor_info` AS select `a`.`actor_id` AS `actor_id`,`a`.`first_name` AS `first_name`,`a`.`last_name` AS `last_name`,group_concat(distinct concat(`c`.`name`,': ',(select group_concat(`f`.`title` order by `f`.`title` ASC separator ', ') from ((`film` `f` join `film_category` `fc` on((`f`.`film_id` = `fc`.`film_id`))) join `film_actor` `fa` on((`f`.`film_id` = `fa`.`film_id`))) where ((`fc`.`category_id` = `c`.`category_id`) and (`fa`.`actor_id` = `a`.`actor_id`)))) order by `c`.`name` ASC separator '; ') AS `film_info` from (((`actor` `a` left join `film_actor` `fa` on((`a`.`actor_id` = `fa`.`actor_id`))) left join `film_category` `fc` on((`fa`.`film_id` = `fc`.`film_id`))) left join `category` `c` on((`fc`.`category_id` = `c`.`category_id`))) group by `a`.`actor_id`,`a`.`first_name`,`a`.`last_name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `customer_list`
--

/*!50001 DROP VIEW IF EXISTS `customer_list`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`sakshi`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `customer_list` AS select `cu`.`customer_id` AS `ID`,concat(`cu`.`first_name`,_utf8mb4' ',`cu`.`last_name`) AS `name`,`a`.`address` AS `address`,`a`.`postal_code` AS `zip code`,`a`.`phone` AS `phone`,`city`.`city` AS `city`,`country`.`country` AS `country`,if(`cu`.`active`,_utf8mb4'active',_utf8mb4'') AS `notes`,`cu`.`store_id` AS `SID` from (((`customer` `cu` join `address` `a` on((`cu`.`address_id` = `a`.`address_id`))) join `city` on((`a`.`city_id` = `city`.`city_id`))) join `country` on((`city`.`country_id` = `country`.`country_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `film_list`
--

/*!50001 DROP VIEW IF EXISTS `film_list`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`sakshi`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `film_list` AS select `film`.`film_id` AS `FID`,`film`.`title` AS `title`,`film`.`description` AS `description`,`category`.`name` AS `category`,`film`.`rental_rate` AS `price`,`film`.`length` AS `length`,`film`.`rating` AS `rating`,group_concat(concat(`actor`.`first_name`,_utf8mb4' ',`actor`.`last_name`) separator ', ') AS `actors` from ((((`film` left join `film_category` on((`film_category`.`film_id` = `film`.`film_id`))) left join `category` on((`category`.`category_id` = `film_category`.`category_id`))) left join `film_actor` on((`film`.`film_id` = `film_actor`.`film_id`))) left join `actor` on((`film_actor`.`actor_id` = `actor`.`actor_id`))) group by `film`.`film_id`,`category`.`name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `nicer_but_slower_film_list`
--

/*!50001 DROP VIEW IF EXISTS `nicer_but_slower_film_list`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`sakshi`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `nicer_but_slower_film_list` AS select `film`.`film_id` AS `FID`,`film`.`title` AS `title`,`film`.`description` AS `description`,`category`.`name` AS `category`,`film`.`rental_rate` AS `price`,`film`.`length` AS `length`,`film`.`rating` AS `rating`,group_concat(concat(concat(upper(substr(`actor`.`first_name`,1,1)),lower(substr(`actor`.`first_name`,2,length(`actor`.`first_name`))),_utf8mb4' ',concat(upper(substr(`actor`.`last_name`,1,1)),lower(substr(`actor`.`last_name`,2,length(`actor`.`last_name`)))))) separator ', ') AS `actors` from ((((`film` left join `film_category` on((`film_category`.`film_id` = `film`.`film_id`))) left join `category` on((`category`.`category_id` = `film_category`.`category_id`))) left join `film_actor` on((`film`.`film_id` = `film_actor`.`film_id`))) left join `actor` on((`film_actor`.`actor_id` = `actor`.`actor_id`))) group by `film`.`film_id`,`category`.`name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `sales_by_film_category`
--

/*!50001 DROP VIEW IF EXISTS `sales_by_film_category`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`sakshi`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `sales_by_film_category` AS select `c`.`name` AS `category`,sum(`p`.`amount`) AS `total_sales` from (((((`payment` `p` join `rental` `r` on((`p`.`rental_id` = `r`.`rental_id`))) join `inventory` `i` on((`r`.`inventory_id` = `i`.`inventory_id`))) join `film` `f` on((`i`.`film_id` = `f`.`film_id`))) join `film_category` `fc` on((`f`.`film_id` = `fc`.`film_id`))) join `category` `c` on((`fc`.`category_id` = `c`.`category_id`))) group by `c`.`name` order by `total_sales` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `sales_by_store`
--

/*!50001 DROP VIEW IF EXISTS `sales_by_store`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`sakshi`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `sales_by_store` AS select concat(`c`.`city`,_utf8mb4',',`cy`.`country`) AS `store`,concat(`m`.`first_name`,_utf8mb4' ',`m`.`last_name`) AS `manager`,sum(`p`.`amount`) AS `total_sales` from (((((((`payment` `p` join `rental` `r` on((`p`.`rental_id` = `r`.`rental_id`))) join `inventory` `i` on((`r`.`inventory_id` = `i`.`inventory_id`))) join `store` `s` on((`i`.`store_id` = `s`.`store_id`))) join `address` `a` on((`s`.`address_id` = `a`.`address_id`))) join `city` `c` on((`a`.`city_id` = `c`.`city_id`))) join `country` `cy` on((`c`.`country_id` = `cy`.`country_id`))) join `staff` `m` on((`s`.`manager_staff_id` = `m`.`staff_id`))) group by `s`.`store_id` order by `cy`.`country`,`c`.`city` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `staff_list`
--

/*!50001 DROP VIEW IF EXISTS `staff_list`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`sakshi`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `staff_list` AS select `s`.`staff_id` AS `ID`,concat(`s`.`first_name`,_utf8mb4' ',`s`.`last_name`) AS `name`,`a`.`address` AS `address`,`a`.`postal_code` AS `zip code`,`a`.`phone` AS `phone`,`city`.`city` AS `city`,`country`.`country` AS `country`,`s`.`store_id` AS `SID` from (((`staff` `s` join `address` `a` on((`s`.`address_id` = `a`.`address_id`))) join `city` on((`a`.`city_id` = `city`.`city_id`))) join `country` on((`city`.`country_id` = `country`.`country_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Current Database: `sms`
--

USE `sms`;

--
-- Current Database: `sud`
--

USE `sud`;

--
-- Current Database: `syntax_checker`
--

USE `syntax_checker`;

--
-- Current Database: `test_db`
--

USE `test_db`;

--
-- Current Database: `TIDB`
--

USE `TIDB`;

--
-- Current Database: `tmp`
--

USE `tmp`;

--
-- Current Database: `vajra_demo`
--

USE `vajra_demo`;

--
-- Current Database: `vendor_payments`
--

USE `vendor_payments`;

--
-- Current Database: `vendor_payments_test`
--

USE `vendor_payments_test`;

--
-- Current Database: `wallet_live`
--

USE `wallet_live`;

--
-- Current Database: `wallet_test`
--

USE `wallet_test`;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-21 17:17:53
