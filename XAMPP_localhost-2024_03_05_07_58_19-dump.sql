-- MariaDB dump 10.19  Distrib 10.4.28-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: ticket
-- ------------------------------------------------------
-- Server version	10.4.28-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `adminlogin`
--

DROP TABLE IF EXISTS `adminlogin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adminlogin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_email` varchar(255) DEFAULT NULL,
  `admin_password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adminlogin`
--

LOCK TABLES `adminlogin` WRITE;
/*!40000 ALTER TABLE `adminlogin` DISABLE KEYS */;
INSERT INTO `adminlogin` VALUES (1,'@admin','123456');
/*!40000 ALTER TABLE `adminlogin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login` (
  `NU_Email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`NU_Email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES ('john','efren');
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `student_Number` varchar(11) NOT NULL,
  PRIMARY KEY (`student_Number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studentlogin`
--

DROP TABLE IF EXISTS `studentlogin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `studentlogin` (
  `NU_Email` varchar(128) NOT NULL,
  `NU_Password` varchar(128) NOT NULL,
  `NU_ID` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`NU_Email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studentlogin`
--

LOCK TABLES `studentlogin` WRITE;
/*!40000 ALTER TABLE `studentlogin` DISABLE KEYS */;
INSERT INTO `studentlogin` VALUES ('anne@students.nation','12345',NULL,NULL,NULL,NULL),('anne@students.national','12345','12345678','Anne','Dones','Colocado'),('joyce@students.ational','1234567','nbnoib','jo','nihp','nnlok'),('joyce@students.national','123456789','20221234',NULL,NULL,NULL),('morty@students.national','grandparick','20211053',NULL,NULL,NULL);
/*!40000 ALTER TABLE `studentlogin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticketable`
--

DROP TABLE IF EXISTS `ticketable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticketable` (
  `ticket_ID` int(10) NOT NULL AUTO_INCREMENT,
  `student_Number` varchar(255) DEFAULT NULL,
  `first_Name` varchar(255) NOT NULL,
  `middle_Name` varchar(255) NOT NULL,
  `last_Name` varchar(255) NOT NULL,
  `email_Address` varchar(100) NOT NULL,
  `document_Type` varchar(50) NOT NULL,
  `number_of_Copies` varchar(255) NOT NULL,
  `purpose` varchar(255) NOT NULL,
  `special_Instruction` varchar(255) NOT NULL,
  `type_of_Payment` varchar(50) NOT NULL,
  `list_of_Requirements` mediumblob DEFAULT NULL,
  `date_of_Payment` date DEFAULT NULL,
  `total_amount_Paid` double(10,0) NOT NULL,
  `proof_of_Payment` mediumblob DEFAULT NULL,
  `ticket_Status` varchar(255) DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  `date_Time` datetime NOT NULL,
  `ticket_friendlyId` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ticket_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticketable`
--

LOCK TABLES `ticketable` WRITE;
/*!40000 ALTER TABLE `ticketable` DISABLE KEYS */;
INSERT INTO `ticketable` VALUES (9,'2021-100202','John','Efren','Viray','gannabanjv@students.national_u.edu.ph','Item 1','Item 1','Item 1','TOR Request Form.\nPlease contact me if the form is available for pickup:\nxxxx-xxx-xxxx','Item 1',NULL,'2024-03-02',1000,NULL,'Completed',NULL,'2024-03-02 17:52:48','20240009'),(10,'Morty C-132','Mortimer ','Chauncey','Smith','EvilMorty@gmail.com','Item 1','Item 1','Item 1','rick','Item 1',NULL,'2024-03-02',1000,NULL,'Pending',NULL,'2024-03-02 19:19:50','20240010'),(13,'137','Rick','C-137','Sanchez','PickleRick@gmail.com','Item 1','Item 1','Item 1','Afterwards, for several decades, Rick killed countless amounts of his alternate selves in his ongoing hunt for Rick Prime, before they surrendered and founded the Citadel of Ricks, with Rick overseeing its construction. ','Item 1',NULL,'2024-03-02',100000,NULL,'Pending',NULL,'2024-03-02 19:29:34','20240013'),(14,'3','3','3','3','3','Certificate of Course Description','3','Other','3','Choose Payment Method',NULL,NULL,3,NULL,'Pending',NULL,'2024-03-05 05:39:08','20240014'),(15,'3','3','3','3','3','Certificate of Enrollment','3','Scholarship/Educational Assistance','3','Choose Payment Method',NULL,NULL,3,NULL,'Rejected',NULL,'2024-03-05 05:40:53','20240015'),(16,'20221234','joyce','don','colocado','joyce@students.national','Certificate of English Medium','2','Scholarship/Educational Assistance','gdfhsdh','Bank Transfer',NULL,NULL,1000,NULL,'Pending',NULL,'2024-03-05 06:42:22','20240016'),(17,'12345678','joy','ann','don','jo daihhi','Certificate of Attendance - 157.00','2','Employment','tdfhdfh','Bank Transfer',NULL,NULL,145,NULL,'Pending',NULL,'2024-03-05 07:09:08','20240017'),(18,'12345678','joy','ann','don','jo daihhi','Certificate of Attendance - 157.00','2','Employment','tdfhdfh','Bank Transfer',NULL,NULL,145,NULL,'Pending',NULL,'2024-03-05 07:10:00','20240018'),(19,'20221234','a','a','a','a','Select your type of document','1','Select your Purpose','1','Choose Payment Method',NULL,NULL,1,NULL,'Pending',NULL,'2024-03-05 07:10:49','20240019'),(20,'20221234','a','a','a','a','Select your type of document','1','Select your Purpose','1','Choose Payment Method',NULL,NULL,1,NULL,'Pending',NULL,'2024-03-05 07:10:56','20240020'),(21,'nbnoib','jo','nihp','nnlok','joyce@students.ational','Certificate of Attendance - 157.00','2','Employment','hgjfhgfjkh','Choose Payment Method',NULL,NULL,1,NULL,'Pending',NULL,'2024-03-05 07:18:59','20240021'),(22,'nbnoib','jo','nihp','nnlok','joyce@students.ational','Select your type of document','3','Employment','fhujcuhjgcjhc','Bank Transfer',NULL,NULL,123,NULL,'Pending',NULL,'2024-03-05 07:19:46','20240022'),(23,'nbnoib','jo','nihp','nnlok','joyce@students.ational','Certificate of Attendance - 157.00','2','Employment','sdafgvdf','Bank Transfer',NULL,NULL,123,NULL,'Pending',NULL,'2024-03-05 07:20:19','20240023'),(24,'12345678','Anne','Dones','Colocado','anne@students.national','Certificate of Attendance - 157.00','1','Scholarship/Educational Assistance','fdhdhfgg','Bank Transfer',NULL,NULL,123,NULL,'Rejected',NULL,'2024-03-05 07:26:40','20240024'),(25,'12345678','Anne','Dones','Colocado','anne@students.national','Assigned Flowchart/Curriculum - 54.00','2','Scholarship/Educational Assistance','hgfjgfjg','Bank Transfer',NULL,NULL,1245,NULL,'Rejected',NULL,'2024-03-05 07:33:04','20240025'),(26,'12345678','Anne','Dones','Colocado','anne@students.national','Assigned Flowchart/Curriculum - 54.00','2','Employment','rgfghrdfg','Bank Transfer',NULL,NULL,1234,NULL,'Rejected','Insufficient Request','2024-03-05 07:47:28','20240026');
/*!40000 ALTER TABLE `ticketable` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-05  7:58:19
