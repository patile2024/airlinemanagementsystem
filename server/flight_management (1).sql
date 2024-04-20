-- MySQL dump 10.13  Distrib 8.0.36, for macos14 (x86_64)
--
-- Host: localhost    Database: airport_management
-- ------------------------------------------------------
-- Server version	8.3.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `admin_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `password` varchar(10) NOT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'test1','12345'),(2,'test2','fast123'),(3,'test3','notfast123'),(4,'test4','yesfast123');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AIRPLANE`
--

DROP TABLE IF EXISTS `AIRPLANE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AIRPLANE` (
  `airplane_id` int NOT NULL AUTO_INCREMENT,
  `max_seats` int NOT NULL,
  PRIMARY KEY (`airplane_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AIRPLANE`
--

LOCK TABLES `AIRPLANE` WRITE;
/*!40000 ALTER TABLE `AIRPLANE` DISABLE KEYS */;
INSERT INTO `AIRPLANE` VALUES (41,100),(42,100),(43,300),(44,100),(45,300),(46,100),(47,100),(48,300),(49,100),(50,300);
/*!40000 ALTER TABLE `AIRPLANE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `airplanes`
--

DROP TABLE IF EXISTS `airplanes`;
/*!50001 DROP VIEW IF EXISTS `airplanes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `airplanes` AS SELECT 
 1 AS `airplane_id`,
 1 AS `max_seats`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Airport`
--

DROP TABLE IF EXISTS `Airport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Airport` (
  `airport_code` varchar(3) NOT NULL,
  `airport_name` varchar(100) DEFAULT NULL,
  `city` varchar(85) DEFAULT NULL,
  `gate_no` int DEFAULT NULL,
  PRIMARY KEY (`airport_code`),
  KEY `FK_AIRPORTCODE` (`gate_no`),
  CONSTRAINT `FK_AIRPORTCODE` FOREIGN KEY (`gate_no`) REFERENCES `GATES` (`gate_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Airport`
--

LOCK TABLES `Airport` WRITE;
/*!40000 ALTER TABLE `Airport` DISABLE KEYS */;
INSERT INTO `Airport` VALUES ('ATL','Atlanta Airport','Atlanta',70),('BOS','Boston Airport','Boston',75),('CLT','Charlotte Airport','Charlotte',72),('DEN','Denver Airport','Denver',73),('EWR','Newark Airport','Newark',74),('KHI','Karachi Airport','Karachi',66),('LAS','Las Vegas Airport','Las Vegas',68),('LAX','Los Angeles Airport','Los Angeles',66),('LHR','Lahore Airport','Lahore',68),('NYU','Newyork Airport','Newyork',69);
/*!40000 ALTER TABLE `Airport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `airports`
--

DROP TABLE IF EXISTS `airports`;
/*!50001 DROP VIEW IF EXISTS `airports`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `airports` AS SELECT 
 1 AS `airport_code`,
 1 AS `airport_name`,
 1 AS `city`,
 1 AS `gate_no`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `BOOKING`
--

DROP TABLE IF EXISTS `BOOKING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BOOKING` (
  `client_id` int DEFAULT NULL,
  `airport_code` varchar(3) DEFAULT NULL,
  `ticket_id` int DEFAULT NULL,
  `flight_no` int DEFAULT NULL,
  `admin_id` int DEFAULT NULL,
  `fares` float DEFAULT NULL,
  KEY `FK_CLIENTID` (`client_id`),
  KEY `FK_AIRPORTCODE_B` (`airport_code`),
  KEY `FK_TicketID` (`ticket_id`),
  KEY `FK_FLIGHTNO` (`flight_no`),
  KEY `FK_ADMINID` (`admin_id`),
  CONSTRAINT `FK_ADMINID` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`),
  CONSTRAINT `FK_AIRPORTCODE_B` FOREIGN KEY (`airport_code`) REFERENCES `Airport` (`airport_code`),
  CONSTRAINT `FK_CLIENTID` FOREIGN KEY (`client_id`) REFERENCES `CLIENTS` (`client_id`),
  CONSTRAINT `FK_FLIGHTNO` FOREIGN KEY (`flight_no`) REFERENCES `FLIGHT` (`flight_no`),
  CONSTRAINT `FK_TicketID` FOREIGN KEY (`ticket_id`) REFERENCES `Ticket` (`ticket_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BOOKING`
--

LOCK TABLES `BOOKING` WRITE;
/*!40000 ALTER TABLE `BOOKING` DISABLE KEYS */;
/*!40000 ALTER TABLE `BOOKING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!50001 DROP VIEW IF EXISTS `bookings`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `bookings` AS SELECT 
 1 AS `client_id`,
 1 AS `airport_code`,
 1 AS `ticket_id`,
 1 AS `flight_no`,
 1 AS `fares`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `client`
--

DROP TABLE IF EXISTS `client`;
/*!50001 DROP VIEW IF EXISTS `client`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `client` AS SELECT 
 1 AS `client_id`,
 1 AS `fname`,
 1 AS `mname`,
 1 AS `lname`,
 1 AS `phone`,
 1 AS `email`,
 1 AS `passport`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `client_id` int NOT NULL AUTO_INCREMENT,
  `fname` varchar(25) NOT NULL,
  `mname` varchar(25) DEFAULT NULL,
  `lname` varchar(25) NOT NULL,
  `phone` varchar(14) NOT NULL,
  `email` varchar(40) NOT NULL,
  `passport` varchar(40) NOT NULL,
  `password` varchar(25) NOT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,'tes1','le','test1','+923317534906','test1@GMAIL.COM','123',''),(2,'test2',NULL,'test1','+923317534907','test2@HOTMAIL.COM','124',''),(3,'test3','tran','test1','+923317534908','test3@YAHOO.COM','125',''),(4,'test4',NULL,'test1','+443317534909','test4@GMAIL.COM','126',''),(5,'test5',NULL,'test1','+1233317534910','test5@GMAIL.COM','127',''),(6,'test6','hoang','test1','+443317534911','test6@OUTLOOK.COM','128',''),(7,'test7','le','test1','+9783317534912','test7@GMAIL.COM','129',''),(8,'test8',NULL,'test1','+923317534913','test8@GMAIL.COM','130',''),(9,'test9',NULL,'test1','+943317534914','test9@GMAIL.COM','131',''),(10,'test10','manh','test1','+923317534915','test110@GMAIL.COM','132','');
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CUSTOMER_REVIEW`
--

DROP TABLE IF EXISTS `CUSTOMER_REVIEW`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CUSTOMER_REVIEW` (
  `client_id` int NOT NULL,
  `review` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CUSTOMER_REVIEW`
--

LOCK TABLES `CUSTOMER_REVIEW` WRITE;
/*!40000 ALTER TABLE `CUSTOMER_REVIEW` DISABLE KEYS */;
INSERT INTO `CUSTOMER_REVIEW` VALUES (1,'Good'),(2,'Bad'),(3,'Satisfactory'),(4,'Good'),(5,'Bad'),(6,'Good'),(7,'Bad'),(8,'Adequate'),(9,'Satisfactory'),(10,'Satisfactory'),(38,'Hello');
/*!40000 ALTER TABLE `CUSTOMER_REVIEW` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flight`
--

DROP TABLE IF EXISTS `flight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flight` (
  `flight_no` int NOT NULL,
  `schedule_id` int NOT NULL,
  `flightStatus_id` int NOT NULL,
  `airplane_id` int NOT NULL,
  `fares` int DEFAULT NULL,
  PRIMARY KEY (`flight_no`),
  KEY `FK_SCHEDULEID` (`schedule_id`),
  KEY `FK_FLIGHTSTATUSID` (`flightStatus_id`),
  KEY `FK_AIRPLANEID` (`airplane_id`),
  CONSTRAINT `FK_AIRPLANEID` FOREIGN KEY (`airplane_id`) REFERENCES `AIRPLANE` (`airplane_id`),
  CONSTRAINT `FK_FLIGHTSTATUSID` FOREIGN KEY (`flightStatus_id`) REFERENCES `FlightStatus` (`flightStatus_id`),
  CONSTRAINT `FK_SCHEDULEID` FOREIGN KEY (`schedule_id`) REFERENCES `SCHEDULE` (`schedule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flight`
--

LOCK TABLES `flight` WRITE;
/*!40000 ALTER TABLE `flight` DISABLE KEYS */;
INSERT INTO `flight` VALUES (31,51,61,41,1000),(32,51,64,45,1001),(33,56,64,47,1002),(34,56,64,47,1003),(35,55,63,42,1004),(36,58,65,43,1005),(37,59,62,43,1006),(38,55,65,45,1007),(39,59,61,49,1008),(40,60,65,50,1009),(42,62,64,45,1010);
/*!40000 ALTER TABLE `flight` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FlightBooking`
--

DROP TABLE IF EXISTS `FlightBooking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FlightBooking` (
  `fb_id` int NOT NULL AUTO_INCREMENT,
  `departure` varchar(30) NOT NULL,
  `arrival` varchar(30) NOT NULL,
  `departureDate` date NOT NULL,
  `returnDate` date NOT NULL,
  `class` varchar(15) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `flight_no` int DEFAULT NULL,
  PRIMARY KEY (`fb_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FlightBooking`
--

LOCK TABLES `FlightBooking` WRITE;
/*!40000 ALTER TABLE `FlightBooking` DISABLE KEYS */;
/*!40000 ALTER TABLE `FlightBooking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `flights`
--

DROP TABLE IF EXISTS `flights`;
/*!50001 DROP VIEW IF EXISTS `flights`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `flights` AS SELECT 
 1 AS `flight_no`,
 1 AS `schedule_id`,
 1 AS `flightStatus_id`,
 1 AS `airplane_id`,
 1 AS `fares`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `FlightStatus`
--

DROP TABLE IF EXISTS `FlightStatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FlightStatus` (
  `flightStatus_id` int NOT NULL AUTO_INCREMENT,
  `status` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`flightStatus_id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FlightStatus`
--

LOCK TABLES `FlightStatus` WRITE;
/*!40000 ALTER TABLE `FlightStatus` DISABLE KEYS */;
INSERT INTO `FlightStatus` VALUES (61,'Departed'),(62,'Landed'),(63,'Delayed'),(64,'Boarding'),(65,'On Time');
/*!40000 ALTER TABLE `FlightStatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `flightstatuses`
--

DROP TABLE IF EXISTS `flightstatuses`;
/*!50001 DROP VIEW IF EXISTS `flightstatuses`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `flightstatuses` AS SELECT 
 1 AS `flightStatus_id`,
 1 AS `status`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `gate`
--

DROP TABLE IF EXISTS `gate`;
/*!50001 DROP VIEW IF EXISTS `gate`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `gate` AS SELECT 
 1 AS `gate_no`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Gates`
--

DROP TABLE IF EXISTS `Gates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Gates` (
  `gate_no` int NOT NULL,
  PRIMARY KEY (`gate_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Gates`
--

LOCK TABLES `Gates` WRITE;
/*!40000 ALTER TABLE `Gates` DISABLE KEYS */;
INSERT INTO `Gates` VALUES (66),(67),(68),(69),(70),(71),(72),(73),(74),(75);
/*!40000 ALTER TABLE `Gates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!50001 DROP VIEW IF EXISTS `reviews`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `reviews` AS SELECT 
 1 AS `client_id`,
 1 AS `review`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `SCHEDULE`
--

DROP TABLE IF EXISTS `SCHEDULE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SCHEDULE` (
  `schedule_id` int NOT NULL AUTO_INCREMENT,
  `departure_time` varchar(30) NOT NULL,
  `arrival_time` varchar(30) NOT NULL,
  `duration_time` float DEFAULT NULL,
  PRIMARY KEY (`schedule_id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SCHEDULE`
--

LOCK TABLES `SCHEDULE` WRITE;
/*!40000 ALTER TABLE `SCHEDULE` DISABLE KEYS */;
INSERT INTO `SCHEDULE` VALUES (51,'3-Jul-2023 12:30:00','3-Jul-2023 1:30:00',NULL),(52,'3-Sep-2023 4:30:00','4-Sep-2023 4:30:00',NULL),(53,'5-Jan-2024 1:50:00','5-Jan-2023 1:30:00',NULL),(54,'6-Feb-2023 5:30:00','6-Feb-2023 8:30:00',NULL),(55,'18-Jul-2025 2:00:00','18-Jul-2025 2:30:00',NULL),(56,'3-Aug-2025 10:30:00','3-Aug-2025 11:30:00',NULL),(57,'6-Feb-2023 9:30:00','7-Feb-2023 1:30:00',NULL),(58,'2-Jul-2023 6:30:00','2-Jul-2023 9:30:00',NULL),(59,'1-Jul-2023 1:30:00','1-Jul-2023 3:30:00',NULL),(60,'9-Jul-2023 5:30:00','9-Jul-2023 6:30:00',NULL),(61,'2022-12-07 5:30:00','2022-12-07 6:30:00',NULL),(62,'2022-12-07 1:30:00','2022-12-07 3:30:00',NULL);
/*!40000 ALTER TABLE `SCHEDULE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `schedules`
--

DROP TABLE IF EXISTS `schedules`;
/*!50001 DROP VIEW IF EXISTS `schedules`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `schedules` AS SELECT 
 1 AS `schedule_id`,
 1 AS `departure_time`,
 1 AS `arrival_time`,
 1 AS `duration_time`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `TempSeatGen`
--

DROP TABLE IF EXISTS `TempSeatGen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TempSeatGen` (
  `gen_id` int NOT NULL AUTO_INCREMENT,
  `nm` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`gen_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TempSeatGen`
--

LOCK TABLES `TempSeatGen` WRITE;
/*!40000 ALTER TABLE `TempSeatGen` DISABLE KEYS */;
INSERT INTO `TempSeatGen` VALUES (1,'A01'),(2,'D01'),(3,'E21'),(4,'F21'),(5,'G31'),(6,'H01'),(7,'I01'),(8,'J01'),(9,'K01');
/*!40000 ALTER TABLE `TempSeatGen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket` (
  `ticket_id` int NOT NULL AUTO_INCREMENT,
  `seat_no` varchar(3) DEFAULT NULL,
  `departure_time` varchar(30) DEFAULT NULL,
  `gate_no` int DEFAULT NULL,
  `airport_code` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`ticket_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES (1,'62',NULL,NULL,NULL),(11,'A01','3-Jul-2023 12:30:00',66,'LAX'),(12,'D01','1-Jul-2023 1:30:00',67,'KHI'),(13,'E21','5-Jan-2024 1:50:00',67,'LHR'),(14,'F31','1-Jul-2023 1:30:00',68,'NYU'),(15,'G01','18-Jul-2025 2:00:00',66,'ATL'),(16,'H01','3-Aug-2025 10:30:00',66,'BOS'),(17,'I01','6-Feb-2023 9:30:00',67,'CLT'),(18,'J01','2-Jul-2023 6:30:00',68,'DEN'),(19,'K01','1-Jul-2023 1:30:00',69,'EWR'),(20,'L01','1-Jul-2023 1:30:00',70,'LAX');
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `tickets`
--

DROP TABLE IF EXISTS `tickets`;
/*!50001 DROP VIEW IF EXISTS `tickets`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `tickets` AS SELECT 
 1 AS `ticket_id`,
 1 AS `seat_no`,
 1 AS `departure_time`,
 1 AS `gate_no`,
 1 AS `airport_code`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `airplanes`
--

/*!50001 DROP VIEW IF EXISTS `airplanes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `airplanes` AS select `airplane`.`airplane_id` AS `airplane_id`,`airplane`.`max_seats` AS `max_seats` from `airplane` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `airports`
--

/*!50001 DROP VIEW IF EXISTS `airports`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `airports` AS select `airport`.`airport_code` AS `airport_code`,`airport`.`airport_name` AS `airport_name`,`airport`.`city` AS `city`,`airport`.`gate_no` AS `gate_no` from `airport` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `bookings`
--

/*!50001 DROP VIEW IF EXISTS `bookings`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `bookings` AS select `booking`.`client_id` AS `client_id`,`booking`.`airport_code` AS `airport_code`,`booking`.`ticket_id` AS `ticket_id`,`booking`.`flight_no` AS `flight_no`,`booking`.`fares` AS `fares` from `booking` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `client`
--

/*!50001 DROP VIEW IF EXISTS `client`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `client` AS select `clients`.`client_id` AS `client_id`,`clients`.`fname` AS `fname`,`clients`.`mname` AS `mname`,`clients`.`lname` AS `lname`,`clients`.`phone` AS `phone`,`clients`.`email` AS `email`,`clients`.`passport` AS `passport` from `clients` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `flights`
--

/*!50001 DROP VIEW IF EXISTS `flights`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `flights` AS select `flight`.`flight_no` AS `flight_no`,`flight`.`schedule_id` AS `schedule_id`,`flight`.`flightStatus_id` AS `flightStatus_id`,`flight`.`airplane_id` AS `airplane_id`,`flight`.`fares` AS `fares` from `flight` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `flightstatuses`
--

/*!50001 DROP VIEW IF EXISTS `flightstatuses`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `flightstatuses` AS select `flightstatus`.`flightStatus_id` AS `flightStatus_id`,`flightstatus`.`status` AS `status` from `flightstatus` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `gate`
--

/*!50001 DROP VIEW IF EXISTS `gate`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `gate` AS select `gates`.`gate_no` AS `gate_no` from `gates` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `reviews`
--

/*!50001 DROP VIEW IF EXISTS `reviews`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `reviews` AS select `customer_review`.`client_id` AS `client_id`,`customer_review`.`review` AS `review` from `customer_review` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `schedules`
--

/*!50001 DROP VIEW IF EXISTS `schedules`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `schedules` AS select `schedule`.`schedule_id` AS `schedule_id`,`schedule`.`departure_time` AS `departure_time`,`schedule`.`arrival_time` AS `arrival_time`,`schedule`.`duration_time` AS `duration_time` from `schedule` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `tickets`
--

/*!50001 DROP VIEW IF EXISTS `tickets`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `tickets` AS select `ticket`.`ticket_id` AS `ticket_id`,`ticket`.`seat_no` AS `seat_no`,`ticket`.`departure_time` AS `departure_time`,`ticket`.`gate_no` AS `gate_no`,`ticket`.`airport_code` AS `airport_code` from `ticket` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-16  9:17:40
