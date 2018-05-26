-- MySQL dump 10.13  Distrib 5.5.58, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: hospital
-- ------------------------------------------------------
-- Server version	5.5.58-0+deb8u1

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
-- Current Database: `hospital`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `hospital` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `hospital`;

--
-- Table structure for table `Academics`
--

DROP TABLE IF EXISTS `Academics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Academics` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Academics`
--

LOCK TABLES `Academics` WRITE;
/*!40000 ALTER TABLE `Academics` DISABLE KEYS */;
/*!40000 ALTER TABLE `Academics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Building_info`
--

DROP TABLE IF EXISTS `Building_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Building_info` (
  `Building_no` int(11) NOT NULL AUTO_INCREMENT,
  `Building_name` varchar(30) DEFAULT NULL,
  `no_of_floors` int(11) NOT NULL,
  PRIMARY KEY (`Building_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Building_info`
--

LOCK TABLES `Building_info` WRITE;
/*!40000 ALTER TABLE `Building_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `Building_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Department`
--

DROP TABLE IF EXISTS `Department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Department` (
  `dno` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Dname` varchar(30) NOT NULL,
  `hod` int(10) unsigned NOT NULL,
  PRIMARY KEY (`dno`),
  KEY `fk_hod` (`hod`),
  CONSTRAINT `fk_hod` FOREIGN KEY (`hod`) REFERENCES `Doctor` (`Doc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Department`
--

LOCK TABLES `Department` WRITE;
/*!40000 ALTER TABLE `Department` DISABLE KEYS */;
/*!40000 ALTER TABLE `Department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Doc_Category`
--

DROP TABLE IF EXISTS `Doc_Category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Doc_Category` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(50) NOT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Doc_Category`
--

LOCK TABLES `Doc_Category` WRITE;
/*!40000 ALTER TABLE `Doc_Category` DISABLE KEYS */;
/*!40000 ALTER TABLE `Doc_Category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Doc_Rooms`
--

DROP TABLE IF EXISTS `Doc_Rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Doc_Rooms` (
  `Room_no` int(11) NOT NULL,
  `Building_no` int(11) NOT NULL,
  `floor_no` int(11) NOT NULL,
  `Doc_id` int(10) unsigned NOT NULL,
  KEY `fk_Doc_id_room` (`Doc_id`),
  KEY `fk_Building_no_Room` (`Building_no`),
  CONSTRAINT `fk_Building_no_Room` FOREIGN KEY (`Building_no`) REFERENCES `Building_info` (`Building_no`),
  CONSTRAINT `fk_Doc_id_room` FOREIGN KEY (`Doc_id`) REFERENCES `Doctor` (`Doc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Doc_Rooms`
--

LOCK TABLES `Doc_Rooms` WRITE;
/*!40000 ALTER TABLE `Doc_Rooms` DISABLE KEYS */;
/*!40000 ALTER TABLE `Doc_Rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Doc_Schedule`
--

DROP TABLE IF EXISTS `Doc_Schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Doc_Schedule` (
  `Sid` int(11) NOT NULL AUTO_INCREMENT,
  `Doc_id` int(10) unsigned NOT NULL,
  `day` varchar(5) NOT NULL,
  `time_in` time NOT NULL,
  `time_out` time NOT NULL,
  PRIMARY KEY (`Sid`),
  KEY `fk_Doc_id_timings_and_days` (`Doc_id`),
  CONSTRAINT `fk_Doc_id_timings_and_days` FOREIGN KEY (`Doc_id`) REFERENCES `Doctor` (`Doc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Doc_Schedule`
--

LOCK TABLES `Doc_Schedule` WRITE;
/*!40000 ALTER TABLE `Doc_Schedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `Doc_Schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Doctor`
--

DROP TABLE IF EXISTS `Doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Doctor` (
  `Doc_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Dname` varchar(30) NOT NULL,
  `DOJ` date NOT NULL,
  `fee` float NOT NULL,
  `office_email` varchar(80) DEFAULT NULL,
  `office_phone` varchar(10) DEFAULT NULL,
  `Department_no` int(10) unsigned NOT NULL,
  `date_of_first_practice` date NOT NULL,
  `type` int(11) NOT NULL,
  PRIMARY KEY (`Doc_id`),
  KEY `fk_dept` (`Department_no`),
  KEY `fk_Doc_type` (`type`),
  CONSTRAINT `fk_Doc_type` FOREIGN KEY (`type`) REFERENCES `Doc_Category` (`cid`),
  CONSTRAINT `fk_dept` FOREIGN KEY (`Department_no`) REFERENCES `Department` (`dno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Doctor`
--

LOCK TABLES `Doctor` WRITE;
/*!40000 ALTER TABLE `Doctor` DISABLE KEYS */;
/*!40000 ALTER TABLE `Doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Doctors_personals`
--

DROP TABLE IF EXISTS `Doctors_personals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Doctors_personals` (
  `Doc_id` int(10) unsigned NOT NULL,
  `dob` date NOT NULL,
  `Gender` varchar(2) NOT NULL,
  `Blood_group` varchar(4) NOT NULL,
  `personal_phone` varchar(14) NOT NULL,
  `Res_address` varchar(200) DEFAULT NULL,
  `personal_email` varchar(60) DEFAULT NULL,
  `marital_status` varchar(15) DEFAULT NULL,
  `salary` double NOT NULL,
  KEY `fk_Doc_id_personal` (`Doc_id`),
  CONSTRAINT `fk_Doc_id_personal` FOREIGN KEY (`Doc_id`) REFERENCES `Doctor` (`Doc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Doctors_personals`
--

LOCK TABLES `Doctors_personals` WRITE;
/*!40000 ALTER TABLE `Doctors_personals` DISABLE KEYS */;
/*!40000 ALTER TABLE `Doctors_personals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Qualifications`
--

DROP TABLE IF EXISTS `Qualifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Qualifications` (
  `Doc_id` int(10) unsigned NOT NULL,
  `Acad` int(11) NOT NULL,
  KEY `fk_doc_id_acad` (`Doc_id`),
  KEY `fk_acad_id_acad` (`Acad`),
  CONSTRAINT `fk_doc_id_acad` FOREIGN KEY (`Doc_id`) REFERENCES `Doctor` (`Doc_id`),
  CONSTRAINT `fk_acad_id_acad` FOREIGN KEY (`Acad`) REFERENCES `Academics` (`aid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Qualifications`
--

LOCK TABLES `Qualifications` WRITE;
/*!40000 ALTER TABLE `Qualifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `Qualifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `floor_info`
--

DROP TABLE IF EXISTS `floor_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `floor_info` (
  `Building_no` int(11) NOT NULL,
  `floor_no` int(11) NOT NULL,
  `no_of_rooms` int(11) NOT NULL,
  KEY `fk_Building_floor` (`Building_no`),
  CONSTRAINT `fk_Building_floor` FOREIGN KEY (`Building_no`) REFERENCES `Building_info` (`Building_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `floor_info`
--

LOCK TABLES `floor_info` WRITE;
/*!40000 ALTER TABLE `floor_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `floor_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specialization`
--

DROP TABLE IF EXISTS `specialization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `specialization` (
  `sid` int(11) NOT NULL AUTO_INCREMENT,
  `sname` varchar(50) NOT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specialization`
--

LOCK TABLES `specialization` WRITE;
/*!40000 ALTER TABLE `specialization` DISABLE KEYS */;
/*!40000 ALTER TABLE `specialization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specializes_in`
--

DROP TABLE IF EXISTS `specializes_in`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `specializes_in` (
  `Doc_id` int(10) unsigned NOT NULL,
  `specialization` int(11) NOT NULL,
  KEY `fk_Doc_id` (`Doc_id`),
  KEY `fk_specializations` (`specialization`),
  CONSTRAINT `fk_Doc_id` FOREIGN KEY (`Doc_id`) REFERENCES `Doctor` (`Doc_id`),
  CONSTRAINT `fk_specializations` FOREIGN KEY (`specialization`) REFERENCES `specialization` (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specializes_in`
--

LOCK TABLES `specializes_in` WRITE;
/*!40000 ALTER TABLE `specializes_in` DISABLE KEYS */;
/*!40000 ALTER TABLE `specializes_in` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-04-30 16:32:06
