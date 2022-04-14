CREATE TABLE IF NOT EXISTS `renzu_projectcars` (
  `plate` varchar(64) NOT NULL DEFAULT '',
  `identifier` varchar(64) NOT NULL DEFAULT '',
  `paint` varchar(128) NULL,
  `coord` varchar(255) NULL,
  `model` varchar(64) NULL,
  `status` longtext NULL,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `renzu_projectcars_items` (
  `identifier` varchar(64) NOT NULL DEFAULT '',
  `items` longtext NULL,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
