-- MySQL dump 10.13  Distrib 5.7.16, for Win64 (x86_64)
--
-- Host: localhost    Database: clubsocial
-- ------------------------------------------------------
-- Server version	5.7.16-log

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
-- Current Database: `clubsocial`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `clubsocial` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `clubsocial`;

--
-- Table structure for table `afiliados`
--

DROP TABLE IF EXISTS `afiliados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `afiliados` (
  `afiId` int(11) NOT NULL AUTO_INCREMENT,
  `afiApellido` varchar(45) DEFAULT NULL,
  `afiNombre` varchar(45) DEFAULT NULL,
  `afiDomicilio` varchar(45) DEFAULT NULL,
  `afiDNI` char(8) NOT NULL,
  `afiFechaInscripcion` date DEFAULT NULL,
  `afiFechaNac` date DEFAULT NULL,
  `afiSexo` char(1) DEFAULT NULL,
  PRIMARY KEY (`afiId`),
  UNIQUE KEY `afiDNI_UNIQUE` (`afiDNI`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `afiliados`
--

LOCK TABLES `afiliados` WRITE;
/*!40000 ALTER TABLE `afiliados` DISABLE KEYS */;
INSERT INTO `afiliados` VALUES (1,'Ramirez','Leonardo','Belgrano 1550','33456987','2000-10-05','1975-07-23','M'),(2,'Alvarez','Romina','Salta 18','22345219','2005-08-01','1980-03-15','F');
/*!40000 ALTER TABLE `afiliados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagos`
--

DROP TABLE IF EXISTS `pagos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pagos` (
  `pagoId` int(11) NOT NULL AUTO_INCREMENT,
  `pagoFechayHora` datetime DEFAULT NULL,
  `afiId` int(11) DEFAULT NULL,
  `serviId` int(11) DEFAULT NULL,
  PRIMARY KEY (`pagoId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagos`
--

LOCK TABLES `pagos` WRITE;
/*!40000 ALTER TABLE `pagos` DISABLE KEYS */;
INSERT INTO `pagos` VALUES (1,'2017-01-10 09:00:00',1,2),(2,'2017-01-10 07:55:00',2,1),(3,'2017-01-17 11:23:00',2,3),(4,'2017-01-25 19:24:00',1,1);
/*!40000 ALTER TABLE `pagos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicios`
--

DROP TABLE IF EXISTS `servicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servicios` (
  `serviId` int(11) NOT NULL,
  `serviDescripcion` varchar(45) DEFAULT NULL,
  `serviPrecio` decimal(10,2) DEFAULT '0.00',
  `serviTipo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`serviId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicios`
--

LOCK TABLES `servicios` WRITE;
/*!40000 ALTER TABLE `servicios` DISABLE KEYS */;
INSERT INTO `servicios` VALUES (1,'Cuota Social',500.00,'Administracion'),(2,'Quincho x dia',100.00,'Esparcimiento'),(3,'Cancha de futbol',50.00,'Deporte'),(4,'Gimnasio x dia',20.00,'Deporte'),(5,'Gimnasio x 1 mes',350.00,'Deporte'),(6,'Sal├│n de Fiestas',2500.00,'Esparcimiento'),(7,'Inscripcion',4000.00,'Administracion');
/*!40000 ALTER TABLE `servicios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-03-10 11:52:23
