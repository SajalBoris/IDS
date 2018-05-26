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
-- Table structure for table `Bills`
--

DROP TABLE IF EXISTS `Bills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Bills` (
  `bill_id` int(11) NOT NULL,
  `total` float NOT NULL,
  PRIMARY KEY (`bill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Bills`
--

LOCK TABLES `Bills` WRITE;
/*!40000 ALTER TABLE `Bills` DISABLE KEYS */;
/*!40000 ALTER TABLE `Bills` ENABLE KEYS */;
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
  CONSTRAINT `fk_dept` FOREIGN KEY (`Department_no`) REFERENCES `Department` (`dno`),
  CONSTRAINT `fk_Doc_type` FOREIGN KEY (`type`) REFERENCES `Doc_Category` (`cid`)
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
-- Table structure for table `Patient`
--

DROP TABLE IF EXISTS `Patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Patient` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `dob` date NOT NULL,
  `gender` char(1) NOT NULL,
  `address` varchar(150) DEFAULT NULL,
  `blood_group` varchar(4) DEFAULT 'unk',
  `phone_1` bigint(20) NOT NULL,
  `phone_2` bigint(20) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Patient`
--

LOCK TABLES `Patient` WRITE;
/*!40000 ALTER TABLE `Patient` DISABLE KEYS */;
INSERT INTO `Patient` VALUES (1,'ABC','0000-00-00','M','uyeekhdds','A+',1234567890,987654321,'mac@apple'),(2,'ABC','0000-00-00','M','uyeekhdds','A+',1234567890,987654321,'mac@apple');
/*!40000 ALTER TABLE `Patient` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger trg_patiend_insert before insert on Patient  for each row begin declare msg varchar(128); if new.pid <= 0 then set msg = concat('Error:Patient id should be > 0',cast(new.pid as char));elseif new.dob < 1880-01-01 then set msg = concat('Error:Patient dob< 1880-01-01',cast(new.dob as char));elseif new.dob > CURDATE() then set msg = concat('Error:Patient  dob> current date',cast(new.dob as char));elseif (blood_group!='unk' AND blood_group!='A+' AND blood_group!='A-' AND blood_group!='B+' AND blood_group!='B-' AND blood_group!='O+' AND blood_group!='O-' AND blood_group!='AB+' AND blood_group!='AB-' ) then set msg = concat('Error:Patient  blood group invalid',cast(new.blood_group as char)); signal sqlstate '45000' set message_text = msg; end if ; end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger trg_patiend_update before update on Patient  for each row begin declare msg varchar(128); if new.pid <= 0 then set msg = concat('Error:Patient id should be > 0',cast(new.pid as char));elseif new.dob < 1880-01-01 then set msg = concat('Error:Patient dob< 1880-01-01',cast(new.dob as char));elseif new.dob > CURDATE() then set msg = concat('Error:Patient  dob> current date',cast(new.dob as char));elseif (blood_group!='unk' AND blood_group!='A+' AND blood_group!='A-' AND blood_group!='B+' AND blood_group!='B-' AND blood_group!='O+' AND blood_group!='O-' AND blood_group!='AB+' AND blood_group!='AB-' ) then set msg = concat('Error:Patient  blood group invalid',cast(new.blood_group as char)); signal sqlstate '45000' set message_text = msg; end if ; end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
  CONSTRAINT `fk_acad_id_acad` FOREIGN KEY (`Acad`) REFERENCES `Academics` (`aid`),
  CONSTRAINT `fk_doc_id_acad` FOREIGN KEY (`Doc_id`) REFERENCES `Doctor` (`Doc_id`)
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
-- Table structure for table `bill_receipt`
--

DROP TABLE IF EXISTS `bill_receipt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_receipt` (
  `bill_id` int(11) NOT NULL,
  `repo_id` int(11) DEFAULT NULL,
  `pre_id` int(11) DEFAULT NULL,
  KEY `fk_bill_receipt_report` (`repo_id`),
  KEY `fk_bill_receipt_prescription` (`pre_id`),
  KEY `fk_bill_receipt_bill` (`bill_id`),
  CONSTRAINT `fk_bill_receipt_bill` FOREIGN KEY (`bill_id`) REFERENCES `Bills` (`bill_id`),
  CONSTRAINT `fk_bill_receipt_prescription` FOREIGN KEY (`pre_id`) REFERENCES `prescription` (`pre_id`),
  CONSTRAINT `fk_bill_receipt_report` FOREIGN KEY (`repo_id`) REFERENCES `report` (`report_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_receipt`
--

LOCK TABLES `bill_receipt` WRITE;
/*!40000 ALTER TABLE `bill_receipt` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill_receipt` ENABLE KEYS */;
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
-- Table structure for table `lab`
--

DROP TABLE IF EXISTS `lab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab` (
  `lab_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`lab_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab`
--

LOCK TABLES `lab` WRITE;
/*!40000 ALTER TABLE `lab` DISABLE KEYS */;
/*!40000 ALTER TABLE `lab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicine`
--

DROP TABLE IF EXISTS `medicine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medicine` (
  `medi_id` int(11) NOT NULL,
  `name` varchar(40) NOT NULL,
  `manufacturer` varchar(40) NOT NULL,
  PRIMARY KEY (`medi_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicine`
--

LOCK TABLES `medicine` WRITE;
/*!40000 ALTER TABLE `medicine` DISABLE KEYS */;
/*!40000 ALTER TABLE `medicine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicine_details`
--

DROP TABLE IF EXISTS `medicine_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medicine_details` (
  `medi_id` int(11) NOT NULL,
  `expiry_date` date NOT NULL,
  `batch_no` int(11) DEFAULT NULL,
  `price` float NOT NULL,
  `quantity_available` int(11) NOT NULL,
  KEY `fk_medicine_details_medicine` (`medi_id`),
  CONSTRAINT `fk_medicine_details_medicine` FOREIGN KEY (`medi_id`) REFERENCES `medicine` (`medi_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicine_details`
--

LOCK TABLES `medicine_details` WRITE;
/*!40000 ALTER TABLE `medicine_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `medicine_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prescription`
--

DROP TABLE IF EXISTS `prescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prescription` (
  `pre_id` int(11) NOT NULL,
  `status` char(1) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `doc_id` int(10) unsigned NOT NULL,
  `pre_link` blob,
  PRIMARY KEY (`pre_id`),
  KEY `fk_pre_patient` (`patient_id`),
  KEY `fk_pre_doctor` (`doc_id`),
  CONSTRAINT `fk_pre_patient` FOREIGN KEY (`patient_id`) REFERENCES `Patient` (`pid`),
  CONSTRAINT `fk_pre_doctor` FOREIGN KEY (`doc_id`) REFERENCES `Doctor` (`Doc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescription`
--

LOCK TABLES `prescription` WRITE;
/*!40000 ALTER TABLE `prescription` DISABLE KEYS */;
/*!40000 ALTER TABLE `prescription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report`
--

DROP TABLE IF EXISTS `report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report` (
  `report_id` int(11) NOT NULL AUTO_INCREMENT,
  `status` char(1) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `test_id` int(11) NOT NULL,
  `report_result` blob,
  PRIMARY KEY (`report_id`),
  KEY `fk_report_patient` (`patient_id`),
  KEY `fk_report_test` (`test_id`),
  CONSTRAINT `fk_report_patient` FOREIGN KEY (`patient_id`) REFERENCES `Patient` (`pid`),
  CONSTRAINT `fk_report_test` FOREIGN KEY (`test_id`) REFERENCES `test` (`test_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report`
--

LOCK TABLES `report` WRITE;
/*!40000 ALTER TABLE `report` DISABLE KEYS */;
/*!40000 ALTER TABLE `report` ENABLE KEYS */;
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

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test` (
  `test_id` int(11) NOT NULL AUTO_INCREMENT,
  `test_name` varchar(40) NOT NULL,
  `lab` int(11) NOT NULL,
  `cost` float NOT NULL,
  PRIMARY KEY (`test_id`),
  KEY `fk_test_lab` (`lab`),
  CONSTRAINT `fk_test_lab` FOREIGN KEY (`lab`) REFERENCES `lab` (`lab_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test`
--

LOCK TABLES `test` WRITE;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
/*!40000 ALTER TABLE `test` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-27  1:54:05
