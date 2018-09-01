-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: new
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
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `ano` varchar(20) NOT NULL,
  `avbal` int(11) DEFAULT NULL,
  `tpassword` varchar(10) NOT NULL,
  `uid` varchar(10) NOT NULL,
  PRIMARY KEY (`aid`),
  KEY `uid` (`uid`),
  CONSTRAINT `accounts_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES (1,'chirag','C12345',20785,'c','151337'),(2,'chirag','C22345',19225,'c','151337'),(3,'prashant','P12345',19000,'p','151333'),(4,'prashant','P22345',21000,'p','151333'),(5,'sahil','S12345',110000,'s','151354'),(6,'sahil','S22345',48111,'s','151354');
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checks`
--

DROP TABLE IF EXISTS `checks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `checks` (
  `usrid` varchar(10) NOT NULL,
  `status` varchar(10) NOT NULL,
  `count` int(11) DEFAULT NULL,
  PRIMARY KEY (`usrid`),
  CONSTRAINT `checks_ibfk_1` FOREIGN KEY (`usrid`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checks`
--

LOCK TABLES `checks` WRITE;
/*!40000 ALTER TABLE `checks` DISABLE KEYS */;
INSERT INTO `checks` VALUES ('151333','U',0),('151337','U',0),('151354','U',0);
/*!40000 ALTER TABLE `checks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checks_update`
--

DROP TABLE IF EXISTS `checks_update`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `checks_update` (
  `usrid` varchar(10) NOT NULL,
  `status` varchar(10) NOT NULL,
  `count` int(11) DEFAULT NULL,
  `Date` datetime DEFAULT NULL,
  PRIMARY KEY (`usrid`),
  CONSTRAINT `checks_update_ibfk_1` FOREIGN KEY (`usrid`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checks_update`
--

LOCK TABLES `checks_update` WRITE;
/*!40000 ALTER TABLE `checks_update` DISABLE KEYS */;
INSERT INTO `checks_update` VALUES ('151333','U',0,NULL),('151337','U',0,'2017-12-22 16:59:48'),('151354','U',0,NULL);
/*!40000 ALTER TABLE `checks_update` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Fromacno` varchar(20) DEFAULT NULL,
  `Toacno` varchar(20) DEFAULT NULL,
  `Amount` int(11) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES (1,'C12345','C22345',5000,'2017-11-17'),(2,'C22345','S12345',10000,'2017-11-21'),(3,'S12345','S22345',20000,'2017-11-21'),(4,'C12345','C22345',1522,'2017-11-22'),(5,'C12345','C22345',1522,'2017-11-22'),(6,'C12345','C22345',5000,'2017-11-22'),(7,'C12345','C22345',1500,'2017-11-22'),(8,'C22345','C12345',20000,'2017-11-22'),(9,'S12345','S22345',1111,'2017-11-23');
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trial`
--

DROP TABLE IF EXISTS `trial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trial` (
  `user_id` varchar(10) NOT NULL,
  `user_password` varchar(20) DEFAULT NULL,
  `taarik` date DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trial`
--

LOCK TABLES `trial` WRITE;
/*!40000 ALTER TABLE `trial` DISABLE KEYS */;
INSERT INTO `trial` VALUES ('sdfgh','try','2017-11-17');
/*!40000 ALTER TABLE `trial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` varchar(10) NOT NULL,
  `user_password` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('151333','prashant'),('151337','chirag'),('151354','sahil'),('admin','admin');
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

-- Dump completed on 2018-01-04  0:08:17
