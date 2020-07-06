-- MySQL dump 10.13  Distrib 8.0.20, for macos10.15 (x86_64)
--
-- Host: 127.0.0.1    Database: data
-- ------------------------------------------------------
-- Server version	5.7.26

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
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_date` datetime DEFAULT NULL,
  `order_address` varchar(45) DEFAULT NULL,
  `order_status` varchar(45) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_id_idx` (`user_id`),
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
insert into cart (id, order_date, order_address, order_status, total, user_id) values (1, '12/23/2019', '0 Hagan Crossing', null, 4000, 1);
insert into cart (id, order_date, order_address, order_status, total, user_id) values (2, '10/26/2019', '075 Esch Way', null, 5000, 2);
insert into cart (id, order_date, order_address, order_status, total, user_id) values (3, '12/19/2019', '3 Northfield Road', null, 9000, 3);
insert into cart (id, order_date, order_address, order_status, total, user_id) values (4, '7/19/2019', '3 Laurel Circle', null, 2500, 4);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_details`
--

DROP TABLE IF EXISTS `cart_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `cart_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cart_id_idx` (`cart_id`),
  KEY `fk_product_id_idx` (`product_id`),
  CONSTRAINT `fk_cart_id` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_details`
--

LOCK TABLES `cart_details` WRITE;
/*!40000 ALTER TABLE `cart_details` DISABLE KEYS */;
insert into cart_details (id, quantity, price, product_id, cart_id) values (1, 76, '$9.12', 1, 1);
insert into cart_details (id, quantity, price, product_id, cart_id) values (2, 18, '$0.87', 2, 2);
insert into cart_details (id, quantity, price, product_id, cart_id) values (3, 53, '$9.10', 3, 3);
insert into cart_details (id, quantity, price, product_id, cart_id) values (4, 55, '$6.29', 4, 4);
insert into cart_details (id, quantity, price, product_id,
/*!40000 ALTER TABLE `cart_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
insert into categories (id, name) values (1, '96');
insert into categories (id, name) values (2, 'ESSENCE');
insert into categories (id, name) values (3, 'BASIC');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image_users`
--

DROP TABLE IF EXISTS `image_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `image_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `avatar` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image_users`
--

