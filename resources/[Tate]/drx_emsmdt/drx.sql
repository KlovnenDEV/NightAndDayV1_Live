CREATE TABLE IF NOT EXISTS `drx_emsmdt_calls` (
  `incident` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `message` text DEFAULT NULL,
  `date` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `coords` longtext DEFAULT NULL,
  `charname` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  PRIMARY KEY (`incident`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `drx_emsmdt_database` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(255) NOT NULL,
  `patientName` varchar(255) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `title` text DEFAULT NULL,
  `desc` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE `players` ADD COLUMN `emsstatus` VARCHAR(255) NULL DEFAULT 'Unavailable';