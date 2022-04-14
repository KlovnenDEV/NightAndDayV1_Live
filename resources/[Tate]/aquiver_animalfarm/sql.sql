-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.27 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for fivem_test
CREATE DATABASE IF NOT EXISTS `fivem_test` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `fivem_test`;

-- Dumping structure for table fivem_test.af_composts
CREATE TABLE IF NOT EXISTS `af_composts` (
  `farmId` int DEFAULT NULL,
  `compostStrid` varchar(128) DEFAULT NULL,
  `shitAmount` int DEFAULT NULL,
  KEY `farmId` (`farmId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

-- Dumping structure for table fivem_test.af_farms_base
CREATE TABLE IF NOT EXISTS `af_farms_base` (
  `farmId` int NOT NULL AUTO_INCREMENT,
  `ownerIdentifier` varchar(255) DEFAULT NULL,
  `ownerName` varchar(255) DEFAULT NULL,
  `price` int DEFAULT NULL,
  `x` int DEFAULT NULL,
  `y` int DEFAULT NULL,
  `z` int DEFAULT NULL,
  `img` text,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `locked` tinyint DEFAULT NULL,
  `milk` int DEFAULT '0',
  `egg` int DEFAULT '0',
  `meal` int DEFAULT '0',
  KEY `id` (`farmId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

-- Dumping structure for table fivem_test.af_paddock_animals
CREATE TABLE IF NOT EXISTS `af_paddock_animals` (
  `aid` int NOT NULL AUTO_INCREMENT,
  `farmId` int NOT NULL,
  `paddockStrid` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `hunger` int DEFAULT NULL,
  `age` double DEFAULT NULL,
  `thirst` int DEFAULT NULL,
  `animalType` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `milk` int DEFAULT NULL,
  `weight` int DEFAULT NULL,
  `health` int DEFAULT NULL,
  `extra` double DEFAULT NULL,
  PRIMARY KEY (`aid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=150 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

-- Dumping structure for table fivem_test.af_paddock_upgrades
CREATE TABLE IF NOT EXISTS `af_paddock_upgrades` (
  `farmId` int DEFAULT NULL,
  `paddockStrid` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `upgradeStrid` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `foodAmount` int DEFAULT NULL,
  `waterAmount` int DEFAULT NULL,
  KEY `farmId` (`farmId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
