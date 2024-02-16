CREATE DATABASE  IF NOT EXISTS `book_my_charge_station` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `book_my_charge_station`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: book_my_charge_station
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `city_master`
--

DROP TABLE IF EXISTS `city_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city_master` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `state_id` int DEFAULT NULL,
  `is_deleted` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city_master`
--

LOCK TABLES `city_master` WRITE;
/*!40000 ALTER TABLE `city_master` DISABLE KEYS */;
INSERT INTO `city_master` VALUES (1,'Pune',1,0),(2,'Mumbai',1,0),(3,'Nashik',1,0),(4,'Jalandhar',2,0),(5,'Amritsar',2,0),(6,'Bathinda',2,0),(7,'Alwar',3,0),(8,'Ajmer',3,0),(9,'Kota',3,0);
/*!40000 ALTER TABLE `city_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_station_mapping`
--

DROP TABLE IF EXISTS `customer_station_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_station_mapping` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `owner_station_mapping_id` int DEFAULT NULL,
  `razorpay_payment_id` varchar(500) DEFAULT '0',
  `razorpay_order_id` varchar(500) DEFAULT NULL,
  `razorpay_signature` varchar(1000) DEFAULT NULL,
  `amount_paid` varchar(45) DEFAULT NULL,
  `currency` varchar(45) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_station_mapping`
--

