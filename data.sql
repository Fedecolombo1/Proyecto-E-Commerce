-- MySQL dump 10.13  Distrib 8.0.20, for macos10.15 (x86_64)
--
-- Host: 127.0.0.1    Database: structure
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
insert into cart (id, order_date, order_address, order_status, total, user_id) values (1, '12/23/2019', '0 Hagan Crossing', null, 12, 1);
insert into cart (id, order_date, order_address, order_status, total, user_id) values (2, '10/26/2019', '075 Esch Way', null, 24, 2);
insert into cart (id, order_date, order_address, order_status, total, user_id) values (3, '12/19/2019', '3 Northfield Road', null, 97, 3);
insert into cart (id, order_date, order_address, order_status, total, user_id) values (4, '7/19/2019', '3 Laurel Circle', null, 99, 4);
insert into cart (id, order_date, order_address, order_status, total, user_id) values (5, '10/6/2019', '45822 Farragut Place', null, 81, 5);
insert into cart (id, order_date, order_address, order_status, total, user_id) values (6, '1/6/2020', '601 Bobwhite Terrace', null, 47, 6);
insert into cart (id, order_date, order_address, order_status, total, user_id) values (7, '7/30/2019', '4 Old Shore Center', null, 83, 7);
insert into cart (id, order_date, order_address, order_status, total, user_id) values (8, '3/13/2020', '1 Graedel Plaza', null, 78, 8);
insert into cart (id, order_date, order_address, order_status, total, user_id) values (9, '7/5/2019', '5 2nd Way', null, 16, 9);
insert into cart (id, order_date, order_address, order_status, total, user_id) values (10, '6/11/2020', '9677 Golf View Pass', null, 14, 10);
insert into cart (id, order_date, order_address, order_status, total, user_id) values (11, '8/19/2019', '559 Warner Pass', null, 91, 11);
insert into cart (id, order_date, order_address, order_status, total, user_id) values (12, '4/5/2020', '56 Tomscot Parkway', null, 76, 12);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
insert into cart_details (id, quantity, price, product_id, cart_id) values (5, 67, '$4.66', 5, 5);
insert into cart_details (id, quantity, price, product_id, cart_id) values (6, 89, '$2.70', 6, 6);
insert into cart_details (id, quantity, price, product_id, cart_id) values (7, 16, '$2.30', 7, 7);
insert into cart_details (id, quantity, price, product_id, cart_id) values (8, 50, '$5.82', 8, 8);
insert into cart_details (id, quantity, price, product_id, cart_id) values (9, 95, '$0.09', 9, 9);
insert into cart_details (id, quantity, price, product_id, cart_id) values (10, 80, '$6.53', 10, 10);
insert into cart_details (id, quantity, price, product_id, cart_id) values (11, 22, '$4.34', 11, 11);
insert into cart_details (id, quantity, price, product_id, cart_id) values (12, 45, '$0.87', 12, 12);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
insert into categories (id, name) values (1, 'Lamond');
insert into categories (id, name) values (2, 'Alvira');
insert into categories (id, name) values (3, 'Charissa');
insert into categories (id, name) values (4, 'Adrianna');
insert into categories (id, name) values (5, 'Dexter');
insert into categories (id, name) values (6, 'Allie');
insert into categories (id, name) values (7, 'Stefan');
insert into categories (id, name) values (8, 'Aldin');
insert into categories (id, name) values (9, 'Channa');
insert into categories (id, name) values (10, 'Peta');
insert into categories (id, name) values (11, 'Kore');
insert into categories (id, name) values (12, 'Bianka');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image_users`
--

LOCK TABLES `image_users` WRITE;
/*!40000 ALTER TABLE `image_users` DISABLE KEYS */;
insert into image_users (id, avatar) values (1, 'https://robohash.org/exercitationemeteveniet.png?size=50x50&set=set1');
insert into image_users (id, avatar) values (2, 'https://robohash.org/insuntvoluptates.jpg?size=50x50&set=set1');
insert into image_users (id, avatar) values (3, 'https://robohash.org/maximelaborenatus.jpg?size=50x50&set=set1');
insert into image_users (id, avatar) values (4, 'https://robohash.org/minimalaborevelit.png?size=50x50&set=set1');
insert into image_users (id, avatar) values (5, 'https://robohash.org/utetqui.png?size=50x50&set=set1');
insert into image_users (id, avatar) values (6, 'https://robohash.org/sedautest.png?size=50x50&set=set1');
insert into image_users (id, avatar) values (7, 'https://robohash.org/estcorruptiut.png?size=50x50&set=set1');
insert into image_users (id, avatar) values (8, 'https://robohash.org/laborumearumquos.png?size=50x50&set=set1');
insert into image_users (id, avatar) values (9, 'https://robohash.org/etnihilharum.bmp?size=50x50&set=set1');
insert into image_users (id, avatar) values (10, 'https://robohash.org/quamrecusandaeea.bmp?size=50x50&set=set1');
insert into image_users (id, avatar) values (11, 'https://robohash.org/quisfugitblanditiis.bmp?size=50x50&set=set1');
insert into image_users (id, avatar) values (12, 'https://robohash.org/minusvoluptatemut.jpg?size=50x50&set=set1');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images_products`
--

