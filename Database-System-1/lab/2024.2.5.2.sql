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


-- Dumping database structure for registration420
CREATE DATABASE IF NOT EXISTS `registration420` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `registration420`;

-- Dumping structure for table registration420.faculty420
CREATE TABLE IF NOT EXISTS `faculty420` (
  `faculty_id` int(4) NOT NULL,
  `faculty_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`faculty_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- Dumping data for table registration420.faculty420: 4 rows
/*!40000 ALTER TABLE `faculty420` DISABLE KEYS */;
REPLACE INTO `faculty420` (`faculty_id`, `faculty_name`) VALUES
	(1, 'วิทยากการจัดการ'),
	(2, 'วิทยาศาสตร์และเทคโนโลยี'),
	(3, 'เทคโนโลยีการเกษตร'),
	(4, 'ครุศาสตร์');
/*!40000 ALTER TABLE `faculty420` ENABLE KEYS */;

-- Dumping structure for table registration420.major420
CREATE TABLE IF NOT EXISTS `major420` (
  `major_id` tinyint(1) NOT NULL,
  `major_name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`major_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- Dumping data for table registration420.major420: 3 rows
/*!40000 ALTER TABLE `major420` DISABLE KEYS */;
REPLACE INTO `major420` (`major_id`, `major_name`) VALUES
	(1, 'เทคโนโลยีสารสนเทศ'),
	(2, 'วิทยาการคอมพิวเตอร์'),
	(10, 'การจัดการทั่วไป');
/*!40000 ALTER TABLE `major420` ENABLE KEYS */;

-- Dumping structure for table registration420.student420
CREATE TABLE IF NOT EXISTS `student420` (
  `Stu_id` char(8) NOT NULL,
  `Stu_name` varchar(30) NOT NULL,
  `Major_id` tinyint(3) NOT NULL,
  `Faculty_id` tinyint(1) NOT NULL,
  PRIMARY KEY (`Stu_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- Dumping data for table registration420.student420: 6 rows
/*!40000 ALTER TABLE `student420` DISABLE KEYS */;
REPLACE INTO `student420` (`Stu_id`, `Stu_name`, `Major_id`, `Faculty_id`) VALUES
	('58143401', 'ประกอบ การงาน', 1, 1),
	('59143401', 'สมบูรณื พูลสุข', 1, 1),
	('59143402', 'กนกพร บุญมี', 1, 1),
	('59143201', 'พิทักษ์ รักษา', 2, 1),
	('60124301', 'สมบูรณื พูลสุข', 10, 2),
	('66143420', 'ณัฐพงษ์ ปันธิยะ', 2, 2);
/*!40000 ALTER TABLE `student420` ENABLE KEYS */;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
