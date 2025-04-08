-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: littlelemondb
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `CustomerID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`CustomerID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'João Silva','joao@email.com','11999998888'),(3,'Ana Beatriz','ana.b@email.com','11988887777'),(4,'Carlos Eduardo','carlos.edu@email.com','11977776666'),(5,'Fernanda Lima','fernanda.lima@email.com','21966665555'),(6,'Bruno Souza','bruno.souza@email.com','31955554444'),(7,'Mariana Castro','mariana@email.com','11944443333'),(8,'Lucas Martins','lucas@email.com','41933332222'),(9,'Patrícia Oliveira','patricia.oliveira@email.com','51922221111'),(10,'Rodrigo Alves','rodrigo.alves@email.com','61911110000'),(11,'Juliana Mendes','juliana@email.com','71900009999'),(12,'Thiago Pereira','thiago.p@email.com','81999998888');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deliverystatus`
--

DROP TABLE IF EXISTS `deliverystatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deliverystatus` (
  `DeliveryID` int NOT NULL AUTO_INCREMENT,
  `OrderID` int DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  `DeliveryTime` datetime DEFAULT NULL,
  PRIMARY KEY (`DeliveryID`),
  KEY `OrderID` (`OrderID`),
  CONSTRAINT `deliverystatus_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deliverystatus`
--

LOCK TABLES `deliverystatus` WRITE;
/*!40000 ALTER TABLE `deliverystatus` DISABLE KEYS */;
INSERT INTO `deliverystatus` VALUES (23,1,'Entregue','2025-04-05 19:30:00'),(24,4,'Entregue','2025-04-08 19:15:00'),(32,5,'Entregue','2025-04-05 15:20:00'),(33,6,'Saiu para entrega','2025-04-06 16:00:00'),(34,7,'Entregue','2025-04-07 13:00:00'),(35,8,'Entregue','2025-04-08 12:00:00'),(36,9,'Cancelado','2025-04-09 10:30:00'),(37,10,'Saiu para entrega','2025-04-10 14:45:00');
/*!40000 ALTER TABLE `deliverystatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `MenuID` int NOT NULL AUTO_INCREMENT,
  `ItemName` varchar(100) NOT NULL,
  `Description` text,
  `Price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`MenuID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'Pizza Margherita','Clássica pizza italiana',25.00),(2,'Hamburguer Artesanal','Com cheddar e bacon',20.00),(3,'Salada Caesar','Com frango grelhado',15.00),(4,'Spaghetti Carbonara','Massa com molho cremoso de parmesão e bacon.',32.50),(5,'Pizza Margherita Especial','Pizza com molho de tomate, mussarela e manjericão.',28.90),(6,'Salmão Grelhado','Filé de salmão grelhado com legumes.',45.00),(7,'Risoto de Cogumelos','Risoto cremoso com cogumelos frescos.',36.00),(8,'Hambúrguer Vegano','Hambúrguer com queijo cheddar, alface e tomate.',29.90),(9,'Lasanha à Bolonhesa','Lasanha com carne moída e molho de tomate.',34.50),(10,'Frango Xadrez','Cubos de frango com pimentões e molho agridoce.',31.00),(11,'Tacos Mexicanos','Tortillas com carne, alface e guacamole.',27.50),(12,'Filé à Parmegiana','Filé empanado com molho de tomate e queijo.',38.00),(13,'Panqueca de Frango','Panqueca recheada com frango e requeijão.',26.00);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderdetails`
--

DROP TABLE IF EXISTS `orderdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderdetails` (
  `DetailID` int NOT NULL AUTO_INCREMENT,
  `OrderID` int DEFAULT NULL,
  `MenuID` int DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  PRIMARY KEY (`DetailID`),
  KEY `OrderID` (`OrderID`),
  KEY `orderdetails_ibfk_2` (`MenuID`),
  CONSTRAINT `orderdetails_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`),
  CONSTRAINT `orderdetails_ibfk_2` FOREIGN KEY (`MenuID`) REFERENCES `menu` (`MenuID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderdetails`
--

LOCK TABLES `orderdetails` WRITE;
/*!40000 ALTER TABLE `orderdetails` DISABLE KEYS */;
INSERT INTO `orderdetails` VALUES (3,1,1,3),(13,1,1,2),(14,4,2,2),(15,5,4,1),(16,6,6,2),(17,7,8,1),(18,8,10,4),(19,9,7,2),(20,10,12,1);
/*!40000 ALTER TABLE `orderdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `OrderID` int NOT NULL AUTO_INCREMENT,
  `CustomerID` int DEFAULT NULL,
  `OrderDate` date DEFAULT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `CustomerID` (`CustomerID`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`CustomerID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,'2025-04-08'),(4,1,'2025-04-08'),(5,1,'2025-04-01'),(6,3,'2025-04-03'),(7,4,'2025-04-04'),(8,5,'2025-04-05'),(9,6,'2025-04-06'),(10,7,'2025-04-07'),(11,8,'2025-04-08'),(12,9,'2025-04-09'),(13,10,'2025-04-10');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `ordersview`
--

DROP TABLE IF EXISTS `ordersview`;
/*!50001 DROP VIEW IF EXISTS `ordersview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `ordersview` AS SELECT 
 1 AS `OrderID`,
 1 AS `Quantity`,
 1 AS `Cost`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation` (
  `ReservationID` int NOT NULL AUTO_INCREMENT,
  `CustomerID` int DEFAULT NULL,
  `ReservationDate` date DEFAULT NULL,
  `TimeSlot` time DEFAULT NULL,
  `NumPeople` int DEFAULT NULL,
  PRIMARY KEY (`ReservationID`),
  KEY `CustomerID` (`CustomerID`),
  CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`CustomerID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` VALUES (9,1,'2025-04-10','19:00:00',2),(10,3,'2025-04-12','18:30:00',3),(11,4,'2025-04-13','21:00:00',2),(12,5,'2025-04-14','19:45:00',6),(13,6,'2025-04-15','20:15:00',5),(14,7,'2025-04-16','19:00:00',1),(15,8,'2025-04-17','18:00:00',2);
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `StaffID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Role` varchar(50) DEFAULT NULL,
  `Salary` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`StaffID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1,'Carlos Henrique','Gerente',5500.00),(2,'Mariana Souza','Garçom',2200.00),(3,'Bruno Almeida','Cozinheiro',3000.00),(4,'Larissa Oliveira','Atendente',2000.00),(5,'Felipe Costa','Auxiliar de Cozinha',1800.00),(6,'Ana Beatriz Ramos','Supervisora',4000.00),(7,'Rafael Lima','Garçom',2300.00),(8,'Juliana Castro','Cozinheira Chefe',4200.00);
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'littlelemondb'
--

--
-- Final view structure for view `ordersview`
--

/*!50001 DROP VIEW IF EXISTS `ordersview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`lemon_user`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `ordersview` AS select `od`.`OrderID` AS `OrderID`,`od`.`Quantity` AS `Quantity`,(`od`.`Quantity` * `m`.`Price`) AS `Cost` from (`orderdetails` `od` join `menu` `m` on((`od`.`MenuID` = `m`.`MenuID`))) where (`od`.`Quantity` > 2) */;
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

-- Dump completed on 2025-04-08 18:34:35
