CREATE DATABASE  IF NOT EXISTS `empatt` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `empatt`;
-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: empatt
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
  PRIMARY KEY (`id`,`date`),
  CONSTRAINT `fk_emp_id` FOREIGN KEY (`id`) REFERENCES `employee` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance`
--

LOCK TABLES `attendance` WRITE;
/*!40000 ALTER TABLE `attendance` DISABLE KEYS */;
INSERT INTO `attendance` VALUES (28,'2021-04-16');
/*!40000 ALTER TABLE `attendance` ENABLE KEYS */;
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Ayush','CS','I am Iron Man',0,'newPass'),(2,'Ayush Shashank','IS',NULL,0,NULL),(3,'Ayush-Shashank','CSE','Lorem',0,NULL),(4,'Ayush-Shashank','CSE','Lorem',0,NULL),(5,'Ayush-Shashank','CSE','Lorem',0,NULL),(6,'Ayush-Shashank','CSE','Lorem',0,NULL),(7,'Ayush-Shashank','CSE',NULL,0,NULL),(8,'Ayush-Shashank','CSE',NULL,0,NULL),(9,'Ayush-Shashank','CSE',NULL,0,NULL),(10,'Ayush-Shashank','CSE',NULL,0,NULL),(11,'Ayush-Shashank','CSE',NULL,0,NULL),(13,'Ayush-Shashank','CSE','Lorem',0,NULL),(14,'Ayush-Shashank','CSE',NULL,0,NULL),(15,'Ayush-Shashank','CSE','Lorem',0,NULL),(16,'Ayush-Shashank','CSE',NULL,0,NULL),(17,'Ayush-Shashank','CSE','Lorem',0,NULL),(18,'Ayush-Shashank','CSE',NULL,0,NULL),(19,'Ayush-Shashank','CSE','Lorem',0,NULL),(20,'Ayush-Shashank','CS','Lorem',0,NULL),(21,'Ayush-Shashank','CSE','Lorem',0,NULL),(23,'Ayush-Shashank','CSE','Lorem',0,NULL),(24,'Ayush-Shashank','CSE',NULL,0,NULL),(27,'Ayush Shashank','CSE','Lorem Ipsum',0,'jsdhgfsjdfhg'),(28,'Ayush Shashank','IS','Lorem',1,'abcd'),(29,'Ayush','CS','Lorem Ipsum Dor Mes Si',0,NULL),(30,'Ayush Shashank','CV','sf',0,NULL);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'empatt'
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
CREATE DEFINER=`root`@`localhost` FUNCTION `decode_emp_id`(`id` varchar(9)) RETURNS int
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
CREATE DEFINER=`root`@`localhost` FUNCTION `encode_emp_id`(`id` int) RETURNS varchar(9) CHARSET utf8mb4
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_employee`(emp_name varchar(100), emp_dept varchar(250), emp_bio varchar(300))
BEGIN

IF (emp_bio IS NULL) THEN
	INSERT INTO `empatt`.`employee` (`name`, `department`)
	VALUES (emp_name, emp_dept);
ELSE
	INSERT INTO `empatt`.`employee` (`name`, `department`, `bio`)
	VALUES (emp_name, emp_dept, emp_bio);
END IF;

SELECT ROW_COUNT() as affectedRows, `empatt`.`encode_emp_id`(LAST_INSERT_ID()) AS 'empCode';

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `basic_setup` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `basic_setup`()
BEGIN

-- create database empAtt;
-- use empAtt;

CREATE TABLE `employee` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `department` varchar(150) NOT NULL,
  `bio` varchar(300) DEFAULT NULL,
  `isResetPassword` BIT DEFAULT 0
);

create table `admin`(
	id int PRIMARY KEY AUTO_INCREMENT,
    `name` varchar(100),
    `password` varchar(250)
);

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

