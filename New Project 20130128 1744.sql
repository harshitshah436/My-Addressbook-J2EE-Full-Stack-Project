-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.86-community-nt


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema addressbook
--

CREATE DATABASE IF NOT EXISTS addressbook;
USE addressbook;

--
-- Definition of table `info`
--

DROP TABLE IF EXISTS `info`;
CREATE TABLE `info` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `user` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `city` varchar(45) default NULL,
  `country` varchar(45) default NULL,
  `phone` decimal(10,0) default NULL,
  `email` varchar(45) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `info`
--

/*!40000 ALTER TABLE `info` DISABLE KEYS */;
INSERT INTO `info` (`id`,`user`,`password`,`name`,`city`,`country`,`phone`,`email`) VALUES 
 (1,'test','test','Test Test','Man','Ind','1234567890','test@test.com'),
 (4,'test1','123456','Test1 Test1','Manalore','India','1234567890','test@test1.com'),
 (5,'test2','test123','test2 test2','Mangalore','India','123546','test@test2.com'),
 (6,'test11','123456','test11','Mangalore','India','12345678','test11@tet.com'),
 (7,'test1','123456','Test1 Test1','Manalore','India','1234567890','test@test1.com'),
 (8,'test1','123456','Test1 Test1','','',NULL,'test@test1.com'),
 (9,'test1','test111','Heshahs sdfhk','','',NULL,'test@testststs.coidk'),
 (26,'harshit','123456','Harshit Shah','Mangalore','India','9428223015','harshit@india.com'),
 (27,'adfsdf','1234','adfd','','',NULL,'adfdfdf');
/*!40000 ALTER TABLE `info` ENABLE KEYS */;


--
-- Definition of table `record`
--

DROP TABLE IF EXISTS `record`;
CREATE TABLE `record` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `user` varchar(45) default NULL,
  `name` varchar(45) default NULL,
  `phone` decimal(10,0) default NULL,
  `address` text,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `record`
--

/*!40000 ALTER TABLE `record` DISABLE KEYS */;
INSERT INTO `record` (`id`,`user`,`name`,`phone`,`address`) VALUES 
 (1,'test','Mr. John','1234567889','D-1/dt, set.fstgawdf'),
 (2,'test','Test','1234568791','D-1/8,</br>, Mangalore'),
 (4,'test','Test2','1234568711','D-1/8,</br>Street-1, Mangalore'),
 (5,'test','Test3','1234568712','D-1/8,</br>London Street,</br>Near Nigeria,<br> Mangalore'),
 (8,'test','John Doe','1234567890','D-1/8,</br>London Street,</br>Near Nigeria,<br> Mangalore'),
 (9,'test','Mr. S','1234456670','D-1/8,</br>London Street,</br>Near Nigeria,<br> Mangalore'),
 (10,'test','Mr. S','1234456670','D-1/8,</br>London Street,</br>Near Nigeria,<br> Mangalore'),
 (11,'test','Mr. S','1234456670','D-1/8,</br>London Street,</br>Near Nigeria,<br> Mangalore'),
 (12,'test','Mr. y','1234568712','D-1/8,</br>London Street,</br>Near Nigeria,<br> Mangalore'),
 (13,'test','Jane Roe','3214567890','D-1/8,</br>London Street,</br>Near Nigeria,<br> Mangalore'),
 (14,'test','Jane Roe','3214567890','dsfdf');
/*!40000 ALTER TABLE `record` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