LOCK TABLES `image_users` WRITE;
/*!40000 ALTER TABLE `image_users` DISABLE KEYS */;
insert into image_users (id, avatar) values (1, 'public/images/users');
insert into image_users (id, avatar) values (2, 'https://robohash.org/insuntvoluptates.jpg?size=50x50&set=set1');
insert into image_users (id, avatar) values (3, 'https://robohash.org/maximelaborenatus.jpg?size=50x50&set=set1');
insert into image_users (id, avatar) values (4, 'https://robohash.org/minimalaborevelit.png?size=50x50&set=set1');
insert into image_users (id, avatar) values (5, 'https://robohash.org/utetqui.png?size=50x50&set=set1');
insert into image_users (id, avatar) values (6, 'https://robohash.org/sedautest.png?size=50x50&set=set1');
/*!40000 ALTER TABLE `image_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images_products`
--

DROP TABLE IF EXISTS `images_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `images_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ruta` varchar(45) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_product_id_idx` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images_products`
--

LOCK TABLES `images_products` WRITE;
/*!40000 ALTER TABLE `images_products` DISABLE KEYS */;
insert into images_products (id, ruta, product_id) values (1, '/images/products/ORANGE_HOODIE.jpg', 1);
insert into images_products (id, ruta, product_id) values (2, '/images/products/ORANGE_HODDIE_BACK.jpg', 1);
insert into images_products (id, ruta, product_id) values (3, '/images/products/BLACK_DROP.jpg', 1);
insert into images_products (id, ruta, product_id) values (4, '/images/products/BLACK_DROP_BACK.jpg', 2);
insert into images_products (id, ruta, product_id) values (5, '/images/products/DROP_HH.jpg', 3);
insert into images_products (id, ruta, product_id) values (6, '/images/products/DROP_HH_BACK.jpg', 3);
insert into images_products (id, ruta, product_id) values (7, '/images/products/BLACK_T-SHIRT.jpg', 4);
insert into images_products (id, ruta, product_id) values (8, '/images/products/BLACK_T-SHIRT_BACK.jpg', 84;
insert into images_products (id, ruta, product_id) values (9, '/images/products/BASIC_LOGO.jpg', 5);
insert into images_products (id, ruta, product_id) values (10, '/images/products/BASIC_LOGO_BACK.jpg', 5);
insert into images_products (id, ruta, product_id) values (11, '/images/products/FIRST_DROP_HOODIE.jpg', 6);
insert into images_products (id, ruta, product_id) values (12, '/images/products/FIRST_DROP.jpg', 7);
insert into images_products (id, ruta, product_id) values (13, '/images/products/BASIC_LOGO_YELLOW.jpg', 8);
insert into images_products (id, ruta, product_id) values (14, '/images/products/BASIC_LOGO_YELLOW_BACK.jpg', 8);
/*!40000 ALTER TABLE `images_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `is_admin`
--

DROP TABLE IF EXISTS `is_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `is_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `is_admin`
--

LOCK TABLES `is_admin` WRITE;
/*!40000 ALTER TABLE `is_admin` DISABLE KEYS */;
insert into is_admin (id, name) values (1, 'Fede');
insert into is_admin (id, name) values (2, 'Thomas');
insert into is_admin (id, name) values (3, 'ruben');
/*!40000 ALTER TABLE `is_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_size`
--

DROP TABLE IF EXISTS `product_size`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_size` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `size_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_order_size_id_idx` (`size_id`),
  KEY `fk_psize_id_idx` (`product_id`),
  CONSTRAINT `fk_order_size_id` FOREIGN KEY (`size_id`) REFERENCES `size` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_psize_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_size`
--

LOCK TABLES `product_size` WRITE;
/*!40000 ALTER TABLE `product_size` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_size` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `images_products_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_category_id_idx` (`category_id`),
  KEY `fk_images_products_id_idx` (`images_products_id`),
  CONSTRAINT `fk_category_id` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_images_products_id` FOREIGN KEY (`images_products_id`) REFERENCES `images_products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
insert into products (id, name, price, stock, category_id, images_products_id) values (1, '96 ORANGE HOODIE', '$760.09', 'RDS.B', 1, 1);
insert into products (id, name, price, stock, category_id, images_products_id) values (2, '96 BLACK DROP, 355 Ml', '$557.91', 'HLT', 2, 2);
insert into products (id, name, price, stock, category_id, images_products_id) values (3, 'HOODIES 96 H/H', '$851.00', 'VAC', 3, 3);
insert into products (id, name, price, stock, category_id, images_products_id) values (4, '96 BLACK T-SHIRT', '$404.05', 'MINI', 4, 4);
insert into products (id, name, price, stock, category_id, images_products_id) values (5, 'BASIC LOGO', '$116.91', 'ACAD', 5, 5);
insert into products (id, name, price, stock, category_id, images_products_id) values (6, 'ESSENCE HOODIE', '$400.45', 'INN', 6, 6);
insert into products (id, name, price, stock, category_id, images_products_id) values (7, 'ESSENCE', '$136.39', 'DLBL', 7, 7);
insert into products (id, name, price, stock, category_id, images_products_id) values (8, 'BASIC LOGO YELLOW', '$571.13', 'MITT^A', 8, 8);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `size`
--

DROP TABLE IF EXISTS `size`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `size` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `size_selected` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `size`
--

LOCK TABLES `size` WRITE;
/*!40000 ALTER TABLE `size` DISABLE KEYS */;
/*!40000 ALTER TABLE `size` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `password` int(11) unsigned zerofill DEFAULT NULL,
  `dateOfBirth` datetime DEFAULT NULL,
  `phoneNumber` int(11) DEFAULT NULL,
  `images_users_id` int(11) DEFAULT NULL,
  `is_admin` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_image_users_id_idx` (`images_users_id`),
  KEY `fk_is_admin_id_idx` (`is_admin`),
  CONSTRAINT `fk_image_users_id` FOREIGN KEY (`images_users_id`) REFERENCES `image_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_is_admin_id` FOREIGN KEY (`is_admin`) REFERENCES `is_admin` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
insert into users (id, name, lastname, email, password, dateOfBirth, phoneNumber, images_users_id, is_admin) values (1, 'Thomas', 'van der Laan', 'tomvanderlaan7@gmail.com', '$2b$10$7cbSXTi7iEIwMXac.CffFupYZ1MdpCwl3BzcUNFOf4UMCNnnl.Ide', '2020-06-19', '1234567888', 2, 1);
insert into users (id, name, lastname, email, password, dateOfBirth, phoneNumber, images_users_id, is_admin) values (2, 'Fede', 'Colombo', 'colombofederico17@gmail.com', '$2b$10$bbaWnnNMVPrpZ7Y0oljlW.gZwmTjsbXb1axfS2tKJBnL7tfY5Pgt.', '2000-09-27', '1167048339', 1, 1);
insert into users (id, name, lastname, email, password, dateOfBirth, phoneNumber, images_users_id, is_admin) values (3, 'ruben', 'david', 'rubenpintogonzalez@gmail.com', '$2b$10$c/NySYnEVEsqTSojfvCf7eSzjwXXeac032d5nLAyQtGysMiy.Fm2m', '2020-07-03', '1234567890', 3, 1);
insert into users (id, name, lastname, email, password, dateOfBirth, phoneNumber, images_users_id, is_admin) values (4, 'Nathalia', 'Foxon', 'nfoxon3@google.nl', 'v5OgzlF', '3/5/1991', '8013508362', 4, null);
insert into users (id, name, lastname, email, password, dateOfBirth, phoneNumber, images_users_id, is_admin) values (5, 'Monika', 'Long', 'mlong4@accuweather.com', 'JprbxXw', '8/3/2014', '5808909194', 5, null);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-07-05 22:42:34