SET @pass:= (SELECT a.`password`
	FROM `empatt`.`admin` a
	WHERE a.username=`user`
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `check_employee`(emp_code varchar(9), encrypted_password varchar(250))
BEGIN

DECLARE pass varchar(250);
DECLARE	emp_name varchar(100);
DECLARE emp_dept varchar(150);
DECLARE emp_bio varchar(300);
DECLARE is_reset_pass bit;
    
SELECT e.`encryptedPassword`,
	e.`name`,
    e.`department`,
    e.`bio`,
    e.`isResetPassword`
INTO pass, emp_name, emp_dept, emp_bio, is_reset_pass
FROM `empatt`.`employee` e
WHERE e.id = `empatt`.decode_emp_id(emp_code);

IF(is_reset_pass = 1) THEN
	UPDATE `empatt`.`employee`
    SET `encryptedPassword` = encrypted_password, 
		`isResetPassword` = 0 
    WHERE id = `empatt`.decode_emp_id(emp_code);
    SELECT 1 AS 'CODE', 'Verified' AS 'msg', emp_name as 'name', emp_dept as 'dept', emp_bio as 'bio';
ELSEIF(pass = encrypted_password) THEN
	SELECT 1 AS 'CODE', 'Verified' AS 'msg', emp_name as 'name', emp_dept as 'dept', emp_bio as 'bio';
ELSEIF (pass IS NOT NULL) THEN
	SELECT 0 AS 'CODE', 'Incorrect Password' AS 'msg', null as 'name', null as 'dept', null as 'bio';
ELSE
	SELECT -1 AS 'CODE', 'Invalid User' AS 'msg', null as 'name', null as 'dept', null as 'bio';
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_employee`(emp_code varchar(9))
BEGIN

DELETE FROM `empatt`.`employee`
WHERE id=`empatt`.`decode_emp_id`(emp_code);

SET @affectedRows:= ROW_COUNT();

IF @affectedRows = 0 THEN
	SELECT 0 AS 'CODE', 'Employee not found' as 'msg';
ELSEIF @affectedRows = 1 THEN
	SELECT 1 AS 'CODE', 'Employee deleted' as 'msg';
ELSE 
	SELECT -1 AS 'CODE', 'Error occurred. Check DB' as 'msg';
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_attendance`(emp_code varchar(9), att_month int, att_year int)
BEGIN

SELECT date_format(`date`,'%d-%m-%Y') AS `date`
FROM `empatt`.`attendance`
WHERE `id`= `empatt`.`decode_emp_id`(emp_code)
	AND month(`date`) = att_month
    AND year(`date`) = att_year;

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

SELECT `empatt`.`encode_emp_id`(`id`) AS 'empCode',
	`name`,
	`department` AS 'dept',
    `bio`,
    `isResetPassword` AS 'isResetPass'
FROM `empatt`.`employee`;

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
CREATE DEFINER=`root`@`localhost` PROCEDURE `mark_attendance`(emp_code varchar(9))
BEGIN

INSERT IGNORE INTO `empatt`.`attendance`
VALUES (`empatt`.`decode_emp_id`(emp_code), curdate());

IF row_count() = 1 THEN
	SELECT 1 AS CODE, 'Attendance marked successfully' as msg;
ELSE
	SELECT 0 AS CODE, 'Attendance already marked' as msg;
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_employee`(emp_code varchar(9), emp_dept varchar(250), emp_bio varchar(300), is_reset_pass bit)
BEGIN

UPDATE `empatt`.`employee`
SET `department` = emp_dept,
	`bio` = emp_bio,
    `isResetPassword` = is_reset_pass
WHERE id = `empatt`.`decode_emp_id`(emp_code);

SET @affectedRows:= ROW_COUNT();

IF @affectedRows = 0 THEN
	SELECT 0 AS 'CODE', 'Employee not found' as 'msg';
ELSEIF @affectedRows = 1 THEN
	SELECT 1 AS 'CODE', 'Employee updated' as 'msg';
ELSE 
	SELECT -1 AS 'CODE', 'Error occurred. Check DB' as 'msg';
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

-- Dump completed on 2021-04-16 20:38:55