LOCK TABLES `images_products` WRITE;
/*!40000 ALTER TABLE `images_products` DISABLE KEYS */;
insert into images_products (id, ruta, product_id) values (1, 'https://army.mil/adipiscing/lorem/vitae/mattis.jpg?a=at&odio=velit&in=vivamus&hac=vel&habitasse=nulla&platea=eget&dictumst=eros&maecenas=elementum&ut=pellentesque&massa=quisque&quis=porta&augue=volutpat&luctus=erat&tincidunt=quisque&nulla=erat&mollis=eros&molestie=viverra&lorem=eget&quisque=congue&ut=eget&erat=semper&curabitur=rutrum&gravida=nulla&nisi=nunc', 1);
insert into images_products (id, ruta, product_id) values (2, 'https://bing.com/turpis/sed/ante/vivamus/tortor/duis.json?in=justo&quam=in&fringilla=hac&rhoncus=habitasse&mauris=platea&enim=dictumst&leo=etiam&rhoncus=faucibus&sed=cursus&vestibulum=urna&sit=ut&amet=tellus&cursus=nulla&id=ut&turpis=erat&integer=id&aliquet=mauris&massa=vulputate&id=elementum&lobortis=nullam&convallis=varius&tortor=nulla&risus=facilisi&dapibus=cras&augue=non&vel=velit&accumsan=nec&tellus=nisi&nisi=vulputate&eu=nonummy&orci=maecenas&mauris=tincidunt&lacinia=lacus&sapien=at&quis=velit&libero=vivamus&nullam=vel&sit=nulla&amet=eget&turpis=eros&elementum=elementum&ligula=pellentesque&vehicula=quisque&consequat=porta&morbi=volutpat&a=erat&ipsum=quisque&integer=erat', 2);
insert into images_products (id, ruta, product_id) values (3, 'http://webs.com/id/massa/id/nisl/venenatis/lacinia.jpg?convallis=sapien&duis=varius&consequat=ut&dui=blandit&nec=non&nisi=interdum&volutpat=in&eleifend=ante&donec=vestibulum&ut=ante&dolor=ipsum&morbi=primis&vel=in&lectus=faucibus&in=orci&quam=luctus&fringilla=et&rhoncus=ultrices&mauris=posuere&enim=cubilia&leo=curae&rhoncus=duis&sed=faucibus&vestibulum=accumsan&sit=odio&amet=curabitur&cursus=convallis&id=duis&turpis=consequat&integer=dui&aliquet=nec&massa=nisi&id=volutpat&lobortis=eleifend&convallis=donec&tortor=ut&risus=dolor&dapibus=morbi&augue=vel&vel=lectus&accumsan=in&tellus=quam&nisi=fringilla&eu=rhoncus&orci=mauris&mauris=enim&lacinia=leo&sapien=rhoncus&quis=sed', 3);
insert into images_products (id, ruta, product_id) values (4, 'http://sphinn.com/at/feugiat/non/pretium.aspx?consequat=mauris&nulla=sit&nisl=amet&nunc=eros&nisl=suspendisse&duis=accumsan&bibendum=tortor&felis=quis&sed=turpis&interdum=sed&venenatis=ante&turpis=vivamus&enim=tortor&blandit=duis&mi=mattis&in=egestas&porttitor=metus&pede=aenean&justo=fermentum&eu=donec&massa=ut&donec=mauris&dapibus=eget&duis=massa&at=tempor&velit=convallis&eu=nulla&est=neque&congue=libero&elementum=convallis&in=eget&hac=eleifend&habitasse=luctus&platea=ultricies&dictumst=eu&morbi=nibh&vestibulum=quisque&velit=id&id=justo&pretium=sit&iaculis=amet&diam=sapien', 4);
insert into images_products (id, ruta, product_id) values (5, 'http://nytimes.com/vestibulum.jpg?aliquet=pede&maecenas=libero&leo=quis&odio=orci&condimentum=nullam&id=molestie&luctus=nibh&nec=in&molestie=lectus&sed=pellentesque&justo=at&pellentesque=nulla&viverra=suspendisse&pede=potenti&ac=cras&diam=in&cras=purus&pellentesque=eu&volutpat=magna&dui=vulputate&maecenas=luctus&tristique=cum&est=sociis&et=natoque&tempus=penatibus&semper=et&est=magnis&quam=dis&pharetra=parturient&magna=montes&ac=nascetur&consequat=ridiculus&metus=mus&sapien=vivamus&ut=vestibulum&nunc=sagittis&vestibulum=sapien&ante=cum&ipsum=sociis', 5);
insert into images_products (id, ruta, product_id) values (6, 'http://domainmarket.com/platea/dictumst/aliquam/augue/quam/sollicitudin/vitae.aspx?magna=tempus&vulputate=vivamus&luctus=in&cum=felis&sociis=eu&natoque=sapien&penatibus=cursus&et=vestibulum&magnis=proin&dis=eu&parturient=mi&montes=nulla&nascetur=ac&ridiculus=enim&mus=in&vivamus=tempor&vestibulum=turpis&sagittis=nec&sapien=euismod&cum=scelerisque&sociis=quam&natoque=turpis&penatibus=adipiscing&et=lorem&magnis=vitae&dis=mattis&parturient=nibh&montes=ligula&nascetur=nec&ridiculus=sem&mus=duis&etiam=aliquam&vel=convallis&augue=nunc&vestibulum=proin&rutrum=at&rutrum=turpis&neque=a&aenean=pede&auctor=posuere&gravida=nonummy&sem=integer&praesent=non&id=velit&massa=donec&id=diam&nisl=neque&venenatis=vestibulum&lacinia=eget&aenean=vulputate&sit=ut&amet=ultrices&justo=vel&morbi=augue', 6);
insert into images_products (id, ruta, product_id) values (7, 'http://so-net.ne.jp/pharetra/magna/ac/consequat/metus.jsp?metus=dui&arcu=maecenas&adipiscing=tristique&molestie=est&hendrerit=et&at=tempus&vulputate=semper&vitae=est&nisl=quam&aenean=pharetra&lectus=magna&pellentesque=ac&eget=consequat&nunc=metus&donec=sapien&quis=ut&orci=nunc&eget=vestibulum&orci=ante&vehicula=ipsum&condimentum=primis&curabitur=in&in=faucibus&libero=orci&ut=luctus&massa=et&volutpat=ultrices&convallis=posuere&morbi=cubilia&odio=curae&odio=mauris&elementum=viverra&eu=diam&interdum=vitae&eu=quam', 7);
insert into images_products (id, ruta, product_id) values (8, 'https://free.fr/interdum/in/ante/vestibulum.jpg?etiam=sapien&pretium=urna&iaculis=pretium&justo=nisl&in=ut&hac=volutpat&habitasse=sapien&platea=arcu&dictumst=sed&etiam=augue&faucibus=aliquam&cursus=erat&urna=volutpat&ut=in&tellus=congue&nulla=etiam&ut=justo&erat=etiam&id=pretium&mauris=iaculis&vulputate=justo&elementum=in&nullam=hac&varius=habitasse&nulla=platea&facilisi=dictumst&cras=etiam&non=faucibus&velit=cursus&nec=urna&nisi=ut&vulputate=tellus&nonummy=nulla&maecenas=ut&tincidunt=erat&lacus=id&at=mauris&velit=vulputate&vivamus=elementum&vel=nullam&nulla=varius&eget=nulla&eros=facilisi&elementum=cras&pellentesque=non&quisque=velit&porta=nec&volutpat=nisi&erat=vulputate&quisque=nonummy&erat=maecenas&eros=tincidunt&viverra=lacus&eget=at&congue=velit&eget=vivamus&semper=vel&rutrum=nulla&nulla=eget&nunc=eros&purus=elementum&phasellus=pellentesque&in=quisque&felis=porta&donec=volutpat&semper=erat&sapien=quisque&a=erat&libero=eros&nam=viverra&dui=eget&proin=congue&leo=eget&odio=semper&porttitor=rutrum&id=nulla&consequat=nunc&in=purus&consequat=phasellus&ut=in&nulla=felis&sed=donec&accumsan=semper&felis=sapien&ut=a&at=libero&dolor=nam&quis=dui&odio=proin', 8);
insert into images_products (id, ruta, product_id) values (9, 'https://miibeian.gov.cn/hac/habitasse/platea/dictumst/aliquam/augue.jpg?rutrum=dolor&nulla=sit&tellus=amet&in=consectetuer&sagittis=adipiscing&dui=elit&vel=proin&nisl=interdum&duis=mauris&ac=non&nibh=ligula&fusce=pellentesque&lacus=ultrices&purus=phasellus&aliquet=id&at=sapien&feugiat=in&non=sapien&pretium=iaculis&quis=congue&lectus=vivamus&suspendisse=metus&potenti=arcu&in=adipiscing&eleifend=molestie&quam=hendrerit&a=at&odio=vulputate&in=vitae&hac=nisl&habitasse=aenean&platea=lectus&dictumst=pellentesque&maecenas=eget&ut=nunc&massa=donec&quis=quis&augue=orci&luctus=eget&tincidunt=orci&nulla=vehicula&mollis=condimentum&molestie=curabitur&lorem=in', 9);
insert into images_products (id, ruta, product_id) values (10, 'https://slideshare.net/risus.js?nec=pellentesque&euismod=at&scelerisque=nulla&quam=suspendisse&turpis=potenti&adipiscing=cras&lorem=in&vitae=purus&mattis=eu&nibh=magna&ligula=vulputate&nec=luctus&sem=cum&duis=sociis&aliquam=natoque&convallis=penatibus&nunc=et&proin=magnis&at=dis&turpis=parturient&a=montes&pede=nascetur&posuere=ridiculus&nonummy=mus&integer=vivamus&non=vestibulum&velit=sagittis&donec=sapien&diam=cum&neque=sociis&vestibulum=natoque&eget=penatibus&vulputate=et&ut=magnis&ultrices=dis&vel=parturient&augue=montes&vestibulum=nascetur&ante=ridiculus&ipsum=mus&primis=etiam&in=vel&faucibus=augue&orci=vestibulum&luctus=rutrum&et=rutrum&ultrices=neque&posuere=aenean&cubilia=auctor&curae=gravida&donec=sem&pharetra=praesent&magna=id&vestibulum=massa&aliquet=id&ultrices=nisl&erat=venenatis&tortor=lacinia&sollicitudin=aenean&mi=sit&sit=amet&amet=justo&lobortis=morbi&sapien=ut&sapien=odio&non=cras&mi=mi&integer=pede&ac=malesuada&neque=in&duis=imperdiet&bibendum=et', 10);
insert into images_products (id, ruta, product_id) values (11, 'https://youku.com/nec/nisi.js?penatibus=phasellus&et=id&magnis=sapien&dis=in&parturient=sapien&montes=iaculis&nascetur=congue&ridiculus=vivamus&mus=metus&etiam=arcu&vel=adipiscing&augue=molestie&vestibulum=hendrerit&rutrum=at&rutrum=vulputate&neque=vitae&aenean=nisl&auctor=aenean&gravida=lectus&sem=pellentesque&praesent=eget&id=nunc&massa=donec&id=quis&nisl=orci&venenatis=eget&lacinia=orci&aenean=vehicula&sit=condimentum&amet=curabitur&justo=in&morbi=libero&ut=ut&odio=massa&cras=volutpat&mi=convallis&pede=morbi&malesuada=odio&in=odio&imperdiet=elementum&et=eu&commodo=interdum&vulputate=eu&justo=tincidunt&in=in&blandit=leo&ultrices=maecenas&enim=pulvinar&lorem=lobortis&ipsum=est&dolor=phasellus&sit=sit&amet=amet&consectetuer=erat&adipiscing=nulla&elit=tempus&proin=vivamus&interdum=in&mauris=felis&non=eu', 11);
insert into images_products (id, ruta, product_id) values (12, 'https://issuu.com/posuere/cubilia/curae/donec/pharetra/magna/vestibulum.jsp?fusce=lacus&posuere=at&felis=turpis&sed=donec&lacus=posuere&morbi=metus&sem=vitae&mauris=ipsum&laoreet=aliquam&ut=non&rhoncus=mauris&aliquet=morbi&pulvinar=non&sed=lectus&nisl=aliquam&nunc=sit&rhoncus=amet&dui=diam&vel=in&sem=magna&sed=bibendum&sagittis=imperdiet&nam=nullam&congue=orci&risus=pede&semper=venenatis&porta=non&volutpat=sodales&quam=sed&pede=tincidunt&lobortis=eu&ligula=felis&sit=fusce&amet=posuere&eleifend=felis&pede=sed&libero=lacus&quis=morbi&orci=sem&nullam=mauris&molestie=laoreet&nibh=ut&in=rhoncus&lectus=aliquet&pellentesque=pulvinar&at=sed&nulla=nisl&suspendisse=nunc&potenti=rhoncus&cras=dui&in=vel&purus=sem&eu=sed&magna=sagittis&vulputate=nam&luctus=congue&cum=risus&sociis=semper&natoque=porta&penatibus=volutpat&et=quam&magnis=pede&dis=lobortis&parturient=ligula&montes=sit&nascetur=amet&ridiculus=eleifend&mus=pede&vivamus=libero', 12);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `is_admin`
--

