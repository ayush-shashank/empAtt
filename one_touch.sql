-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: one_touch
-- ------------------------------------------------------
-- Server version	8.0.20

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
  `username` varchar(100) NOT NULL,
  `password` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('root','root');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attendance` (
  `id` int NOT NULL,
  `date` date NOT NULL,
  `inTime` time DEFAULT '00:00:00',
  `outTime` time DEFAULT '00:00:00',
  `duration` time GENERATED ALWAYS AS (timediff(`outTime`,`inTime`)) VIRTUAL,
  PRIMARY KEY (`id`,`date`),
  CONSTRAINT `fk_emp_id` FOREIGN KEY (`id`) REFERENCES `employee` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance`
--

LOCK TABLES `attendance` WRITE;
/*!40000 ALTER TABLE `attendance` DISABLE KEYS */;
INSERT INTO `attendance` (`id`, `date`, `inTime`, `outTime`) VALUES (28,'2021-04-16',NULL,NULL),(31,'2021-04-16',NULL,NULL),(31,'2021-05-23','19:35:36','19:35:43'),(37,'2021-06-04','23:04:58','23:05:41');
/*!40000 ALTER TABLE `attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'Biotechnology Engineering'),(2,'Civil Engineering'),(3,'Computer Science and Engineering'),(4,'Electrical and Eectronics Engineering'),(5,'Electronics and Communication Engineering'),(6,'Information Science and Engineering'),(7,'Mechanical Engineering');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `department` varchar(150) NOT NULL,
  `bio` varchar(300) DEFAULT NULL,
  `isResetPassword` tinyint(1) DEFAULT '1',
  `encryptedPassword` varchar(250) DEFAULT NULL,
  `expectedInTime` time DEFAULT NULL,
  `expectedOutTime` time DEFAULT NULL,
  `startDate` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Ayush','CS','I am Iron Man',0,'newPass',NULL,NULL,NULL),(2,'Ayush Shashank','IS',NULL,0,NULL,NULL,NULL,NULL),(3,'Ayush-Shashank','CSE','Lorem',0,NULL,NULL,NULL,NULL),(4,'Ayush-Shashank','CSE','Lorem',0,NULL,NULL,NULL,NULL),(5,'Ayush-Shashank','CSE','Lorem',0,NULL,NULL,NULL,NULL),(6,'Ayush-Shashank','CSE','Lorem',0,NULL,NULL,NULL,NULL),(7,'Ayush-Shashank','CSE',NULL,0,NULL,NULL,NULL,NULL),(8,'Ayush-Shashank','CSE',NULL,0,NULL,NULL,NULL,NULL),(9,'Ayush-Shashank','CSE',NULL,0,NULL,NULL,NULL,NULL),(10,'Ayush-Shashank','CSE',NULL,0,NULL,NULL,NULL,NULL),(11,'Ayush-Shashank','CSE',NULL,0,NULL,NULL,NULL,NULL),(13,'Ayush-Shashank','CSE','Lorem',0,NULL,NULL,NULL,NULL),(14,'Ayush-Shashank','CSE',NULL,0,NULL,NULL,NULL,NULL),(15,'Ayush-Shashank','CSE','Lorem',0,NULL,NULL,NULL,NULL),(16,'Ayush-Shashank','CSE',NULL,0,NULL,NULL,NULL,NULL),(17,'Ayush-Shashank','CSE','Lorem',0,NULL,NULL,NULL,NULL),(18,'Ayush-Shashank','CSE',NULL,0,NULL,NULL,NULL,NULL),(19,'Ayush-Shashank','CSE','Lorem',0,NULL,NULL,NULL,NULL),(20,'Ayush-Shashank','CS','Lorem',0,NULL,NULL,NULL,NULL),(21,'Ayush-Shashank','CSE','Lorem',0,NULL,NULL,NULL,NULL),(23,'Ayush-Shashank','CSE','Lorem',0,NULL,NULL,NULL,NULL),(24,'Ayush-Shashank','CSE',NULL,0,NULL,NULL,NULL,NULL),(27,'Ayush Shashank','CSE','Lorem Ipsum',0,'jsdhgfsjdfhg',NULL,NULL,NULL),(28,'Ayush Shashank','IS','Lorem',0,'abc',NULL,NULL,NULL),(31,'Ayush Shashank','CS','Lorem Ipsum',1,NULL,NULL,NULL,NULL),(32,'Ayush-Shashank','CSE',NULL,1,NULL,NULL,NULL,NULL),(33,'Ayush Shashank','CS','Lorem Ipsum',1,NULL,NULL,NULL,NULL),(34,'Ayush-Shashank','IS','Lorem',1,NULL,'09:30:00','16:00:00',NULL),(35,'Ayush Shashank','IS','Lorem',0,NULL,'09:30:00','16:00:00','2021-06-10'),(36,'Ayush S Shashank','CS','abcd',1,NULL,'09:00:00','16:30:00','2021-06-04'),(37,'Aysh S Shashank','CS','abcdef',0,'abc','09:30:00','17:00:00','2021-06-04'),(38,'Ayush-Shashank','CSE',NULL,0,'abc',NULL,NULL,'2021-06-04'),(39,'Ayush Shashank','CS','Lorem Ipsum',1,NULL,NULL,NULL,'2021-06-04'),(40,'Ayush S Shashank','CS','aSDFHJ',1,NULL,'08:30:00','06:30:00','2021-06-05'),(41,'Ayush','CS','sdfdssdf',1,NULL,'00:00:00','01:01:00','2021-06-07'),(42,'A','BT','',1,NULL,'00:47:00','03:46:00','2021-06-07'),(43,'AA','BT','',1,NULL,'00:49:00','00:50:00','2021-06-07'),(44,'k','CS','',1,NULL,'00:00:00','00:00:00','2021-06-07'),(45,'Ayush','EC','',1,NULL,'00:00:00','04:57:00','2021-10-31'),(46,'fds','CV','',1,NULL,'00:00:00','00:00:00','2021-06-12'),(47,'g','CV','',1,NULL,'00:00:00','00:00:00','2021-06-11'),(48,'kj','CS','',1,NULL,'00:00:00','00:00:00','2021-06-15'),(49,'aaaa','EE','',1,NULL,'04:00:00','05:00:00','2021-06-15'),(50,'hgfh','CS',NULL,0,'abc',NULL,NULL,'2021-06-15');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'one_touch'
--
/*!50003 DROP FUNCTION IF EXISTS `decode_emp_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `decode_emp_id`(`id` VARCHAR(9)) RETURNS int
    DETERMINISTIC
BEGIN

RETURN TRIM(LEADING '0' FROM SUBSTR(`id`, 4));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `encode_emp_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `encode_emp_id`(`id` INT) RETURNS varchar(9) CHARSET utf8mb4
    DETERMINISTIC
BEGIN

RETURN CONCAT('EMP', LPAD(`id`, 4, 0));

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_employee` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_employee`(
	emp_name VARCHAR(100)
    , emp_dept VARCHAR(250)
    , emp_bio VARCHAR(300)
    , empInTime VARCHAR(20)
    , empOutTime VARCHAR(20)
    , empStartDate VARCHAR(20)
)
BEGIN

INSERT INTO `employee`(`name`, `department`, `bio`, `expectedInTime`, `expectedOutTime`, `startDate`)
VALUES (emp_name, emp_dept, emp_bio, empInTime, empOutTime, empStartDate);

SELECT ROW_COUNT() AS 'affectedRows', `encode_emp_id`(LAST_INSERT_ID()) AS 'empCode';

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `check_admin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `check_admin`(`user` VARCHAR(100), `pass` VARCHAR(250))
BEGIN

SET @pass:= (
	SELECT a.`password`
	FROM `admin` a
	WHERE a.username = `user`
);

IF(@pass=`pass`) THEN
	SELECT 1 AS 'CODE', 'Verified' AS 'MSG';
ELSEIF (@pass IS NOT NULL) THEN
	SELECT 0 AS 'CODE', 'Incorrect Password' AS 'MSG';
ELSE
	SELECT -1 AS 'CODE', 'Invalid User' AS 'MSG';
END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `check_employee` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `check_employee`(emp_code VARCHAR(9), encrypted_password VARCHAR(250))
BEGIN

DECLARE pass VARCHAR(250);
DECLARE	emp_name VARCHAR(100);
DECLARE emp_dept VARCHAR(150);
DECLARE emp_bio VARCHAR(300);
DECLARE is_reset_pass BIT;
DECLARE emp_in_time TIME;
DECLARE emp_out_time TIME;
DECLARE emp_start_date DATE;

SELECT e.`encryptedPassword`
	, e.`name`
    , e.`department`
    , e.`bio`
    , e.`isResetPassword`
    , e.`expectedInTime`
    , e.`expectedOutTime`
    , e.`startDate`
INTO pass, emp_name, emp_dept, emp_bio, is_reset_pass, emp_in_time, emp_out_time, emp_start_date
FROM `employee` e
WHERE e.id = `decode_emp_id`(emp_code);

IF(is_reset_pass = 1) THEN
	UPDATE `employee`
    SET `encryptedPassword` = encrypted_password, 
		`isResetPassword` = 0 
    WHERE id = `decode_emp_id`(emp_code);
    SELECT 1 AS 'CODE', 'Verified' AS 'msg', emp_name AS 'name', emp_dept AS 'dept', emp_in_time AS 'eInTime', emp_out_time AS 'eOutTime', DATE_FORMAT(emp_start_date,'%d-%m-%Y') AS 'startDate', emp_bio AS 'bio';
ELSEIF(pass = encrypted_password) THEN
	SELECT 1 AS 'CODE', 'Verified' AS 'msg', emp_name AS 'name', emp_dept AS 'dept', emp_in_time AS 'eInTime', emp_out_time AS 'eOutTime', DATE_FORMAT(emp_start_date,'%d-%m-%Y') AS 'startDate', emp_bio AS 'bio';
ELSEIF (pass IS NOT NULL) THEN
	SELECT 0 AS 'CODE', 'Incorrect Password' AS 'msg', NULL AS 'name', NULL AS 'dept', NULL AS 'eInTime', NULL AS 'eOutTime', NULL AS 'startDate', NULL AS 'bio';
ELSE
	SELECT -1 AS 'CODE', 'Invalid User' AS 'msg', NULL AS 'name', NULL AS 'dept', NULL AS 'eInTime', NULL AS 'eOutTime', NULL AS 'startDate', NULL AS 'bio';
END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_employee` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_employee`(emp_code VARCHAR(9))
BEGIN

DELETE FROM `employee`
WHERE id = `decode_emp_id`(emp_code);

SET @affectedRows := ROW_COUNT();

IF @affectedRows = 0 THEN
	SELECT 0 AS 'CODE', 'Employee not found' AS 'msg';
ELSEIF @affectedRows = 1 THEN
	SELECT 1 AS 'CODE', 'Employee deleted' AS 'msg';
ELSE 
	SELECT -1 AS 'CODE', 'Error occurred, check DB' AS 'msg';
END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_attendance` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_attendance`(emp_code VARCHAR(9), att_month INT, att_year INT)
BEGIN

SELECT DATE_FORMAT(`date`,'%d-%m-%Y') AS 'date'
	, `inTime`
    , `outTime`
    , `duration`
FROM `attendance`
WHERE `id` = `decode_emp_id`(emp_code)
	AND MONTH(`date`) = att_month
    AND YEAR(`date`) = att_year;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_employees` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_employees`()
BEGIN

SELECT `encode_emp_id`(`id`) AS 'empCode'
	, `name`
    , `department` AS 'dept'
    , `bio`
    , `isResetPassword` AS 'isResetPass'
    , `expectedInTime` AS 'eInTime'
    , `expectedOutTime` AS 'eOutTime'
    , DATE_FORMAT(`startDate`,'%d-%m-%Y') AS 'startDate'
FROM `employee`;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_stats_month` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_stats_month`(att_month INT, att_year INT)
BEGIN

SELECT DISTINCT(`encode_emp_id`(`id`)) AS 'empCode'
	, COUNT(`date`) AS 'Total Days'
    , TIME(SUM(`duration`)) AS 'Total Time'
FROM `attendance`
WHERE MONTH(`date`) = att_month
    AND YEAR(`date`) = att_year
GROUP BY `id`;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mark_attendance` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `mark_attendance`(emp_code VARCHAR(9))
BEGIN

INSERT IGNORE INTO `attendance`(`id`, `date`)
VALUES (`decode_emp_id`(emp_code), CURDATE());

IF ROW_COUNT() = 1 THEN
	SELECT 1 AS 'CODE', 'Attendance marked successfully' as 'msg';
ELSE
	SELECT 0 AS 'CODE', 'Attendance already marked' as 'msg';
END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mark_checkin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `mark_checkin`(emp_code VARCHAR(9))
BEGIN

DECLARE checkinTime TIME;
SET checkinTime := CURTIME();

INSERT IGNORE INTO `attendance`(`id`, `date`, `inTime`)
VALUES (`decode_emp_id`(emp_code), CURDATE(), checkinTime);

IF ROW_COUNT() = 1 THEN
	SELECT 1 AS 'CODE', 'Check-in successful' AS 'msg', checkinTime AS 'IST_time';
ELSE
	SELECT 0 AS 'CODE', 'Already checked-in today' AS 'msg', inTime AS 'IST_time'
    FROM `attendance`
    WHERE `id` = `decode_emp_id`(emp_code) AND `date` =  CURDATE();
END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mark_checkout` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `mark_checkout`(emp_code VARCHAR(9))
BEGIN

DECLARE checkoutTime TIME;
SET checkoutTime = (
	SELECT `outTime`
	FROM `attendance`
	WHERE `id`= `decode_emp_id`(emp_code) AND `date` = CURDATE()
);

IF checkoutTime IS NULL THEN
	SELECT -1 AS 'CODE', 'No check-in today' AS 'msg', NULL AS 'IST_time', NULL AS 'duration';
ELSEIF checkoutTime = '00:00:00' THEN
	SET checkoutTime= curtime();
	
    UPDATE `attendance`
	SET outTime = checkoutTime
	WHERE `id`= `decode_emp_id`(emp_code) AND `date` = CURDATE();
    
    SELECT 1 AS 'CODE', 'Check-out successful'  AS 'msg', checkoutTime AS 'IST_time', `duration`
	FROM `attendance`
    WHERE `id` = `decode_emp_id`(emp_code) AND `date` =  CURDATE();
ELSE
	SELECT 0 AS 'CODE', 'Already checked-out today' AS 'msg', `outTime` AS 'IST_time', `duration` 
    FROM `attendance`
    WHERE `id` = `decode_emp_id`(emp_code) AND `date` =  CURDATE();
END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_employee` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_employee`(emp_code VARCHAR(9), emp_dept VARCHAR(250), emp_bio VARCHAR(300), is_reset_pass BIT, emp_in_time TIME, emp_out_time TIME, emp_start_date VARCHAR(10))
BEGIN

UPDATE `employee`
SET `department` = emp_dept
	, `bio` = emp_bio
    , `isResetPassword` = is_reset_pass
    , `expectedInTime` = emp_in_time
    , `expectedOutTime` = emp_out_time
    , `startDate` = emp_start_date
WHERE id = `decode_emp_id`(emp_code);

SET @affectedRows:= ROW_COUNT();

IF @affectedRows = 0 THEN
	SELECT 0 AS 'CODE', 'Employee not found' as 'msg';
ELSEIF @affectedRows = 1 THEN
	SELECT 1 AS 'CODE', 'Employee updated' as 'msg',emp_start_date as date ;
ELSE 
	SELECT -1 AS 'CODE', 'Error occurred, check DB' as 'msg';
END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-07  3:44:39
