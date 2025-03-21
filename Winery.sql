-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: Winery
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
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
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Alice Johnson','alice@example.com','0000000000','av. montaigne'),(2,'Bob Smith','bob@example.com','1234554321','av. des champs elysees'),(3,'Charlie Davis','charlie@example.com','0123456789','place victor hugo'),(4,'Diana White','diana@example.com','0011112222','bd saint germain'),(5,'Ethan Brown','ethan@example.com','1111111111','rue de la sorbonne');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoices`
--

DROP TABLE IF EXISTS `invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoices` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `tax_rate` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_invoices_order` (`order_id`),
  CONSTRAINT `fk_invoices_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoices`
--

LOCK TABLES `invoices` WRITE;
/*!40000 ALTER TABLE `invoices` DISABLE KEYS */;
INSERT INTO `invoices` VALUES (1,2,120.00,0.10),(2,3,45.25,0.08),(8,4,200.00,0.19);
/*!40000 ALTER TABLE `invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `wine_id` int NOT NULL,
  `quantity` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wine_id` (`wine_id`),
  KEY `order_items_ibfk_1` (`order_id`),
  CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`wine_id`) REFERENCES `wines` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (9,1,1,2),(10,1,3,1),(11,2,5,4),(12,3,2,1),(13,3,4,2),(14,4,6,3),(15,4,8,1);
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `total_amount` decimal(10,2) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_orders_customer` (`customer_id`),
  CONSTRAINT `fk_orders_customer` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,75.50,'In Progress'),(2,2,120.00,'Validated'),(3,3,45.25,'Delivered'),(4,4,200.00,'Validated');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wines`
--

DROP TABLE IF EXISTS `wines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wines` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `region` varchar(50) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `stock` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wines`
--

