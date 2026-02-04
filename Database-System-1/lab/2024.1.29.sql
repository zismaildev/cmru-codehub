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

-- Dumping structure for table nattapong51.billorder420
CREATE TABLE IF NOT EXISTS `billorder420` (
  `idBillorder` char(5) NOT NULL,
  `id_sup` char(5) DEFAULT NULL,
  PRIMARY KEY (`idBillorder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- Dumping data for table nattapong51.billorder420: 4 rows
/*!40000 ALTER TABLE `billorder420` DISABLE KEYS */;
REPLACE INTO `billorder420` (`idBillorder`, `id_sup`) VALUES
	('BC001', 'P001'),
	('BC002', 'P001'),
	('BC003', 'P002'),
	('BC004', 'P003');
/*!40000 ALTER TABLE `billorder420` ENABLE KEYS */;

-- Dumping structure for table nattapong51.detailorder420
CREATE TABLE IF NOT EXISTS `detailorder420` (
  `idBillorder` char(5) DEFAULT NULL,
  `idProduct` char(5) DEFAULT NULL,
  `amount` char(7) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- Dumping data for table nattapong51.detailorder420: 9 rows
/*!40000 ALTER TABLE `detailorder420` DISABLE KEYS */;
REPLACE INTO `detailorder420` (`idBillorder`, `idProduct`, `amount`) VALUES
	('BC001', 'P01', '100'),
	('BC001', 'P02', '200'),
	('BC001', 'P03', '100'),
	('BC001', 'P04', '100'),
	('BC002', 'P02', '300'),
	('BC002', 'P03', '300'),
	('BC003', 'B01', '50'),
	('BC003', 'B02', '100'),
	('BC004', 'L01', '20');
/*!40000 ALTER TABLE `detailorder420` ENABLE KEYS */;

-- Dumping structure for table nattapong51.product420
CREATE TABLE IF NOT EXISTS `product420` (
  `idProduct` char(3) NOT NULL,
  `NameProduct` varchar(35) DEFAULT NULL,
  `Price` int(4) DEFAULT NULL,
  `Numstock` int(4) DEFAULT NULL,
  PRIMARY KEY (`idProduct`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- Dumping data for table nattapong51.product420: 7 rows
/*!40000 ALTER TABLE `product420` DISABLE KEYS */;
REPLACE INTO `product420` (`idProduct`, `NameProduct`, `Price`, `Numstock`) VALUES
	('P01', 'Paper A4 70 g.', 105, NULL),
	('P02', 'Paper A4 80 g.', 120, NULL),
	('P03', 'Paper F4 80 g.', 130, NULL),
	('P04', 'Paper B2 80 g.', 150, NULL),
	('B01', 'Blue Pen ', 25, NULL),
	('B02', 'Red Pen', 15, NULL),
	('L01', 'Toner printer', 5500, NULL);
/*!40000 ALTER TABLE `product420` ENABLE KEYS */;

-- Dumping structure for table nattapong51.productbak
CREATE TABLE IF NOT EXISTS `productbak` (
  `idProduct` char(3) NOT NULL,
  `NameProduct` varchar(35) DEFAULT NULL,
  `Price` int(4) DEFAULT NULL,
  `Numstock` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table nattapong51.productbak: ~7 rows (approximately)
REPLACE INTO `productbak` (`idProduct`, `NameProduct`, `Price`, `Numstock`) VALUES
	('P01', 'Paper A4 70 g.', 105, NULL),
	('P02', 'Paper A4 80 g.', 120, NULL),
	('P03', 'Paper F4 80 g.', 130, NULL),
	('P04', 'Paper B2 80 g.', 150, NULL),
	('B01', 'Blue Pen ', 25, NULL),
	('B02', 'Red Pen', 15, NULL),
	('L01', 'Toner printer', 5500, NULL);

-- Dumping structure for table nattapong51.productcopy1
CREATE TABLE IF NOT EXISTS `productcopy1` (
  `idProduct` char(3) NOT NULL,
  `NameProduct` varchar(35) DEFAULT NULL,
  `Price` int(4) DEFAULT NULL,
  `Numstock` int(4) DEFAULT NULL,
  PRIMARY KEY (`idProduct`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- Dumping data for table nattapong51.productcopy1: 2 rows
/*!40000 ALTER TABLE `productcopy1` DISABLE KEYS */;
REPLACE INTO `productcopy1` (`idProduct`, `NameProduct`, `Price`, `Numstock`) VALUES
	('L01', 'Toner printer', 5500, NULL),
	('P04', 'Paper B2 80 g.', 150, NULL);
/*!40000 ALTER TABLE `productcopy1` ENABLE KEYS */;

-- Dumping structure for table nattapong51.productcopy2
CREATE TABLE IF NOT EXISTS `productcopy2` (
  `idProduct` char(3) NOT NULL,
  `NameProduct` varchar(35) DEFAULT NULL,
  `Price` int(4) DEFAULT NULL,
  `Numstock` int(4) DEFAULT NULL,
  PRIMARY KEY (`idProduct`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- Dumping data for table nattapong51.productcopy2: 0 rows
/*!40000 ALTER TABLE `productcopy2` DISABLE KEYS */;
REPLACE INTO `productcopy2` (`idProduct`, `NameProduct`, `Price`, `Numstock`) VALUES
	('P01', 'Paper A4 70 g.', 105, NULL),
	('P02', 'Paper A4 80 g.', 120, NULL),
	('P03', 'Paper F4 80 g.', 130, NULL),
	('P04', 'Paper B2 80 g.', 150, NULL);
/*!40000 ALTER TABLE `productcopy2` ENABLE KEYS */;

-- Dumping structure for table nattapong51.productstru
CREATE TABLE IF NOT EXISTS `productstru` (
  `idProduct` char(3) NOT NULL,
  `NameProduct` varchar(35) DEFAULT NULL,
  `Price` int(4) DEFAULT NULL,
  `Numstock` int(4) DEFAULT NULL,
  PRIMARY KEY (`idProduct`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- Dumping data for table nattapong51.productstru: 0 rows
/*!40000 ALTER TABLE `productstru` DISABLE KEYS */;
/*!40000 ALTER TABLE `productstru` ENABLE KEYS */;

-- Dumping structure for table nattapong51.supplier420
CREATE TABLE IF NOT EXISTS `supplier420` (
  `id_sup` char(5) NOT NULL,
  `name_sup` varchar(30) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `tel` int(9) DEFAULT NULL,
  PRIMARY KEY (`id_sup`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- Dumping data for table nattapong51.supplier420: 5 rows
/*!40000 ALTER TABLE `supplier420` DISABLE KEYS */;
REPLACE INTO `supplier420` (`id_sup`, `name_sup`, `address`, `tel`) VALUES
	('P001', 'Somjai Company', '120 changphuak Chaiangmai', NULL),
	('P002', 'ABC Company', '50 Chotana Chaiangmai', NULL),
	('P003', 'Paper Service', '50 Intayonyot road Lamphun', NULL),
	('P004', 'ComTect', '33 Moo 3 T.Baanklan Lumphun', NULL),
	('P005', 'Parada Company', '102 T.Changphuak Chaiangmai', NULL);
/*!40000 ALTER TABLE `supplier420` ENABLE KEYS */;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
