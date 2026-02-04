-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.16-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for nattapong51
CREATE DATABASE IF NOT EXISTS `nattapong51` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `nattapong51`;

-- Dumping structure for table nattapong51.supplier420
CREATE TABLE IF NOT EXISTS `supplier420` (
  `id_sup` char(5) NOT NULL,
  `name_sup` varchar(30) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `tel` int(9) DEFAULT NULL,
  PRIMARY KEY (`id_sup`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- Dumping data for table nattapong51.supplier420: 6 rows
/*!40000 ALTER TABLE `supplier420` DISABLE KEYS */;
REPLACE INTO `supplier420` (`id_sup`, `name_sup`, `address`, `tel`) VALUES
	('SP001', 'Somjai Company', '120 changphuak Chaiangmai', NULL),
	('SP002', 'ABC Company', '50 Chotana Chaiangmai', NULL),
	('SP003', 'Paper Service', '50 Intayonyot road Lamphun', NULL),
	('SP004', 'ComTect', '33 Moo 3 T.Baanklan Lumphun', NULL),
	('SP005', 'Parada Company', '102 T.Changphuak Chaiangmai', NULL),
	('SP006', 'Parada Company', '102 T.Changphuak Chaiangmai', NULL);
/*!40000 ALTER TABLE `supplier420` ENABLE KEYS */;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