LOCK TABLES `wines` WRITE;
/*!40000 ALTER TABLE `wines` DISABLE KEYS */;
INSERT INTO `wines` VALUES (1,'Ch├óteau Margaux 2018',650.00,'Red','Bordeaux',10,25),(2,'Domaine de la Roman├⌐e-Conti 2015',21000.00,'Red','Burgundy',13,2),(3,'Opus One 2019',400.00,'Red','Napa Valley',9,17),(4,'Sassicaia 2017',350.00,'Red','Tuscany',11,20),(5,'Vega Sicilia Unico 2010',500.00,'Red','Ribera del Duero',18,8),(6,'Domaine Leroy Musigny 2016',18000.00,'Red','Burgundy',12,1),(7,'Ch├óteau Haut-Brion 2012',550.00,'Red','Bordeaux',16,12),(8,'Penfolds Grange Hermitage 2014',300.00,'Red','South Australia',14,18),(9,'Egon M├╝ller Scharzhofberger TBA 2017',12000.00,'White','Mosel',11,3),(10,'Domaine Leflaive Montrachet 2018',7000.00,'White','Burgundy',10,5),(11,'Ridge Vineyards Monte Bello Cabernet Sauvignon 2016',250.00,'Red','Santa Cruz Mountains',12,25),(12,'Caymus Vineyards Special Selection Cabernet Sauvignon 2018',200.00,'Red','Napa Valley',10,30),(13,'Stag\'s Leap Wine Cellars S.L.V. Cabernet Sauvignon 2017',180.00,'Red','Napa Valley',11,22),(14,'Inglenook Rubicon 2019',150.00,'Red','Napa Valley',9,28),(15,'Duckhorn Vineyards Cabernet Sauvignon 2020',120.00,'Red','Napa Valley',8,35),(16,'Ch├óteau Cheval Blanc 2015',800.00,'Red','Bordeaux',13,10),(17,'Petrus 2016',1500.00,'Red','Bordeaux',12,27),(18,'Le Pin 2018',1200.00,'Red','Bordeaux',10,8),(19,'La Mondotte 2019',450.00,'Red','Bordeaux',9,15),(20,'Ausone 2017',600.00,'Red','Bordeaux',11,12),(21,'Domaine de la Grange des P├¿res 2019',200.00,'Red','Languedoc',9,20),(22,'Clos des Papes Ch├óteauneuf-du-Pape 2020',180.00,'Red','Rh├┤ne Valley',8,25),(23,'Paul Jaboulet A├«n├⌐ Hermitage La Chapelle 2018',300.00,'Red','Rh├┤ne Valley',10,18),(24,'M. Chapoutier C├┤te-R├┤tie La Mordor├⌐e 2017',250.00,'Red','Rh├┤ne Valley',11,22),(25,'Guigal C├┤te-R├┤tie La Mouline 2016',400.00,'Red','Rh├┤ne Valley',12,15),(26,'Domaine Weinbach Riesling Grand Cru Schlossberg 2019',200.00,'White','Alsace',9,28),(27,'Trimbach Riesling Cuv├⌐e Fr├⌐d├⌐ric Emile 2020',150.00,'White','Alsace',8,32),(28,'Zind-Humbrecht Riesling Grand Cru Clos Saint-Urbain 2018',250.00,'White','Alsace',10,25),(29,'Hugel Riesling Vendange Tardive 2017',180.00,'White','Alsace',11,30),(30,'Albert Mann Riesling Grand Cru Furstentum 2016',300.00,'White','Alsace',12,20),(31,'Louis Roederer Cristal 2012',300.00,'Sparkling','Champagne',10,20),(32,'Dom P├⌐rignon 2013',250.00,'Sparkling','Champagne',9,25),(33,'Taittinger Comtes de Champagne Blanc de Blancs 2011',200.00,'Sparkling','Champagne',11,30),(34,'Veuve Clicquot La Grande Dame 2008',180.00,'Sparkling','Champagne',12,35),(35,'Bollinger R.D. 2007',280.00,'Sparkling','Champagne',13,22),(36,'Moscato d\'Asti 2022',25.00,'White','Piedmont',6,50),(37,'Sauvignon Blanc 2021',18.00,'White','Loire Valley',7,45),(38,'Pinot Grigio 2020',15.00,'White','Veneto',8,55),(39,'Chardonnay 2019',22.00,'White','Burgundy',9,40),(40,'Riesling 2018',20.00,'White','Mosel',10,50),(41,'Cabernet Sauvignon 2017 Limited Edition',300.00,'Red','Napa Valley',11,5),(42,'Merlot 2016 Limited Edition',250.00,'Red','Bordeaux',12,3),(43,'Pinot Noir 2015',28.00,'Red','Burgundy',13,50),(44,'Sangiovese 2014',22.00,'Red','Tuscany',14,55),(45,'Tempranillo 2013',25.00,'Red','Rioja',15,45),(46,'Malbec 2012',20.00,'Red','Mendoza',16,50),(47,'Zinfandel 2011',28.00,'Red','California',17,40),(48,'Carmenere 2010 Limited Edition',220.00,'Red','Chile',18,1),(49,'Gew├╝rztraminer 2009',25.00,'White','Alsace',19,55),(50,'Ice Wine 2008 Limited Edition',180.00,'White','Canada',20,5),(51,'Domaine Tempier Bandol Ros├⌐',45.00,'Ros├⌐','Provence',7,30),(52,'Ch├óteau Minuty M Ros├⌐',35.00,'Ros├⌐','Provence',6,40),(53,'Miraval Ros├⌐',28.00,'Ros├⌐','Provence',5,50),(54,'Whispering Angel Ros├⌐',32.00,'Ros├⌐','Provence',6,45),(55,'Studio by Miraval Ros├⌐',25.00,'Ros├⌐','Provence',5,55),(56,'Domaine Ott Ch├óteau Romassan Ros├⌐',60.00,'Ros├⌐','Provence',8,25),(57,'Triennes Ros├⌐',20.00,'Ros├⌐','Provence',4,60),(58,'Maison Saleya Ros├⌐',18.00,'Ros├⌐','Provence',3,70),(59,'Ch├óteau d\'Esclans Rock Angel Ros├⌐',50.00,'Ros├⌐','Provence',7,35),(60,'Caves d\'Esclans Garrus Ros├⌐',80.00,'Ros├⌐','Provence',9,20),(61,'Bodegas Muga Ros├⌐',22.00,'Ros├⌐','Rioja',5,50),(62,'CVNE Rosado',18.00,'Ros├⌐','Rioja',4,60),(63,'Ameztoi Getariako Txakolina Ros├⌐',25.00,'Ros├⌐','Basque Country',6,65),(64,'Gerard Bertrand Clos du Temple Ros├⌐',70.00,'Ros├⌐','Languedoc-Roussillon',8,24),(65,'Domaine de l\'Hortus Ros├⌐',30.00,'Ros├⌐','Languedoc-Roussillon',7,42),(66,'Mas de Daumas Gassac Ros├⌐',40.00,'Ros├⌐','Languedoc-Roussillon',6,34),(67,'Tavel Ros├⌐',28.00,'Ros├⌐','Rh├┤ne Valley',5,56),(68,'Lirac Ros├⌐',22.00,'Ros├⌐','Rh├┤ne Valley',4,65),(69,'Sancerre Ros├⌐',35.00,'Ros├⌐','Loire Valley',7,45),(70,'Anjou Ros├⌐',25.00,'Ros├⌐','Loire Valley',6,58);
/*!40000 ALTER TABLE `wines` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-11 12:38:07