LOCK TABLES `customer_station_mapping` WRITE;
/*!40000 ALTER TABLE `customer_station_mapping` DISABLE KEYS */;
INSERT INTO `customer_station_mapping` VALUES (1,NULL,2,'0',NULL,NULL,'120','INR','2023-11-05 12:30:34'),(2,12,1,'pay_MwhBCyXjdoHFGl','order_MwhAhCHTVQryH1','c25cb6b20020c231ae4c57edf1142e9958008bfdf2f5da76824da6d78793ab7b','100','INR','2023-11-05 12:30:34'),(3,12,2,'pay_MwhIqIVhIsfOcc','order_MwhIMyLFoNnpm2','35551350c2f40b85f842e212c956ba0ad7c6d1f8c8df656559f7e0ad54c55454','1476','INR','2023-11-05 12:30:34'),(4,2,1,'pay_MxZVRbfcOASx11','order_MxZTmTdW9QBHhq','10f2ff714411280a9736475c53a4f95359c4bda1f020a104f95193b35f9ca11a','1120','INR','2023-11-07 17:11:53'),(5,2,1,'pay_NO6g2EaNT5UDl2','order_NO6e2EsknYaWlX','9df9119b54031bef3e5839ee497ece7150b5354a4ed5864ea111b5314ebb3982','340','INR','2024-01-13 18:32:36'),(6,13,3,'pay_NXU9NXIpAVlep9','order_NXU7vVe6HVniZh','f5f0cffecf99a8ea9142082cc48cc8a0c7795e48c7af42bf41580fd035cb3844','750','INR','2024-02-06 11:21:49'),(7,2,8,'0','order_NYssHvY5NOcVeX',NULL,'2000','INR','2024-02-10 00:13:25'),(8,2,2,'pay_NYtKHWamUuHcRe','order_NYtIesVJNePQ46','7045910b2551fbe04408e3bd8d99dd6833daae8854e8269b3cd3de32c98f2c98','1200','INR','2024-02-10 00:38:23'),(9,2,12,'0','order_NbFUx3OjvAjswZ',NULL,'500','INR','2024-02-15 23:39:17'),(10,2,7,'pay_NbFmQOBJVpa2xV','order_NbFgWkqoXQXCmM','a239e9fd2e22d4a8cdb7fd2a6c7ed3dc5664f1b029746652d3bff6340292495f','5200','INR','2024-02-15 23:50:14'),(11,2,7,'pay_NbFqL5F0rmPutw','order_NbFpDoFVGIDQew','80f8bf91384b5d8183af4913497d22b47aba62304888d42fc835f77f23314d5b','2600','INR','2024-02-15 23:58:28');
/*!40000 ALTER TABLE `customer_station_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `feedback` text,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (1,2,'Hello','2023-09-23 13:29:07'),(2,4,'Timepass','2024-01-13 23:08:39'),(3,2,'good station','2024-02-16 00:00:46');
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `owner_station_mapping`
--

DROP TABLE IF EXISTS `owner_station_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `owner_station_mapping` (
  `id` int NOT NULL AUTO_INCREMENT,
  `owner_id` int DEFAULT NULL,
  `station_name` varchar(50) DEFAULT NULL,
  `time_slot` varchar(50) DEFAULT NULL,
  `address` text,
  `state_id` int DEFAULT NULL,
  `city_id` int DEFAULT NULL,
  `pincode` varchar(45) DEFAULT NULL,
  `date_slot` varchar(50) DEFAULT NULL,
  `vehicle_type_id` int DEFAULT NULL,
  `cost_per_unit` varchar(45) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `owner_station_mapping`
--

LOCK TABLES `owner_station_mapping` WRITE;
/*!40000 ALTER TABLE `owner_station_mapping` DISABLE KEYS */;
INSERT INTO `owner_station_mapping` VALUES (1,4,'ABC','12:10 PM','Hadpsar',1,1,'411028','2024-01-01',1,'10',0),(2,4,'abc2','4:20 PM','Akurdi',1,1,'411035','2024-01-01',1,'12',0),(3,5,'abc3','10:10 AM','Wadala',2,4,'411028','2024-01-01',1,'15',0),(4,4,'s1add1','18:30:00','AmritNagar',2,5,'411028','2024-01-01',1,'13',0),(5,4,'s1add2','18:30:00','Aamala',3,7,'411028','2024-01-01',2,'12',0),(6,4,'s1add3','18:30:00','Paltan Bazar',3,8,'411028','2024-01-01',4,'12',0),(7,10,'TS1','19:50:00','Rampura',3,9,'42323322','2024-01-01',4,'52',0),(8,11,'Test','17:35:00','Hadapsar, Pune',1,1,'411028','2024-01-01',3,'10',0),(9,4,'Test','15:30:00','Pune',1,1,'411028','2024-01-01',3,'80',0),(10,5,'xyz56','09:00:00','Sadashiv peth',1,1,'411005','2024-02-07',1,'13',0),(11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(12,4,'aaa','15:30:00','PASHAN',1,1,'411009','2024-02-15',3,'10',0),(13,4,'aaa','15:30:00','PASHAN',1,1,'411009','2024-02-15',3,'10',0),(14,5,'BBB','15:30:00','ZZZ',1,1,'411019','2024-02-15',3,'10',0),(15,6,'vc','15:30:00','aaa',1,1,'411019','2024-02-15',3,'10',0);
/*!40000 ALTER TABLE `owner_station_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_history`
--

DROP TABLE IF EXISTS `payment_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_id` varchar(45) DEFAULT NULL,
  `payment_gateway` varchar(45) DEFAULT NULL,
  `transaction_id` varchar(500) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `amount` varchar(45) DEFAULT NULL,
  `station_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_history`
--

LOCK TABLES `payment_history` WRITE;
/*!40000 ALTER TABLE `payment_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_master`
--

DROP TABLE IF EXISTS `role_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_master` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role` varchar(45) DEFAULT NULL,
  `is_deleted` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_master`
--

LOCK TABLES `role_master` WRITE;
/*!40000 ALTER TABLE `role_master` DISABLE KEYS */;
INSERT INTO `role_master` VALUES (1,'Admin',0),(2,'Station Owner',0),(3,'Customer',0);
/*!40000 ALTER TABLE `role_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `state_master`
--

DROP TABLE IF EXISTS `state_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `state_master` (
  `id` int NOT NULL AUTO_INCREMENT,
  `state` varchar(50) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state_master`
--

LOCK TABLES `state_master` WRITE;
/*!40000 ALTER TABLE `state_master` DISABLE KEYS */;
INSERT INTO `state_master` VALUES (1,'Maharashtra',0),(2,'Punjab',0),(3,'Rajasthan',0),(4,'Madhya Pradesh',0),(5,'Gujrat',0),(6,'Goa',0);
/*!40000 ALTER TABLE `state_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `role_id` int DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0',
  `address` text,
  `pincode` varchar(100) DEFAULT NULL,
  `city_id` int DEFAULT NULL,
  `state_id` int DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Shubham','Bansode','shubham@gmail.com','1234','9922332233',1,0,'Kothrudr, pune','411028',1,1,'2024-01-02 13:29:07','2024-01-02 13:29:07'),(2,'Rucha','Dharak','rucha@gmail.com','1234','1122334455',3,1,'PCMC','411028',1,1,'2024-01-02 14:18:32','2024-01-02 14:18:32'),(3,'Akash ','Kakad','akash@gmail.com','1234','6677889900',3,0,'Bhosari, pune','411028',1,1,'2024-01-02 14:18:32','2024-01-02 14:18:32'),(4,'Rutuja','Hatgine','rutuja@gmail.com','1234','1122334455',2,1,'Hadapsar, pune','411028',1,1,'2024-01-02 14:18:32','2024-01-02 14:18:32'),(5,'owner','owner','owner@gmail.com','1234','6677889900',2,1,'Hadapsar, pune','411028',1,1,'2023-01-02 14:18:32','2024-01-02 14:18:32'),(6,'owner2','owner2','owner2@gmail.com','1234','9992223344',2,1,'Wakad,pune','411035',1,1,'2024-01-02 18:27:49','2024-01-02 18:27:49'),(7,'AB','TEST','TEST@gmail.com','123','8256',2,0,'Kota','411028',9,3,'2024-01-22 11:59:02','2024-01-22 11:59:02'),(8,'AB','TEST','TEST@gmail.com','123','8256',2,0,'Bathinda','411028',6,2,'2024-01-22 12:00:31','2024-01-22 12:00:31'),(9,'AB','TEST','TEST@gmail.com','123','8256',2,1,'Amritsar','411028',5,2,'2024-01-22 12:02:48','2024-01-22 12:02:48'),(10,'Ts','ts','ts@gmail.com','1234','1234567890',2,0,'Ajmer','411023',8,9,'2024-01-22 19:22:27','2024-01-22 19:22:27'),(12,'Radhe','bansode','smb@gmail.com','3333','9922887766',3,1,'pune','898989',1,1,'2024-02-06 11:15:48','2024-02-06 11:15:48');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle_type`
--

DROP TABLE IF EXISTS `vehicle_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicle_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_type`
--

LOCK TABLES `vehicle_type` WRITE;
/*!40000 ALTER TABLE `vehicle_type` DISABLE KEYS */;
INSERT INTO `vehicle_type` VALUES (1,'Two Wheeler'),(2,'Three Wheeler'),(3,'Four Wheeler'),(4,'Commercial');
/*!40000 ALTER TABLE `vehicle_type` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-16 20:20:50
