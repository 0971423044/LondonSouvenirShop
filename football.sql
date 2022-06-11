-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: football
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brand` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_rdxh7tq2xs66r485cc8dkxt77` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` VALUES (1,'Adidas','/image/brand/adidas.png'),(2,'Air Jordan','/image/brand/air_jordan.png'),(3,'Asics','/image/brand/asics.png'),(4,'Converse','/image/brand/converse.png'),(5,'Nike','/image/brand/nike.png'),(6,'Vans','/image/brand/vans.png');
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_items`
--

DROP TABLE IF EXISTS `cart_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` varchar(255) NOT NULL,
  `user_id` bigint NOT NULL,
  `quantity` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_items_ibfk_1` (`product_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `cart_items_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `cart_items_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_items`
--

LOCK TABLES `cart_items` WRITE;
/*!40000 ALTER TABLE `cart_items` DISABLE KEYS */;
INSERT INTO `cart_items` VALUES (1,'135JLM',3,1),(2,'1df5Kd',3,2);
/*!40000 ALTER TABLE `cart_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(300) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Nam'),(2,'Nữ'),(3,'Trẻ em');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configuration`
--

DROP TABLE IF EXISTS `configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `configuration` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `london_choices` json DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuration`
--

LOCK TABLES `configuration` WRITE;
/*!40000 ALTER TABLE `configuration` DISABLE KEYS */;
INSERT INTO `configuration` VALUES (1,'[\"LJL675\", \"MWHO233\", \"jlK454\", \"MLH946\", \"QR3l6ss\"]');
/*!40000 ALTER TABLE `configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `finance`
--

DROP TABLE IF EXISTS `finance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `finance` (
  `id` int NOT NULL AUTO_INCREMENT,
  `amount` bigint NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` bigint DEFAULT NULL,
  `order_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKiil5n5e3m0l7t06p1w20pi7o2` (`created_by`),
  KEY `FK7jablfr6nyikn00v63ri0aufw` (`order_id`),
  CONSTRAINT `FK7jablfr6nyikn00v63ri0aufw` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `FKiil5n5e3m0l7t06p1w20pi7o2` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `finance`
--

LOCK TABLES `finance` WRITE;
/*!40000 ALTER TABLE `finance` DISABLE KEYS */;
/*!40000 ALTER TABLE `finance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `image` (
  `id` varchar(255) NOT NULL,
  `link` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `size` bigint DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `uploaded_at` datetime DEFAULT NULL,
  `uploaded_by` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_4pgw8w3qp244ujvcs4wowiv3x` (`link`),
  KEY `FK4s1nm09l7ywc77xm5d35ecxyo` (`uploaded_by`),
  CONSTRAINT `FK4s1nm09l7ywc77xm5d35ecxyo` FOREIGN KEY (`uploaded_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `product_price` bigint DEFAULT NULL,
  `promotion` json DEFAULT NULL,
  `receiver_address` varchar(255) DEFAULT NULL,
  `receiver_name` varchar(255) DEFAULT NULL,
  `receiver_phone` varchar(255) DEFAULT NULL,
  `size` int DEFAULT NULL,
  `status` int DEFAULT NULL,
  `total_price` bigint DEFAULT NULL,
  `buyer` bigint DEFAULT NULL,
  `created_by` bigint DEFAULT NULL,
  `modified_by` bigint DEFAULT NULL,
  `product_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKljvc97l19m7cnlopv8535hijx` (`buyer`),
  KEY `FKtjwuphstqm46uffgc7l1r27a9` (`created_by`),
  KEY `FKe0abpy849bl2ynw3468ksavvl` (`modified_by`),
  KEY `FK787ibr3guwp6xobrpbofnv7le` (`product_id`),
  CONSTRAINT `FK787ibr3guwp6xobrpbofnv7le` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `FKe0abpy849bl2ynw3468ksavvl` FOREIGN KEY (`modified_by`) REFERENCES `users` (`id`),
  CONSTRAINT `FKljvc97l19m7cnlopv8535hijx` FOREIGN KEY (`buyer`) REFERENCES `users` (`id`),
  CONSTRAINT `FKtjwuphstqm46uffgc7l1r27a9` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (6,'2022-06-05 11:22:51',NULL,NULL,640000,NULL,'maid dong','ADMIN','0987654321',35,1,640000,1,1,NULL,'135JLM'),(7,'2022-06-05 11:23:49',NULL,NULL,400000,NULL,'ha noi','ADMIN','0987654321',38,1,400000,1,1,NULL,'JLEjl2'),(9,'2022-06-06 14:50:46',NULL,NULL,640000,NULL,'mai dong ','ADMIN','0987654321',35,1,640000,1,1,NULL,'135JLM'),(13,'2022-06-09 16:03:48',NULL,NULL,640000,NULL,'Ha Noi','xuan xhaka','0971423033',35,5,640000,3,3,NULL,'135JLM'),(14,'2022-06-09 21:59:52',NULL,NULL,2000000,NULL,'ha noi\n','xuan xhaka','0971423033',38,1,2000000,3,3,NULL,'HWT354');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `content` text,
  `created_at` datetime DEFAULT NULL,
  `description` text,
  `modified_at` datetime DEFAULT NULL,
  `published_at` datetime DEFAULT NULL,
  `slug` varchar(600) NOT NULL,
  `status` int DEFAULT '0',
  `thumbnail` varchar(255) DEFAULT NULL,
  `title` varchar(300) NOT NULL,
  `created_by` bigint DEFAULT NULL,
  `modified_by` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK3b6cq7u0x3fdxeh4sq95mia29` (`created_by`),
  KEY `FKl2q2idcap1gt3qhh87ebirpnc` (`modified_by`),
  CONSTRAINT `FK3b6cq7u0x3fdxeh4sq95mia29` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  CONSTRAINT `FKl2q2idcap1gt3qhh87ebirpnc` FOREIGN KEY (`modified_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (1,'<p style=\"font-family: Roboto, sans-serif; outline: none; color: rgb(51, 51, 51);\"><span style=\"outline: none;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</span></p><p style=\"font-family: Roboto, sans-serif; outline: none; color: rgb(51, 51, 51);\"><span style=\"outline: none;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.&nbsp;</span><span style=\"outline: none;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.&nbsp;</span><span style=\"outline: none;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</span></p><p style=\"font-family: Roboto, sans-serif; outline: none; color: rgb(51, 51, 51);\"><span style=\"outline: none;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</span></p><p style=\"font-family: Roboto, sans-serif; outline: none; color: rgb(51, 51, 51);\"><span style=\"outline: none;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.&nbsp;</span><span style=\"outline: none;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.&nbsp;</span><span style=\"outline: none;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</span><span style=\"outline: none;\"><br style=\"outline: none;\"></span></p>','2020-06-09 07:53:04','Trong pack này, chúng ta sẽ đến với mẫu branding kiểu phác thảo, đầy mộc mạc và “blend” hoàn hảo cùng tổng thể phối màu.','2020-06-09 08:11:59','2020-06-09 07:53:45','pack-logo-sketch-voi-branding-moc-mac-tren-air-max-97-va-air-max-plus',1,'/image/news/news-1-thumnails.jpg','Pack “Logo Sketch” với branding mộc mạc trên Air Max 97 và Air Max Plus',1,1),(2,'<p><span style=\"color: rgb(51, 51, 51); font-family: Roboto, sans-serif;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</span></p><p><span style=\"color: rgb(51, 51, 51); font-family: Roboto, sans-serif;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.&nbsp;</span><span style=\"color: rgb(51, 51, 51); font-family: Roboto, sans-serif;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.&nbsp;</span><span style=\"color: rgb(51, 51, 51); font-family: Roboto, sans-serif;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</span></p><p><span style=\"color: rgb(51, 51, 51); font-family: Roboto, sans-serif;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</span></p><p><span style=\"color: rgb(51, 51, 51); font-family: Roboto, sans-serif;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.&nbsp;</span><span style=\"color: rgb(51, 51, 51); font-family: Roboto, sans-serif;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.&nbsp;</span><span style=\"color: rgb(51, 51, 51); font-family: Roboto, sans-serif;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</span><span style=\"color: rgb(51, 51, 51); font-family: Roboto, sans-serif;\"><br></span><span style=\"color: rgb(51, 51, 51); font-family: Roboto, sans-serif;\"><br></span><span style=\"color: rgb(51, 51, 51); font-family: Roboto, sans-serif;\"><br></span><br></p>','2020-06-09 07:55:16','Phối màu tiếp theo gia nhập bộ sưu tập Nike Classic Cortez với sự kết hợp của 2 tông màu: Hồng Hoa Đăng và màu Cam','2020-06-09 08:11:27','2020-06-09 07:55:47','nike-classic-cortez-phoi-mau-cua-su-tinh-te',1,'/image/news/news-2-thumnails.jpg','Nike Classic Cortez – Phối Màu Của Sự Tinh Tế',1,1),(3,'<p style=\"font-family: Roboto, sans-serif; outline: none; color: rgb(51, 51, 51);\"><span style=\"outline: none;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</span></p><p style=\"font-family: Roboto, sans-serif; outline: none; color: rgb(51, 51, 51);\"><span style=\"outline: none;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.&nbsp;</span><span style=\"outline: none;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.&nbsp;</span><span style=\"outline: none;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</span></p><p style=\"font-family: Roboto, sans-serif; outline: none; color: rgb(51, 51, 51);\"><span style=\"outline: none;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</span></p><p style=\"font-family: Roboto, sans-serif; outline: none; color: rgb(51, 51, 51);\"><span style=\"outline: none;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.&nbsp;</span><span style=\"outline: none;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.&nbsp;</span><span style=\"outline: none;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</span><span style=\"outline: none;\"><br style=\"outline: none;\"></span></p><p style=\"box-sizing: inherit; margin-bottom: 1.5em; color: rgb(36, 36, 36); font-family: Roboto, sans-serif; font-size: 18px;\"></p>','2020-06-09 07:57:49','Air Jordan 1 “Black Toe” vẫn luôn là thiết kế Air Jordan 1 đáng mua nhất mọi thời đại. Vậy sẽ thế nào nếu chúng khoác lên mình chất liệu satin?','2020-06-09 08:11:47','2020-06-09 07:58:23','air-jordan-1-satin-black-toe-xuat-hien-hinh-anh-chi-tiet',1,'/image/news/news-3-thumnails.jpg','Air Jordan 1 “Satin Black Toe” Xuất Hiện Hình Ảnh Chi Tiết',1,1),(4,'<p style=\"font-family: Roboto, sans-serif; outline: none; color: rgb(51, 51, 51);\"><span style=\"outline: none;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</span></p><p style=\"font-family: Roboto, sans-serif; outline: none; color: rgb(51, 51, 51);\"><span style=\"outline: none;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.&nbsp;</span><span style=\"outline: none;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.&nbsp;</span><span style=\"outline: none;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</span></p><p style=\"font-family: Roboto, sans-serif; outline: none; color: rgb(51, 51, 51);\"><span style=\"outline: none;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</span></p><p style=\"font-family: Roboto, sans-serif; outline: none; color: rgb(51, 51, 51);\"><span style=\"outline: none;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.&nbsp;</span><span style=\"outline: none;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.&nbsp;</span><span style=\"outline: none;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</span></p>','2020-06-09 08:13:03','Đến hẹn lại lên, Nike và Levi’s lại tái hợp với nhau khiến các sneakerheads và tín đồ thời trang mê mệt.','2020-06-09 08:13:29','2020-06-09 08:13:29','hot-nike-va-levis-tai-hop-voi-hang-loat-sieu-pham-moi',1,'/image/news/news-4-thumnails.jpg','HOT! Nike Và Levi’s Tái Hợp Với Hàng Loạt Siêu Phẩm Mới',1,NULL);
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `description` text,
  `is_available` tinyint(1) DEFAULT NULL,
  `name` varchar(300) NOT NULL,
  `onfeet_images` json DEFAULT NULL,
  `price` bigint DEFAULT NULL,
  `product_images` json DEFAULT NULL,
  `slug` varchar(255) NOT NULL,
  `total_sold` int DEFAULT NULL,
  `brand_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKs6cydsualtsrprvlf2bb3lcam` (`brand_id`),
  CONSTRAINT `FKs6cydsualtsrprvlf2bb3lcam` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES ('135JLM','2020-06-09 04:15:18','<p style=\"font-family: Roboto, sans-serif; outline: none; color: rgb(51, 51, 51);\">Trend “dad shoes” đang gây bão trong giới trẻ hiện nay và mẫu giày Yeezy 700 Wave Runner Solid Grey cũng góp phần tạo nên sức hút cho cơn sốt này, khiến giới săn giày đứng ngồi không yên. Kiểu dáng của Yeezy 700 Wave Runner Solid Grey chịu sự ảnh hưởng của những mẫu “dad shoes” và cross-trainer, hiện đang là 2 xu hướng sneaker được ưa thích trong những năm gần đây. Đế giày đậm chất chunky sneaker và thiết kế retro, đi cùng bản phối xám / xanh / cam đã dễ dàng thổi “bùa yêu” vào giới yêu giày.</p><p style=\"font-family: Roboto, sans-serif; outline: none; color: rgb(51, 51, 51);\">Phần upper sử dụng chất liệu breathable mesh, suede và nubuck. Điểm nhấn ấn tượng chính là thiết kế là dây giày màu neon đi kèm một số chi tiết được làm bằng chất liệu 3M phản quang. Với bộ đế boost nổi tiếng và form giày rộng rãi, Yeezy 700 Wave Runner Solid Grey mang đến cảm giác dễ chịu nhất cho người mang. Cộng nghệ Boost với tấm đệm lót “thần thánh” êm ái, bạn có thể mang đôi giày này từ sáng đến tối mà không hề có cảm giác khó chịu hay bí bách. Không những hype mà còn comfy nữa.</p>',1,'Adidas Yeezy 500 Bone White','[\"/image/onfeet/onfeet1.jpg\", \"/image/onfeet/onfeet2.jpg\", \"/image/onfeet/onfeet3.jpg\", \"/image/onfeet/onfeet4.jpg\", \"/image/onfeet/onfeet5.jpg\", \"/image/onfeet/onfeet6.jpg\"]',640000,'[\"/image/product/adidas/adidas-Yeezy-Boost-500-Bone-White.jpg\", \"/image/product/adidas/adidas-Yeezy-Boost-500-Bone-White.jpg\", \"/image/product/adidas/adidas-Yeezy-Boost-500-Bone-White.jpg\", \"/image/product/adidas/adidas-Yeezy-Boost-500-Bone-White.jpg\", \"/image/product/adidas/adidas-Yeezy-Boost-500-Bone-White.jpg\"]','adidas-yeezy-500-bone-white',13,1),('1df5Kd','2020-06-09 04:08:48','<p style=\"font-family: Roboto, sans-serif; outline: none; color: rgb(51, 51, 51);\">Trend “dad shoes” đang gây bão trong giới trẻ hiện nay và mẫu giày Yeezy 700 Wave Runner Solid Grey cũng góp phần tạo nên sức hút cho cơn sốt này, khiến giới săn giày đứng ngồi không yên. Kiểu dáng của Yeezy 700 Wave Runner Solid Grey chịu sự ảnh hưởng của những mẫu “dad shoes” và cross-trainer, hiện đang là 2 xu hướng sneaker được ưa thích trong những năm gần đây. Đế giày đậm chất chunky sneaker và thiết kế retro, đi cùng bản phối xám / xanh / cam đã dễ dàng thổi “bùa yêu” vào giới yêu giày.</p><p style=\"font-family: Roboto, sans-serif; outline: none; color: rgb(51, 51, 51);\">Phần upper sử dụng chất liệu breathable mesh, suede và nubuck. Điểm nhấn ấn tượng chính là thiết kế là dây giày màu neon đi kèm một số chi tiết được làm bằng chất liệu 3M phản quang. Với bộ đế boost nổi tiếng và form giày rộng rãi, Yeezy 700 Wave Runner Solid Grey mang đến cảm giác dễ chịu nhất cho người mang. Cộng nghệ Boost với tấm đệm lót “thần thánh” êm ái, bạn có thể mang đôi giày này từ sáng đến tối mà không hề có cảm giác khó chịu hay bí bách. Không những hype mà còn comfy nữa.</p>',1,'Air Jordan 1 Retro High Satin Black Toe','[\"/image/onfeet/onfeet1.jpg\", \"/image/onfeet/onfeet2.jpg\", \"/image/onfeet/onfeet3.jpg\", \"/image/onfeet/onfeet4.jpg\", \"/image/onfeet/onfeet5.jpg\", \"/image/onfeet/onfeet6.jpg\"]',460000,'[\"/image/product/air-jordan/Air-Jordan-1-Retro-High-Satin-Black-Toe.jpg\", \"/image/product/air-jordan/Air-Jordan-1-Retro-High-Satin-Black-Toe.jpg\", \"/image/product/air-jordan/Air-Jordan-1-Retro-High-Satin-Black-Toe.jpg\", \"/image/product/air-jordan/Air-Jordan-1-Retro-High-Satin-Black-Toe.jpg\", \"/image/product/air-jordan/Air-Jordan-1-Retro-High-Satin-Black-Toe.jpg\"]','air-jordan-1-retro-high-satin-black-toe',466,2),('3AQ322','2020-06-09 05:30:40','<p style=\"font-family: Roboto, sans-serif; outline: none; color: rgb(51, 51, 51);\">Trend “dad shoes” đang gây bão trong giới trẻ hiện nay và mẫu giày Yeezy 700 Wave Runner Solid Grey cũng góp phần tạo nên sức hút cho cơn sốt này, khiến giới săn giày đứng ngồi không yên. Kiểu dáng của Yeezy 700 Wave Runner Solid Grey chịu sự ảnh hưởng của những mẫu “dad shoes” và cross-trainer, hiện đang là 2 xu hướng sneaker được ưa thích trong những năm gần đây. Đế giày đậm chất chunky sneaker và thiết kế retro, đi cùng bản phối xám / xanh / cam đã dễ dàng thổi “bùa yêu” vào giới yêu giày.</p><p style=\"font-family: Roboto, sans-serif; outline: none; color: rgb(51, 51, 51);\">Phần upper sử dụng chất liệu breathable mesh, suede và nubuck. Điểm nhấn ấn tượng chính là thiết kế là dây giày màu neon đi kèm một số chi tiết được làm bằng chất liệu 3M phản quang. Với bộ đế boost nổi tiếng và form giày rộng rãi, Yeezy 700 Wave Runner Solid Grey mang đến cảm giác dễ chịu nhất cho người mang. Cộng nghệ Boost với tấm đệm lót “thần thánh” êm ái, bạn có thể mang đôi giày này từ sáng đến tối mà không hề có cảm giác khó chịu hay bí bách. Không những hype mà còn comfy nữa.</p>',1,'Adidas NMD Hu Pharrell Solar Pack Mother','[\"/image/onfeet/onfeet1.jpg\", \"/image/onfeet/onfeet2.jpg\", \"/image/onfeet/onfeet3.jpg\", \"/image/onfeet/onfeet4.jpg\", \"/image/onfeet/onfeet5.jpg\", \"/image/onfeet/onfeet6.jpg\"]',1000000,'[\"/image/product/adidas/adidas-NMD-Hu-Pharrell-Mother-Product.jpg\", \"/image/product/adidas/adidas-NMD-Hu-Pharrell-Mother-Product.jpg\", \"/image/product/adidas/adidas-NMD-Hu-Pharrell-Mother-Product.jpg\", \"/image/product/adidas/adidas-NMD-Hu-Pharrell-Mother-Product.jpg\", \"/image/product/adidas/adidas-NMD-Hu-Pharrell-Mother-Product.jpg\"]','adidas-nmd-hu-pharrell-solar-pack-mother',370,1),('AHFA34','2020-06-09 05:14:27','<p style=\"font-family: Roboto, sans-serif; outline: none; color: rgb(51, 51, 51);\">Trend “dad shoes” đang gây bão trong giới trẻ hiện nay và mẫu giày Yeezy 700 Wave Runner Solid Grey cũng góp phần tạo nên sức hút cho cơn sốt này, khiến giới săn giày đứng ngồi không yên. Kiểu dáng của Yeezy 700 Wave Runner Solid Grey chịu sự ảnh hưởng của những mẫu “dad shoes” và cross-trainer, hiện đang là 2 xu hướng sneaker được ưa thích trong những năm gần đây. Đế giày đậm chất chunky sneaker và thiết kế retro, đi cùng bản phối xám / xanh / cam đã dễ dàng thổi “bùa yêu” vào giới yêu giày.</p><p style=\"font-family: Roboto, sans-serif; outline: none; color: rgb(51, 51, 51);\">Phần upper sử dụng chất liệu breathable mesh, suede và nubuck. Điểm nhấn ấn tượng chính là thiết kế là dây giày màu neon đi kèm một số chi tiết được làm bằng chất liệu 3M phản quang. Với bộ đế boost nổi tiếng và form giày rộng rãi, Yeezy 700 Wave Runner Solid Grey mang đến cảm giác dễ chịu nhất cho người mang. Cộng nghệ Boost với tấm đệm lót “thần thánh” êm ái, bạn có thể mang đôi giày này từ sáng đến tối mà không hề có cảm giác khó chịu hay bí bách. Không những hype mà còn comfy nữa.</p>',1,'Vans Old Skool David Bowie Aladdin Sane','[\"/image/onfeet/onfeet1.jpg\", \"/image/onfeet/onfeet2.jpg\", \"/image/onfeet/onfeet3.jpg\", \"/image/onfeet/onfeet4.jpg\", \"/image/onfeet/onfeet5.jpg\", \"/image/onfeet/onfeet6.jpg\"]',700000,'[\"/image/product/vans/Vans-Old-Skool-David-Bowie-Aladdin-Sane-Product.jpg\", \"/image/product/vans/Vans-Old-Skool-David-Bowie-Aladdin-Sane-Product.jpg\", \"/image/product/vans/Vans-Old-Skool-David-Bowie-Aladdin-Sane-Product.jpg\", \"/image/product/vans/Vans-Old-Skool-David-Bowie-Aladdin-Sane-Product.jpg\", \"/image/product/vans/Vans-Old-Skool-David-Bowie-Aladdin-Sane-Product.jpg\"]','vans-old-skool-david-bowie-aladdin-sane',24,6),('AKJ469','2020-06-09 04:04:03','<p style=\"font-family: Roboto, sans-serif; outline: none; color: rgb(51, 51, 51);\">Trend “dad shoes” đang gây bão trong giới trẻ hiện nay và mẫu giày Yeezy 700 Wave Runner Solid Grey cũng góp phần tạo nên sức hút cho cơn sốt này, khiến giới săn giày đứng ngồi không yên. Kiểu dáng của Yeezy 700 Wave Runner Solid Grey chịu sự ảnh hưởng của những mẫu “dad shoes” và cross-trainer, hiện đang là 2 xu hướng sneaker được ưa thích trong những năm gần đây. Đế giày đậm chất chunky sneaker và thiết kế retro, đi cùng bản phối xám / xanh / cam đã dễ dàng thổi “bùa yêu” vào giới yêu giày.</p><p style=\"font-family: Roboto, sans-serif; outline: none; color: rgb(51, 51, 51);\">Phần upper sử dụng chất liệu breathable mesh, suede và nubuck. Điểm nhấn ấn tượng chính là thiết kế là dây giày màu neon đi kèm một số chi tiết được làm bằng chất liệu 3M phản quang. Với bộ đế boost nổi tiếng và form giày rộng rãi, Yeezy 700 Wave Runner Solid Grey mang đến cảm giác dễ chịu nhất cho người mang. Cộng nghệ Boost với tấm đệm lót “thần thánh” êm ái, bạn có thể mang đôi giày này từ sáng đến tối mà không hề có cảm giác khó chịu hay bí bách. Không những hype mà còn comfy nữa.</p>',1,'ASICS Gel-Lyte III Afew Koi','[\"/image/onfeet/onfeet1.jpg\", \"/image/onfeet/onfeet2.jpg\", \"/image/onfeet/onfeet3.jpg\", \"/image/onfeet/onfeet4.jpg\", \"/image/onfeet/onfeet5.jpg\", \"/image/onfeet/onfeet6.jpg\"]',652000,'[\"/image/product/asics/Asics-Gel-Lyte-III-Afew-Koi.jpg\", \"/image/product/asics/Asics-Gel-Lyte-III-Afew-Koi.jpg\", \"/image/product/asics/Asics-Gel-Lyte-III-Afew-Koi.jpg\", \"/image/product/asics/Asics-Gel-Lyte-III-Afew-Koi.jpg\", \"/image/product/asics/Asics-Gel-Lyte-III-Afew-Koi.jpg\"]','asics-gel-lyte-iii-afew-koi',10,3),('HWT354','2020-06-09 05:42:53','<p style=\"font-family: Roboto, sans-serif; outline: none; color: rgb(51, 51, 51);\">Trend “dad shoes” đang gây bão trong giới trẻ hiện nay và mẫu giày Yeezy 700 Wave Runner Solid Grey cũng góp phần tạo nên sức hút cho cơn sốt này, khiến giới săn giày đứng ngồi không yên. Kiểu dáng của Yeezy 700 Wave Runner Solid Grey chịu sự ảnh hưởng của những mẫu “dad shoes” và cross-trainer, hiện đang là 2 xu hướng sneaker được ưa thích trong những năm gần đây. Đế giày đậm chất chunky sneaker và thiết kế retro, đi cùng bản phối xám / xanh / cam đã dễ dàng thổi “bùa yêu” vào giới yêu giày.</p><p style=\"font-family: Roboto, sans-serif; outline: none; color: rgb(51, 51, 51);\">Phần upper sử dụng chất liệu breathable mesh, suede và nubuck. Điểm nhấn ấn tượng chính là thiết kế là dây giày màu neon đi kèm một số chi tiết được làm bằng chất liệu 3M phản quang. Với bộ đế boost nổi tiếng và form giày rộng rãi, Yeezy 700 Wave Runner Solid Grey mang đến cảm giác dễ chịu nhất cho người mang. Cộng nghệ Boost với tấm đệm lót “thần thánh” êm ái, bạn có thể mang đôi giày này từ sáng đến tối mà không hề có cảm giác khó chịu hay bí bách. Không những hype mà còn comfy nữa.</p>',1,'Adidas Ultra Boost 4.0 Game of Thrones White Walkers','[\"/image/onfeet/onfeet1.jpg\", \"/image/onfeet/onfeet2.jpg\", \"/image/onfeet/onfeet3.jpg\", \"/image/onfeet/onfeet4.jpg\", \"/image/onfeet/onfeet5.jpg\", \"/image/onfeet/onfeet6.jpg\"]',2000000,'[\"/image/product/adidas/adidas-Ultra-Boost-4-Game-of-Thrones-White-Walkers-1.jpg\", \"/image/product/adidas/adidas-Ultra-Boost-4-Game-of-Thrones-White-Walkers-1.jpg\", \"/image/product/adidas/adidas-Ultra-Boost-4-Game-of-Thrones-White-Walkers-1.jpg\", \"/image/product/adidas/adidas-Ultra-Boost-4-Game-of-Thrones-White-Walkers-1.jpg\", \"/image/product/adidas/adidas-Ultra-Boost-4-Game-of-Thrones-White-Walkers-1.jpg\"]','adidas-ultra-boost-4-0-game-of-thrones-white-walkers',247,1),('ixrq43','2020-06-09 05:15:43','<p style=\"font-family: Roboto, sans-serif; outline: none; color: rgb(51, 51, 51);\">Trend “dad shoes” đang gây bão trong giới trẻ hiện nay và mẫu giày Yeezy 700 Wave Runner Solid Grey cũng góp phần tạo nên sức hút cho cơn sốt này, khiến giới săn giày đứng ngồi không yên. Kiểu dáng của Yeezy 700 Wave Runner Solid Grey chịu sự ảnh hưởng của những mẫu “dad shoes” và cross-trainer, hiện đang là 2 xu hướng sneaker được ưa thích trong những năm gần đây. Đế giày đậm chất chunky sneaker và thiết kế retro, đi cùng bản phối xám / xanh / cam đã dễ dàng thổi “bùa yêu” vào giới yêu giày.</p><p style=\"font-family: Roboto, sans-serif; outline: none; color: rgb(51, 51, 51);\">Phần upper sử dụng chất liệu breathable mesh, suede và nubuck. Điểm nhấn ấn tượng chính là thiết kế là dây giày màu neon đi kèm một số chi tiết được làm bằng chất liệu 3M phản quang. Với bộ đế boost nổi tiếng và form giày rộng rãi, Yeezy 700 Wave Runner Solid Grey mang đến cảm giác dễ chịu nhất cho người mang. Cộng nghệ Boost với tấm đệm lót “thần thánh” êm ái, bạn có thể mang đôi giày này từ sáng đến tối mà không hề có cảm giác khó chịu hay bí bách. Không những hype mà còn comfy nữa.</p>',1,'Converse One Star Ox Tyler the Creator Golf Le Fleur Jade Lime','[\"/image/onfeet/onfeet1.jpg\", \"/image/onfeet/onfeet2.jpg\", \"/image/onfeet/onfeet3.jpg\", \"/image/onfeet/onfeet4.jpg\", \"/image/onfeet/onfeet5.jpg\", \"/image/onfeet/onfeet6.jpg\"]',420000,'[\"/image/product/converse/Converse-One-Star-Ox-Tyler-The-Creator-Golf-Le-Fleur-Jade-Lime-Product.jpg\", \"/image/product/converse/Converse-One-Star-Ox-Tyler-The-Creator-Golf-Le-Fleur-Jade-Lime-Product.jpg\", \"/image/product/converse/Converse-One-Star-Ox-Tyler-The-Creator-Golf-Le-Fleur-Jade-Lime-Product.jpg\", \"/image/product/converse/Converse-One-Star-Ox-Tyler-The-Creator-Golf-Le-Fleur-Jade-Lime-Product.jpg\", \"/image/product/converse/Converse-One-Star-Ox-Tyler-The-Creator-Golf-Le-Fleur-Jade-Lime-Product.jpg\"]','converse-one-star-ox-tyler-the-creator-golf-le-fleur-jade-lime',24,4),('j432jl','2020-06-09 05:46:03','<p style=\"font-family: Roboto, sans-serif; outline: none; color: rgb(51, 51, 51);\">Trend “dad shoes” đang gây bão trong giới trẻ hiện nay và mẫu giày Yeezy 700 Wave Runner Solid Grey cũng góp phần tạo nên sức hút cho cơn sốt này, khiến giới săn giày đứng ngồi không yên. Kiểu dáng của Yeezy 700 Wave Runner Solid Grey chịu sự ảnh hưởng của những mẫu “dad shoes” và cross-trainer, hiện đang là 2 xu hướng sneaker được ưa thích trong những năm gần đây. Đế giày đậm chất chunky sneaker và thiết kế retro, đi cùng bản phối xám / xanh / cam đã dễ dàng thổi “bùa yêu” vào giới yêu giày.</p><p style=\"font-family: Roboto, sans-serif; outline: none; color: rgb(51, 51, 51);\">Phần upper sử dụng chất liệu breathable mesh, suede và nubuck. Điểm nhấn ấn tượng chính là thiết kế là dây giày màu neon đi kèm một số chi tiết được làm bằng chất liệu 3M phản quang. Với bộ đế boost nổi tiếng và form giày rộng rãi, Yeezy 700 Wave Runner Solid Grey mang đến cảm giác dễ chịu nhất cho người mang. Cộng nghệ Boost với tấm đệm lót “thần thánh” êm ái, bạn có thể mang đôi giày này từ sáng đến tối mà không hề có cảm giác khó chịu hay bí bách. Không những hype mà còn comfy nữa.</p>',1,'Converse Chuck Taylor All-Star 70s Hi Undercover New Warriors White','[\"/image/onfeet/onfeet1.jpg\", \"/image/onfeet/onfeet2.jpg\", \"/image/onfeet/onfeet3.jpg\", \"/image/onfeet/onfeet4.jpg\", \"/image/onfeet/onfeet5.jpg\", \"/image/onfeet/onfeet6.jpg\"]',3600000,'[\"/image/product/converse/Converse-Chuck-Taylor-All-Star-70s-Hi-Undercover-New-Warriors-White-Product.jpg\", \"/image/product/converse/Converse-Chuck-Taylor-All-Star-70s-Hi-Undercover-New-Warriors-White-Product.jpg\", \"/image/product/converse/Converse-Chuck-Taylor-All-Star-70s-Hi-Undercover-New-Warriors-White-Product.jpg\", \"/image/product/converse/Converse-Chuck-Taylor-All-Star-70s-Hi-Undercover-New-Warriors-White-Product.jpg\", \"/image/product/converse/Converse-Chuck-Taylor-All-Star-70s-Hi-Undercover-New-Warriors-White-Product.jpg\"]','converse-chuck-taylor-all-star-70s-hi-undercover-new-warriors-white',157,4),('JL8Dd5','2020-06-09 04:18:39','<p style=\"font-family: Roboto, sans-serif; outline: none; color: rgb(51, 51, 51);\">Trend “dad shoes” đang gây bão trong giới trẻ hiện nay và mẫu giày Yeezy 700 Wave Runner Solid Grey cũng góp phần tạo nên sức hút cho cơn sốt này, khiến giới săn giày đứng ngồi không yên. Kiểu dáng của Yeezy 700 Wave Runner Solid Grey chịu sự ảnh hưởng của những mẫu “dad shoes” và cross-trainer, hiện đang là 2 xu hướng sneaker được ưa thích trong những năm gần đây. Đế giày đậm chất chunky sneaker và thiết kế retro, đi cùng bản phối xám / xanh / cam đã dễ dàng thổi “bùa yêu” vào giới yêu giày.</p><p style=\"font-family: Roboto, sans-serif; outline: none; color: rgb(51, 51, 51);\">Phần upper sử dụng chất liệu breathable mesh, suede và nubuck. Điểm nhấn ấn tượng chính là thiết kế là dây giày màu neon đi kèm một số chi tiết được làm bằng chất liệu 3M phản quang. Với bộ đế boost nổi tiếng và form giày rộng rãi, Yeezy 700 Wave Runner Solid Grey mang đến cảm giác dễ chịu nhất cho người mang. Cộng nghệ Boost với tấm đệm lót “thần thánh” êm ái, bạn có thể mang đôi giày này từ sáng đến tối mà không hề có cảm giác khó chịu hay bí bách. Không những hype mà còn comfy nữa.</p>',1,'Converse Chuck Taylor All-Star 70s Hi Comme des Garcons PLAY White','[\"/image/onfeet/onfeet1.jpg\", \"/image/onfeet/onfeet2.jpg\", \"/image/onfeet/onfeet3.jpg\", \"/image/onfeet/onfeet4.jpg\", \"/image/onfeet/onfeet5.jpg\", \"/image/onfeet/onfeet6.jpg\"]',700000,'[\"/image/product/converse/Converse-Chuck-Taylor-All-Star-70s-Hi-Comme-des-Garcons-PLAY-White-Product.jpg\", \"/image/product/converse/Converse-Chuck-Taylor-All-Star-70s-Hi-Comme-des-Garcons-PLAY-White-Product.jpg\", \"/image/product/converse/Converse-Chuck-Taylor-All-Star-70s-Hi-Comme-des-Garcons-PLAY-White-Product.jpg\", \"/image/product/converse/Converse-Chuck-Taylor-All-Star-70s-Hi-Comme-des-Garcons-PLAY-White-Product.jpg\", \"/image/product/converse/Converse-Chuck-Taylor-All-Star-70s-Hi-Comme-des-Garcons-PLAY-White-Product.jpg\"]','converse-chuck-taylor-all-star-70s-hi-comme-des-garcons-play-white',165,4),('JLEjl2','2020-06-09 05:03:43','<p style=\"font-family: Roboto, sans-serif; outline: none; color: rgb(51, 51, 51);\">Trend “dad shoes” đang gây bão trong giới trẻ hiện nay và mẫu giày Yeezy 700 Wave Runner Solid Grey cũng góp phần tạo nên sức hút cho cơn sốt này, khiến giới săn giày đứng ngồi không yên. Kiểu dáng của Yeezy 700 Wave Runner Solid Grey chịu sự ảnh hưởng của những mẫu “dad shoes” và cross-trainer, hiện đang là 2 xu hướng sneaker được ưa thích trong những năm gần đây. Đế giày đậm chất chunky sneaker và thiết kế retro, đi cùng bản phối xám / xanh / cam đã dễ dàng thổi “bùa yêu” vào giới yêu giày.</p><p style=\"font-family: Roboto, sans-serif; outline: none; color: rgb(51, 51, 51);\">Phần upper sử dụng chất liệu breathable mesh, suede và nubuck. Điểm nhấn ấn tượng chính là thiết kế là dây giày màu neon đi kèm một số chi tiết được làm bằng chất liệu 3M phản quang. Với bộ đế boost nổi tiếng và form giày rộng rãi, Yeezy 700 Wave Runner Solid Grey mang đến cảm giác dễ chịu nhất cho người mang. Cộng nghệ Boost với tấm đệm lót “thần thánh” êm ái, bạn có thể mang đôi giày này từ sáng đến tối mà không hề có cảm giác khó chịu hay bí bách. Không những hype mà còn comfy nữa.</p>',1,'Converse Chuck Taylor All-Star Vulcanized Hi Off-White','[\"/image/onfeet/onfeet1.jpg\", \"/image/onfeet/onfeet2.jpg\", \"/image/onfeet/onfeet3.jpg\", \"/image/onfeet/onfeet4.jpg\", \"/image/onfeet/onfeet5.jpg\", \"/image/onfeet/onfeet6.jpg\"]',400000,'[\"/image/product/converse/Converse-Chuck-Taylor-All-Star-Hi-Off-White-Product.jpg\", \"/image/product/converse/Converse-Chuck-Taylor-All-Star-Hi-Off-White-Product.jpg\", \"/image/product/converse/Converse-Chuck-Taylor-All-Star-Hi-Off-White-Product.jpg\", \"/image/product/converse/Converse-Chuck-Taylor-All-Star-Hi-Off-White-Product.jpg\", \"/image/product/converse/Converse-Chuck-Taylor-All-Star-Hi-Off-White-Product.jpg\"]','converse-chuck-taylor-all-star-vulcanized-hi-off-white',65,4),('jlK454','2020-06-09 04:06:23','<p style=\"font-family: Roboto, sans-serif; outline: none; color: rgb(51, 51, 51);\">Trend “dad shoes” đang gây bão trong giới trẻ hiện nay và mẫu giày Yeezy 700 Wave Runner Solid Grey cũng góp phần tạo nên sức hút cho cơn sốt này, khiến giới săn giày đứng ngồi không yên. Kiểu dáng của Yeezy 700 Wave Runner Solid Grey chịu sự ảnh hưởng của những mẫu “dad shoes” và cross-trainer, hiện đang là 2 xu hướng sneaker được ưa thích trong những năm gần đây. Đế giày đậm chất chunky sneaker và thiết kế retro, đi cùng bản phối xám / xanh / cam đã dễ dàng thổi “bùa yêu” vào giới yêu giày.</p><p style=\"font-family: Roboto, sans-serif; outline: none; color: rgb(51, 51, 51);\">Phần upper sử dụng chất liệu breathable mesh, suede và nubuck. Điểm nhấn ấn tượng chính là thiết kế là dây giày màu neon đi kèm một số chi tiết được làm bằng chất liệu 3M phản quang. Với bộ đế boost nổi tiếng và form giày rộng rãi, Yeezy 700 Wave Runner Solid Grey mang đến cảm giác dễ chịu nhất cho người mang. Cộng nghệ Boost với tấm đệm lót “thần thánh” êm ái, bạn có thể mang đôi giày này từ sáng đến tối mà không hề có cảm giác khó chịu hay bí bách. Không những hype mà còn comfy nữa.</p>',1,'ASICS Gel-Lyte III Ronnie Fieg Super Green','[\"/image/onfeet/onfeet1.jpg\", \"/image/onfeet/onfeet2.jpg\", \"/image/onfeet/onfeet3.jpg\", \"/image/onfeet/onfeet4.jpg\", \"/image/onfeet/onfeet5.jpg\", \"/image/onfeet/onfeet6.jpg\"]',900000,'[\"/image/product/asics/Asics-Gel-Lyte-III-Ronnie-Fieg-Super-Green.jpg\", \"/image/product/asics/Asics-Gel-Lyte-III-Ronnie-Fieg-Super-Green.jpg\", \"/image/product/asics/Asics-Gel-Lyte-III-Ronnie-Fieg-Super-Green.jpg\", \"/image/product/asics/Asics-Gel-Lyte-III-Ronnie-Fieg-Super-Green.jpg\", \"/image/product/asics/Asics-Gel-Lyte-III-Ronnie-Fieg-Super-Green.jpg\"]','asics-gel-lyte-iii-ronnie-fieg-super-green',14,3),('LEO872','2020-06-09 05:07:43','<p style=\"font-family: Roboto, sans-serif; outline: none; color: rgb(51, 51, 51);\">Trend “dad shoes” đang gây bão trong giới trẻ hiện nay và mẫu giày Yeezy 700 Wave Runner Solid Grey cũng góp phần tạo nên sức hút cho cơn sốt này, khiến giới săn giày đứng ngồi không yên. Kiểu dáng của Yeezy 700 Wave Runner Solid Grey chịu sự ảnh hưởng của những mẫu “dad shoes” và cross-trainer, hiện đang là 2 xu hướng sneaker được ưa thích trong những năm gần đây. Đế giày đậm chất chunky sneaker và thiết kế retro, đi cùng bản phối xám / xanh / cam đã dễ dàng thổi “bùa yêu” vào giới yêu giày.</p><p style=\"font-family: Roboto, sans-serif; outline: none; color: rgb(51, 51, 51);\">Phần upper sử dụng chất liệu breathable mesh, suede và nubuck. Điểm nhấn ấn tượng chính là thiết kế là dây giày màu neon đi kèm một số chi tiết được làm bằng chất liệu 3M phản quang. Với bộ đế boost nổi tiếng và form giày rộng rãi, Yeezy 700 Wave Runner Solid Grey mang đến cảm giác dễ chịu nhất cho người mang. Cộng nghệ Boost với tấm đệm lót “thần thánh” êm ái, bạn có thể mang đôi giày này từ sáng đến tối mà không hề có cảm giác khó chịu hay bí bách. Không những hype mà còn comfy nữa.</p>',1,'Adidas Yeezy Boost 700 Wave Runner Solid Grey','[\"/image/onfeet/onfeet1.jpg\", \"/image/onfeet/onfeet2.jpg\", \"/image/onfeet/onfeet3.jpg\", \"/image/onfeet/onfeet4.jpg\", \"/image/onfeet/onfeet5.jpg\", \"/image/onfeet/onfeet6.jpg\"]',650000,'[\"/image/product/adidas/Adidas-Yeezy-Wave-Runner-700-Solid-Grey-Product.jpg\", \"/image/product/adidas/Adidas-Yeezy-Wave-Runner-700-Solid-Grey-Product.jpg\", \"/image/product/adidas/Adidas-Yeezy-Wave-Runner-700-Solid-Grey-Product.jpg\", \"/image/product/adidas/Adidas-Yeezy-Wave-Runner-700-Solid-Grey-Product.jpg\", \"/image/product/adidas/Adidas-Yeezy-Wave-Runner-700-Solid-Grey-Product.jpg\"]','adidas-yeezy-boost-700-wave-runner-solid-grey',76,1),('ljJ439','2020-06-09 04:12:11','<p style=\"font-family: Roboto, sans-serif; outline: none; color: rgb(51, 51, 51);\">Trend “dad shoes” đang gây bão trong giới trẻ hiện nay và mẫu giày Yeezy 700 Wave Runner Solid Grey cũng góp phần tạo nên sức hút cho cơn sốt này, khiến giới săn giày đứng ngồi không yên. Kiểu dáng của Yeezy 700 Wave Runner Solid Grey chịu sự ảnh hưởng của những mẫu “dad shoes” và cross-trainer, hiện đang là 2 xu hướng sneaker được ưa thích trong những năm gần đây. Đế giày đậm chất chunky sneaker và thiết kế retro, đi cùng bản phối xám / xanh / cam đã dễ dàng thổi “bùa yêu” vào giới yêu giày.</p><p style=\"font-family: Roboto, sans-serif; outline: none; color: rgb(51, 51, 51);\">Phần upper sử dụng chất liệu breathable mesh, suede và nubuck. Điểm nhấn ấn tượng chính là thiết kế là dây giày màu neon đi kèm một số chi tiết được làm bằng chất liệu 3M phản quang. Với bộ đế boost nổi tiếng và form giày rộng rãi, Yeezy 700 Wave Runner Solid Grey mang đến cảm giác dễ chịu nhất cho người mang. Cộng nghệ Boost với tấm đệm lót “thần thánh” êm ái, bạn có thể mang đôi giày này từ sáng đến tối mà không hề có cảm giác khó chịu hay bí bách. Không những hype mà còn comfy nữa.</p>',1,'Jordan 12 Retro Fiba (2019)','[\"/image/onfeet/onfeet1.jpg\", \"/image/onfeet/onfeet2.jpg\", \"/image/onfeet/onfeet3.jpg\", \"/image/onfeet/onfeet4.jpg\", \"/image/onfeet/onfeet5.jpg\", \"/image/onfeet/onfeet6.jpg\"]',360000,'[\"/image/product/air-jordan/Air-Jordan-12-Retro-Fiba-2019.jpeg\", \"/image/product/air-jordan/Air-Jordan-12-Retro-Fiba-2019.jpeg\", \"/image/product/air-jordan/Air-Jordan-12-Retro-Fiba-2019.jpeg\", \"/image/product/air-jordan/Air-Jordan-12-Retro-Fiba-2019.jpeg\", \"/image/product/air-jordan/Air-Jordan-12-Retro-Fiba-2019.jpeg\"]','jordan-12-retro-fiba-2019',100,2),('LJL675','2020-06-09 05:08:59','<p style=\"font-family: Roboto, sans-serif; outline: none; color: rgb(51, 51, 51);\">Trend “dad shoes” đang gây bão trong giới trẻ hiện nay và mẫu giày Yeezy 700 Wave Runner Solid Grey cũng góp phần tạo nên sức hút cho cơn sốt này, khiến giới săn giày đứng ngồi không yên. Kiểu dáng của Yeezy 700 Wave Runner Solid Grey chịu sự ảnh hưởng của những mẫu “dad shoes” và cross-trainer, hiện đang là 2 xu hướng sneaker được ưa thích trong những năm gần đây. Đế giày đậm chất chunky sneaker và thiết kế retro, đi cùng bản phối xám / xanh / cam đã dễ dàng thổi “bùa yêu” vào giới yêu giày.</p><p style=\"font-family: Roboto, sans-serif; outline: none; color: rgb(51, 51, 51);\">Phần upper sử dụng chất liệu breathable mesh, suede và nubuck. Điểm nhấn ấn tượng chính là thiết kế là dây giày màu neon đi kèm một số chi tiết được làm bằng chất liệu 3M phản quang. Với bộ đế boost nổi tiếng và form giày rộng rãi, Yeezy 700 Wave Runner Solid Grey mang đến cảm giác dễ chịu nhất cho người mang. Cộng nghệ Boost với tấm đệm lót “thần thánh” êm ái, bạn có thể mang đôi giày này từ sáng đến tối mà không hề có cảm giác khó chịu hay bí bách. Không những hype mà còn comfy nữa.</p>',1,'ASICS Gel-Lyte III Concepts Boston Tea Party','[\"/image/onfeet/onfeet1.jpg\", \"/image/onfeet/onfeet2.jpg\", \"/image/onfeet/onfeet3.jpg\", \"/image/onfeet/onfeet4.jpg\", \"/image/onfeet/onfeet5.jpg\", \"/image/onfeet/onfeet6.jpg\"]',960000,'[\"/image/product/asics/Asics-Gel-Lyte-III-Concepts-Boston-Tea-Party.jpg\", \"/image/product/asics/Asics-Gel-Lyte-III-Concepts-Boston-Tea-Party.jpg\", \"/image/product/asics/Asics-Gel-Lyte-III-Concepts-Boston-Tea-Party.jpg\", \"/image/product/asics/Asics-Gel-Lyte-III-Concepts-Boston-Tea-Party.jpg\", \"/image/product/asics/Asics-Gel-Lyte-III-Concepts-Boston-Tea-Party.jpg\"]','asics-gel-lyte-iii-concepts-boston-tea-party',65,3),('MLH492','2020-06-09 05:12:40','<p style=\"font-family: Roboto, sans-serif; outline: none; color: rgb(51, 51, 51);\">Trend “dad shoes” đang gây bão trong giới trẻ hiện nay và mẫu giày Yeezy 700 Wave Runner Solid Grey cũng góp phần tạo nên sức hút cho cơn sốt này, khiến giới săn giày đứng ngồi không yên. Kiểu dáng của Yeezy 700 Wave Runner Solid Grey chịu sự ảnh hưởng của những mẫu “dad shoes” và cross-trainer, hiện đang là 2 xu hướng sneaker được ưa thích trong những năm gần đây. Đế giày đậm chất chunky sneaker và thiết kế retro, đi cùng bản phối xám / xanh / cam đã dễ dàng thổi “bùa yêu” vào giới yêu giày.</p><p style=\"font-family: Roboto, sans-serif; outline: none; color: rgb(51, 51, 51);\">Phần upper sử dụng chất liệu breathable mesh, suede và nubuck. Điểm nhấn ấn tượng chính là thiết kế là dây giày màu neon đi kèm một số chi tiết được làm bằng chất liệu 3M phản quang. Với bộ đế boost nổi tiếng và form giày rộng rãi, Yeezy 700 Wave Runner Solid Grey mang đến cảm giác dễ chịu nhất cho người mang. Cộng nghệ Boost với tấm đệm lót “thần thánh” êm ái, bạn có thể mang đôi giày này từ sáng đến tối mà không hề có cảm giác khó chịu hay bí bách. Không những hype mà còn comfy nữa.</p>',1,'Vans Sk8-Hi Fear of God','[\"/image/onfeet/onfeet1.jpg\", \"/image/onfeet/onfeet2.jpg\", \"/image/onfeet/onfeet3.jpg\", \"/image/onfeet/onfeet4.jpg\", \"/image/onfeet/onfeet5.jpg\", \"/image/onfeet/onfeet6.jpg\"]',500000,'[\"/image/product/vans/Vans-Sk8-Hi-FOG.jpeg\", \"/image/product/vans/Vans-Sk8-Hi-FOG.jpeg\", \"/image/product/vans/Vans-Sk8-Hi-FOG.jpeg\", \"/image/product/vans/Vans-Sk8-Hi-FOG.jpeg\", \"/image/product/vans/Vans-Sk8-Hi-FOG.jpeg\"]','vans-sk8-hi-fear-of-god',34,6),('MLH946','2020-06-09 04:57:30','<p style=\"font-family: Roboto, sans-serif; outline: none; color: rgb(51, 51, 51);\">Trend “dad shoes” đang gây bão trong giới trẻ hiện nay và mẫu giày Yeezy 700 Wave Runner Solid Grey cũng góp phần tạo nên sức hút cho cơn sốt này, khiến giới săn giày đứng ngồi không yên. Kiểu dáng của Yeezy 700 Wave Runner Solid Grey chịu sự ảnh hưởng của những mẫu “dad shoes” và cross-trainer, hiện đang là 2 xu hướng sneaker được ưa thích trong những năm gần đây. Đế giày đậm chất chunky sneaker và thiết kế retro, đi cùng bản phối xám / xanh / cam đã dễ dàng thổi “bùa yêu” vào giới yêu giày.</p><p style=\"font-family: Roboto, sans-serif; outline: none; color: rgb(51, 51, 51);\">Phần upper sử dụng chất liệu breathable mesh, suede và nubuck. Điểm nhấn ấn tượng chính là thiết kế là dây giày màu neon đi kèm một số chi tiết được làm bằng chất liệu 3M phản quang. Với bộ đế boost nổi tiếng và form giày rộng rãi, Yeezy 700 Wave Runner Solid Grey mang đến cảm giác dễ chịu nhất cho người mang. Cộng nghệ Boost với tấm đệm lót “thần thánh” êm ái, bạn có thể mang đôi giày này từ sáng đến tối mà không hề có cảm giác khó chịu hay bí bách. Không những hype mà còn comfy nữa.</p>',1,'Adidas Yeezy Boost 350 V2 Lundmark (Non Reflective)','[\"/image/onfeet/onfeet1.jpg\", \"/image/onfeet/onfeet2.jpg\", \"/image/onfeet/onfeet3.jpg\", \"/image/onfeet/onfeet4.jpg\", \"/image/onfeet/onfeet5.jpg\", \"/image/onfeet/onfeet6.jpg\"]',792000,'[\"/image/product/adidas/adidas-Yeezy-Boost-350-V2-Lundmark-Product.jpg\", \"/image/product/adidas/adidas-Yeezy-Boost-350-V2-Lundmark-Product.jpg\", \"/image/product/adidas/adidas-Yeezy-Boost-350-V2-Lundmark-Product.jpg\", \"/image/product/adidas/adidas-Yeezy-Boost-350-V2-Lundmark-Product.jpg\", \"/image/product/adidas/adidas-Yeezy-Boost-350-V2-Lundmark-Product.jpg\"]','adidas-yeezy-boost-350-v2-lundmark-non-reflective',42,1),('MN8sa3','2020-06-09 04:19:53','<p style=\"font-family: Roboto, sans-serif; outline: none; color: rgb(51, 51, 51);\">Trend “dad shoes” đang gây bão trong giới trẻ hiện nay và mẫu giày Yeezy 700 Wave Runner Solid Grey cũng góp phần tạo nên sức hút cho cơn sốt này, khiến giới săn giày đứng ngồi không yên. Kiểu dáng của Yeezy 700 Wave Runner Solid Grey chịu sự ảnh hưởng của những mẫu “dad shoes” và cross-trainer, hiện đang là 2 xu hướng sneaker được ưa thích trong những năm gần đây. Đế giày đậm chất chunky sneaker và thiết kế retro, đi cùng bản phối xám / xanh / cam đã dễ dàng thổi “bùa yêu” vào giới yêu giày.</p><p style=\"font-family: Roboto, sans-serif; outline: none; color: rgb(51, 51, 51);\">Phần upper sử dụng chất liệu breathable mesh, suede và nubuck. Điểm nhấn ấn tượng chính là thiết kế là dây giày màu neon đi kèm một số chi tiết được làm bằng chất liệu 3M phản quang. Với bộ đế boost nổi tiếng và form giày rộng rãi, Yeezy 700 Wave Runner Solid Grey mang đến cảm giác dễ chịu nhất cho người mang. Cộng nghệ Boost với tấm đệm lót “thần thánh” êm ái, bạn có thể mang đôi giày này từ sáng đến tối mà không hề có cảm giác khó chịu hay bí bách. Không những hype mà còn comfy nữa.</p>',1,'Converse Chuck Taylor All-Star 70s Hi Kith Coca-Cola Denim (2019)','[\"/image/onfeet/onfeet1.jpg\", \"/image/onfeet/onfeet2.jpg\", \"/image/onfeet/onfeet3.jpg\", \"/image/onfeet/onfeet4.jpg\", \"/image/onfeet/onfeet5.jpg\", \"/image/onfeet/onfeet6.jpg\"]',350000,'[\"/image/product/converse/Converse-Chuck-Taylor-All-Star-70s-Hi-Kith-Coca-Cola-Denim-2019.jpeg\", \"/image/product/converse/Converse-Chuck-Taylor-All-Star-70s-Hi-Kith-Coca-Cola-Denim-2019.jpeg\", \"/image/product/converse/Converse-Chuck-Taylor-All-Star-70s-Hi-Kith-Coca-Cola-Denim-2019.jpeg\", \"/image/product/converse/Converse-Chuck-Taylor-All-Star-70s-Hi-Kith-Coca-Cola-Denim-2019.jpeg\", \"/image/product/converse/Converse-Chuck-Taylor-All-Star-70s-Hi-Kith-Coca-Cola-Denim-2019.jpeg\", \"/image/product/converse/Converse-Chuck-Taylor-All-Star-70s-Hi-Kith-Coca-Cola-Denim-2019.jpeg\"]','converse-chuck-taylor-all-star-70s-hi-kith-coca-cola-denim-2019',466,4),('MSL242','2020-06-09 04:10:22','<p style=\"font-family: Roboto, sans-serif; outline: none; color: rgb(51, 51, 51);\">Trend “dad shoes” đang gây bão trong giới trẻ hiện nay và mẫu giày Yeezy 700 Wave Runner Solid Grey cũng góp phần tạo nên sức hút cho cơn sốt này, khiến giới săn giày đứng ngồi không yên. Kiểu dáng của Yeezy 700 Wave Runner Solid Grey chịu sự ảnh hưởng của những mẫu “dad shoes” và cross-trainer, hiện đang là 2 xu hướng sneaker được ưa thích trong những năm gần đây. Đế giày đậm chất chunky sneaker và thiết kế retro, đi cùng bản phối xám / xanh / cam đã dễ dàng thổi “bùa yêu” vào giới yêu giày.</p><p style=\"font-family: Roboto, sans-serif; outline: none; color: rgb(51, 51, 51);\">Phần upper sử dụng chất liệu breathable mesh, suede và nubuck. Điểm nhấn ấn tượng chính là thiết kế là dây giày màu neon đi kèm một số chi tiết được làm bằng chất liệu 3M phản quang. Với bộ đế boost nổi tiếng và form giày rộng rãi, Yeezy 700 Wave Runner Solid Grey mang đến cảm giác dễ chịu nhất cho người mang. Cộng nghệ Boost với tấm đệm lót “thần thánh” êm ái, bạn có thể mang đôi giày này từ sáng đến tối mà không hề có cảm giác khó chịu hay bí bách. Không những hype mà còn comfy nữa.</p>',1,'Asics Gel-Lyte III Afew x Beams Orange Koi','[\"/image/onfeet/onfeet1.jpg\", \"/image/onfeet/onfeet2.jpg\", \"/image/onfeet/onfeet3.jpg\", \"/image/onfeet/onfeet4.jpg\", \"/image/onfeet/onfeet5.jpg\", \"/image/onfeet/onfeet6.jpg\"]',600000,'[\"/image/product/asics/Asics-Gel-Lyte-III-Afew-X-Beams-Orange-Koi-Product.jpg\", \"/image/product/asics/Asics-Gel-Lyte-III-Afew-X-Beams-Orange-Koi-Product.jpg\", \"/image/product/asics/Asics-Gel-Lyte-III-Afew-X-Beams-Orange-Koi-Product.jpg\", \"/image/product/asics/Asics-Gel-Lyte-III-Afew-X-Beams-Orange-Koi-Product.jpg\", \"/image/product/asics/Asics-Gel-Lyte-III-Afew-X-Beams-Orange-Koi-Product.jpg\"]','asics-gel-lyte-iii-afew-x-beams-orange-koi',32,3),('MWHO233','2020-06-09 05:17:10','<p style=\"font-family: Roboto, sans-serif; outline: none; color: rgb(51, 51, 51);\">Trend “dad shoes” đang gây bão trong giới trẻ hiện nay và mẫu giày Yeezy 700 Wave Runner Solid Grey cũng góp phần tạo nên sức hút cho cơn sốt này, khiến giới săn giày đứng ngồi không yên. Kiểu dáng của Yeezy 700 Wave Runner Solid Grey chịu sự ảnh hưởng của những mẫu “dad shoes” và cross-trainer, hiện đang là 2 xu hướng sneaker được ưa thích trong những năm gần đây. Đế giày đậm chất chunky sneaker và thiết kế retro, đi cùng bản phối xám / xanh / cam đã dễ dàng thổi “bùa yêu” vào giới yêu giày.</p><p style=\"font-family: Roboto, sans-serif; outline: none; color: rgb(51, 51, 51);\">Phần upper sử dụng chất liệu breathable mesh, suede và nubuck. Điểm nhấn ấn tượng chính là thiết kế là dây giày màu neon đi kèm một số chi tiết được làm bằng chất liệu 3M phản quang. Với bộ đế boost nổi tiếng và form giày rộng rãi, Yeezy 700 Wave Runner Solid Grey mang đến cảm giác dễ chịu nhất cho người mang. Cộng nghệ Boost với tấm đệm lót “thần thánh” êm ái, bạn có thể mang đôi giày này từ sáng đến tối mà không hề có cảm giác khó chịu hay bí bách. Không những hype mà còn comfy nữa.</p>',1,'Vans Sk8-Hi Odd Future Donut','[\"/image/onfeet/onfeet1.jpg\", \"/image/onfeet/onfeet2.jpg\", \"/image/onfeet/onfeet3.jpg\", \"/image/onfeet/onfeet4.jpg\", \"/image/onfeet/onfeet5.jpg\", \"/image/onfeet/onfeet6.jpg\"]',840000,'[\"/image/product/vans/Vans-OG-Sk8-Hi-Odd-Future-Donut-Product.jpg\", \"/image/product/vans/Vans-OG-Sk8-Hi-Odd-Future-Donut-Product.jpg\", \"/image/product/vans/Vans-OG-Sk8-Hi-Odd-Future-Donut-Product.jpg\", \"/image/product/vans/Vans-OG-Sk8-Hi-Odd-Future-Donut-Product.jpg\", \"/image/product/vans/Vans-OG-Sk8-Hi-Odd-Future-Donut-Product.jpg\", \"/image/product/vans/Vans-OG-Sk8-Hi-Odd-Future-Donut-Product.jpg\"]','vans-sk8-hi-odd-future-donut',53,6),('qjl258','2020-06-09 05:11:23','<p style=\"font-family: Roboto, sans-serif; outline: none; color: rgb(51, 51, 51);\">Trend “dad shoes” đang gây bão trong giới trẻ hiện nay và mẫu giày Yeezy 700 Wave Runner Solid Grey cũng góp phần tạo nên sức hút cho cơn sốt này, khiến giới săn giày đứng ngồi không yên. Kiểu dáng của Yeezy 700 Wave Runner Solid Grey chịu sự ảnh hưởng của những mẫu “dad shoes” và cross-trainer, hiện đang là 2 xu hướng sneaker được ưa thích trong những năm gần đây. Đế giày đậm chất chunky sneaker và thiết kế retro, đi cùng bản phối xám / xanh / cam đã dễ dàng thổi “bùa yêu” vào giới yêu giày.</p><p style=\"font-family: Roboto, sans-serif; outline: none; color: rgb(51, 51, 51);\">Phần upper sử dụng chất liệu breathable mesh, suede và nubuck. Điểm nhấn ấn tượng chính là thiết kế là dây giày màu neon đi kèm một số chi tiết được làm bằng chất liệu 3M phản quang. Với bộ đế boost nổi tiếng và form giày rộng rãi, Yeezy 700 Wave Runner Solid Grey mang đến cảm giác dễ chịu nhất cho người mang. Cộng nghệ Boost với tấm đệm lót “thần thánh” êm ái, bạn có thể mang đôi giày này từ sáng đến tối mà không hề có cảm giác khó chịu hay bí bách. Không những hype mà còn comfy nữa.</p>',1,'Jordan 1 Retro High Travis Scott','[\"/image/onfeet/onfeet1.jpg\", \"/image/onfeet/onfeet2.jpg\", \"/image/onfeet/onfeet3.jpg\", \"/image/onfeet/onfeet4.jpg\", \"/image/onfeet/onfeet5.jpg\", \"/image/onfeet/onfeet6.jpg\"]',600000,'[\"/image/product/air-jordan/Air-Jordan-1-Retro-High-Travis-Scott-Product.jpg\", \"/image/product/air-jordan/Air-Jordan-1-Retro-High-Travis-Scott-Product.jpg\", \"/image/product/air-jordan/Air-Jordan-1-Retro-High-Travis-Scott-Product.jpg\", \"/image/product/air-jordan/Air-Jordan-1-Retro-High-Travis-Scott-Product.jpg\", \"/image/product/air-jordan/Air-Jordan-1-Retro-High-Travis-Scott-Product.jpg\"]','jordan-1-retro-high-travis-scott',2,2),('QR3l6ss','2020-06-09 05:10:06','<p style=\"font-family: Roboto, sans-serif; outline: none; color: rgb(51, 51, 51);\">Trend “dad shoes” đang gây bão trong giới trẻ hiện nay và mẫu giày Yeezy 700 Wave Runner Solid Grey cũng góp phần tạo nên sức hút cho cơn sốt này, khiến giới săn giày đứng ngồi không yên. Kiểu dáng của Yeezy 700 Wave Runner Solid Grey chịu sự ảnh hưởng của những mẫu “dad shoes” và cross-trainer, hiện đang là 2 xu hướng sneaker được ưa thích trong những năm gần đây. Đế giày đậm chất chunky sneaker và thiết kế retro, đi cùng bản phối xám / xanh / cam đã dễ dàng thổi “bùa yêu” vào giới yêu giày.</p><p style=\"font-family: Roboto, sans-serif; outline: none; color: rgb(51, 51, 51);\">Phần upper sử dụng chất liệu breathable mesh, suede và nubuck. Điểm nhấn ấn tượng chính là thiết kế là dây giày màu neon đi kèm một số chi tiết được làm bằng chất liệu 3M phản quang. Với bộ đế boost nổi tiếng và form giày rộng rãi, Yeezy 700 Wave Runner Solid Grey mang đến cảm giác dễ chịu nhất cho người mang. Cộng nghệ Boost với tấm đệm lót “thần thánh” êm ái, bạn có thể mang đôi giày này từ sáng đến tối mà không hề có cảm giác khó chịu hay bí bách. Không những hype mà còn comfy nữa.</p>',1,'Converse Run Star Hike Hi JW Anderson Black','[\"/image/onfeet/onfeet1.jpg\", \"/image/onfeet/onfeet2.jpg\", \"/image/onfeet/onfeet3.jpg\", \"/image/onfeet/onfeet4.jpg\", \"/image/onfeet/onfeet5.jpg\", \"/image/onfeet/onfeet6.jpg\"]',800000,'[\"/image/product/converse/Converse-Run-Star-Hike-Hi-JW-Anderson-Black-Product.jpg\", \"/image/product/converse/Converse-Run-Star-Hike-Hi-JW-Anderson-Black-Product.jpg\", \"/image/product/converse/Converse-Run-Star-Hike-Hi-JW-Anderson-Black-Product.jpg\", \"/image/product/converse/Converse-Run-Star-Hike-Hi-JW-Anderson-Black-Product.jpg\", \"/image/product/converse/Converse-Run-Star-Hike-Hi-JW-Anderson-Black-Product.jpg\"]','converse-run-star-hike-hi-jw-anderson-black',43,4),('qw241J','2020-06-09 05:48:24','<p style=\"font-family: Roboto, sans-serif; outline: none; color: rgb(51, 51, 51);\">Trend “dad shoes” đang gây bão trong giới trẻ hiện nay và mẫu giày Yeezy 700 Wave Runner Solid Grey cũng góp phần tạo nên sức hút cho cơn sốt này, khiến giới săn giày đứng ngồi không yên. Kiểu dáng của Yeezy 700 Wave Runner Solid Grey chịu sự ảnh hưởng của những mẫu “dad shoes” và cross-trainer, hiện đang là 2 xu hướng sneaker được ưa thích trong những năm gần đây. Đế giày đậm chất chunky sneaker và thiết kế retro, đi cùng bản phối xám / xanh / cam đã dễ dàng thổi “bùa yêu” vào giới yêu giày.</p><p style=\"font-family: Roboto, sans-serif; outline: none; color: rgb(51, 51, 51);\">Phần upper sử dụng chất liệu breathable mesh, suede và nubuck. Điểm nhấn ấn tượng chính là thiết kế là dây giày màu neon đi kèm một số chi tiết được làm bằng chất liệu 3M phản quang. Với bộ đế boost nổi tiếng và form giày rộng rãi, Yeezy 700 Wave Runner Solid Grey mang đến cảm giác dễ chịu nhất cho người mang. Cộng nghệ Boost với tấm đệm lót “thần thánh” êm ái, bạn có thể mang đôi giày này từ sáng đến tối mà không hề có cảm giác khó chịu hay bí bách. Không những hype mà còn comfy nữa.</p>',1,'Vans Sk8-Hi Checkerboard Cap','[\"/image/onfeet/onfeet1.jpg\", \"/image/onfeet/onfeet2.jpg\", \"/image/onfeet/onfeet3.jpg\", \"/image/onfeet/onfeet4.jpg\", \"/image/onfeet/onfeet5.jpg\", \"/image/onfeet/onfeet6.jpg\"]',1500000,'[\"/image/product/vans/Vans-Sk8-Hi-Checkerboard-Cap-1.jpg\", \"/image/product/vans/Vans-Sk8-Hi-Checkerboard-Cap-1.jpg\", \"/image/product/vans/Vans-Sk8-Hi-Checkerboard-Cap-1.jpg\", \"/image/product/vans/Vans-Sk8-Hi-Checkerboard-Cap-1.jpg\", \"/image/product/vans/Vans-Sk8-Hi-Checkerboard-Cap-1.jpg\"]','vans-sk8-hi-checkerboard-cap',35,6),('REI425','2020-06-09 05:56:18','<p style=\"font-family: Roboto, sans-serif; outline: none; color: rgb(51, 51, 51);\">Trend “dad shoes” đang gây bão trong giới trẻ hiện nay và mẫu giày Yeezy 700 Wave Runner Solid Grey cũng góp phần tạo nên sức hút cho cơn sốt này, khiến giới săn giày đứng ngồi không yên. Kiểu dáng của Yeezy 700 Wave Runner Solid Grey chịu sự ảnh hưởng của những mẫu “dad shoes” và cross-trainer, hiện đang là 2 xu hướng sneaker được ưa thích trong những năm gần đây. Đế giày đậm chất chunky sneaker và thiết kế retro, đi cùng bản phối xám / xanh / cam đã dễ dàng thổi “bùa yêu” vào giới yêu giày.</p><p style=\"font-family: Roboto, sans-serif; outline: none; color: rgb(51, 51, 51);\">Phần upper sử dụng chất liệu breathable mesh, suede và nubuck. Điểm nhấn ấn tượng chính là thiết kế là dây giày màu neon đi kèm một số chi tiết được làm bằng chất liệu 3M phản quang. Với bộ đế boost nổi tiếng và form giày rộng rãi, Yeezy 700 Wave Runner Solid Grey mang đến cảm giác dễ chịu nhất cho người mang. Cộng nghệ Boost với tấm đệm lót “thần thánh” êm ái, bạn có thể mang đôi giày này từ sáng đến tối mà không hề có cảm giác khó chịu hay bí bách. Không những hype mà còn comfy nữa.</p>',1,'Kyrie 5 Spongebob Squarepants','[\"/image/onfeet/onfeet1.jpg\", \"/image/onfeet/onfeet2.jpg\", \"/image/onfeet/onfeet3.jpg\", \"/image/onfeet/onfeet4.jpg\", \"/image/onfeet/onfeet5.jpg\", \"/image/onfeet/onfeet6.jpg\"]',1350000,'[\"/image/product/nike/Nike-Kyrie-5-Spongebob-Product.jpg\", \"/image/product/nike/Nike-Kyrie-5-Spongebob-Product.jpg\", \"/image/product/nike/Nike-Kyrie-5-Spongebob-Product.jpg\", \"/image/product/nike/Nike-Kyrie-5-Spongebob-Product.jpg\", \"/image/product/nike/Nike-Kyrie-5-Spongebob-Product.jpg\"]','kyrie-5-spongebob-squarepants',42,5),('RJL186','2020-06-09 05:28:00','<p style=\"font-family: Roboto, sans-serif; outline: none; color: rgb(51, 51, 51);\">Trend “dad shoes” đang gây bão trong giới trẻ hiện nay và mẫu giày Yeezy 700 Wave Runner Solid Grey cũng góp phần tạo nên sức hút cho cơn sốt này, khiến giới săn giày đứng ngồi không yên. Kiểu dáng của Yeezy 700 Wave Runner Solid Grey chịu sự ảnh hưởng của những mẫu “dad shoes” và cross-trainer, hiện đang là 2 xu hướng sneaker được ưa thích trong những năm gần đây. Đế giày đậm chất chunky sneaker và thiết kế retro, đi cùng bản phối xám / xanh / cam đã dễ dàng thổi “bùa yêu” vào giới yêu giày.</p><p style=\"font-family: Roboto, sans-serif; outline: none; color: rgb(51, 51, 51);\">Phần upper sử dụng chất liệu breathable mesh, suede và nubuck. Điểm nhấn ấn tượng chính là thiết kế là dây giày màu neon đi kèm một số chi tiết được làm bằng chất liệu 3M phản quang. Với bộ đế boost nổi tiếng và form giày rộng rãi, Yeezy 700 Wave Runner Solid Grey mang đến cảm giác dễ chịu nhất cho người mang. Cộng nghệ Boost với tấm đệm lót “thần thánh” êm ái, bạn có thể mang đôi giày này từ sáng đến tối mà không hề có cảm giác khó chịu hay bí bách. Không những hype mà còn comfy nữa.</p>',1,'Jordan 1 Low SB UNC','[\"/image/onfeet/onfeet1.jpg\", \"/image/onfeet/onfeet2.jpg\", \"/image/onfeet/onfeet3.jpg\", \"/image/onfeet/onfeet4.jpg\", \"/image/onfeet/onfeet5.jpg\", \"/image/onfeet/onfeet6.jpg\"]',890000,'[\"/image/product/air-jordan/Air-Jordan-1-Low-SB-UNC-v2.jpg\", \"/image/product/air-jordan/Air-Jordan-1-Low-SB-UNC-v2.jpg\", \"/image/product/air-jordan/Air-Jordan-1-Low-SB-UNC-v2.jpg\", \"/image/product/air-jordan/Air-Jordan-1-Low-SB-UNC-v2.jpg\", \"/image/product/air-jordan/Air-Jordan-1-Low-SB-UNC-v2.jpg\"]','jordan-1-low-sb-unc',235,2),('thy981','2020-06-09 04:17:20','<p style=\"font-family: Roboto, sans-serif; outline: none; color: rgb(51, 51, 51);\">Trend “dad shoes” đang gây bão trong giới trẻ hiện nay và mẫu giày Yeezy 700 Wave Runner Solid Grey cũng góp phần tạo nên sức hút cho cơn sốt này, khiến giới săn giày đứng ngồi không yên. Kiểu dáng của Yeezy 700 Wave Runner Solid Grey chịu sự ảnh hưởng của những mẫu “dad shoes” và cross-trainer, hiện đang là 2 xu hướng sneaker được ưa thích trong những năm gần đây. Đế giày đậm chất chunky sneaker và thiết kế retro, đi cùng bản phối xám / xanh / cam đã dễ dàng thổi “bùa yêu” vào giới yêu giày.</p><p style=\"font-family: Roboto, sans-serif; outline: none; color: rgb(51, 51, 51);\">Phần upper sử dụng chất liệu breathable mesh, suede và nubuck. Điểm nhấn ấn tượng chính là thiết kế là dây giày màu neon đi kèm một số chi tiết được làm bằng chất liệu 3M phản quang. Với bộ đế boost nổi tiếng và form giày rộng rãi, Yeezy 700 Wave Runner Solid Grey mang đến cảm giác dễ chịu nhất cho người mang. Cộng nghệ Boost với tấm đệm lót “thần thánh” êm ái, bạn có thể mang đôi giày này từ sáng đến tối mà không hề có cảm giác khó chịu hay bí bách. Không những hype mà còn comfy nữa.</p>',1,'Converse Chuck Taylor All-Star 70s Hi Off-White','[\"/image/onfeet/onfeet1.jpg\", \"/image/onfeet/onfeet2.jpg\", \"/image/onfeet/onfeet3.jpg\", \"/image/onfeet/onfeet4.jpg\", \"/image/onfeet/onfeet5.jpg\", \"/image/onfeet/onfeet6.jpg\"]',460000,'[\"/image/product/converse/Converse-Chuck-Taylor-All-Star-70s-Hi-Off-White-Product.jpg\", \"/image/product/converse/Converse-Chuck-Taylor-All-Star-70s-Hi-Off-White-Product.jpg\", \"/image/product/converse/Converse-Chuck-Taylor-All-Star-70s-Hi-Off-White-Product.jpg\", \"/image/product/converse/Converse-Chuck-Taylor-All-Star-70s-Hi-Off-White-Product.jpg\", \"/image/product/converse/Converse-Chuck-Taylor-All-Star-70s-Hi-Off-White-Product.jpg\", \"/image/product/converse/Converse-Chuck-Taylor-All-Star-70s-Hi-Off-White-Product.jpg\"]','converse-chuck-taylor-all-star-70s-hi-off-white',165,4),('WER424','2020-06-09 05:39:04','<p style=\"font-family: Roboto, sans-serif; outline: none; color: rgb(51, 51, 51);\">Trend “dad shoes” đang gây bão trong giới trẻ hiện nay và mẫu giày Yeezy 700 Wave Runner Solid Grey cũng góp phần tạo nên sức hút cho cơn sốt này, khiến giới săn giày đứng ngồi không yên. Kiểu dáng của Yeezy 700 Wave Runner Solid Grey chịu sự ảnh hưởng của những mẫu “dad shoes” và cross-trainer, hiện đang là 2 xu hướng sneaker được ưa thích trong những năm gần đây. Đế giày đậm chất chunky sneaker và thiết kế retro, đi cùng bản phối xám / xanh / cam đã dễ dàng thổi “bùa yêu” vào giới yêu giày.</p><p style=\"font-family: Roboto, sans-serif; outline: none; color: rgb(51, 51, 51);\">Phần upper sử dụng chất liệu breathable mesh, suede và nubuck. Điểm nhấn ấn tượng chính là thiết kế là dây giày màu neon đi kèm một số chi tiết được làm bằng chất liệu 3M phản quang. Với bộ đế boost nổi tiếng và form giày rộng rãi, Yeezy 700 Wave Runner Solid Grey mang đến cảm giác dễ chịu nhất cho người mang. Cộng nghệ Boost với tấm đệm lót “thần thánh” êm ái, bạn có thể mang đôi giày này từ sáng đến tối mà không hề có cảm giác khó chịu hay bí bách. Không những hype mà còn comfy nữa.</p>',1,'Vans Sk8-Hi Deconstructed Black','[\"/image/onfeet/onfeet1.jpg\", \"/image/onfeet/onfeet2.jpg\", \"/image/onfeet/onfeet3.jpg\", \"/image/onfeet/onfeet4.jpg\", \"/image/onfeet/onfeet5.jpg\", \"/image/onfeet/onfeet6.jpg\"]',1500000,'[\"/image/product/vans/Vans-Sk8-Hi-Deconstructed-Black-Product.jpg\", \"/image/product/vans/Vans-Sk8-Hi-Deconstructed-Black-Product.jpg\", \"/image/product/vans/Vans-Sk8-Hi-Deconstructed-Black-Product.jpg\", \"/image/product/vans/Vans-Sk8-Hi-Deconstructed-Black-Product.jpg\", \"/image/product/vans/Vans-Sk8-Hi-Deconstructed-Black-Product.jpg\"]','vans-sk8-hi-deconstructed-black',64,6);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_category`
--

DROP TABLE IF EXISTS `product_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_category` (
  `product_id` varchar(255) NOT NULL,
  `category_id` int NOT NULL,
  KEY `FKkud35ls1d40wpjb5htpp14q4e` (`category_id`),
  KEY `FK2k3smhbruedlcrvu6clued06x` (`product_id`),
  CONSTRAINT `FK2k3smhbruedlcrvu6clued06x` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `FKkud35ls1d40wpjb5htpp14q4e` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_category`
--

LOCK TABLES `product_category` WRITE;
/*!40000 ALTER TABLE `product_category` DISABLE KEYS */;
INSERT INTO `product_category` VALUES ('AKJ469',1),('AKJ469',3),('jlK454',2),('1df5Kd',3),('1df5Kd',1),('MSL242',1),('MSL242',2),('ljJ439',2),('135JLM',3),('thy981',2),('thy981',1),('JL8Dd5',1),('JL8Dd5',2),('MN8sa3',1),('MLH946',1),('JLEjl2',2),('LEO872',3),('LEO872',2),('LJL675',2),('QR3l6ss',1),('qjl258',2),('MLH946',2),('MLH946',1),('AHFA34',1),('ixrq43',2),('MWHO233',2),('MWHO233',3),('RJL186',1),('RJL186',2),('3AQ322',2),('WER424',1),('HWT354',1),('HWT354',3),('j432jl',2),('qw241J',3),('qw241J',2),('REI425',1);
/*!40000 ALTER TABLE `product_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_size`
--

DROP TABLE IF EXISTS `product_size`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_size` (
  `product_id` varchar(255) NOT NULL,
  `size` int NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`product_id`,`size`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_size`
--

LOCK TABLES `product_size` WRITE;
/*!40000 ALTER TABLE `product_size` DISABLE KEYS */;
INSERT INTO `product_size` VALUES ('135JLM',35,34),('135JLM',36,13),('135JLM',37,24),('135JLM',38,24),('135JLM',40,74),('135JLM',41,7),('1df5Kd',36,134),('1df5Kd',37,100),('1df5Kd',38,173),('1df5Kd',39,178),('1df5Kd',40,17),('3AQ322',38,69),('AHFA34',40,12),('AHFA34',41,10),('AHFA34',42,1),('AKJ469',39,2),('AKJ469',40,2),('HWT354',38,23),('HWT354',39,24),('HWT354',40,12),('ixrq43',38,24),('j432jl',39,25),('j432jl',40,53),('JLEjl2',38,13),('JLEjl2',39,53),('JLEjl2',40,2),('JLEjl2',41,6),('JLEjl2',42,2),('jlK454',38,23),('jlK454',39,23),('LEO872',39,24),('LEO872',40,24),('ljJ439',35,32),('ljJ439',36,33),('LJL675',40,24),('MLH946',39,43),('MLH946',40,42),('MLH946',41,42),('MN8sa3',38,24),('MN8sa3',40,43),('MSL242',39,13),('MSL242',40,16),('MWHO233',39,13),('MWHO233',40,13),('MWHO233',41,13),('qjl258',39,45),('qjl258',40,22),('RJL186',40,24),('WER424',37,12);
/*!40000 ALTER TABLE `product_size` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotion`
--

DROP TABLE IF EXISTS `promotion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promotion` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `coupon_code` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `discount_type` int DEFAULT NULL,
  `discount_value` bigint DEFAULT NULL,
  `expired_at` datetime DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `is_public` tinyint(1) DEFAULT NULL,
  `maximum_discount_value` bigint DEFAULT NULL,
  `name` varchar(300) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_acld676f1gyc04nofpb7t2ecn` (`coupon_code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotion`
--

LOCK TABLES `promotion` WRITE;
/*!40000 ALTER TABLE `promotion` DISABLE KEYS */;
INSERT INTO `promotion` VALUES (1,'OPENING','2020-06-09 08:44:43',1,20,'2020-07-02 00:00:00',1,1,200000,'Mừng khai trương');
/*!40000 ALTER TABLE `promotion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `email` varchar(200) NOT NULL,
  `full_name` varchar(200) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `roles` json NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_6dotkott2kjsp8vw4d0m25fb7` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Hà Nội','2022-06-11 15:18:22','london@souvenir.com','ADMIN','$2a$12$gDLZPcBVL5RESvJijhJxCOLw4XQeA7j4QvY8txQMpvdujZsnqdVC6','0987654321','[\"USER\", \"ADMIN\"]',1),(2,'Bắc Ninh','2022-06-10 13:08:12','vanxuan2042000@gmail.com','nghiem van  xuan','$2a$12$pcEjVpxZ1PDsH3yEgmTduu6h49gomcuffJWEz0HQTzaQu7.flCwKW','0916468464','[\"USER\"]',1),(3,'Từ Sơn, Bắc Ninh','2022-06-07 23:07:01','xuanxhaka@gmail.com','xuan xhaka','$2a$12$I6gco4OlQ2/bdZvKo..u4.0qrQFPE5ikIh.jgTPQeD/RP7lbHZc7W','0971423033','[\"USER\"]',1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'football'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-11 15:12:23
