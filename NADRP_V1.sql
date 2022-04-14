-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.22-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for denalifwstd
CREATE DATABASE IF NOT EXISTS `denalifwstd` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `denalifwstd`;

-- Dumping structure for table denalifwstd.af_composts
CREATE TABLE IF NOT EXISTS `af_composts` (
  `farmId` int(11) DEFAULT NULL,
  `compostStrid` varchar(128) DEFAULT NULL,
  `shitAmount` int(11) DEFAULT NULL,
  KEY `farmId` (`farmId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denalifwstd.af_composts: ~0 rows (approximately)
/*!40000 ALTER TABLE `af_composts` DISABLE KEYS */;
/*!40000 ALTER TABLE `af_composts` ENABLE KEYS */;

-- Dumping structure for table denalifwstd.af_farms_base
CREATE TABLE IF NOT EXISTS `af_farms_base` (
  `farmId` int(11) NOT NULL AUTO_INCREMENT,
  `ownerIdentifier` varchar(255) DEFAULT NULL,
  `ownerName` varchar(255) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `x` int(11) DEFAULT NULL,
  `y` int(11) DEFAULT NULL,
  `z` int(11) DEFAULT NULL,
  `img` text DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `locked` tinyint(4) DEFAULT NULL,
  `milk` int(11) DEFAULT 0,
  `egg` int(11) DEFAULT 0,
  `meal` int(11) DEFAULT 0,
  KEY `id` (`farmId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denalifwstd.af_farms_base: ~0 rows (approximately)
/*!40000 ALTER TABLE `af_farms_base` DISABLE KEYS */;
/*!40000 ALTER TABLE `af_farms_base` ENABLE KEYS */;

-- Dumping structure for table denalifwstd.af_paddock_animals
CREATE TABLE IF NOT EXISTS `af_paddock_animals` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `farmId` int(11) NOT NULL,
  `paddockStrid` varchar(128) CHARACTER SET utf8mb4 NOT NULL,
  `hunger` int(11) DEFAULT NULL,
  `age` double DEFAULT NULL,
  `thirst` int(11) DEFAULT NULL,
  `animalType` varchar(128) CHARACTER SET utf8mb4 DEFAULT NULL,
  `milk` int(11) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `health` int(11) DEFAULT NULL,
  `extra` double DEFAULT NULL,
  PRIMARY KEY (`aid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denalifwstd.af_paddock_animals: ~0 rows (approximately)
/*!40000 ALTER TABLE `af_paddock_animals` DISABLE KEYS */;
/*!40000 ALTER TABLE `af_paddock_animals` ENABLE KEYS */;

-- Dumping structure for table denalifwstd.af_paddock_upgrades
CREATE TABLE IF NOT EXISTS `af_paddock_upgrades` (
  `farmId` int(11) DEFAULT NULL,
  `paddockStrid` varchar(128) CHARACTER SET utf8mb4 DEFAULT NULL,
  `upgradeStrid` varchar(128) CHARACTER SET utf8mb4 DEFAULT NULL,
  `foodAmount` int(11) DEFAULT NULL,
  `waterAmount` int(11) DEFAULT NULL,
  KEY `farmId` (`farmId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denalifwstd.af_paddock_upgrades: ~0 rows (approximately)
/*!40000 ALTER TABLE `af_paddock_upgrades` DISABLE KEYS */;
/*!40000 ALTER TABLE `af_paddock_upgrades` ENABLE KEYS */;

-- Dumping structure for table denalifwstd.allowlist
CREATE TABLE IF NOT EXISTS `allowlist` (
  `userID` int(11) NOT NULL,
  UNIQUE KEY `userID` (`userID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table denalifwstd.allowlist: 0 rows
/*!40000 ALTER TABLE `allowlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `allowlist` ENABLE KEYS */;

-- Dumping structure for table denalifwstd.apartments
CREATE TABLE IF NOT EXISTS `apartments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `citizenid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- Dumping data for table denalifwstd.apartments: ~3 rows (approximately)
/*!40000 ALTER TABLE `apartments` DISABLE KEYS */;
INSERT INTO `apartments` (`id`, `name`, `type`, `label`, `citizenid`) VALUES
	(7, 'apartment39905', 'apartment3', 'Integrity Way 9905', 'SFN33075'),
	(8, 'apartment36182', 'apartment3', 'Integrity Way 6182', 'XHJ13673'),
	(9, 'apartment34188', 'apartment3', 'Integrity Way', 'XGU69179');
/*!40000 ALTER TABLE `apartments` ENABLE KEYS */;

-- Dumping structure for table denalifwstd.arrestreports
CREATE TABLE IF NOT EXISTS `arrestreports` (
  `caseID` varchar(75) COLLATE utf8_bin NOT NULL,
  `userID` int(11) NOT NULL,
  `defendantName` varchar(75) COLLATE utf8_bin NOT NULL,
  `city` varchar(75) COLLATE utf8_bin NOT NULL,
  `street` varchar(75) COLLATE utf8_bin NOT NULL,
  `zip` varchar(75) COLLATE utf8_bin NOT NULL,
  `arrestingOfficer` varchar(75) COLLATE utf8_bin NOT NULL,
  `date` varchar(10) COLLATE utf8_bin NOT NULL COMMENT 'Format DD/MM/YYYY',
  `time` varchar(5) COLLATE utf8_bin NOT NULL COMMENT 'Format HH:MM',
  `factsOfArrest` text COLLATE utf8_bin NOT NULL,
  `signature` text COLLATE utf8_bin NOT NULL COMMENT 'Encoded JSON String',
  `charges` text COLLATE utf8_bin NOT NULL COMMENT 'JSON Array String',
  UNIQUE KEY `caseID` (`caseID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table denalifwstd.arrestreports: 0 rows
/*!40000 ALTER TABLE `arrestreports` DISABLE KEYS */;
/*!40000 ALTER TABLE `arrestreports` ENABLE KEYS */;

-- Dumping structure for table denalifwstd.bank_accounts
CREATE TABLE IF NOT EXISTS `bank_accounts` (
  `record_id` bigint(255) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(250) DEFAULT NULL,
  `business` varchar(50) DEFAULT NULL,
  `businessid` int(11) DEFAULT NULL,
  `gangid` varchar(50) DEFAULT NULL,
  `amount` bigint(255) NOT NULL DEFAULT 0,
  `account_type` enum('Current','Savings','Business','Gang') NOT NULL DEFAULT 'Current',
  PRIMARY KEY (`record_id`),
  UNIQUE KEY `citizenid` (`citizenid`),
  KEY `business` (`business`),
  KEY `businessid` (`businessid`),
  KEY `gangid` (`gangid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denalifwstd.bank_accounts: ~0 rows (approximately)
/*!40000 ALTER TABLE `bank_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `bank_accounts` ENABLE KEYS */;

-- Dumping structure for table denalifwstd.bank_statements
CREATE TABLE IF NOT EXISTS `bank_statements` (
  `record_id` bigint(255) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `account` varchar(50) DEFAULT NULL,
  `business` varchar(50) DEFAULT NULL,
  `businessid` int(11) DEFAULT NULL,
  `gangid` varchar(50) DEFAULT NULL,
  `deposited` int(11) DEFAULT NULL,
  `withdraw` int(11) DEFAULT NULL,
  `balance` int(11) DEFAULT NULL,
  `date` varchar(50) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `business` (`business`),
  KEY `businessid` (`businessid`),
  KEY `gangid` (`gangid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denalifwstd.bank_statements: ~0 rows (approximately)
/*!40000 ALTER TABLE `bank_statements` DISABLE KEYS */;
/*!40000 ALTER TABLE `bank_statements` ENABLE KEYS */;

-- Dumping structure for table denalifwstd.bans
CREATE TABLE IF NOT EXISTS `bans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `license` varchar(50) DEFAULT NULL,
  `discord` varchar(50) DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `expire` int(11) DEFAULT NULL,
  `bannedby` varchar(255) NOT NULL DEFAULT 'LeBanhammer',
  PRIMARY KEY (`id`),
  KEY `license` (`license`),
  KEY `discord` (`discord`),
  KEY `ip` (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denalifwstd.bans: ~0 rows (approximately)
/*!40000 ALTER TABLE `bans` DISABLE KEYS */;
/*!40000 ALTER TABLE `bans` ENABLE KEYS */;

-- Dumping structure for table denalifwstd.crypto
CREATE TABLE IF NOT EXISTS `crypto` (
  `crypto` varchar(50) NOT NULL DEFAULT 'qbit',
  `worth` int(11) NOT NULL DEFAULT 0,
  `history` text DEFAULT NULL,
  PRIMARY KEY (`crypto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denalifwstd.crypto: ~0 rows (approximately)
/*!40000 ALTER TABLE `crypto` DISABLE KEYS */;
INSERT INTO `crypto` (`crypto`, `worth`, `history`) VALUES
	('qbit', 3, '[{"NewWorth":3,"PreviousWorth":5},{"NewWorth":5,"PreviousWorth":1},{"NewWorth":1,"PreviousWorth":5},{"NewWorth":5,"PreviousWorth":1}]');
/*!40000 ALTER TABLE `crypto` ENABLE KEYS */;

-- Dumping structure for table denalifwstd.crypto_transactions
CREATE TABLE IF NOT EXISTS `crypto_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `message` varchar(50) DEFAULT NULL,
  `date` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denalifwstd.crypto_transactions: ~0 rows (approximately)
/*!40000 ALTER TABLE `crypto_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `crypto_transactions` ENABLE KEYS */;

-- Dumping structure for table denalifwstd.dealers
CREATE TABLE IF NOT EXISTS `dealers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '0',
  `coords` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `time` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `createdby` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denalifwstd.dealers: ~0 rows (approximately)
/*!40000 ALTER TABLE `dealers` DISABLE KEYS */;
/*!40000 ALTER TABLE `dealers` ENABLE KEYS */;

-- Dumping structure for table denalifwstd.defaultreports
CREATE TABLE IF NOT EXISTS `defaultreports` (
  `caseID` varchar(75) COLLATE utf8_bin NOT NULL,
  `callName` text COLLATE utf8_bin DEFAULT NULL,
  `userID` int(11) DEFAULT NULL,
  `officer` varchar(75) COLLATE utf8_bin DEFAULT NULL,
  `location` varchar(75) COLLATE utf8_bin DEFAULT NULL,
  `date` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT 'Fromat - DD/MM/YYYY',
  `time` varchar(5) COLLATE utf8_bin DEFAULT NULL COMMENT 'Format - HH:MM',
  `involved` text COLLATE utf8_bin DEFAULT NULL COMMENT 'JSON Array String',
  `suspects` text COLLATE utf8_bin DEFAULT NULL COMMENT 'JSON Array String',
  `victims` text COLLATE utf8_bin DEFAULT NULL COMMENT 'JSON Array String',
  `report` text COLLATE utf8_bin DEFAULT NULL,
  `signature` text COLLATE utf8_bin DEFAULT NULL COMMENT 'Encoded JSON String',
  UNIQUE KEY `caseID` (`caseID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table denalifwstd.defaultreports: 0 rows
/*!40000 ALTER TABLE `defaultreports` DISABLE KEYS */;
/*!40000 ALTER TABLE `defaultreports` ENABLE KEYS */;

-- Dumping structure for table denalifwstd.departments
CREATE TABLE IF NOT EXISTS `departments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(75) COLLATE utf8_bin NOT NULL,
  `shortname` varchar(10) COLLATE utf8_bin NOT NULL,
  `icon` text COLLATE utf8_bin NOT NULL,
  `background` text COLLATE utf8_bin NOT NULL,
  `wallpaper` text COLLATE utf8_bin NOT NULL,
  `requiresApplication` tinyint(1) NOT NULL DEFAULT 0,
  `hiring` tinyint(1) NOT NULL DEFAULT 0,
  `maxMembers` int(11) unsigned NOT NULL DEFAULT 1,
  `callsignFormat` varchar(10) COLLATE utf8_bin NOT NULL DEFAULT '',
  `radius` float NOT NULL DEFAULT 0,
  `posX` float NOT NULL DEFAULT 0,
  `posY` float NOT NULL DEFAULT 0,
  `posZ` float NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table denalifwstd.departments: 0 rows
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;

-- Dumping structure for table denalifwstd.department_members
CREATE TABLE IF NOT EXISTS `department_members` (
  `userID` int(11) NOT NULL,
  `rankID` int(11) NOT NULL,
  `departmentID` int(11) NOT NULL,
  `accepted` tinyint(1) NOT NULL,
  `callsign` varchar(10) COLLATE utf8_bin NOT NULL DEFAULT '',
  UNIQUE KEY `userID` (`userID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table denalifwstd.department_members: 0 rows
/*!40000 ALTER TABLE `department_members` DISABLE KEYS */;
/*!40000 ALTER TABLE `department_members` ENABLE KEYS */;

-- Dumping structure for table denalifwstd.gloveboxitems
CREATE TABLE IF NOT EXISTS `gloveboxitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(255) NOT NULL DEFAULT '[]',
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`plate`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denalifwstd.gloveboxitems: ~0 rows (approximately)
/*!40000 ALTER TABLE `gloveboxitems` DISABLE KEYS */;
/*!40000 ALTER TABLE `gloveboxitems` ENABLE KEYS */;

-- Dumping structure for table denalifwstd.houselocations
CREATE TABLE IF NOT EXISTS `houselocations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `coords` text DEFAULT NULL,
  `owned` tinyint(1) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `tier` tinyint(4) DEFAULT NULL,
  `garage` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table denalifwstd.houselocations: ~0 rows (approximately)
/*!40000 ALTER TABLE `houselocations` DISABLE KEYS */;
INSERT INTO `houselocations` (`id`, `name`, `label`, `coords`, `owned`, `price`, `tier`, `garage`) VALUES
	(1, 'olympic fwy1', 'Olympic Fwy 1', '{"enter":{"y":-1213.06396484375,"z":28.66036415100097,"x":-53.81039047241211,"h":323.3861083984375},"cam":{"y":-1213.06396484375,"z":28.66036415100097,"x":-53.81039047241211,"h":323.3861083984375,"yaw":-10.0}}', 1, 1, 1, NULL);
/*!40000 ALTER TABLE `houselocations` ENABLE KEYS */;

-- Dumping structure for table denalifwstd.house_plants
CREATE TABLE IF NOT EXISTS `house_plants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `building` varchar(50) DEFAULT NULL,
  `stage` varchar(50) DEFAULT 'stage-a',
  `sort` varchar(50) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `food` int(11) DEFAULT 100,
  `health` int(11) DEFAULT 100,
  `progress` int(11) DEFAULT 0,
  `coords` text DEFAULT NULL,
  `plantid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `building` (`building`),
  KEY `plantid` (`plantid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denalifwstd.house_plants: ~0 rows (approximately)
/*!40000 ALTER TABLE `house_plants` DISABLE KEYS */;
/*!40000 ALTER TABLE `house_plants` ENABLE KEYS */;

-- Dumping structure for table denalifwstd.lapraces
CREATE TABLE IF NOT EXISTS `lapraces` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `checkpoints` text DEFAULT NULL,
  `records` text DEFAULT NULL,
  `creator` varchar(50) DEFAULT NULL,
  `distance` int(11) DEFAULT NULL,
  `raceid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `raceid` (`raceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denalifwstd.lapraces: ~0 rows (approximately)
/*!40000 ALTER TABLE `lapraces` DISABLE KEYS */;
/*!40000 ALTER TABLE `lapraces` ENABLE KEYS */;

-- Dumping structure for table denalifwstd.mdw_announcements
CREATE TABLE IF NOT EXISTS `mdw_announcements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `announcement` longtext NOT NULL,
  `date` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table denalifwstd.mdw_announcements: ~0 rows (approximately)
/*!40000 ALTER TABLE `mdw_announcements` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdw_announcements` ENABLE KEYS */;

-- Dumping structure for table denalifwstd.mdw_evidence
CREATE TABLE IF NOT EXISTS `mdw_evidence` (
  `id` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `description` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table denalifwstd.mdw_evidence: ~0 rows (approximately)
/*!40000 ALTER TABLE `mdw_evidence` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdw_evidence` ENABLE KEYS */;

-- Dumping structure for table denalifwstd.mdw_incidents
CREATE TABLE IF NOT EXISTS `mdw_incidents` (
  `id` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `location` varchar(100) NOT NULL,
  `time` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `data` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table denalifwstd.mdw_incidents: ~0 rows (approximately)
/*!40000 ALTER TABLE `mdw_incidents` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdw_incidents` ENABLE KEYS */;

-- Dumping structure for table denalifwstd.mdw_reports
CREATE TABLE IF NOT EXISTS `mdw_reports` (
  `id` varchar(100) NOT NULL,
  `incident` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `ongoing` tinyint(1) NOT NULL,
  `expire` varchar(100) NOT NULL,
  `created` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table denalifwstd.mdw_reports: ~0 rows (approximately)
/*!40000 ALTER TABLE `mdw_reports` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdw_reports` ENABLE KEYS */;

-- Dumping structure for table denalifwstd.messages
CREATE TABLE IF NOT EXISTS `messages` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `receiverID` int(11) NOT NULL,
  `senderID` int(11) NOT NULL,
  `timestamp` int(11) DEFAULT NULL,
  `message` text COLLATE utf8_bin DEFAULT NULL,
  `isRead` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table denalifwstd.messages: 0 rows
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;

-- Dumping structure for table denalifwstd.occasion_vehicles
CREATE TABLE IF NOT EXISTS `occasion_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seller` varchar(50) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `plate` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `mods` text DEFAULT NULL,
  `occasionid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `occasionId` (`occasionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denalifwstd.occasion_vehicles: ~0 rows (approximately)
/*!40000 ALTER TABLE `occasion_vehicles` DISABLE KEYS */;
/*!40000 ALTER TABLE `occasion_vehicles` ENABLE KEYS */;

-- Dumping structure for table denalifwstd.pedcitations
CREATE TABLE IF NOT EXISTS `pedcitations` (
  `citationID` varchar(15) COLLATE utf8_bin NOT NULL,
  `userID` int(11) NOT NULL,
  `name` varchar(150) COLLATE utf8_bin NOT NULL,
  `address` varchar(150) COLLATE utf8_bin DEFAULT NULL,
  `date` varchar(10) COLLATE utf8_bin NOT NULL COMMENT 'dd/mm/yyyy',
  `time` varchar(5) COLLATE utf8_bin NOT NULL COMMENT 'hh:mm',
  `reason` text COLLATE utf8_bin NOT NULL COMMENT 'JSON Array String',
  `location` varchar(75) COLLATE utf8_bin NOT NULL,
  `amount` double NOT NULL,
  `timestamp` int(11) NOT NULL DEFAULT 0 COMMENT 'Record Timestamp',
  UNIQUE KEY `citationID` (`citationID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table denalifwstd.pedcitations: 0 rows
/*!40000 ALTER TABLE `pedcitations` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedcitations` ENABLE KEYS */;

-- Dumping structure for table denalifwstd.permissions
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `license` varchar(255) NOT NULL,
  `permission` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `license` (`license`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table denalifwstd.permissions: ~3 rows (approximately)
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` (`id`, `name`, `license`, `permission`) VALUES
	(1, 'Tate', 'license:fbcbeb01650b145c086c994c9f9b7b24e131d463', 'god'),
	(2, 'Tito', 'license:dce41c2c0c58ef942a0cc6e69fec7e20118e39be', 'god'),
	(3, 'KINGCOBRA', 'license:d8a602db3d88a5a0b94c6f6a4f890a6875951200', 'god');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;

-- Dumping structure for table denalifwstd.phone_gallery
CREATE TABLE IF NOT EXISTS `phone_gallery` (
  `citizenid` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `date` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table denalifwstd.phone_gallery: ~0 rows (approximately)
/*!40000 ALTER TABLE `phone_gallery` DISABLE KEYS */;
/*!40000 ALTER TABLE `phone_gallery` ENABLE KEYS */;

-- Dumping structure for table denalifwstd.phone_invoices
CREATE TABLE IF NOT EXISTS `phone_invoices` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `amount` int(11) NOT NULL DEFAULT 0,
  `society` tinytext DEFAULT NULL,
  `sender` varchar(50) DEFAULT NULL,
  `sendercitizenid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denalifwstd.phone_invoices: ~0 rows (approximately)
/*!40000 ALTER TABLE `phone_invoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `phone_invoices` ENABLE KEYS */;

-- Dumping structure for table denalifwstd.phone_messages
CREATE TABLE IF NOT EXISTS `phone_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `number` varchar(50) DEFAULT NULL,
  `messages` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `number` (`number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denalifwstd.phone_messages: ~0 rows (approximately)
/*!40000 ALTER TABLE `phone_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `phone_messages` ENABLE KEYS */;

-- Dumping structure for table denalifwstd.phone_tweets
CREATE TABLE IF NOT EXISTS `phone_tweets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `firstName` varchar(25) DEFAULT NULL,
  `lastName` varchar(25) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `date` datetime DEFAULT current_timestamp(),
  `url` text DEFAULT NULL,
  `picture` varchar(512) DEFAULT './img/default.png',
  `tweetId` varchar(25) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denalifwstd.phone_tweets: ~0 rows (approximately)
/*!40000 ALTER TABLE `phone_tweets` DISABLE KEYS */;
/*!40000 ALTER TABLE `phone_tweets` ENABLE KEYS */;

-- Dumping structure for table denalifwstd.players
CREATE TABLE IF NOT EXISTS `players` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `cid` int(11) DEFAULT NULL,
  `license` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `money` text NOT NULL,
  `charinfo` text DEFAULT NULL,
  `job` text NOT NULL,
  `gang` text DEFAULT NULL,
  `position` text NOT NULL,
  `metadata` text NOT NULL,
  `inventory` longtext DEFAULT NULL,
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `mdw_image` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `mdw_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `mdw_alias` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `mdw_staffdata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`citizenid`),
  KEY `id` (`id`),
  KEY `last_updated` (`last_updated`),
  KEY `license` (`license`)
) ENGINE=InnoDB AUTO_INCREMENT=222 DEFAULT CHARSET=utf8;

-- Dumping data for table denalifwstd.players: ~3 rows (approximately)
/*!40000 ALTER TABLE `players` DISABLE KEYS */;
INSERT INTO `players` (`id`, `citizenid`, `cid`, `license`, `name`, `money`, `charinfo`, `job`, `gang`, `position`, `metadata`, `inventory`, `last_updated`, `mdw_image`, `mdw_description`, `mdw_alias`, `mdw_staffdata`) VALUES
	(106, 'SFN33075', 5, 'license:fbcbeb01650b145c086c994c9f9b7b24e131d463', 'Tate', '{"crypto":0,"cash":929899850,"bank":69909575}', '{"backstory":"placeholder backstory","gender":0,"firstname":"Tt","birthdate":"1983-04-13","account":"US02DenaliFW9197590436","card":4466768459458493,"nationality":"tt","lastname":"Tt","cid":"5","phone":"1560058821"}', '{"payment":300,"name":"police","onduty":true,"isboss":false,"grade":{"level":4,"name":"Corporal"},"label":"Law Enforcement"}', '{"name":"none","isboss":false,"grade":{"level":0,"name":"none"},"label":"No Gang Affiliaton"}', '{"x":1961.3406982421876,"y":5179.52978515625,"z":47.915771484375}', '{"criminalrecord":{"hasRecord":false},"dealerrep":0,"hunger":24.39999999999994,"licences":{"business":false,"driver":true,"weapon":false},"walletid":"denalifw-17448682","phonedata":{"InstalledApps":[],"SerialNumber":21968010},"craftingrep":0,"jobrep":{"taxi":0,"trucker":0,"tow":0,"hotdog":0},"fingerprint":"BF960Y12hCA6964","stress":0,"commandbinds":[],"ishandcuffed":false,"attachmentcraftingrep":0,"status":[],"fitbit":[],"currentapartment":"apartment39905","isdead":false,"jailitems":[],"phone":[],"inside":{"apartment":[]},"injail":0,"inlaststand":false,"tracker":false,"armor":0,"callsign":"NO CALLSIGN","thirst":31.60000000000004,"bloodtype":"AB-"}', '[{"amount":1,"name":"phone","slot":1,"type":"item","info":[]},{"amount":1,"name":"mastercard","slot":3,"type":"item","info":{"citizenid":"SFN33075","cardType":"mastercard","cardNumber":4466768459458493,"name":"Tt Tt","cardActive":true,"cardPin":7869}},{"amount":17,"name":"cokebaggy","slot":4,"type":"item","info":[]},{"amount":12,"name":"weed_white-widow","slot":5,"type":"item","info":""},{"amount":5,"name":"weed_brick","slot":6,"type":"item","info":[]},{"amount":2,"name":"crack_baggy","slot":7,"type":"item","info":""},{"amount":1,"name":"visa","slot":8,"type":"item","info":{"citizenid":"SFN33075","cardType":"visa","cardNumber":9765559298817774,"name":"Tt Tt","cardActive":true,"cardPin":7869}},{"amount":150000,"name":"casinochips","slot":9,"type":"item","info":[]}]', '2022-04-14 05:29:07', '', '', '', ''),
	(192, 'XGU69179', 1, 'license:d8a602db3d88a5a0b94c6f6a4f890a6875951200', 'KINGCOBRA01_TTV ', '{"cash":5500,"crypto":0,"bank":5610}', '{"firstname":"Liam","phone":"1777206168","cid":"1","birthdate":"1999-06-22","backstory":"placeholder backstory","account":"US01DenaliFW5547903335","nationality":"UK","lastname":"Montana","gender":0}', '{"grade":{"name":"Corporal","level":4},"onduty":true,"name":"police","payment":300,"isboss":false,"label":"Law Enforcement"}', '{"grade":{"name":"none","level":0},"isboss":false,"name":"none","label":"No Gang Affiliaton"}', '{"x":1214.4263916015626,"y":1772.6768798828126,"z":77.773681640625}', '{"injail":0,"currentapartment":"apartment34188","fitbit":[],"jobrep":{"hotdog":0,"taxi":0,"trucker":0,"tow":0},"walletid":"denalifw-17750852","commandbinds":[],"armor":0,"thirst":92.4,"phonedata":{"SerialNumber":29097198,"InstalledApps":[]},"inlaststand":false,"bloodtype":"O-","stress":0,"criminalrecord":{"hasRecord":false},"status":[],"attachmentcraftingrep":0,"phone":[],"fingerprint":"cV798D79iug7579","inside":{"apartment":[]},"callsign":"NO CALLSIGN","licences":{"business":false,"driver":true,"weapon":false},"isdead":false,"hunger":91.6,"craftingrep":0,"jailitems":[],"tracker":false,"ishandcuffed":false,"dealerrep":0}', '[{"slot":1,"amount":1,"name":"driver_license","type":"item","info":{"birthdate":"1999-06-22","lastname":"Montana","type":"Class C Driver License","firstname":"Liam"}},{"slot":2,"amount":1,"name":"phone","type":"item","info":[]},{"slot":3,"amount":1,"name":"id_card","type":"item","info":{"birthdate":"1999-06-22","firstname":"Liam","nationality":"UK","citizenid":"XGU69179","lastname":"Montana","gender":0}},{"slot":4,"amount":1,"name":"weapon_pistol","type":"weapon","info":{"quality":95.94999999999985,"ammo":0,"attachments":[{"component":"COMPONENT_AT_PI_FLSH","label":"Flashlight"}],"serie":"77Ivv3Wt205mRTp"}},{"slot":5,"amount":1,"name":"weapon_smg","type":"weapon","info":{"quality":96.24999999999986,"ammo":6,"attachments":[{"component":"COMPONENT_AT_SCOPE_MACRO_02","label":"1x Scope"},{"component":"COMPONENT_AT_AR_FLSH","label":"Flashlight"}],"serie":"85tqy5Gp435LVJd"}},{"slot":6,"amount":8,"name":"weed_brick","type":"item","info":[]},{"slot":7,"amount":1,"name":"weapon_pumpshotgun","type":"weapon","info":{"attachments":[{"component":"COMPONENT_AT_AR_FLSH","label":"Flashlight"}],"serie":"02LOu3oJ303smZd"}},{"slot":8,"amount":1,"name":"weapon_stungun","type":"weapon","info":{"ammo":-1,"serie":"92HGz9un060IaRt"}},{"slot":9,"amount":1,"name":"weapon_carbinerifle","type":"weapon","info":{"attachments":[{"component":"COMPONENT_AT_AR_FLSH","label":"Flashlight"},{"component":"COMPONENT_AT_SCOPE_MEDIUM","label":"3x Scope"}],"serie":"99nTa3Lb712fFTs"}},{"slot":10,"amount":35,"name":"weed_white-widow","type":"item","info":""},{"slot":13,"amount":1,"name":"shotgun_ammo","type":"item","info":[]},{"slot":14,"amount":1,"name":"rifle_ammo","type":"item","info":[]}]', '2022-04-13 19:42:20', '', '', '', ''),
	(164, 'XHJ13673', 1, 'license:dce41c2c0c58ef942a0cc6e69fec7e20118e39be', 'Tito', '{"crypto":0,"bank":5330,"cash":1000360}', '{"backstory":"placeholder backstory","cid":"1","nationality":"Egyptian","gender":0,"birthdate":"","lastname":"Reed","firstname":"Tito","account":"US01DenaliFW6161124777","card":7217408755772961,"phone":"1538724262"}', '{"onduty":true,"label":"Civilian","grade":{"name":"Freelancer","level":0},"isboss":false,"name":"unemployed","payment":10}', '{"grade":{"name":"none","level":0},"label":"No Gang Affiliaton","name":"none","isboss":false}', '{"x":-46.72087860107422,"y":-1758.0791015625,"z":29.4146728515625}', '{"injail":0,"attachmentcraftingrep":0,"dealerrep":0,"bloodtype":"A-","jailitems":[],"phonedata":{"InstalledApps":[],"SerialNumber":93942611},"tracker":false,"status":[],"thirst":77.20000000000002,"inlaststand":false,"criminalrecord":{"hasRecord":false},"hunger":74.79999999999999,"callsign":"NO CALLSIGN","craftingrep":0,"commandbinds":[],"armor":0,"stress":19,"fingerprint":"ke446q26lmv9697","inside":{"apartment":[]},"phone":[],"ishandcuffed":false,"licences":{"weapon":false,"business":false,"driver":true},"walletid":"denalifw-41482358","isdead":false,"jobrep":{"taxi":0,"hotdog":0,"trucker":0,"tow":0},"fitbit":[]}', '[{"amount":1,"info":{"quality":95.19999999999982,"serie":"65UHV0ly755raXC","ammo":24,"attachments":[{"component":"COMPONENT_AT_PI_FLSH","label":"Flashlight"}]},"slot":1,"type":"weapon","name":"weapon_pistol"},{"amount":2,"info":[],"slot":2,"type":"item","name":"pistol_ammo"},{"amount":1,"info":[],"slot":3,"type":"item","name":"lockpick"},{"amount":1,"info":{"serie":"38dAA4zr215vaHx","attachments":[{"component":"COMPONENT_AT_AR_FLSH","label":"Flashlight"},{"component":"COMPONENT_AT_SCOPE_MEDIUM","label":"3x Scope"}]},"slot":4,"type":"weapon","name":"weapon_carbinerifle"},{"amount":1,"info":[],"slot":5,"type":"item","name":"electronickit"},{"amount":1,"info":[],"slot":6,"type":"item","name":"phone"},{"amount":1,"info":{"birthdate":"","lastname":"Reed","citizenid":"XHJ13673","gender":0,"firstname":"Tito","nationality":"Egyptian"},"slot":7,"type":"item","name":"id_card"},{"amount":1,"info":{"type":"Class C Driver License","birthdate":"","firstname":"Tito","lastname":"Reed"},"slot":8,"type":"item","name":"driver_license"},{"amount":1,"info":{"cardNumber":7217408755772961,"citizenid":"XHJ13673","cardPin":0,"cardActive":true,"name":"Tito Reed","cardType":"mastercard"},"slot":9,"type":"item","name":"mastercard"},{"amount":5,"info":[],"slot":10,"type":"item","name":"rifle_ammo"},{"amount":1,"info":{"serie":"72SzB7db954nWnh"},"slot":11,"type":"weapon","name":"weapon_stungun"},{"amount":1,"info":[],"slot":12,"type":"weapon","name":"weapon_flashlight"},{"amount":1,"info":[],"slot":13,"type":"item","name":"trojan_usb"},{"amount":1,"info":[],"slot":14,"type":"item","name":"radio"},{"amount":2,"info":[],"slot":15,"type":"item","name":"lockpick"},{"amount":1,"info":[],"slot":19,"type":"item","name":"trojan_usb"}]', '2022-04-13 16:19:43', '', '', '', '');
/*!40000 ALTER TABLE `players` ENABLE KEYS */;

-- Dumping structure for table denalifwstd.playerskins
CREATE TABLE IF NOT EXISTS `playerskins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(255) NOT NULL,
  `model` varchar(255) NOT NULL,
  `skin` text NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `active` (`active`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- Dumping data for table denalifwstd.playerskins: ~1 rows (approximately)
/*!40000 ALTER TABLE `playerskins` DISABLE KEYS */;
INSERT INTO `playerskins` (`id`, `citizenid`, `model`, `skin`, `active`) VALUES
	(8, 'SFN33075', '1885233650', '{"neck_thikness":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"pants":{"defaultTexture":0,"item":24,"defaultItem":0,"texture":0},"mask":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"accessory":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"makeup":{"defaultTexture":1,"item":-1,"defaultItem":-1,"texture":1},"nose_0":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"t-shirt":{"defaultTexture":0,"item":58,"defaultItem":1,"texture":0},"eye_color":{"defaultTexture":0,"item":-1,"defaultItem":-1,"texture":0},"nose_4":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"cheek_1":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"blush":{"defaultTexture":1,"item":-1,"defaultItem":-1,"texture":1},"eyebrown_forward":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"arms":{"defaultTexture":0,"item":19,"defaultItem":0,"texture":0},"lips_thickness":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"bag":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"eyebrows":{"defaultTexture":1,"item":-1,"defaultItem":-1,"texture":1},"nose_3":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"chimp_bone_width":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"vest":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"nose_2":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"lipstick":{"defaultTexture":1,"item":-1,"defaultItem":-1,"texture":1},"nose_1":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"ageing":{"defaultTexture":0,"item":-1,"defaultItem":-1,"texture":0},"jaw_bone_back_lenght":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"jaw_bone_width":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"moles":{"defaultTexture":0,"item":0,"defaultItem":-1,"texture":0},"facemix":{"defaultSkinMix":0.0,"skinMix":0,"defaultShapeMix":0.0,"shapeMix":0},"chimp_bone_lenght":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"chimp_bone_lowering":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"hat":{"defaultTexture":0,"item":-1,"defaultItem":-1,"texture":-1},"face2":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"watch":{"defaultTexture":0,"item":-1,"defaultItem":-1,"texture":0},"beard":{"defaultTexture":1,"item":-1,"defaultItem":-1,"texture":1},"eyebrown_high":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"ear":{"defaultTexture":0,"item":0,"defaultItem":-1,"texture":0},"hair":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"shoes":{"defaultTexture":0,"item":51,"defaultItem":1,"texture":0},"bracelet":{"defaultTexture":0,"item":-1,"defaultItem":-1,"texture":0},"cheek_2":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"glass":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"decals":{"defaultTexture":0,"item":58,"defaultItem":0,"texture":0},"cheek_3":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"eye_opening":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"torso2":{"defaultTexture":0,"item":55,"defaultItem":0,"texture":0},"chimp_hole":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"face":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"nose_5":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0}}', 1),
	(9, 'XGU69179', '1885233650', '{"vest":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"pants":{"defaultTexture":0,"item":24,"defaultItem":0,"texture":0},"lipstick":{"defaultTexture":1,"item":-1,"defaultItem":-1,"texture":1},"face":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"blush":{"defaultTexture":1,"item":-1,"defaultItem":-1,"texture":1},"lips_thickness":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"chimp_bone_lowering":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"accessory":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"makeup":{"defaultTexture":1,"item":-1,"defaultItem":-1,"texture":1},"neck_thikness":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"face2":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"shoes":{"defaultTexture":0,"item":51,"defaultItem":1,"texture":0},"torso2":{"defaultTexture":0,"item":55,"defaultItem":0,"texture":0},"eye_color":{"defaultTexture":0,"item":-1,"defaultItem":-1,"texture":0},"chimp_bone_lenght":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"chimp_hole":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"chimp_bone_width":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"bracelet":{"defaultTexture":0,"item":-1,"defaultItem":-1,"texture":0},"eyebrown_forward":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"eyebrown_high":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"nose_2":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"eyebrows":{"defaultTexture":1,"item":-1,"defaultItem":-1,"texture":1},"moles":{"defaultTexture":0,"item":0,"defaultItem":-1,"texture":0},"eye_opening":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"decals":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"facemix":{"shapeMix":0,"skinMix":0,"defaultShapeMix":0.0,"defaultSkinMix":0.0},"nose_0":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"cheek_1":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"glass":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"cheek_2":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"nose_5":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"nose_4":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"jaw_bone_back_lenght":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"beard":{"defaultTexture":1,"item":-1,"defaultItem":-1,"texture":1},"bag":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"ear":{"defaultTexture":0,"item":-1,"defaultItem":-1,"texture":0},"jaw_bone_width":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"hair":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"nose_3":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"watch":{"defaultTexture":0,"item":-1,"defaultItem":-1,"texture":0},"cheek_3":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"hat":{"defaultTexture":0,"item":-1,"defaultItem":-1,"texture":-1},"arms":{"defaultTexture":0,"item":19,"defaultItem":0,"texture":0},"nose_1":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"t-shirt":{"defaultTexture":0,"item":58,"defaultItem":1,"texture":0},"mask":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"ageing":{"defaultTexture":0,"item":-1,"defaultItem":-1,"texture":0}}', 1);
/*!40000 ALTER TABLE `playerskins` ENABLE KEYS */;

-- Dumping structure for table denalifwstd.players_appearance
CREATE TABLE IF NOT EXISTS `players_appearance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `appearance` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table denalifwstd.players_appearance: ~0 rows (approximately)
/*!40000 ALTER TABLE `players_appearance` DISABLE KEYS */;
INSERT INTO `players_appearance` (`id`, `citizenid`, `model`, `appearance`) VALUES
	(1, 'SFN33075', '1885233650', '{"components":[{"component_id":0,"drawable":0,"texture":0},{"component_id":1,"drawable":0,"texture":0},{"component_id":2,"drawable":0,"texture":0},{"component_id":3,"drawable":0,"texture":0},{"component_id":4,"drawable":0,"texture":0},{"component_id":5,"drawable":0,"texture":0},{"component_id":6,"drawable":0,"texture":0},{"component_id":7,"drawable":0,"texture":0},{"component_id":8,"drawable":0,"texture":0},{"component_id":9,"drawable":0,"texture":0},{"component_id":10,"drawable":0,"texture":0},{"component_id":11,"drawable":0,"texture":0}],"props":[{"drawable":-1,"prop_id":0,"texture":-1},{"drawable":-1,"prop_id":1,"texture":-1},{"drawable":-1,"prop_id":2,"texture":-1},{"drawable":-1,"prop_id":6,"texture":-1},{"drawable":-1,"prop_id":7,"texture":-1}],"headBlend":{"shapeSecond":0,"skinFirst":0,"shapeFirst":0,"shapeMix":0,"skinSecond":0,"skinMix":0},"headOverlays":{"chestHair":{"color":0,"opacity":0,"style":0},"beard":{"color":0,"opacity":0,"style":0},"sunDamage":{"color":0,"opacity":0,"style":0},"blemishes":{"color":0,"opacity":0,"style":0},"complexion":{"color":0,"opacity":0,"style":0},"bodyBlemishes":{"color":0,"opacity":0,"style":0},"makeUp":{"color":0,"opacity":0,"style":0},"eyebrows":{"color":0,"opacity":0,"style":0},"moleAndFreckles":{"color":0,"opacity":0,"style":0},"lipstick":{"color":0,"opacity":0,"style":0},"blush":{"color":0,"opacity":0,"style":0},"ageing":{"color":0,"opacity":0,"style":0}},"eyeColor":0,"faceFeatures":{"cheeksWidth":0,"eyeBrownHigh":0,"jawBoneWidth":0,"cheeksBoneWidth":0,"eyesOpening":0,"eyeBrownForward":0,"nosePeakLowering":0,"nosePeakSize":0,"noseWidth":0,"neckThickness":0,"jawBoneBackSize":0,"noseBoneHigh":0,"cheeksBoneHigh":0,"chinBoneSize":0,"noseBoneTwist":0,"nosePeakHigh":0,"chinBoneLenght":0,"chinBoneLowering":0,"lipsThickness":0,"chinHole":0},"hair":{"color":0,"highlight":0,"style":0},"model":"mp_m_freemode_01"}'),
	(2, 'XGU69179', '1885233650', '{"props":[{"texture":-1,"drawable":-1,"prop_id":0},{"texture":-1,"drawable":-1,"prop_id":1},{"texture":-1,"drawable":-1,"prop_id":2},{"texture":-1,"drawable":-1,"prop_id":6},{"texture":-1,"drawable":-1,"prop_id":7}],"components":[{"texture":0,"drawable":0,"component_id":0},{"texture":0,"drawable":0,"component_id":1},{"texture":0,"drawable":0,"component_id":2},{"texture":0,"drawable":0,"component_id":3},{"texture":0,"drawable":0,"component_id":4},{"texture":0,"drawable":0,"component_id":5},{"texture":0,"drawable":0,"component_id":6},{"texture":0,"drawable":0,"component_id":7},{"texture":0,"drawable":0,"component_id":8},{"texture":0,"drawable":0,"component_id":9},{"texture":0,"drawable":0,"component_id":10},{"texture":0,"drawable":0,"component_id":11}],"hair":{"color":0,"style":0,"highlight":0},"headOverlays":{"blush":{"color":0,"style":0,"opacity":0},"moleAndFreckles":{"color":0,"style":0,"opacity":0},"blemishes":{"color":0,"style":0,"opacity":0},"makeUp":{"color":0,"style":0,"opacity":0},"lipstick":{"color":0,"style":0,"opacity":0},"chestHair":{"color":0,"style":0,"opacity":0},"beard":{"color":0,"style":0,"opacity":0},"complexion":{"color":0,"style":0,"opacity":0},"bodyBlemishes":{"color":0,"style":0,"opacity":0},"eyebrows":{"color":0,"style":0,"opacity":0},"sunDamage":{"color":0,"style":0,"opacity":0},"ageing":{"color":0,"style":0,"opacity":0}},"eyeColor":0,"headBlend":{"skinMix":0,"shapeMix":0,"skinFirst":0,"shapeSecond":10,"skinSecond":0,"shapeFirst":0},"model":"mp_m_freemode_01","faceFeatures":{"noseBoneHigh":0,"lipsThickness":0,"nosePeakSize":0,"cheeksBoneHigh":0,"noseBoneTwist":0,"cheeksBoneWidth":0,"eyeBrownHigh":0,"eyeBrownForward":0,"jawBoneWidth":0,"eyesOpening":0,"cheeksWidth":0,"nosePeakLowering":0,"chinBoneLenght":0,"noseWidth":0,"neckThickness":0,"chinBoneLowering":0,"jawBoneBackSize":0,"chinHole":0,"nosePeakHigh":0,"chinBoneSize":0}}');
/*!40000 ALTER TABLE `players_appearance` ENABLE KEYS */;

-- Dumping structure for table denalifwstd.players_outfits
CREATE TABLE IF NOT EXISTS `players_outfits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `name` longtext DEFAULT NULL,
  `ped` longtext DEFAULT NULL,
  `components` longtext DEFAULT NULL,
  `props` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denalifwstd.players_outfits: ~0 rows (approximately)
/*!40000 ALTER TABLE `players_outfits` DISABLE KEYS */;
/*!40000 ALTER TABLE `players_outfits` ENABLE KEYS */;

-- Dumping structure for table denalifwstd.players_pd_presets
CREATE TABLE IF NOT EXISTS `players_pd_presets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext DEFAULT NULL,
  `ped` longtext DEFAULT NULL,
  `components` longtext DEFAULT NULL,
  `props` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denalifwstd.players_pd_presets: ~0 rows (approximately)
/*!40000 ALTER TABLE `players_pd_presets` DISABLE KEYS */;
/*!40000 ALTER TABLE `players_pd_presets` ENABLE KEYS */;

-- Dumping structure for table denalifwstd.player_boats
CREATE TABLE IF NOT EXISTS `player_boats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `plate` varchar(50) DEFAULT NULL,
  `boathouse` varchar(50) DEFAULT NULL,
  `fuel` int(11) NOT NULL DEFAULT 100,
  `state` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denalifwstd.player_boats: ~0 rows (approximately)
/*!40000 ALTER TABLE `player_boats` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_boats` ENABLE KEYS */;

-- Dumping structure for table denalifwstd.player_contacts
CREATE TABLE IF NOT EXISTS `player_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `number` varchar(50) DEFAULT NULL,
  `iban` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denalifwstd.player_contacts: ~0 rows (approximately)
/*!40000 ALTER TABLE `player_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_contacts` ENABLE KEYS */;

-- Dumping structure for table denalifwstd.player_houses
CREATE TABLE IF NOT EXISTS `player_houses` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `house` varchar(50) NOT NULL,
  `identifier` varchar(50) DEFAULT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `keyholders` text DEFAULT NULL,
  `decorations` text DEFAULT NULL,
  `stash` text DEFAULT NULL,
  `outfit` text DEFAULT NULL,
  `logout` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `house` (`house`),
  KEY `citizenid` (`citizenid`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table denalifwstd.player_houses: ~0 rows (approximately)
/*!40000 ALTER TABLE `player_houses` DISABLE KEYS */;
INSERT INTO `player_houses` (`id`, `house`, `identifier`, `citizenid`, `keyholders`, `decorations`, `stash`, `outfit`, `logout`) VALUES
	(1, 'olympic fwy1', 'license:3de8fa5314866ffce7a517e626d26ef6d0676264', 'SWX89939', '["SWX89939"]', NULL, '{"y":-1209.4539794921876,"z":1.6979900598526,"x":-55.92578506469726}', '{"y":-1207.710693359375,"z":1.69799053668975,"x":-54.19847106933594}', NULL);
/*!40000 ALTER TABLE `player_houses` ENABLE KEYS */;

-- Dumping structure for table denalifwstd.player_mails
CREATE TABLE IF NOT EXISTS `player_mails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `sender` varchar(50) DEFAULT NULL,
  `subject` varchar(50) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `read` tinyint(4) DEFAULT 0,
  `mailid` int(11) DEFAULT NULL,
  `date` timestamp NULL DEFAULT current_timestamp(),
  `button` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table denalifwstd.player_mails: ~2 rows (approximately)
/*!40000 ALTER TABLE `player_mails` DISABLE KEYS */;
INSERT INTO `player_mails` (`id`, `citizenid`, `sender`, `subject`, `message`, `read`, `mailid`, `date`, `button`) VALUES
	(1, 'SWX89939', 'Pillbox Hospital', 'Hospital Costs', 'Dear Mr. Testing, <br /><br />Hereby you received an email with the costs of the last hospital visit.<br />The final costs have become: <strong>$2000</strong><br /><br />We wish you a quick recovery!', 0, 431941, '2022-02-02 23:32:05', '[]'),
	(2, 'SWX89939', 'Pillbox Hospital', 'Hospital Costs', 'Dear Mr. Testing, <br /><br />Hereby you received an email with the costs of the last hospital visit.<br />The final costs have become: <strong>$2000</strong><br /><br />We wish you a quick recovery!', 0, 160250, '2022-02-02 23:32:39', '[]');
/*!40000 ALTER TABLE `player_mails` ENABLE KEYS */;

-- Dumping structure for table denalifwstd.player_outfits
CREATE TABLE IF NOT EXISTS `player_outfits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `outfitname` varchar(50) NOT NULL,
  `model` varchar(50) DEFAULT NULL,
  `skin` text DEFAULT NULL,
  `outfitId` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `outfitId` (`outfitId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table denalifwstd.player_outfits: ~2 rows (approximately)
/*!40000 ALTER TABLE `player_outfits` DISABLE KEYS */;
INSERT INTO `player_outfits` (`id`, `citizenid`, `outfitname`, `model`, `skin`, `outfitId`) VALUES
	(1, 'XHJ13673', '', '349505262', '{"beard":{"texture":1,"defaultTexture":1,"defaultItem":-1,"item":-1},"pants":{"texture":0,"defaultTexture":0,"defaultItem":0,"item":24},"makeup":{"texture":1,"defaultTexture":1,"defaultItem":-1,"item":-1},"neck_thikness":{"texture":0,"defaultTexture":0,"defaultItem":0,"item":0},"eyebrown_high":{"texture":0,"defaultTexture":0,"defaultItem":0,"item":0},"torso2":{"texture":0,"defaultTexture":0,"defaultItem":0,"item":55},"nose_4":{"texture":0,"defaultTexture":0,"defaultItem":0,"item":0},"nose_3":{"texture":0,"defaultTexture":0,"defaultItem":0,"item":0},"bracelet":{"texture":0,"defaultTexture":0,"defaultItem":-1,"item":-1},"bag":{"texture":0,"defaultTexture":0,"defaultItem":0,"item":0},"jaw_bone_back_lenght":{"texture":0,"defaultTexture":0,"defaultItem":0,"item":0},"arms":{"texture":0,"defaultTexture":0,"defaultItem":0,"item":19},"accessory":{"texture":0,"defaultTexture":0,"defaultItem":0,"item":0},"mask":{"texture":0,"defaultTexture":0,"defaultItem":0,"item":0},"moles":{"texture":0,"defaultTexture":0,"defaultItem":-1,"item":0},"chimp_bone_width":{"texture":0,"defaultTexture":0,"defaultItem":0,"item":0},"facemix":{"defaultSkinMix":0.0,"skinMix":0,"defaultShapeMix":0.0,"shapeMix":0},"eye_opening":{"texture":0,"defaultTexture":0,"defaultItem":0,"item":0},"decals":{"texture":0,"defaultTexture":0,"defaultItem":0,"item":0},"ear":{"texture":0,"defaultTexture":0,"defaultItem":-1,"item":-1},"nose_0":{"texture":0,"defaultTexture":0,"defaultItem":0,"item":0},"eyebrows":{"texture":1,"defaultTexture":1,"defaultItem":-1,"item":-1},"lips_thickness":{"texture":0,"defaultTexture":0,"defaultItem":0,"item":0},"blush":{"texture":1,"defaultTexture":1,"defaultItem":-1,"item":-1},"chimp_bone_lenght":{"texture":0,"defaultTexture":0,"defaultItem":0,"item":0},"eye_color":{"texture":0,"defaultTexture":0,"defaultItem":-1,"item":-1},"chimp_hole":{"texture":0,"defaultTexture":0,"defaultItem":0,"item":0},"jaw_bone_width":{"texture":0,"defaultTexture":0,"defaultItem":0,"item":0},"nose_2":{"texture":0,"defaultTexture":0,"defaultItem":0,"item":0},"watch":{"texture":0,"defaultTexture":0,"defaultItem":-1,"item":-1},"hat":{"texture":-1,"defaultTexture":0,"defaultItem":-1,"item":-1},"nose_5":{"texture":0,"defaultTexture":0,"defaultItem":0,"item":0},"nose_1":{"texture":0,"defaultTexture":0,"defaultItem":0,"item":0},"face2":{"texture":0,"defaultTexture":0,"defaultItem":0,"item":0},"glass":{"texture":0,"defaultTexture":0,"defaultItem":0,"item":0},"face":{"texture":0,"defaultTexture":0,"defaultItem":0,"item":0},"ageing":{"texture":0,"defaultTexture":0,"defaultItem":-1,"item":-1},"cheek_2":{"texture":0,"defaultTexture":0,"defaultItem":0,"item":0},"cheek_3":{"texture":0,"defaultTexture":0,"defaultItem":0,"item":0},"cheek_1":{"texture":0,"defaultTexture":0,"defaultItem":0,"item":0},"hair":{"texture":0,"defaultTexture":0,"defaultItem":0,"item":0},"lipstick":{"texture":1,"defaultTexture":1,"defaultItem":-1,"item":-1},"chimp_bone_lowering":{"texture":0,"defaultTexture":0,"defaultItem":0,"item":0},"shoes":{"texture":0,"defaultTexture":0,"defaultItem":1,"item":51},"vest":{"texture":0,"defaultTexture":0,"defaultItem":0,"item":0},"eyebrown_forward":{"texture":0,"defaultTexture":0,"defaultItem":0,"item":0},"t-shirt":{"texture":0,"defaultTexture":0,"defaultItem":1,"item":58}}', 'outfit-4-8240'),
	(2, 'XGU69179', '', '1885233650', '{"decals":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"cheek_2":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"nose_1":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"ageing":{"defaultTexture":0,"item":-1,"defaultItem":-1,"texture":0},"chimp_hole":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"hat":{"defaultTexture":0,"item":-1,"defaultItem":-1,"texture":-1},"watch":{"defaultTexture":0,"item":-1,"defaultItem":-1,"texture":0},"eye_color":{"defaultTexture":0,"item":-1,"defaultItem":-1,"texture":0},"cheek_1":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"shoes":{"defaultTexture":0,"item":51,"defaultItem":1,"texture":0},"lips_thickness":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"bag":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"eyebrows":{"defaultTexture":1,"item":-1,"defaultItem":-1,"texture":1},"pants":{"defaultTexture":0,"item":24,"defaultItem":0,"texture":0},"nose_4":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"face2":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"bracelet":{"defaultTexture":0,"item":-1,"defaultItem":-1,"texture":0},"t-shirt":{"defaultTexture":0,"item":58,"defaultItem":1,"texture":0},"eyebrown_high":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"jaw_bone_back_lenght":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"arms":{"defaultTexture":0,"item":19,"defaultItem":0,"texture":0},"hair":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"neck_thikness":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"cheek_3":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"blush":{"defaultTexture":1,"item":-1,"defaultItem":-1,"texture":1},"jaw_bone_width":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"nose_3":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"lipstick":{"defaultTexture":1,"item":-1,"defaultItem":-1,"texture":1},"chimp_bone_width":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"eye_opening":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"nose_5":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"glass":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"nose_2":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"beard":{"defaultTexture":1,"item":-1,"defaultItem":-1,"texture":1},"facemix":{"defaultShapeMix":0.0,"shapeMix":0,"defaultSkinMix":0.0,"skinMix":0},"accessory":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"makeup":{"defaultTexture":1,"item":-1,"defaultItem":-1,"texture":1},"mask":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"face":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"nose_0":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"eyebrown_forward":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"chimp_bone_lowering":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"ear":{"defaultTexture":0,"item":-1,"defaultItem":-1,"texture":0},"chimp_bone_lenght":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"vest":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"moles":{"defaultTexture":0,"item":0,"defaultItem":-1,"texture":0},"torso2":{"defaultTexture":0,"item":55,"defaultItem":0,"texture":0}}', 'outfit-2-6413');
/*!40000 ALTER TABLE `player_outfits` ENABLE KEYS */;

-- Dumping structure for table denalifwstd.player_vehicles
CREATE TABLE IF NOT EXISTS `player_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `license` varchar(50) DEFAULT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `vehicle` varchar(50) DEFAULT NULL,
  `hash` varchar(50) DEFAULT NULL,
  `mods` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `plate` varchar(50) NOT NULL,
  `fakeplate` varchar(50) DEFAULT NULL,
  `garage` varchar(50) DEFAULT NULL,
  `fuel` int(11) DEFAULT 100,
  `engine` float DEFAULT 1000,
  `body` float DEFAULT 1000,
  `state` int(11) DEFAULT 1,
  `depotprice` int(11) NOT NULL DEFAULT 0,
  `drivingdistance` int(50) DEFAULT NULL,
  `status` text DEFAULT NULL,
  `balance` int(11) NOT NULL DEFAULT 0,
  `paymentamount` int(11) NOT NULL DEFAULT 0,
  `paymentsleft` int(11) NOT NULL DEFAULT 0,
  `financetime` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `plate` (`plate`),
  KEY `citizenid` (`citizenid`),
  KEY `license` (`license`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table denalifwstd.player_vehicles: ~0 rows (approximately)
/*!40000 ALTER TABLE `player_vehicles` DISABLE KEYS */;
INSERT INTO `player_vehicles` (`id`, `license`, `citizenid`, `vehicle`, `hash`, `mods`, `plate`, `fakeplate`, `garage`, `fuel`, `engine`, `body`, `state`, `depotprice`, `drivingdistance`, `status`, `balance`, `paymentamount`, `paymentsleft`, `financetime`) VALUES
	(1, 'license:dce41c2c0c58ef942a0cc6e69fec7e20118e39be', 'XHJ13673', 'panto', '-431692672', '{"modTank":-1,"modCustomTiresF":false,"modVanityPlate":-1,"modFrontWheels":-1,"modShifterLeavers":-1,"tankHealth":990.527308701179,"modSuspension":-1,"color2":3,"modHorns":-1,"pearlescentColor":0,"engineHealth":915.8604546370965,"modArchCover":-1,"modArmor":-1,"modRightFender":-1,"modGrille":-1,"extras":[],"fuelLevel":63.54625877794252,"modAirFilter":-1,"modSmokeEnabled":false,"modTransmission":-1,"xenonColor":255,"modHood":-1,"modFrame":-1,"modExhaust":-1,"dashboardColor":0,"modDoorSpeaker":-1,"modWindows":-1,"modSpeakers":-1,"modDial":-1,"modFrontBumper":-1,"color1":3,"interiorColor":0,"windowTint":-1,"modBackWheels":-1,"bodyHealth":946.8392557913435,"modTrunk":-1,"plateIndex":0,"modHydrolic":-1,"modTrimB":-1,"modFender":-1,"wheels":5,"dirtLevel":3.9716411736214,"modOrnaments":-1,"modAPlate":-1,"modTrimA":-1,"modRoof":-1,"modRearBumper":-1,"modAerials":-1,"modStruts":-1,"modLivery":-1,"modEngineBlock":-1,"modDashboard":-1,"modSteeringWheel":-1,"modSeats":-1,"modSideSkirt":-1,"plate":"41QVO778","neonEnabled":[false,false,false,false],"modTurbo":false,"tyreSmokeColor":[255,255,255],"modEngine":-1,"modPlateHolder":-1,"modSpoilers":-1,"modXenon":false,"model":-431692672,"wheelColor":156,"modCustomTiresR":false,"neonColor":[255,0,255],"modBrakes":-1}', '41QVO778', NULL, NULL, 100, 1000, 1000, 1, 0, 350345, NULL, 0, 0, 0, 0);
/*!40000 ALTER TABLE `player_vehicles` ENABLE KEYS */;

-- Dumping structure for table denalifwstd.player_warns
CREATE TABLE IF NOT EXISTS `player_warns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `senderIdentifier` varchar(50) DEFAULT NULL,
  `targetIdentifier` varchar(50) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `warnId` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denalifwstd.player_warns: ~0 rows (approximately)
/*!40000 ALTER TABLE `player_warns` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_warns` ENABLE KEYS */;

-- Dumping structure for table denalifwstd.playtime
CREATE TABLE IF NOT EXISTS `playtime` (
  `identifier` varchar(100) NOT NULL,
  `time` int(11) NOT NULL DEFAULT 0,
  `login` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table denalifwstd.playtime: ~4 rows (approximately)
/*!40000 ALTER TABLE `playtime` DISABLE KEYS */;
INSERT INTO `playtime` (`identifier`, `time`, `login`) VALUES
	('license:3de8fa5314866ffce7a517e626d26ef6d0676264', 11774, 8),
	('license:fbcbeb01650b145c086c994c9f9b7b24e131d463', 18897, 14),
	('license:dce41c2c0c58ef942a0cc6e69fec7e20118e39be', 2187, 3),
	('license:d8a602db3d88a5a0b94c6f6a4f890a6875951200', 1993, 1);
/*!40000 ALTER TABLE `playtime` ENABLE KEYS */;

-- Dumping structure for table denalifwstd.ranks
CREATE TABLE IF NOT EXISTS `ranks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `departmentID` int(11) NOT NULL,
  `name` varchar(75) COLLATE utf8_bin NOT NULL COMMENT 'The name of the rank',
  `promoteOnly` tinyint(1) NOT NULL,
  `canPromote` tinyint(1) NOT NULL,
  `canKick` tinyint(1) NOT NULL,
  `canAccept` tinyint(1) NOT NULL,
  `canChangeCallsign` tinyint(1) NOT NULL DEFAULT 0,
  `rankNumber` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table denalifwstd.ranks: 0 rows
/*!40000 ALTER TABLE `ranks` DISABLE KEYS */;
/*!40000 ALTER TABLE `ranks` ENABLE KEYS */;

-- Dumping structure for table denalifwstd.settings
CREATE TABLE IF NOT EXISTS `settings` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `radiovolume` double NOT NULL DEFAULT 1,
  `emergencyvolume` double NOT NULL DEFAULT 1,
  `language` varchar(2) COLLATE utf8_bin NOT NULL DEFAULT 'en',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `userID` (`userID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table denalifwstd.settings: 1 rows
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` (`ID`, `userID`, `radiovolume`, `emergencyvolume`, `language`) VALUES
	(1, 1, 1, 1, 'en');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;

-- Dumping structure for table denalifwstd.stashitems
CREATE TABLE IF NOT EXISTS `stashitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stash` varchar(255) NOT NULL DEFAULT '[]',
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`stash`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Dumping data for table denalifwstd.stashitems: ~4 rows (approximately)
/*!40000 ALTER TABLE `stashitems` DISABLE KEYS */;
INSERT INTO `stashitems` (`id`, `stash`, `items`) VALUES
	(1, 'apartment51731', '[]'),
	(2, 'olympic fwy1', '[]'),
	(3, 'policestash_SFN33075', '[{"unique":false,"name":"casinochips","type":"item","amount":400,"label":"Casino Chips","slot":1,"image":"casinochips.png","info":[],"weight":0,"useable":false},{"unique":false,"name":"suturekit","type":"item","amount":1,"label":"Suture kit","slot":2,"image":"suturekit.png","info":"","weight":200,"useable":true},{"unique":true,"name":"stretcher","type":"item","amount":1,"label":"Stretcher","slot":3,"image":"stretcher.png","info":"","weight":200,"useable":true}]');
/*!40000 ALTER TABLE `stashitems` ENABLE KEYS */;

-- Dumping structure for table denalifwstd.trunkitems
CREATE TABLE IF NOT EXISTS `trunkitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(255) NOT NULL DEFAULT '[]',
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`plate`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denalifwstd.trunkitems: ~0 rows (approximately)
/*!40000 ALTER TABLE `trunkitems` DISABLE KEYS */;
/*!40000 ALTER TABLE `trunkitems` ENABLE KEYS */;

-- Dumping structure for table denalifwstd.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `license` varchar(75) COLLATE utf8_bin DEFAULT NULL,
  `gameName` varchar(75) COLLATE utf8_bin DEFAULT NULL,
  `isAdmin` tinyint(1) DEFAULT 0,
  `activated` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `license` (`license`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table denalifwstd.users: 1 rows
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `license`, `gameName`, `isAdmin`, `activated`) VALUES
	(1, '3de8fa5314866ffce7a517e626d26ef6d0676264', 'deakum', 0, 1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping structure for table denalifwstd.vehiclecitations
CREATE TABLE IF NOT EXISTS `vehiclecitations` (
  `citationID` varchar(15) COLLATE utf8_bin NOT NULL,
  `userID` int(11) NOT NULL,
  `name` varchar(150) COLLATE utf8_bin DEFAULT NULL,
  `address` varchar(150) COLLATE utf8_bin DEFAULT NULL,
  `licenseplate` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `vehicle` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `date` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT 'dd/mm/yyyy',
  `time` varchar(5) COLLATE utf8_bin DEFAULT NULL COMMENT 'hh:mm',
  `reason` text COLLATE utf8_bin DEFAULT NULL COMMENT 'JSON Array String',
  `location` varchar(75) COLLATE utf8_bin DEFAULT NULL,
  `amount` int(11) NOT NULL DEFAULT 0,
  `isPoint` tinyint(1) NOT NULL,
  `timestamp` int(11) NOT NULL DEFAULT 0,
  UNIQUE KEY `citationID` (`citationID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table denalifwstd.vehiclecitations: 0 rows
/*!40000 ALTER TABLE `vehiclecitations` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehiclecitations` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