LOCK TABLES `is_admin` WRITE;
/*!40000 ALTER TABLE `is_admin` DISABLE KEYS */;
insert into is_admin (id, name) values (1, 'jmccome0');
insert into is_admin (id, name) values (2, 'scasino1');
insert into is_admin (id, name) values (3, 'acarhart2');
insert into is_admin (id, name) values (4, 'mhayle3');
insert into is_admin (id, name) values (5, 'srathborne4');
insert into is_admin (id, name) values (6, 'rbanford5');
insert into is_admin (id, name) values (7, 'yluciani6');
insert into is_admin (id, name) values (8, 'vtottem7');
insert into is_admin (id, name) values (9, 'caykroyd8');
insert into is_admin (id, name) values (10, 'mhardinge9');
insert into is_admin (id, name) values (11, 'wgarleya');
insert into is_admin (id, name) values (12, 'ayegorkovb');
/*!40000 ALTER TABLE `is_admin` ENABLE KEYS */;
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
  `size` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_category_id_idx` (`category_id`),
  KEY `fk_images_products_id_idx` (`images_products_id`),
  CONSTRAINT `fk_category_id` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_images_products_id` FOREIGN KEY (`images_products_id`) REFERENCES `images_products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
insert into products (id, name, price, stock, category_id, images_products_id) values (1, 'Table Cloth 53x69 White', '$760.09', 'RDS.B', 1, 1);
insert into products (id, name, price, stock, category_id, images_products_id) values (2, 'Soda Water - Club Soda, 355 Ml', '$557.91', 'HLT', 2, 2);
insert into products (id, name, price, stock, category_id, images_products_id) values (3, 'Bread - Raisin', '$851.00', 'VAC', 3, 3);
insert into products (id, name, price, stock, category_id, images_products_id) values (4, 'Tuna - Salad Premix', '$404.05', 'MINI', 4, 4);
insert into products (id, name, price, stock, category_id, images_products_id) values (5, 'Sugar - Crumb', '$116.91', 'ACAD', 5, 5);
insert into products (id, name, price, stock, category_id, images_products_id) values (6, 'Salmon Atl.whole 8 - 10 Lb', '$400.45', 'INN', 6, 6);
insert into products (id, name, price, stock, category_id, images_products_id) values (7, 'Spice - Chili Powder Mexican', '$136.39', 'DLBL', 7, 7);
insert into products (id, name, price, stock, category_id, images_products_id) values (8, 'Cognac - Courvaisier', '$571.13', 'MITT^A', 8, 8);
insert into products (id, name, price, stock, category_id, images_products_id) values (9, 'Rhubarb', '$649.19', 'HCM', 9, 9);
insert into products (id, name, price, stock, category_id, images_products_id) values (10, 'Lotus Root', '$764.87', 'GOOD', 10, 10);
insert into products (id, name, price, stock, category_id, images_products_id) values (11, 'Oil - Margarine', '$283.27', 'STZ.B', 11, 11);
insert into products (id, name, price, stock, category_id, images_products_id) values (12, 'Ecolab - Orange Frc, Cleaner', '$848.93', 'FVC', 12, 12);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
insert into users (id, name, lastname, email, password, dateOfBirth, phoneNumber, images_users_id, is_admin) values (1, 'Debby', 'Ordidge', 'dordidge0@1und1.de', 'YecGX6cRXt7', '7/21/2007', '2711051297', 1, 'Debby Ordidge');
insert into users (id, name, lastname, email, password, dateOfBirth, phoneNumber, images_users_id, is_admin) values (2, 'Vivi', 'Cough', 'vcough1@paypal.com', 'dN42Up2', '5/14/2011', '2371204299', 2, 'Vivi Cough');
insert into users (id, name, lastname, email, password, dateOfBirth, phoneNumber, images_users_id, is_admin) values (3, 'David', 'Hansemann', 'dhansemann2@indiatimes.com', 'WbWRmK5BZK', '8/15/2002', '4554393467', 3, 'David Hansemann');
insert into users (id, name, lastname, email, password, dateOfBirth, phoneNumber, images_users_id, is_admin) values (4, 'Nathalia', 'Foxon', 'nfoxon3@google.nl', 'v5OgzlF', '3/5/1991', '8013508362', 4, 'Nathalia Foxon');
insert into users (id, name, lastname, email, password, dateOfBirth, phoneNumber, images_users_id, is_admin) values (5, 'Monika', 'Long', 'mlong4@accuweather.com', 'JprbxXw', '8/3/2014', '5808909194', 5, 'Monika Long');
insert into users (id, name, lastname, email, password, dateOfBirth, phoneNumber, images_users_id, is_admin) values (6, 'Grace', 'Riehm', 'griehm5@mysql.com', 'JH2mLrP', '10/6/1995', '5841690476', 6, 'Grace Riehm');
insert into users (id, name, lastname, email, password, dateOfBirth, phoneNumber, images_users_id, is_admin) values (7, 'Whit', 'Kase', 'wkase6@nifty.com', '4O8iN6j', '4/12/2015', '2252779696', 7, 'Whit Kase');
insert into users (id, name, lastname, email, password, dateOfBirth, phoneNumber, images_users_id, is_admin) values (8, 'Chan', 'O''Brogan', 'cobrogan7@chicagotribune.com', 'TAqfpmvT3nFK', '2/14/1999', '2001907921', 8, 'Chan O''Brogan');
insert into users (id, name, lastname, email, password, dateOfBirth, phoneNumber, images_users_id, is_admin) values (9, 'Anastassia', 'Neylan', 'aneylan8@google.com.hk', '7LLVi177Y', '4/21/1999', '3714380601', 9, 'Anastassia Neylan');
insert into users (id, name, lastname, email, password, dateOfBirth, phoneNumber, images_users_id, is_admin) values (10, 'Angie', 'Glenny', 'aglenny9@weibo.com', 'aQKGbR', '10/25/2011', '4576405097', 10, 'Angie Glenny');
insert into users (id, name, lastname, email, password, dateOfBirth, phoneNumber, images_users_id, is_admin) values (11, 'Bud', 'McGorley', 'bmcgorleya@tiny.cc', 'NkWLZX', '12/22/2018', '3684652050', 11, 'Bud McGorley');
insert into users (id, name, lastname, email, password, dateOfBirth, phoneNumber, images_users_id, is_admin) values (12, 'Tiffani', 'Dahlback', 'tdahlbackb@huffingtonpost.com', '1VmI9gC9J7', '6/20/2015', '3621078016', 12, 'Tiffani Dahlback');

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

-- Dump completed on 2020-07-02 23:12:57
