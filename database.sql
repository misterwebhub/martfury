-- MySQL dump 10.13  Distrib 8.0.29, for macos12.2 (x86_64)
--
-- Host: localhost    Database: martfury
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `activations`
--

DROP TABLE IF EXISTS `activations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `code` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT '0',
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activations_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activations`
--

LOCK TABLES `activations` WRITE;
/*!40000 ALTER TABLE `activations` DISABLE KEYS */;
INSERT INTO `activations` VALUES (1,1,'eAs8XGaic8z6S1WQUTMcaYu3TniEi1jW',1,'2022-07-25 08:36:32','2022-07-25 08:36:32','2022-07-25 08:36:32');
/*!40000 ALTER TABLE `activations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ads`
--

DROP TABLE IF EXISTS `ads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ads` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expired_at` datetime DEFAULT NULL,
  `location` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clicked` bigint NOT NULL DEFAULT '0',
  `order` int DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ads_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ads`
--

LOCK TABLES `ads` WRITE;
/*!40000 ALTER TABLE `ads` DISABLE KEYS */;
INSERT INTO `ads` VALUES (1,'Top Slider Image 1','2027-07-25 00:00:00','not_set','VC2C8Q1UGCBG','promotion/1.jpg','/products',0,1,'published','2022-07-25 08:36:30','2022-07-25 08:36:30'),(2,'Top Slider Image 2','2027-07-25 00:00:00','not_set','NBDWRXTSVZ8N','promotion/2.jpg','/products',0,2,'published','2022-07-25 08:36:30','2022-07-25 08:36:30'),(3,'Homepage middle 1','2027-07-25 00:00:00','not_set','IZ6WU8KUALYD','promotion/3.jpg','/products',0,3,'published','2022-07-25 08:36:30','2022-07-25 08:36:30'),(4,'Homepage middle 2','2027-07-25 00:00:00','not_set','ILSFJVYFGCPZ','promotion/4.jpg','/products',0,4,'published','2022-07-25 08:36:30','2022-07-25 08:36:30'),(5,'Homepage middle 3','2027-07-25 00:00:00','not_set','ZDOZUZZIU7FT','promotion/5.jpg','/products',0,5,'published','2022-07-25 08:36:30','2022-07-25 08:36:30'),(6,'Homepage big 1','2027-07-25 00:00:00','not_set','Q9YDUIC9HSWS','promotion/6.jpg','/products',0,6,'published','2022-07-25 08:36:30','2022-07-25 08:36:30'),(7,'Homepage bottom small','2027-07-25 00:00:00','not_set','X1XEM6V9IOJE','promotion/7.jpg','/products',0,7,'published','2022-07-25 08:36:30','2022-07-25 08:36:30'),(8,'Product sidebar','2027-07-25 00:00:00','product-sidebar','VMHJGWILJOHG','promotion/8.jpg','/products',0,8,'published','2022-07-25 08:36:30','2022-07-25 08:36:30'),(9,'Homepage big 2','2027-07-25 00:00:00','not_set','IZ6WU8KUALYE','promotion/9.jpg','/products',0,9,'published','2022-07-25 08:36:30','2022-07-25 08:36:30');
/*!40000 ALTER TABLE `ads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ads_translations`
--

DROP TABLE IF EXISTS `ads_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ads_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ads_id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ads_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ads_translations`
--

LOCK TABLES `ads_translations` WRITE;
/*!40000 ALTER TABLE `ads_translations` DISABLE KEYS */;
INSERT INTO `ads_translations` VALUES ('vi',1,'Top Slider Image 1','promotion/1.jpg','/vi/products'),('vi',2,'Top Slider Image 2','promotion/2.jpg','/vi/products'),('vi',3,'Homepage middle 1','promotion/3.jpg','/vi/products'),('vi',4,'Homepage middle 2','promotion/4.jpg','/vi/products'),('vi',5,'Homepage middle 3','promotion/5.jpg','/vi/products'),('vi',6,'Homepage big 1','promotion/6.jpg','/vi/products'),('vi',7,'Homepage bottom small','promotion/7.jpg','/vi/products'),('vi',8,'Product sidebar','promotion/8.jpg','/vi/products'),('vi',9,'Homepage big 2','promotion/9.jpg','/vi/products');
/*!40000 ALTER TABLE `ads_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_histories`
--

DROP TABLE IF EXISTS `audit_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_histories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `module` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `request` text COLLATE utf8mb4_unicode_ci,
  `action` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `ip_address` varchar(39) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_user` int unsigned NOT NULL,
  `reference_id` int unsigned NOT NULL,
  `reference_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `audit_histories_user_id_index` (`user_id`),
  KEY `audit_histories_module_index` (`module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_histories`
--

LOCK TABLES `audit_histories` WRITE;
/*!40000 ALTER TABLE `audit_histories` DISABLE KEYS */;
/*!40000 ALTER TABLE `audit_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int unsigned NOT NULL DEFAULT '0',
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `author_id` int NOT NULL,
  `author_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `icon` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `is_featured` tinyint NOT NULL DEFAULT '0',
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `status` (`status`),
  KEY `created_at` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Ecommerce',0,'Dolores nobis deserunt placeat magnam ducimus. Optio corrupti illum molestiae nihil et. Recusandae harum ipsum nam quia. Ut non harum est quae est aut error.','published',1,'Botble\\ACL\\Models\\User',NULL,0,0,1,'2022-07-25 08:36:21','2022-07-25 08:36:21'),(2,'Fashion',0,'Cum doloribus occaecati dolores. Sed vel officia voluptatem id. Quia est sit ut praesentium ratione et qui. Impedit cumque quia nesciunt ea omnis consequatur.','published',1,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2022-07-25 08:36:21','2022-07-25 08:36:21'),(3,'Electronic',0,'Omnis ex dolor consequatur rem sunt distinctio nihil. Non molestias sunt fugiat aperiam reiciendis aut et optio. Eius at accusantium hic assumenda et perspiciatis.','published',1,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2022-07-25 08:36:21','2022-07-25 08:36:21'),(4,'Commercial',0,'Quisquam sapiente et amet cum sed odio qui ab. Qui excepturi illo tempora ab expedita veniam. Necessitatibus tempora dicta rerum quo ipsam.','published',1,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2022-07-25 08:36:21','2022-07-25 08:36:21');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories_translations`
--

DROP TABLE IF EXISTS `categories_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `categories_id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`categories_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories_translations`
--

LOCK TABLES `categories_translations` WRITE;
/*!40000 ALTER TABLE `categories_translations` DISABLE KEYS */;
INSERT INTO `categories_translations` VALUES ('vi',1,'Thương mại điện tử',NULL),('vi',2,'Thời trang',NULL),('vi',3,'Điện tử',NULL),('vi',4,'Thương mại',NULL);
/*!40000 ALTER TABLE `categories_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cities` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state_id` int unsigned NOT NULL,
  `country_id` int unsigned DEFAULT NULL,
  `record_id` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities_backup`
--

DROP TABLE IF EXISTS `cities_backup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cities_backup` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state_id` int unsigned NOT NULL,
  `country_id` int unsigned DEFAULT NULL,
  `record_id` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities_backup`
--

LOCK TABLES `cities_backup` WRITE;
/*!40000 ALTER TABLE `cities_backup` DISABLE KEYS */;
/*!40000 ALTER TABLE `cities_backup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities_translations`
--

DROP TABLE IF EXISTS `cities_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cities_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cities_id` int NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`cities_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities_translations`
--

LOCK TABLES `cities_translations` WRITE;
/*!40000 ALTER TABLE `cities_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `cities_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_replies`
--

DROP TABLE IF EXISTS `contact_replies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_replies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_replies`
--

LOCK TABLES `contact_replies` WRITE;
/*!40000 ALTER TABLE `contact_replies` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_replies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contacts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unread',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
INSERT INTO `contacts` VALUES (1,'Stefanie Wehner','lily17@example.net','+17654896079','9044 Myrtice Heights\nNew Larissahaven, AR 68700','Ullam et minus dolore earum expedita.','Et ut impedit sed. Architecto hic explicabo laborum dolorum et. Expedita ipsa reiciendis impedit ea eos voluptates doloremque. Quia maiores hic quas aut et facilis praesentium dolorem. Adipisci quas modi quos a ut amet velit alias. Et voluptas tempora neque modi voluptas cumque reiciendis. Atque nesciunt qui magnam voluptas dolor. Sit ratione nisi qui alias quibusdam. Occaecati rerum soluta minus ut delectus illum qui. Voluptate cumque laboriosam minima omnis. Sapiente quia voluptatem beatae.','read','2022-07-25 08:36:11','2022-07-25 08:36:11'),(2,'Violette Ryan','crist.okey@example.com','607.650.1711','540 Weissnat Wall Suite 565\nWest Agnes, MN 96438-9235','Et minima tempore voluptatem quia.','In temporibus est et suscipit illum non quis. Quibusdam aliquam asperiores quisquam expedita voluptas fuga quis assumenda. Culpa qui ea dolor omnis quas nulla. Et totam facere provident ab itaque. Est et dolorem nobis autem. Nisi eius suscipit consectetur expedita quam facere. Voluptate natus et ratione in cum vel nisi.','unread','2022-07-25 08:36:11','2022-07-25 08:36:11'),(3,'Miss Cayla Lockman IV','kutch.tressie@example.org','(534) 563-3665','48749 Mandy Brooks\nWest Connie, NY 16858-3219','Et ea sit rerum molestias nam.','Explicabo dolores qui iure dolore dicta. Temporibus dolores debitis fuga eius aliquam dolore. Ut nihil voluptatibus alias nam cum blanditiis molestiae. Vel fugit dolor iusto. Deleniti et unde nemo velit qui. Asperiores quas doloribus repellat aliquam. Perferendis odio id inventore assumenda debitis accusamus. Sequi est sunt consequuntur est nostrum consectetur.','read','2022-07-25 08:36:11','2022-07-25 08:36:11'),(4,'Chesley Powlowski','estoltenberg@example.net','+1-443-626-7494','54720 Melyna Garden\nPort Virginia, ND 21315','Ut sunt aut nostrum ea doloribus quidem eaque et.','Ex odio est quod reiciendis aut rerum. Vitae sit placeat officiis qui provident error. Quia voluptate consectetur consequatur. Earum ut quia omnis reiciendis odio eius nesciunt. Est voluptate quasi quidem dolore excepturi. Eius asperiores dicta incidunt iure sunt. Est repudiandae minima nemo eius alias beatae mollitia. Non iste corrupti dolorem unde cum architecto.','unread','2022-07-25 08:36:11','2022-07-25 08:36:11'),(5,'Glenna Jaskolski','dawn81@example.com','820.810.7636','46320 Paige Crossroad\nPort Richard, FL 43573-4387','Nam labore id repellendus modi quo qui ut.','Quibusdam blanditiis possimus tenetur nisi eaque delectus ipsum unde. Repellat fuga voluptas sed quidem. Ducimus non consequatur error aspernatur aspernatur atque necessitatibus. Repellendus et sed autem itaque atque perferendis aspernatur deleniti. Quasi provident blanditiis molestias temporibus dolorem qui. Aliquam provident animi doloribus minima.','unread','2022-07-25 08:36:11','2022-07-25 08:36:11'),(6,'Andres Stark','xerdman@example.net','628-808-7904','58347 Jayme Street Suite 527\nPetrashire, NM 01083','Distinctio qui corrupti veniam.','Vitae consequatur iste et ex quibusdam. Eum itaque totam et ab sapiente modi. Cupiditate cumque dolor aspernatur modi inventore. Est vitae eum in maxime quia enim et. Explicabo inventore est dolorem vel. Voluptatem ut iure occaecati molestiae. Consequatur nobis enim magni velit qui atque. Id eveniet id corrupti quam. Repellendus minima quidem officia et a quis aliquid natus. Doloribus itaque nemo aut.','read','2022-07-25 08:36:11','2022-07-25 08:36:11'),(7,'Jaydon Beatty PhD','breitenberg.frank@example.com','+1 (210) 787-6100','797 Welch Grove\nWest Jadenmouth, NH 49858-5282','Itaque id fugiat corrupti qui totam porro.','Ut fugiat aliquam voluptatum ipsa dolorem aut. Nihil et rerum aut beatae. Dolores fuga modi consequatur alias. Ea ea laborum repellendus. Eos nemo aspernatur architecto ipsa minima. Et magni voluptatibus accusamus quia. Autem temporibus in corporis dicta. Dolores non facilis culpa. Quae est aut rerum ut est maiores quisquam. Ipsum est ducimus laudantium et modi deleniti.','read','2022-07-25 08:36:11','2022-07-25 08:36:11'),(8,'Kyra Blick','goyette.ludie@example.org','(559) 700-0841','7973 Krystal Alley Apt. 763\nEast Mortonstad, AR 98907-5056','Optio exercitationem qui quam error at vel quia.','Est doloremque voluptatem possimus saepe. Quibusdam modi aut minus ipsum dolores incidunt. Sequi iste omnis corporis placeat aut facere quasi. Omnis sit odio fugit commodi aut in veritatis. Perferendis deleniti ullam iusto eius repudiandae laborum. Quam ut quam perspiciatis repellendus ab. Dolor laborum veniam quod in quibusdam alias.','read','2022-07-25 08:36:11','2022-07-25 08:36:11'),(9,'Vincenza Predovic','miller.valerie@example.net','909.374.4320','5323 Ebert Stream\nEast Matteo, AK 77684-9691','Itaque nihil voluptatum ea.','Quae et vel doloremque quos. Laborum totam et quidem nulla ut quae nobis. Quam ut sit dolor quisquam dignissimos deleniti. Commodi et a alias voluptatem quam. Et enim ullam molestiae debitis quas est quis. Optio repudiandae laborum et et in molestias consequuntur. Repudiandae similique in id doloribus dicta accusamus. Occaecati explicabo porro quisquam veniam dolor sed.','unread','2022-07-25 08:36:11','2022-07-25 08:36:11'),(10,'Mozelle Lubowitz V','weimann.teagan@example.net','1-951-896-1241','257 Crist Drives\nParisianstad, IL 74199-6260','Impedit exercitationem ut nesciunt nobis.','Magnam quis aut cum. Dolorem assumenda dolores illum et. Occaecati dolores eligendi saepe. Repellendus illum adipisci consectetur sit est quasi aspernatur. Accusamus et eum magni quia. Reiciendis vitae ut voluptatem laboriosam libero laboriosam. Nam voluptatem officiis quisquam odio quis. Quos unde velit veniam atque sed et. Iste voluptatem modi rerum quis.','unread','2022-07-25 08:36:11','2022-07-25 08:36:11');
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countries` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nationality` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries_backup`
--

DROP TABLE IF EXISTS `countries_backup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countries_backup` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nationality` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries_backup`
--

LOCK TABLES `countries_backup` WRITE;
/*!40000 ALTER TABLE `countries_backup` DISABLE KEYS */;
/*!40000 ALTER TABLE `countries_backup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries_translations`
--

DROP TABLE IF EXISTS `countries_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countries_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `countries_id` int NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nationality` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`countries_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries_translations`
--

LOCK TABLES `countries_translations` WRITE;
/*!40000 ALTER TABLE `countries_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `countries_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_widget_settings`
--

DROP TABLE IF EXISTS `dashboard_widget_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_widget_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `user_id` int unsigned NOT NULL,
  `widget_id` int unsigned NOT NULL,
  `order` tinyint unsigned NOT NULL DEFAULT '0',
  `status` tinyint unsigned NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dashboard_widget_settings_user_id_index` (`user_id`),
  KEY `dashboard_widget_settings_widget_id_index` (`widget_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_widget_settings`
--

LOCK TABLES `dashboard_widget_settings` WRITE;
/*!40000 ALTER TABLE `dashboard_widget_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_widget_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_widgets`
--

DROP TABLE IF EXISTS `dashboard_widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_widgets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_widgets`
--

LOCK TABLES `dashboard_widgets` WRITE;
/*!40000 ALTER TABLE `dashboard_widgets` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_widgets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_brands`
--

DROP TABLE IF EXISTS `ec_brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_brands` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `website` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `order` tinyint unsigned NOT NULL DEFAULT '0',
  `is_featured` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_brands`
--

LOCK TABLES `ec_brands` WRITE;
/*!40000 ALTER TABLE `ec_brands` DISABLE KEYS */;
INSERT INTO `ec_brands` VALUES (1,'Fashion live',NULL,NULL,'brands/1.jpg','published',0,1,'2022-07-25 08:35:24','2022-07-25 08:35:24'),(2,'Hand crafted',NULL,NULL,'brands/2.jpg','published',1,1,'2022-07-25 08:35:24','2022-07-25 08:35:24'),(3,'Mestonix',NULL,NULL,'brands/3.jpg','published',2,1,'2022-07-25 08:35:24','2022-07-25 08:35:24'),(4,'Sunshine',NULL,NULL,'brands/4.jpg','published',3,1,'2022-07-25 08:35:24','2022-07-25 08:35:24'),(5,'Pure',NULL,NULL,'brands/5.jpg','published',4,1,'2022-07-25 08:35:24','2022-07-25 08:35:24'),(6,'Anfold',NULL,NULL,'brands/6.jpg','published',5,1,'2022-07-25 08:35:24','2022-07-25 08:35:24'),(7,'Automotive',NULL,NULL,'brands/7.jpg','published',6,1,'2022-07-25 08:35:24','2022-07-25 08:35:24');
/*!40000 ALTER TABLE `ec_brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_brands_translations`
--

DROP TABLE IF EXISTS `ec_brands_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_brands_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_brands_id` int NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ec_brands_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_brands_translations`
--

LOCK TABLES `ec_brands_translations` WRITE;
/*!40000 ALTER TABLE `ec_brands_translations` DISABLE KEYS */;
INSERT INTO `ec_brands_translations` VALUES ('vi',1,'Fashion live',NULL),('vi',2,'Hand crafted',NULL),('vi',3,'Mestonix',NULL),('vi',4,'Sunshine',NULL),('vi',5,'Pure',NULL),('vi',6,'Anfold',NULL),('vi',7,'Automotive',NULL);
/*!40000 ALTER TABLE `ec_brands_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_cart`
--

DROP TABLE IF EXISTS `ec_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_cart` (
  `identifier` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `instance` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`identifier`,`instance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_cart`
--

LOCK TABLES `ec_cart` WRITE;
/*!40000 ALTER TABLE `ec_cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_currencies`
--

DROP TABLE IF EXISTS `ec_currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_currencies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_prefix_symbol` tinyint unsigned NOT NULL DEFAULT '0',
  `decimals` tinyint unsigned DEFAULT '0',
  `order` int unsigned DEFAULT '0',
  `is_default` tinyint NOT NULL DEFAULT '0',
  `exchange_rate` double NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_currencies`
--

LOCK TABLES `ec_currencies` WRITE;
/*!40000 ALTER TABLE `ec_currencies` DISABLE KEYS */;
INSERT INTO `ec_currencies` VALUES (1,'USD','$',1,2,0,1,1,'2022-07-25 08:35:25','2022-07-25 08:35:25'),(2,'EUR','€',0,2,1,0,0.84,'2022-07-25 08:35:25','2022-07-25 08:35:25'),(3,'VND','₫',0,0,2,0,23203,'2022-07-25 08:35:25','2022-07-25 08:35:25');
/*!40000 ALTER TABLE `ec_currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_customer_addresses`
--

DROP TABLE IF EXISTS `ec_customer_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_customer_addresses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_id` int unsigned NOT NULL,
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `zip_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_customer_addresses`
--

LOCK TABLES `ec_customer_addresses` WRITE;
/*!40000 ALTER TABLE `ec_customer_addresses` DISABLE KEYS */;
INSERT INTO `ec_customer_addresses` VALUES (1,'Johnpaul Quitzon','customer@botble.com','+16518276190','YE','Mississippi','McClurefort','38689 Toy Wall Suite 230',1,1,'2022-07-25 08:36:06','2022-07-25 08:36:06','77257'),(2,'Johnpaul Quitzon','customer@botble.com','+18388729970','CW','Arkansas','Lake Chestershire','540 Cameron Mount Suite 127',1,0,'2022-07-25 08:36:06','2022-07-25 08:36:06','93957'),(3,'Miss Josie Rau PhD','vendor@botble.com','+15209767789','IN','Colorado','West Beryl','18828 Stephania Port Apt. 348',2,1,'2022-07-25 08:36:06','2022-07-25 08:36:06','66428-7963'),(4,'Miss Josie Rau PhD','vendor@botble.com','+12258830514','VG','North Dakota','New Corene','7232 Schumm Divide Suite 756',2,0,'2022-07-25 08:36:06','2022-07-25 08:36:06','44295'),(5,'Telly Block','june27@example.com','+14845400128','EH','Nebraska','Kristinberg','458 Allie Loop Suite 798',3,1,'2022-07-25 08:36:06','2022-07-25 08:36:06','10377'),(6,'Jany Gleason','lesly02@example.org','+14059650951','RS','Washington','South Kacichester','817 Stiedemann Bridge Apt. 390',4,1,'2022-07-25 08:36:07','2022-07-25 08:36:07','73007'),(7,'Dr. Leonor Gislason','rgerlach@example.com','+14197676494','LK','Illinois','West Rosarioburgh','260 Nyah Club Apt. 373',5,1,'2022-07-25 08:36:07','2022-07-25 08:36:07','48615-4225'),(8,'Conner Brekke','celestine42@example.org','+16407892429','MQ','Indiana','South Brianneland','3579 Harley Streets Suite 711',6,1,'2022-07-25 08:36:07','2022-07-25 08:36:07','69223'),(9,'Dr. Newell Fahey','ohaley@example.com','+13649493317','SO','Pennsylvania','Padbergview','147 Stokes Well Suite 665',7,1,'2022-07-25 08:36:07','2022-07-25 08:36:07','65395'),(10,'Alanna Aufderhar','ismael.rutherford@example.net','+12535171002','SC','South Dakota','Heathcotetown','458 Jarred Pike Apt. 359',8,1,'2022-07-25 08:36:07','2022-07-25 08:36:07','77252'),(11,'Abbey Johnston','brittany.stoltenberg@example.com','+18328463324','GF','Ohio','Ernestomouth','826 Germaine Path Suite 186',9,1,'2022-07-25 08:36:07','2022-07-25 08:36:07','76052-7028'),(12,'Haylie Collier','cdietrich@example.com','+18787070367','PH','New Hampshire','Lake Davontetown','499 Hansen Street Apt. 980',10,1,'2022-07-25 08:36:08','2022-07-25 08:36:08','60134');
/*!40000 ALTER TABLE `ec_customer_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_customer_password_resets`
--

DROP TABLE IF EXISTS `ec_customer_password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_customer_password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `ec_customer_password_resets_email_index` (`email`),
  KEY `ec_customer_password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_customer_password_resets`
--

LOCK TABLES `ec_customer_password_resets` WRITE;
/*!40000 ALTER TABLE `ec_customer_password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_customer_password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_customer_recently_viewed_products`
--

DROP TABLE IF EXISTS `ec_customer_recently_viewed_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_customer_recently_viewed_products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int unsigned NOT NULL,
  `product_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_customer_recently_viewed_products`
--

LOCK TABLES `ec_customer_recently_viewed_products` WRITE;
/*!40000 ALTER TABLE `ec_customer_recently_viewed_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_customer_recently_viewed_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_customers`
--

DROP TABLE IF EXISTS `ec_customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_customers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `phone` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `confirmed_at` datetime DEFAULT NULL,
  `email_verify_token` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_vendor` tinyint(1) NOT NULL DEFAULT '0',
  `vendor_verified_at` datetime DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'activated',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_customers_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_customers`
--

LOCK TABLES `ec_customers` WRITE;
/*!40000 ALTER TABLE `ec_customers` DISABLE KEYS */;
INSERT INTO `ec_customers` VALUES (1,'Johnpaul Quitzon','customer@botble.com','$2y$10$FSitP/IBLYX63AGyM50FpO6yVk9Uw.kuFIBJTYy4.lzde0dlqRLsK','customers/1.jpg','1975-07-09','+13204855978',NULL,'2022-07-25 08:36:06','2022-07-25 08:36:06','2022-07-25 15:36:06',NULL,0,NULL,'activated'),(2,'Miss Josie Rau PhD','vendor@botble.com','$2y$10$QdUVpmeau4F15WeKeXV.KOWHNgFrOQiHZOI7Sukex1z0R0G9CvZCO','customers/1.jpg','1981-07-07','+12767438737',NULL,'2022-07-25 08:36:06','2022-07-25 08:36:41','2022-07-25 15:36:06',NULL,1,'2022-07-25 15:36:41','activated'),(3,'Telly Block','june27@example.com','$2y$10$TVF0AOCquHo8nDjymJ621uKS2mJSLlzjvJdcViXRv6WfEenWM1uI2','customers/1.jpg','1985-07-05','+17405934403',NULL,'2022-07-25 08:36:06','2022-07-25 08:36:41','2022-07-25 15:36:06',NULL,1,'2022-07-25 15:36:41','activated'),(4,'Jany Gleason','lesly02@example.org','$2y$10$5B5b57743HJYLGLlJ.MulO/EyXjOk0uT3vtnf9ZUAawrbWjneERsq','customers/2.jpg','1987-07-14','+13029644848',NULL,'2022-07-25 08:36:07','2022-07-25 08:36:07','2022-07-25 15:36:07',NULL,0,NULL,'activated'),(5,'Dr. Leonor Gislason','rgerlach@example.com','$2y$10$6OvGGlns50QTFDYuRftb5O52RQnSMXb8PRVXWBLBZ1uzfItcNGl6a','customers/3.jpg','1976-07-09','+14354981879',NULL,'2022-07-25 08:36:07','2022-07-25 08:36:41','2022-07-25 15:36:07',NULL,1,'2022-07-25 15:36:41','activated'),(6,'Conner Brekke','celestine42@example.org','$2y$10$IJr2CIvDUN5gLf3A1jrNuup6X05D8NKetYNEwbRf.OplObynLzpHK','customers/4.jpg','1985-07-15','+13207971979',NULL,'2022-07-25 08:36:07','2022-07-25 08:36:41','2022-07-25 15:36:07',NULL,1,'2022-07-25 15:36:41','activated'),(7,'Dr. Newell Fahey','ohaley@example.com','$2y$10$08QJbxHJIX9CCUeD8J9Lc.9fsHVggUYpNOq/wGKWVoz9OZKEeZ5u6','customers/5.jpg','1991-06-27','+13414773890',NULL,'2022-07-25 08:36:07','2022-07-25 08:36:41','2022-07-25 15:36:07',NULL,1,'2022-07-25 15:36:41','activated'),(8,'Alanna Aufderhar','ismael.rutherford@example.net','$2y$10$VUrH7r0O5R2MpI6hSzizcu9UNlsiJUYwdDmDEwn01io.wFPiWkuZK','customers/6.jpg','1997-07-20','+17407133913',NULL,'2022-07-25 08:36:07','2022-07-25 08:36:07','2022-07-25 15:36:07',NULL,0,NULL,'activated'),(9,'Abbey Johnston','brittany.stoltenberg@example.com','$2y$10$ISM/dZgr.9p.qJlbGT1ltOgZ/o1.M9q13h2SskuA6aFciPEBq7FHG','customers/7.jpg','1985-07-21','+18648906170',NULL,'2022-07-25 08:36:07','2022-07-25 08:36:07','2022-07-25 15:36:07',NULL,0,NULL,'activated'),(10,'Haylie Collier','cdietrich@example.com','$2y$10$8ZnbWxBgzUYwOmlFAlWnnuEo8WjEmCwAX5yp2NdPKZ6YXj1d/Qy0m','customers/8.jpg','1972-06-28','+14586303193',NULL,'2022-07-25 08:36:07','2022-07-25 08:36:08','2022-07-25 15:36:08',NULL,0,NULL,'activated');
/*!40000 ALTER TABLE `ec_customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_discount_customers`
--

DROP TABLE IF EXISTS `ec_discount_customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_discount_customers` (
  `discount_id` int unsigned NOT NULL,
  `customer_id` int unsigned NOT NULL,
  PRIMARY KEY (`discount_id`,`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_discount_customers`
--

LOCK TABLES `ec_discount_customers` WRITE;
/*!40000 ALTER TABLE `ec_discount_customers` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_discount_customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_discount_product_collections`
--

DROP TABLE IF EXISTS `ec_discount_product_collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_discount_product_collections` (
  `discount_id` int unsigned NOT NULL,
  `product_collection_id` int unsigned NOT NULL,
  PRIMARY KEY (`discount_id`,`product_collection_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_discount_product_collections`
--

LOCK TABLES `ec_discount_product_collections` WRITE;
/*!40000 ALTER TABLE `ec_discount_product_collections` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_discount_product_collections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_discount_products`
--

DROP TABLE IF EXISTS `ec_discount_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_discount_products` (
  `discount_id` int unsigned NOT NULL,
  `product_id` int unsigned NOT NULL,
  PRIMARY KEY (`discount_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_discount_products`
--

LOCK TABLES `ec_discount_products` WRITE;
/*!40000 ALTER TABLE `ec_discount_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_discount_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_discounts`
--

DROP TABLE IF EXISTS `ec_discounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_discounts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `total_used` int unsigned NOT NULL DEFAULT '0',
  `value` double DEFAULT NULL,
  `type` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT 'coupon',
  `can_use_with_promotion` tinyint(1) NOT NULL DEFAULT '0',
  `discount_on` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_quantity` int unsigned DEFAULT NULL,
  `type_option` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'amount',
  `target` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'all-orders',
  `min_order_price` decimal(15,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `store_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_discounts_code_unique` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_discounts`
--

LOCK TABLES `ec_discounts` WRITE;
/*!40000 ALTER TABLE `ec_discounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_discounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_flash_sale_products`
--

DROP TABLE IF EXISTS `ec_flash_sale_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_flash_sale_products` (
  `flash_sale_id` int unsigned NOT NULL,
  `product_id` int unsigned NOT NULL,
  `price` double unsigned DEFAULT NULL,
  `quantity` int unsigned DEFAULT NULL,
  `sold` int unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_flash_sale_products`
--

LOCK TABLES `ec_flash_sale_products` WRITE;
/*!40000 ALTER TABLE `ec_flash_sale_products` DISABLE KEYS */;
INSERT INTO `ec_flash_sale_products` VALUES (1,1,59.385,12,1),(1,2,21.87,15,5),(1,3,12.4,11,1),(1,4,264.2976,10,2),(1,5,617.7,10,4),(1,6,244.8,10,3),(1,7,340.83,13,3),(1,8,589.183,8,4),(1,9,228,13,3),(1,10,770.04,17,4);
/*!40000 ALTER TABLE `ec_flash_sale_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_flash_sales`
--

DROP TABLE IF EXISTS `ec_flash_sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_flash_sales` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `end_date` datetime NOT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_flash_sales`
--

LOCK TABLES `ec_flash_sales` WRITE;
/*!40000 ALTER TABLE `ec_flash_sales` DISABLE KEYS */;
INSERT INTO `ec_flash_sales` VALUES (1,'Winter Sale','2022-08-24 00:00:00','published','2022-07-25 08:36:09','2022-07-25 08:36:09');
/*!40000 ALTER TABLE `ec_flash_sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_flash_sales_translations`
--

DROP TABLE IF EXISTS `ec_flash_sales_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_flash_sales_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_flash_sales_id` int NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ec_flash_sales_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_flash_sales_translations`
--

LOCK TABLES `ec_flash_sales_translations` WRITE;
/*!40000 ALTER TABLE `ec_flash_sales_translations` DISABLE KEYS */;
INSERT INTO `ec_flash_sales_translations` VALUES ('vi',1,'Khuyến mãi mùa đông.');
/*!40000 ALTER TABLE `ec_flash_sales_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_grouped_products`
--

DROP TABLE IF EXISTS `ec_grouped_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_grouped_products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `parent_product_id` int unsigned NOT NULL,
  `product_id` int unsigned NOT NULL,
  `fixed_qty` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_grouped_products`
--

LOCK TABLES `ec_grouped_products` WRITE;
/*!40000 ALTER TABLE `ec_grouped_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_grouped_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_order_addresses`
--

DROP TABLE IF EXISTS `ec_order_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_order_addresses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` int unsigned NOT NULL,
  `zip_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_order_addresses`
--

LOCK TABLES `ec_order_addresses` WRITE;
/*!40000 ALTER TABLE `ec_order_addresses` DISABLE KEYS */;
INSERT INTO `ec_order_addresses` VALUES (1,'Jany Gleason','+14059650951','lesly02@example.org','RS','Washington','South Kacichester','817 Stiedemann Bridge Apt. 390',1,'73007'),(2,'Jany Gleason','+14059650951','lesly02@example.org','RS','Washington','South Kacichester','817 Stiedemann Bridge Apt. 390',2,'73007'),(3,'Jany Gleason','+14059650951','lesly02@example.org','RS','Washington','South Kacichester','817 Stiedemann Bridge Apt. 390',3,'73007'),(4,'Alanna Aufderhar','+12535171002','ismael.rutherford@example.net','SC','South Dakota','Heathcotetown','458 Jarred Pike Apt. 359',4,'77252'),(5,'Alanna Aufderhar','+12535171002','ismael.rutherford@example.net','SC','South Dakota','Heathcotetown','458 Jarred Pike Apt. 359',5,'77252'),(6,'Abbey Johnston','+18328463324','brittany.stoltenberg@example.com','GF','Ohio','Ernestomouth','826 Germaine Path Suite 186',6,'76052-7028'),(7,'Abbey Johnston','+18328463324','brittany.stoltenberg@example.com','GF','Ohio','Ernestomouth','826 Germaine Path Suite 186',7,'76052-7028'),(8,'Abbey Johnston','+18328463324','brittany.stoltenberg@example.com','GF','Ohio','Ernestomouth','826 Germaine Path Suite 186',8,'76052-7028'),(9,'Abbey Johnston','+18328463324','brittany.stoltenberg@example.com','GF','Ohio','Ernestomouth','826 Germaine Path Suite 186',9,'76052-7028'),(10,'Haylie Collier','+18787070367','cdietrich@example.com','PH','New Hampshire','Lake Davontetown','499 Hansen Street Apt. 980',10,'60134'),(11,'Haylie Collier','+18787070367','cdietrich@example.com','PH','New Hampshire','Lake Davontetown','499 Hansen Street Apt. 980',11,'60134'),(12,'Johnpaul Quitzon','+16518276190','customer@botble.com','YE','Mississippi','McClurefort','38689 Toy Wall Suite 230',12,'77257'),(13,'Johnpaul Quitzon','+16518276190','customer@botble.com','YE','Mississippi','McClurefort','38689 Toy Wall Suite 230',13,'77257'),(14,'Johnpaul Quitzon','+16518276190','customer@botble.com','YE','Mississippi','McClurefort','38689 Toy Wall Suite 230',14,'77257'),(15,'Jany Gleason','+14059650951','lesly02@example.org','RS','Washington','South Kacichester','817 Stiedemann Bridge Apt. 390',15,'73007'),(16,'Jany Gleason','+14059650951','lesly02@example.org','RS','Washington','South Kacichester','817 Stiedemann Bridge Apt. 390',16,'73007'),(17,'Jany Gleason','+14059650951','lesly02@example.org','RS','Washington','South Kacichester','817 Stiedemann Bridge Apt. 390',17,'73007'),(18,'Alanna Aufderhar','+12535171002','ismael.rutherford@example.net','SC','South Dakota','Heathcotetown','458 Jarred Pike Apt. 359',18,'77252'),(19,'Alanna Aufderhar','+12535171002','ismael.rutherford@example.net','SC','South Dakota','Heathcotetown','458 Jarred Pike Apt. 359',19,'77252'),(20,'Abbey Johnston','+18328463324','brittany.stoltenberg@example.com','GF','Ohio','Ernestomouth','826 Germaine Path Suite 186',20,'76052-7028'),(21,'Abbey Johnston','+18328463324','brittany.stoltenberg@example.com','GF','Ohio','Ernestomouth','826 Germaine Path Suite 186',21,'76052-7028'),(22,'Abbey Johnston','+18328463324','brittany.stoltenberg@example.com','GF','Ohio','Ernestomouth','826 Germaine Path Suite 186',22,'76052-7028'),(23,'Jany Gleason','+14059650951','lesly02@example.org','RS','Washington','South Kacichester','817 Stiedemann Bridge Apt. 390',23,'73007'),(24,'Jany Gleason','+14059650951','lesly02@example.org','RS','Washington','South Kacichester','817 Stiedemann Bridge Apt. 390',24,'73007'),(25,'Haylie Collier','+18787070367','cdietrich@example.com','PH','New Hampshire','Lake Davontetown','499 Hansen Street Apt. 980',25,'60134'),(26,'Haylie Collier','+18787070367','cdietrich@example.com','PH','New Hampshire','Lake Davontetown','499 Hansen Street Apt. 980',26,'60134'),(27,'Haylie Collier','+18787070367','cdietrich@example.com','PH','New Hampshire','Lake Davontetown','499 Hansen Street Apt. 980',27,'60134'),(28,'Jany Gleason','+14059650951','lesly02@example.org','RS','Washington','South Kacichester','817 Stiedemann Bridge Apt. 390',28,'73007'),(29,'Jany Gleason','+14059650951','lesly02@example.org','RS','Washington','South Kacichester','817 Stiedemann Bridge Apt. 390',29,'73007'),(30,'Jany Gleason','+14059650951','lesly02@example.org','RS','Washington','South Kacichester','817 Stiedemann Bridge Apt. 390',30,'73007'),(31,'Abbey Johnston','+18328463324','brittany.stoltenberg@example.com','GF','Ohio','Ernestomouth','826 Germaine Path Suite 186',31,'76052-7028'),(32,'Abbey Johnston','+18328463324','brittany.stoltenberg@example.com','GF','Ohio','Ernestomouth','826 Germaine Path Suite 186',32,'76052-7028'),(33,'Abbey Johnston','+18328463324','brittany.stoltenberg@example.com','GF','Ohio','Ernestomouth','826 Germaine Path Suite 186',33,'76052-7028'),(34,'Abbey Johnston','+18328463324','brittany.stoltenberg@example.com','GF','Ohio','Ernestomouth','826 Germaine Path Suite 186',34,'76052-7028'),(35,'Abbey Johnston','+18328463324','brittany.stoltenberg@example.com','GF','Ohio','Ernestomouth','826 Germaine Path Suite 186',35,'76052-7028'),(36,'Abbey Johnston','+18328463324','brittany.stoltenberg@example.com','GF','Ohio','Ernestomouth','826 Germaine Path Suite 186',36,'76052-7028'),(37,'Alanna Aufderhar','+12535171002','ismael.rutherford@example.net','SC','South Dakota','Heathcotetown','458 Jarred Pike Apt. 359',37,'77252'),(38,'Alanna Aufderhar','+12535171002','ismael.rutherford@example.net','SC','South Dakota','Heathcotetown','458 Jarred Pike Apt. 359',38,'77252'),(39,'Jany Gleason','+14059650951','lesly02@example.org','RS','Washington','South Kacichester','817 Stiedemann Bridge Apt. 390',39,'73007'),(40,'Jany Gleason','+14059650951','lesly02@example.org','RS','Washington','South Kacichester','817 Stiedemann Bridge Apt. 390',40,'73007'),(41,'Jany Gleason','+14059650951','lesly02@example.org','RS','Washington','South Kacichester','817 Stiedemann Bridge Apt. 390',41,'73007'),(42,'Jany Gleason','+14059650951','lesly02@example.org','RS','Washington','South Kacichester','817 Stiedemann Bridge Apt. 390',42,'73007'),(43,'Alanna Aufderhar','+12535171002','ismael.rutherford@example.net','SC','South Dakota','Heathcotetown','458 Jarred Pike Apt. 359',43,'77252'),(44,'Alanna Aufderhar','+12535171002','ismael.rutherford@example.net','SC','South Dakota','Heathcotetown','458 Jarred Pike Apt. 359',44,'77252'),(45,'Alanna Aufderhar','+12535171002','ismael.rutherford@example.net','SC','South Dakota','Heathcotetown','458 Jarred Pike Apt. 359',45,'77252'),(46,'Alanna Aufderhar','+12535171002','ismael.rutherford@example.net','SC','South Dakota','Heathcotetown','458 Jarred Pike Apt. 359',46,'77252'),(47,'Alanna Aufderhar','+12535171002','ismael.rutherford@example.net','SC','South Dakota','Heathcotetown','458 Jarred Pike Apt. 359',47,'77252'),(48,'Abbey Johnston','+18328463324','brittany.stoltenberg@example.com','GF','Ohio','Ernestomouth','826 Germaine Path Suite 186',48,'76052-7028'),(49,'Abbey Johnston','+18328463324','brittany.stoltenberg@example.com','GF','Ohio','Ernestomouth','826 Germaine Path Suite 186',49,'76052-7028');
/*!40000 ALTER TABLE `ec_order_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_order_histories`
--

DROP TABLE IF EXISTS `ec_order_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_order_histories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `action` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int unsigned DEFAULT NULL,
  `order_id` int unsigned NOT NULL,
  `extras` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=230 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_order_histories`
--

LOCK TABLES `ec_order_histories` WRITE;
/*!40000 ALTER TABLE `ec_order_histories` DISABLE KEYS */;
INSERT INTO `ec_order_histories` VALUES (1,'create_order_from_seeder','Order is created from the checkout page',NULL,1,NULL,'2022-07-13 16:36:44','2022-07-13 16:36:44'),(2,'confirm_order','Order was verified by %user_name%',0,1,NULL,'2022-07-13 16:36:44','2022-07-13 16:36:44'),(3,'confirm_payment','Payment was confirmed (amount $22.00) by %user_name%',0,1,NULL,'2022-07-25 08:36:44','2022-07-25 08:36:44'),(4,'create_shipment','Created shipment for order',0,1,NULL,'2022-07-25 08:36:44','2022-07-25 08:36:44'),(5,'create_order_from_seeder','Order is created from the checkout page',NULL,2,NULL,'2022-07-20 08:36:44','2022-07-20 08:36:44'),(6,'confirm_order','Order was verified by %user_name%',0,2,NULL,'2022-07-20 08:36:44','2022-07-20 08:36:44'),(7,'create_shipment','Created shipment for order',0,2,NULL,'2022-07-25 08:36:44','2022-07-25 08:36:44'),(8,'create_order_from_seeder','Order is created from the checkout page',NULL,3,NULL,'2022-07-17 00:36:44','2022-07-17 00:36:44'),(9,'confirm_order','Order was verified by %user_name%',0,3,NULL,'2022-07-17 00:36:44','2022-07-17 00:36:44'),(10,'confirm_payment','Payment was confirmed (amount $1,860.00) by %user_name%',0,3,NULL,'2022-07-25 08:36:45','2022-07-25 08:36:45'),(11,'create_shipment','Created shipment for order',0,3,NULL,'2022-07-25 08:36:45','2022-07-25 08:36:45'),(12,'create_order_from_seeder','Order is created from the checkout page',NULL,4,NULL,'2022-07-15 20:36:45','2022-07-15 20:36:45'),(13,'confirm_order','Order was verified by %user_name%',0,4,NULL,'2022-07-15 20:36:45','2022-07-15 20:36:45'),(14,'confirm_payment','Payment was confirmed (amount $595.10) by %user_name%',0,4,NULL,'2022-07-25 08:36:45','2022-07-25 08:36:45'),(15,'create_shipment','Created shipment for order',0,4,NULL,'2022-07-25 08:36:45','2022-07-25 08:36:45'),(16,'create_order_from_seeder','Order is created from the checkout page',NULL,5,NULL,'2022-07-15 20:36:45','2022-07-15 20:36:45'),(17,'confirm_order','Order was verified by %user_name%',0,5,NULL,'2022-07-15 20:36:45','2022-07-15 20:36:45'),(18,'create_shipment','Created shipment for order',0,5,NULL,'2022-07-25 08:36:45','2022-07-25 08:36:45'),(19,'create_order_from_seeder','Order is created from the checkout page',NULL,6,NULL,'2022-07-19 08:36:45','2022-07-19 08:36:45'),(20,'confirm_order','Order was verified by %user_name%',0,6,NULL,'2022-07-19 08:36:45','2022-07-19 08:36:45'),(21,'confirm_payment','Payment was confirmed (amount $1,699.10) by %user_name%',0,6,NULL,'2022-07-25 08:36:45','2022-07-25 08:36:45'),(22,'create_shipment','Created shipment for order',0,6,NULL,'2022-07-25 08:36:45','2022-07-25 08:36:45'),(23,'create_order_from_seeder','Order is created from the checkout page',NULL,7,NULL,'2022-07-14 20:36:45','2022-07-14 20:36:45'),(24,'confirm_order','Order was verified by %user_name%',0,7,NULL,'2022-07-14 20:36:45','2022-07-14 20:36:45'),(25,'confirm_payment','Payment was confirmed (amount $1,066.80) by %user_name%',0,7,NULL,'2022-07-25 08:36:45','2022-07-25 08:36:45'),(26,'create_shipment','Created shipment for order',0,7,NULL,'2022-07-25 08:36:45','2022-07-25 08:36:45'),(27,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,7,NULL,'2022-07-25 08:36:45','2022-07-25 08:36:45'),(28,'create_order_from_seeder','Order is created from the checkout page',NULL,8,NULL,'2022-07-12 14:36:45','2022-07-12 14:36:45'),(29,'confirm_order','Order was verified by %user_name%',0,8,NULL,'2022-07-12 14:36:45','2022-07-12 14:36:45'),(30,'create_shipment','Created shipment for order',0,8,NULL,'2022-07-25 08:36:45','2022-07-25 08:36:45'),(31,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,8,NULL,'2022-07-25 08:36:45','2022-07-25 08:36:45'),(32,'create_order_from_seeder','Order is created from the checkout page',NULL,9,NULL,'2022-07-22 12:36:46','2022-07-22 12:36:46'),(33,'confirm_order','Order was verified by %user_name%',0,9,NULL,'2022-07-22 12:36:46','2022-07-22 12:36:46'),(34,'confirm_payment','Payment was confirmed (amount $2,031.70) by %user_name%',0,9,NULL,'2022-07-25 08:36:46','2022-07-25 08:36:46'),(35,'create_shipment','Created shipment for order',0,9,NULL,'2022-07-25 08:36:46','2022-07-25 08:36:46'),(36,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,9,NULL,'2022-07-25 08:36:46','2022-07-25 08:36:46'),(37,'create_order_from_seeder','Order is created from the checkout page',NULL,10,NULL,'2022-07-12 00:36:46','2022-07-12 00:36:46'),(38,'confirm_order','Order was verified by %user_name%',0,10,NULL,'2022-07-12 00:36:46','2022-07-12 00:36:46'),(39,'confirm_payment','Payment was confirmed (amount $44.55) by %user_name%',0,10,NULL,'2022-07-25 08:36:46','2022-07-25 08:36:46'),(40,'create_shipment','Created shipment for order',0,10,NULL,'2022-07-25 08:36:46','2022-07-25 08:36:46'),(41,'create_order_from_seeder','Order is created from the checkout page',NULL,11,NULL,'2022-07-12 00:36:46','2022-07-12 00:36:46'),(42,'confirm_order','Order was verified by %user_name%',0,11,NULL,'2022-07-12 00:36:46','2022-07-12 00:36:46'),(43,'create_shipment','Created shipment for order',0,11,NULL,'2022-07-25 08:36:46','2022-07-25 08:36:46'),(44,'create_order_from_seeder','Order is created from the checkout page',NULL,12,NULL,'2022-07-17 20:36:46','2022-07-17 20:36:46'),(45,'confirm_order','Order was verified by %user_name%',0,12,NULL,'2022-07-17 20:36:46','2022-07-17 20:36:46'),(46,'confirm_payment','Payment was confirmed (amount $248.78) by %user_name%',0,12,NULL,'2022-07-25 08:36:46','2022-07-25 08:36:46'),(47,'create_shipment','Created shipment for order',0,12,NULL,'2022-07-25 08:36:46','2022-07-25 08:36:46'),(48,'create_order_from_seeder','Order is created from the checkout page',NULL,13,NULL,'2022-07-17 20:36:46','2022-07-17 20:36:46'),(49,'confirm_order','Order was verified by %user_name%',0,13,NULL,'2022-07-17 20:36:46','2022-07-17 20:36:46'),(50,'create_shipment','Created shipment for order',0,13,NULL,'2022-07-25 08:36:46','2022-07-25 08:36:46'),(51,'create_order_from_seeder','Order is created from the checkout page',NULL,14,NULL,'2022-07-16 14:36:46','2022-07-16 14:36:46'),(52,'confirm_order','Order was verified by %user_name%',0,14,NULL,'2022-07-16 14:36:46','2022-07-16 14:36:46'),(53,'confirm_payment','Payment was confirmed (amount $660.00) by %user_name%',0,14,NULL,'2022-07-25 08:36:46','2022-07-25 08:36:46'),(54,'create_shipment','Created shipment for order',0,14,NULL,'2022-07-25 08:36:46','2022-07-25 08:36:46'),(55,'create_order_from_seeder','Order is created from the checkout page',NULL,15,NULL,'2022-07-17 04:36:46','2022-07-17 04:36:46'),(56,'confirm_order','Order was verified by %user_name%',0,15,NULL,'2022-07-17 04:36:46','2022-07-17 04:36:46'),(57,'confirm_payment','Payment was confirmed (amount $62.00) by %user_name%',0,15,NULL,'2022-07-25 08:36:46','2022-07-25 08:36:46'),(58,'create_shipment','Created shipment for order',0,15,NULL,'2022-07-25 08:36:46','2022-07-25 08:36:46'),(59,'create_order_from_seeder','Order is created from the checkout page',NULL,16,NULL,'2022-07-18 08:36:47','2022-07-18 08:36:47'),(60,'confirm_order','Order was verified by %user_name%',0,16,NULL,'2022-07-18 08:36:47','2022-07-18 08:36:47'),(61,'confirm_payment','Payment was confirmed (amount $3,712.80) by %user_name%',0,16,NULL,'2022-07-25 08:36:47','2022-07-25 08:36:47'),(62,'create_shipment','Created shipment for order',0,16,NULL,'2022-07-25 08:36:47','2022-07-25 08:36:47'),(63,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,16,NULL,'2022-07-25 08:36:47','2022-07-25 08:36:47'),(64,'create_order_from_seeder','Order is created from the checkout page',NULL,17,NULL,'2022-07-21 00:36:47','2022-07-21 00:36:47'),(65,'confirm_order','Order was verified by %user_name%',0,17,NULL,'2022-07-21 00:36:47','2022-07-21 00:36:47'),(66,'confirm_payment','Payment was confirmed (amount $3,175.20) by %user_name%',0,17,NULL,'2022-07-25 08:36:47','2022-07-25 08:36:47'),(67,'create_shipment','Created shipment for order',0,17,NULL,'2022-07-25 08:36:47','2022-07-25 08:36:47'),(68,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,17,NULL,'2022-07-25 08:36:47','2022-07-25 08:36:47'),(69,'create_order_from_seeder','Order is created from the checkout page',NULL,18,NULL,'2022-07-15 08:36:47','2022-07-15 08:36:47'),(70,'confirm_order','Order was verified by %user_name%',0,18,NULL,'2022-07-15 08:36:47','2022-07-15 08:36:47'),(71,'create_shipment','Created shipment for order',0,18,NULL,'2022-07-25 08:36:47','2022-07-25 08:36:47'),(72,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,18,NULL,'2022-07-25 08:36:47','2022-07-25 08:36:47'),(73,'create_order_from_seeder','Order is created from the checkout page',NULL,19,NULL,'2022-07-17 08:36:47','2022-07-17 08:36:47'),(74,'confirm_order','Order was verified by %user_name%',0,19,NULL,'2022-07-17 08:36:47','2022-07-17 08:36:47'),(75,'confirm_payment','Payment was confirmed (amount $884.10) by %user_name%',0,19,NULL,'2022-07-25 08:36:47','2022-07-25 08:36:47'),(76,'create_shipment','Created shipment for order',0,19,NULL,'2022-07-25 08:36:47','2022-07-25 08:36:47'),(77,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,19,NULL,'2022-07-25 08:36:47','2022-07-25 08:36:47'),(78,'create_order_from_seeder','Order is created from the checkout page',NULL,20,NULL,'2022-07-23 12:36:47','2022-07-23 12:36:47'),(79,'confirm_order','Order was verified by %user_name%',0,20,NULL,'2022-07-23 12:36:47','2022-07-23 12:36:47'),(80,'create_shipment','Created shipment for order',0,20,NULL,'2022-07-25 08:36:47','2022-07-25 08:36:47'),(81,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,20,NULL,'2022-07-25 08:36:47','2022-07-25 08:36:47'),(82,'create_order_from_seeder','Order is created from the checkout page',NULL,21,NULL,'2022-07-20 18:36:47','2022-07-20 18:36:47'),(83,'confirm_order','Order was verified by %user_name%',0,21,NULL,'2022-07-20 18:36:47','2022-07-20 18:36:47'),(84,'confirm_payment','Payment was confirmed (amount $2,534.70) by %user_name%',0,21,NULL,'2022-07-25 08:36:47','2022-07-25 08:36:47'),(85,'create_shipment','Created shipment for order',0,21,NULL,'2022-07-25 08:36:47','2022-07-25 08:36:47'),(86,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,21,NULL,'2022-07-25 08:36:47','2022-07-25 08:36:47'),(87,'create_order_from_seeder','Order is created from the checkout page',NULL,22,NULL,'2022-07-20 18:36:47','2022-07-20 18:36:47'),(88,'confirm_order','Order was verified by %user_name%',0,22,NULL,'2022-07-20 18:36:47','2022-07-20 18:36:47'),(89,'confirm_payment','Payment was confirmed (amount $878.90) by %user_name%',0,22,NULL,'2022-07-25 08:36:48','2022-07-25 08:36:48'),(90,'create_shipment','Created shipment for order',0,22,NULL,'2022-07-25 08:36:48','2022-07-25 08:36:48'),(91,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,22,NULL,'2022-07-25 08:36:48','2022-07-25 08:36:48'),(92,'create_order_from_seeder','Order is created from the checkout page',NULL,23,NULL,'2022-07-21 04:36:48','2022-07-21 04:36:48'),(93,'confirm_order','Order was verified by %user_name%',0,23,NULL,'2022-07-21 04:36:48','2022-07-21 04:36:48'),(94,'confirm_payment','Payment was confirmed (amount $2,697.00) by %user_name%',0,23,NULL,'2022-07-25 08:36:48','2022-07-25 08:36:48'),(95,'create_shipment','Created shipment for order',0,23,NULL,'2022-07-25 08:36:48','2022-07-25 08:36:48'),(96,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,23,NULL,'2022-07-25 08:36:48','2022-07-25 08:36:48'),(97,'create_order_from_seeder','Order is created from the checkout page',NULL,24,NULL,'2022-07-22 00:36:48','2022-07-22 00:36:48'),(98,'confirm_order','Order was verified by %user_name%',0,24,NULL,'2022-07-22 00:36:48','2022-07-22 00:36:48'),(99,'confirm_payment','Payment was confirmed (amount $1,763.00) by %user_name%',0,24,NULL,'2022-07-25 08:36:48','2022-07-25 08:36:48'),(100,'create_shipment','Created shipment for order',0,24,NULL,'2022-07-25 08:36:48','2022-07-25 08:36:48'),(101,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,24,NULL,'2022-07-25 08:36:48','2022-07-25 08:36:48'),(102,'create_order_from_seeder','Order is created from the checkout page',NULL,25,NULL,'2022-07-21 14:36:48','2022-07-21 14:36:48'),(103,'confirm_order','Order was verified by %user_name%',0,25,NULL,'2022-07-21 14:36:48','2022-07-21 14:36:48'),(104,'create_shipment','Created shipment for order',0,25,NULL,'2022-07-25 08:36:49','2022-07-25 08:36:49'),(105,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,25,NULL,'2022-07-25 08:36:49','2022-07-25 08:36:49'),(106,'create_order_from_seeder','Order is created from the checkout page',NULL,26,NULL,'2022-07-19 08:36:49','2022-07-19 08:36:49'),(107,'confirm_order','Order was verified by %user_name%',0,26,NULL,'2022-07-19 08:36:49','2022-07-19 08:36:49'),(108,'confirm_payment','Payment was confirmed (amount $2,326.80) by %user_name%',0,26,NULL,'2022-07-25 08:36:49','2022-07-25 08:36:49'),(109,'create_shipment','Created shipment for order',0,26,NULL,'2022-07-25 08:36:49','2022-07-25 08:36:49'),(110,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,26,NULL,'2022-07-25 08:36:49','2022-07-25 08:36:49'),(111,'create_order_from_seeder','Order is created from the checkout page',NULL,27,NULL,'2022-07-22 08:36:49','2022-07-22 08:36:49'),(112,'confirm_order','Order was verified by %user_name%',0,27,NULL,'2022-07-22 08:36:49','2022-07-22 08:36:49'),(113,'confirm_payment','Payment was confirmed (amount $1,305.10) by %user_name%',0,27,NULL,'2022-07-25 08:36:49','2022-07-25 08:36:49'),(114,'create_shipment','Created shipment for order',0,27,NULL,'2022-07-25 08:36:49','2022-07-25 08:36:49'),(115,'create_order_from_seeder','Order is created from the checkout page',NULL,28,NULL,'2022-07-24 16:36:49','2022-07-24 16:36:49'),(116,'confirm_order','Order was verified by %user_name%',0,28,NULL,'2022-07-24 16:36:49','2022-07-24 16:36:49'),(117,'create_shipment','Created shipment for order',0,28,NULL,'2022-07-25 08:36:49','2022-07-25 08:36:49'),(118,'create_order_from_seeder','Order is created from the checkout page',NULL,29,NULL,'2022-07-18 16:36:49','2022-07-18 16:36:49'),(119,'confirm_order','Order was verified by %user_name%',0,29,NULL,'2022-07-18 16:36:49','2022-07-18 16:36:49'),(120,'confirm_payment','Payment was confirmed (amount $1,268.30) by %user_name%',0,29,NULL,'2022-07-25 08:36:49','2022-07-25 08:36:49'),(121,'create_shipment','Created shipment for order',0,29,NULL,'2022-07-25 08:36:49','2022-07-25 08:36:49'),(122,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,29,NULL,'2022-07-25 08:36:49','2022-07-25 08:36:49'),(123,'create_order_from_seeder','Order is created from the checkout page',NULL,30,NULL,'2022-07-24 16:36:49','2022-07-24 16:36:49'),(124,'confirm_order','Order was verified by %user_name%',0,30,NULL,'2022-07-24 16:36:49','2022-07-24 16:36:49'),(125,'confirm_payment','Payment was confirmed (amount $1,574.80) by %user_name%',0,30,NULL,'2022-07-25 08:36:49','2022-07-25 08:36:49'),(126,'create_shipment','Created shipment for order',0,30,NULL,'2022-07-25 08:36:49','2022-07-25 08:36:49'),(127,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,30,NULL,'2022-07-25 08:36:49','2022-07-25 08:36:49'),(128,'create_order_from_seeder','Order is created from the checkout page',NULL,31,NULL,'2022-07-19 12:36:49','2022-07-19 12:36:49'),(129,'confirm_order','Order was verified by %user_name%',0,31,NULL,'2022-07-19 12:36:49','2022-07-19 12:36:49'),(130,'confirm_payment','Payment was confirmed (amount $1,827.00) by %user_name%',0,31,NULL,'2022-07-25 08:36:49','2022-07-25 08:36:49'),(131,'create_shipment','Created shipment for order',0,31,NULL,'2022-07-25 08:36:49','2022-07-25 08:36:49'),(132,'create_order_from_seeder','Order is created from the checkout page',NULL,32,NULL,'2022-07-20 02:36:49','2022-07-20 02:36:49'),(133,'confirm_order','Order was verified by %user_name%',0,32,NULL,'2022-07-20 02:36:49','2022-07-20 02:36:49'),(134,'create_shipment','Created shipment for order',0,32,NULL,'2022-07-25 08:36:49','2022-07-25 08:36:49'),(135,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,32,NULL,'2022-07-25 08:36:49','2022-07-25 08:36:49'),(136,'create_order_from_seeder','Order is created from the checkout page',NULL,33,NULL,'2022-07-19 12:36:49','2022-07-19 12:36:49'),(137,'confirm_order','Order was verified by %user_name%',0,33,NULL,'2022-07-19 12:36:49','2022-07-19 12:36:49'),(138,'confirm_payment','Payment was confirmed (amount $2,476.90) by %user_name%',0,33,NULL,'2022-07-25 08:36:49','2022-07-25 08:36:49'),(139,'create_shipment','Created shipment for order',0,33,NULL,'2022-07-25 08:36:49','2022-07-25 08:36:49'),(140,'create_order_from_seeder','Order is created from the checkout page',NULL,34,NULL,'2022-07-24 20:36:49','2022-07-24 20:36:49'),(141,'confirm_order','Order was verified by %user_name%',0,34,NULL,'2022-07-24 20:36:49','2022-07-24 20:36:49'),(142,'confirm_payment','Payment was confirmed (amount $88.28) by %user_name%',0,34,NULL,'2022-07-25 08:36:49','2022-07-25 08:36:49'),(143,'create_shipment','Created shipment for order',0,34,NULL,'2022-07-25 08:36:49','2022-07-25 08:36:49'),(144,'create_order_from_seeder','Order is created from the checkout page',NULL,35,NULL,'2022-07-21 08:36:49','2022-07-21 08:36:49'),(145,'confirm_order','Order was verified by %user_name%',0,35,NULL,'2022-07-21 08:36:49','2022-07-21 08:36:49'),(146,'confirm_payment','Payment was confirmed (amount $1,677.90) by %user_name%',0,35,NULL,'2022-07-25 08:36:50','2022-07-25 08:36:50'),(147,'create_shipment','Created shipment for order',0,35,NULL,'2022-07-25 08:36:50','2022-07-25 08:36:50'),(148,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,35,NULL,'2022-07-25 08:36:50','2022-07-25 08:36:50'),(149,'create_order_from_seeder','Order is created from the checkout page',NULL,36,NULL,'2022-07-23 08:36:50','2022-07-23 08:36:50'),(150,'confirm_order','Order was verified by %user_name%',0,36,NULL,'2022-07-23 08:36:50','2022-07-23 08:36:50'),(151,'confirm_payment','Payment was confirmed (amount $2,238.20) by %user_name%',0,36,NULL,'2022-07-25 08:36:50','2022-07-25 08:36:50'),(152,'create_shipment','Created shipment for order',0,36,NULL,'2022-07-25 08:36:50','2022-07-25 08:36:50'),(153,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,36,NULL,'2022-07-25 08:36:50','2022-07-25 08:36:50'),(154,'create_order_from_seeder','Order is created from the checkout page',NULL,37,NULL,'2022-07-22 00:36:50','2022-07-22 00:36:50'),(155,'confirm_order','Order was verified by %user_name%',0,37,NULL,'2022-07-22 00:36:50','2022-07-22 00:36:50'),(156,'create_shipment','Created shipment for order',0,37,NULL,'2022-07-25 08:36:50','2022-07-25 08:36:50'),(157,'create_order_from_seeder','Order is created from the checkout page',NULL,38,NULL,'2022-07-24 12:36:50','2022-07-24 12:36:50'),(158,'confirm_order','Order was verified by %user_name%',0,38,NULL,'2022-07-24 12:36:50','2022-07-24 12:36:50'),(159,'confirm_payment','Payment was confirmed (amount $588.50) by %user_name%',0,38,NULL,'2022-07-25 08:36:50','2022-07-25 08:36:50'),(160,'create_shipment','Created shipment for order',0,38,NULL,'2022-07-25 08:36:50','2022-07-25 08:36:50'),(161,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,38,NULL,'2022-07-25 08:36:50','2022-07-25 08:36:50'),(162,'create_order_from_seeder','Order is created from the checkout page',NULL,39,NULL,'2022-07-22 00:36:50','2022-07-22 00:36:50'),(163,'confirm_order','Order was verified by %user_name%',0,39,NULL,'2022-07-22 00:36:50','2022-07-22 00:36:50'),(164,'create_shipment','Created shipment for order',0,39,NULL,'2022-07-25 08:36:50','2022-07-25 08:36:50'),(165,'create_order_from_seeder','Order is created from the checkout page',NULL,40,NULL,'2022-07-22 08:36:50','2022-07-22 08:36:50'),(166,'confirm_order','Order was verified by %user_name%',0,40,NULL,'2022-07-22 08:36:50','2022-07-22 08:36:50'),(167,'confirm_payment','Payment was confirmed (amount $1,860.00) by %user_name%',0,40,NULL,'2022-07-25 08:36:50','2022-07-25 08:36:50'),(168,'create_shipment','Created shipment for order',0,40,NULL,'2022-07-25 08:36:50','2022-07-25 08:36:50'),(169,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,40,NULL,'2022-07-25 08:36:50','2022-07-25 08:36:50'),(170,'create_order_from_seeder','Order is created from the checkout page',NULL,41,NULL,'2022-07-23 08:36:50','2022-07-23 08:36:50'),(171,'confirm_order','Order was verified by %user_name%',0,41,NULL,'2022-07-23 08:36:50','2022-07-23 08:36:50'),(172,'confirm_payment','Payment was confirmed (amount $1,152.90) by %user_name%',0,41,NULL,'2022-07-25 08:36:51','2022-07-25 08:36:51'),(173,'create_shipment','Created shipment for order',0,41,NULL,'2022-07-25 08:36:51','2022-07-25 08:36:51'),(174,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,41,NULL,'2022-07-25 08:36:51','2022-07-25 08:36:51'),(175,'create_order_from_seeder','Order is created from the checkout page',NULL,42,NULL,'2022-07-23 16:36:51','2022-07-23 16:36:51'),(176,'confirm_order','Order was verified by %user_name%',0,42,NULL,'2022-07-23 16:36:51','2022-07-23 16:36:51'),(177,'create_shipment','Created shipment for order',0,42,NULL,'2022-07-25 08:36:51','2022-07-25 08:36:51'),(178,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,42,NULL,'2022-07-25 08:36:51','2022-07-25 08:36:51'),(179,'create_order_from_seeder','Order is created from the checkout page',NULL,43,NULL,'2022-07-24 14:36:51','2022-07-24 14:36:51'),(180,'confirm_order','Order was verified by %user_name%',0,43,NULL,'2022-07-24 14:36:51','2022-07-24 14:36:51'),(181,'confirm_payment','Payment was confirmed (amount $528.00) by %user_name%',0,43,NULL,'2022-07-25 08:36:51','2022-07-25 08:36:51'),(182,'create_shipment','Created shipment for order',0,43,NULL,'2022-07-25 08:36:51','2022-07-25 08:36:51'),(183,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,43,NULL,'2022-07-25 08:36:51','2022-07-25 08:36:51'),(184,'create_order_from_seeder','Order is created from the checkout page',NULL,44,NULL,'2022-07-23 08:36:51','2022-07-23 08:36:51'),(185,'confirm_order','Order was verified by %user_name%',0,44,NULL,'2022-07-23 08:36:51','2022-07-23 08:36:51'),(186,'confirm_payment','Payment was confirmed (amount $1,726.80) by %user_name%',0,44,NULL,'2022-07-25 08:36:51','2022-07-25 08:36:51'),(187,'create_shipment','Created shipment for order',0,44,NULL,'2022-07-25 08:36:51','2022-07-25 08:36:51'),(188,'create_order_from_seeder','Order is created from the checkout page',NULL,45,NULL,'2022-07-25 04:36:51','2022-07-25 04:36:51'),(189,'confirm_order','Order was verified by %user_name%',0,45,NULL,'2022-07-25 04:36:51','2022-07-25 04:36:51'),(190,'confirm_payment','Payment was confirmed (amount $1,677.10) by %user_name%',0,45,NULL,'2022-07-25 08:36:51','2022-07-25 08:36:51'),(191,'create_shipment','Created shipment for order',0,45,NULL,'2022-07-25 08:36:51','2022-07-25 08:36:51'),(192,'create_order_from_seeder','Order is created from the checkout page',NULL,46,NULL,'2022-07-24 16:36:51','2022-07-24 16:36:51'),(193,'confirm_order','Order was verified by %user_name%',0,46,NULL,'2022-07-24 16:36:51','2022-07-24 16:36:51'),(194,'confirm_payment','Payment was confirmed (amount $1,123.50) by %user_name%',0,46,NULL,'2022-07-25 08:36:51','2022-07-25 08:36:51'),(195,'create_shipment','Created shipment for order',0,46,NULL,'2022-07-25 08:36:51','2022-07-25 08:36:51'),(196,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,46,NULL,'2022-07-25 08:36:51','2022-07-25 08:36:51'),(197,'create_order_from_seeder','Order is created from the checkout page',NULL,47,NULL,'2022-07-24 16:36:51','2022-07-24 16:36:51'),(198,'confirm_order','Order was verified by %user_name%',0,47,NULL,'2022-07-24 16:36:51','2022-07-24 16:36:51'),(199,'create_shipment','Created shipment for order',0,47,NULL,'2022-07-25 08:36:51','2022-07-25 08:36:51'),(200,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,47,NULL,'2022-07-25 08:36:51','2022-07-25 08:36:51'),(201,'create_order_from_seeder','Order is created from the checkout page',NULL,48,NULL,'2022-07-24 12:36:51','2022-07-24 12:36:51'),(202,'confirm_order','Order was verified by %user_name%',0,48,NULL,'2022-07-24 12:36:51','2022-07-24 12:36:51'),(203,'confirm_payment','Payment was confirmed (amount $1,568.60) by %user_name%',0,48,NULL,'2022-07-25 08:36:51','2022-07-25 08:36:51'),(204,'create_shipment','Created shipment for order',0,48,NULL,'2022-07-25 08:36:51','2022-07-25 08:36:51'),(205,'create_order_from_seeder','Order is created from the checkout page',NULL,49,NULL,'2022-07-24 18:36:51','2022-07-24 18:36:51'),(206,'confirm_order','Order was verified by %user_name%',0,49,NULL,'2022-07-24 18:36:51','2022-07-24 18:36:51'),(207,'confirm_payment','Payment was confirmed (amount $3,992.80) by %user_name%',0,49,NULL,'2022-07-25 08:36:52','2022-07-25 08:36:52'),(208,'create_shipment','Created shipment for order',0,49,NULL,'2022-07-25 08:36:52','2022-07-25 08:36:52'),(209,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,49,NULL,'2022-07-25 08:36:52','2022-07-25 08:36:52'),(210,'update_status','Order confirmed by %user_name%',0,7,NULL,'2022-07-25 08:36:52','2022-07-25 08:36:52'),(211,'update_status','Order confirmed by %user_name%',0,9,NULL,'2022-07-25 08:36:52','2022-07-25 08:36:52'),(212,'update_status','Order confirmed by %user_name%',0,16,NULL,'2022-07-25 08:36:52','2022-07-25 08:36:52'),(213,'update_status','Order confirmed by %user_name%',0,17,NULL,'2022-07-25 08:36:52','2022-07-25 08:36:52'),(214,'update_status','Order confirmed by %user_name%',0,19,NULL,'2022-07-25 08:36:53','2022-07-25 08:36:53'),(215,'update_status','Order confirmed by %user_name%',0,21,NULL,'2022-07-25 08:36:53','2022-07-25 08:36:53'),(216,'update_status','Order confirmed by %user_name%',0,22,NULL,'2022-07-25 08:36:53','2022-07-25 08:36:53'),(217,'update_status','Order confirmed by %user_name%',0,23,NULL,'2022-07-25 08:36:53','2022-07-25 08:36:53'),(218,'update_status','Order confirmed by %user_name%',0,24,NULL,'2022-07-25 08:36:53','2022-07-25 08:36:53'),(219,'update_status','Order confirmed by %user_name%',0,26,NULL,'2022-07-25 08:36:54','2022-07-25 08:36:54'),(220,'update_status','Order confirmed by %user_name%',0,29,NULL,'2022-07-25 08:36:54','2022-07-25 08:36:54'),(221,'update_status','Order confirmed by %user_name%',0,30,NULL,'2022-07-25 08:36:54','2022-07-25 08:36:54'),(222,'update_status','Order confirmed by %user_name%',0,35,NULL,'2022-07-25 08:36:54','2022-07-25 08:36:54'),(223,'update_status','Order confirmed by %user_name%',0,36,NULL,'2022-07-25 08:36:54','2022-07-25 08:36:54'),(224,'update_status','Order confirmed by %user_name%',0,38,NULL,'2022-07-25 08:36:55','2022-07-25 08:36:55'),(225,'update_status','Order confirmed by %user_name%',0,40,NULL,'2022-07-25 08:36:55','2022-07-25 08:36:55'),(226,'update_status','Order confirmed by %user_name%',0,41,NULL,'2022-07-25 08:36:55','2022-07-25 08:36:55'),(227,'update_status','Order confirmed by %user_name%',0,43,NULL,'2022-07-25 08:36:56','2022-07-25 08:36:56'),(228,'update_status','Order confirmed by %user_name%',0,46,NULL,'2022-07-25 08:36:56','2022-07-25 08:36:56'),(229,'update_status','Order confirmed by %user_name%',0,49,NULL,'2022-07-25 08:36:56','2022-07-25 08:36:56');
/*!40000 ALTER TABLE `ec_order_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_order_product`
--

DROP TABLE IF EXISTS `ec_order_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_order_product` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int unsigned NOT NULL,
  `qty` int NOT NULL,
  `price` decimal(15,2) NOT NULL,
  `tax_amount` decimal(15,2) NOT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `product_id` int unsigned DEFAULT NULL,
  `product_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `weight` double(8,2) DEFAULT '0.00',
  `restock_quantity` int unsigned DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_order_product`
--

LOCK TABLES `ec_order_product` WRITE;
/*!40000 ALTER TABLE `ec_order_product` DISABLE KEYS */;
INSERT INTO `ec_order_product` VALUES (1,1,1,20.00,2.00,'[]',28,'Beat Headphone',520.00,0,'2022-07-25 08:36:44','2022-07-25 08:36:44'),(2,2,3,480.00,48.00,'[]',33,'Nikon HD camera',2136.00,0,'2022-07-25 08:36:44','2022-07-25 08:36:44'),(3,2,1,575.00,57.50,'[]',54,'Apple MacBook Air Retina 13.3-Inch Laptop',740.00,0,'2022-07-25 08:36:44','2022-07-25 08:36:44'),(4,3,3,600.00,60.00,'[]',43,'Samsung Smart Phone',1989.00,0,'2022-07-25 08:36:45','2022-07-25 08:36:45'),(5,4,1,541.00,54.10,'[]',37,'Audio Equipment',510.00,0,'2022-07-25 08:36:45','2022-07-25 08:36:45'),(6,5,2,1288.00,128.80,'[]',63,'Aveeno Moisturizing Body Shower 450ml',1590.00,0,'2022-07-25 08:36:45','2022-07-25 08:36:45'),(7,5,1,658.00,65.80,'[]',71,'MVMTH Classical Leather Watch In Black',784.00,0,'2022-07-25 08:36:45','2022-07-25 08:36:45'),(8,6,1,20.00,2.00,'[]',28,'Beat Headphone',520.00,0,'2022-07-25 08:36:45','2022-07-25 08:36:45'),(9,6,3,541.00,54.10,'[]',35,'Audio Equipment',1530.00,0,'2022-07-25 08:36:45','2022-07-25 08:36:45'),(10,7,2,508.00,50.80,'[]',59,'Samsung Gear VR Virtual Reality Headset',1748.00,0,'2022-07-25 08:36:45','2022-07-25 08:36:45'),(11,8,2,1207.00,120.70,'[]',45,'Xbox One Wireless Controller Black Color',1268.00,0,'2022-07-25 08:36:45','2022-07-25 08:36:45'),(12,9,3,506.00,50.60,'[]',47,'EPSION Plaster Printer',1659.00,0,'2022-07-25 08:36:46','2022-07-25 08:36:46'),(13,9,1,421.00,42.10,'[]',73,'Baxter Care Hair Kit For Bearded Mens',600.00,0,'2022-07-25 08:36:46','2022-07-25 08:36:46'),(14,10,1,40.50,4.05,'[]',27,'Smart Watches',645.00,0,'2022-07-25 08:36:46','2022-07-25 08:36:46'),(15,11,3,508.00,50.80,'[]',61,'Samsung Gear VR Virtual Reality Headset',2622.00,0,'2022-07-25 08:36:46','2022-07-25 08:36:46'),(16,12,3,80.25,8.03,'[]',24,'Dual Camera 20MP',1674.00,0,'2022-07-25 08:36:46','2022-07-25 08:36:46'),(17,13,2,541.00,54.10,'[]',36,'Audio Equipment',1020.00,0,'2022-07-25 08:36:46','2022-07-25 08:36:46'),(18,14,1,600.00,60.00,'[]',43,'Samsung Smart Phone',663.00,0,'2022-07-25 08:36:46','2022-07-25 08:36:46'),(19,15,3,20.00,2.00,'[]',29,'Beat Headphone',1560.00,0,'2022-07-25 08:36:46','2022-07-25 08:36:46'),(20,16,2,480.00,48.00,'[]',33,'Nikon HD camera',1424.00,0,'2022-07-25 08:36:47','2022-07-25 08:36:47'),(21,16,2,1288.00,128.80,'[]',62,'Aveeno Moisturizing Body Shower 450ml',1590.00,0,'2022-07-25 08:36:47','2022-07-25 08:36:47'),(22,17,2,508.00,50.80,'[]',61,'Samsung Gear VR Virtual Reality Headset',1748.00,0,'2022-07-25 08:36:47','2022-07-25 08:36:47'),(23,17,2,1004.00,100.40,'[]',65,'NYX Beauty Couton Pallete Makeup 12',1170.00,0,'2022-07-25 08:36:47','2022-07-25 08:36:47'),(24,18,1,508.00,50.80,'[]',61,'Samsung Gear VR Virtual Reality Headset',874.00,0,'2022-07-25 08:36:47','2022-07-25 08:36:47'),(25,19,2,421.00,42.10,'[]',73,'Baxter Care Hair Kit For Bearded Mens',1200.00,0,'2022-07-25 08:36:47','2022-07-25 08:36:47'),(26,20,2,1153.00,115.30,'[]',40,'Smart Televisions',1054.00,0,'2022-07-25 08:36:47','2022-07-25 08:36:47'),(27,21,2,1207.00,120.70,'[]',46,'Xbox One Wireless Controller Black Color',1268.00,0,'2022-07-25 08:36:47','2022-07-25 08:36:47'),(28,22,1,799.00,79.90,'[]',69,'NYX Beauty Couton Pallete Makeup 12',850.00,0,'2022-07-25 08:36:47','2022-07-25 08:36:47'),(29,23,3,870.00,87.00,'[]',31,'Smart Watch External',1512.00,0,'2022-07-25 08:36:48','2022-07-25 08:36:48'),(30,24,1,799.00,79.90,'[]',69,'NYX Beauty Couton Pallete Makeup 12',850.00,0,'2022-07-25 08:36:48','2022-07-25 08:36:48'),(31,24,2,421.00,42.10,'[]',74,'Baxter Care Hair Kit For Bearded Mens',1200.00,0,'2022-07-25 08:36:48','2022-07-25 08:36:48'),(32,25,2,1153.00,115.30,'[]',41,'Smart Televisions',1054.00,0,'2022-07-25 08:36:48','2022-07-25 08:36:48'),(33,26,2,600.00,60.00,'[]',42,'Samsung Smart Phone',1326.00,0,'2022-07-25 08:36:49','2022-07-25 08:36:49'),(34,26,2,508.00,50.80,'[]',60,'Samsung Gear VR Virtual Reality Headset',1748.00,0,'2022-07-25 08:36:49','2022-07-25 08:36:49'),(35,27,3,421.00,42.10,'[]',72,'Baxter Care Hair Kit For Bearded Mens',1800.00,0,'2022-07-25 08:36:49','2022-07-25 08:36:49'),(36,28,1,870.00,87.00,'[]',32,'Smart Watch External',504.00,0,'2022-07-25 08:36:49','2022-07-25 08:36:49'),(37,28,2,541.00,54.10,'[]',38,'Audio Equipment',1020.00,0,'2022-07-25 08:36:49','2022-07-25 08:36:49'),(38,29,1,1153.00,115.30,'[]',41,'Smart Televisions',527.00,0,'2022-07-25 08:36:49','2022-07-25 08:36:49'),(39,30,3,508.00,50.80,'[]',61,'Samsung Gear VR Virtual Reality Headset',2622.00,0,'2022-07-25 08:36:49','2022-07-25 08:36:49'),(40,31,2,870.00,87.00,'[]',31,'Smart Watch External',1008.00,0,'2022-07-25 08:36:49','2022-07-25 08:36:49'),(41,32,1,549.00,54.90,'[]',53,'B&O Play Mini Bluetooth Speaker',889.00,0,'2022-07-25 08:36:49','2022-07-25 08:36:49'),(42,33,3,799.00,79.90,'[]',69,'NYX Beauty Couton Pallete Makeup 12',2550.00,0,'2022-07-25 08:36:49','2022-07-25 08:36:49'),(43,34,1,80.25,8.03,'[]',24,'Dual Camera 20MP',558.00,0,'2022-07-25 08:36:49','2022-07-25 08:36:49'),(44,35,2,799.00,79.90,'[]',69,'NYX Beauty Couton Pallete Makeup 12',1700.00,0,'2022-07-25 08:36:49','2022-07-25 08:36:49'),(45,36,3,722.00,72.20,'[]',77,'Ciate Palemore Lipstick Bold Red Color',1743.00,0,'2022-07-25 08:36:50','2022-07-25 08:36:50'),(46,37,3,541.00,54.10,'[]',35,'Audio Equipment',1530.00,0,'2022-07-25 08:36:50','2022-07-25 08:36:50'),(47,38,1,535.00,53.50,'[]',50,'Sound Intone I65 Earphone White Version',725.00,0,'2022-07-25 08:36:50','2022-07-25 08:36:50'),(48,39,1,870.00,87.00,'[]',32,'Smart Watch External',504.00,0,'2022-07-25 08:36:50','2022-07-25 08:36:50'),(49,40,3,600.00,60.00,'[]',42,'Samsung Smart Phone',1989.00,0,'2022-07-25 08:36:50','2022-07-25 08:36:50'),(50,41,2,549.00,54.90,'[]',52,'B&O Play Mini Bluetooth Speaker',1778.00,0,'2022-07-25 08:36:50','2022-07-25 08:36:50'),(51,42,2,1288.00,128.80,'[]',64,'Aveeno Moisturizing Body Shower 450ml',1590.00,0,'2022-07-25 08:36:51','2022-07-25 08:36:51'),(52,43,1,480.00,48.00,'[]',33,'Nikon HD camera',712.00,0,'2022-07-25 08:36:51','2022-07-25 08:36:51'),(53,44,1,600.00,60.00,'[]',43,'Samsung Smart Phone',663.00,0,'2022-07-25 08:36:51','2022-07-25 08:36:51'),(54,44,2,508.00,50.80,'[]',60,'Samsung Gear VR Virtual Reality Headset',1748.00,0,'2022-07-25 08:36:51','2022-07-25 08:36:51'),(55,45,3,541.00,54.10,'[]',37,'Audio Equipment',1530.00,0,'2022-07-25 08:36:51','2022-07-25 08:36:51'),(56,46,2,535.00,53.50,'[]',51,'Sound Intone I65 Earphone White Version',1450.00,0,'2022-07-25 08:36:51','2022-07-25 08:36:51'),(57,47,1,549.00,54.90,'[]',53,'B&O Play Mini Bluetooth Speaker',889.00,0,'2022-07-25 08:36:51','2022-07-25 08:36:51'),(58,48,3,506.00,50.60,'[]',47,'EPSION Plaster Printer',1659.00,0,'2022-07-25 08:36:51','2022-07-25 08:36:51'),(59,49,3,1288.00,128.80,'[]',63,'Aveeno Moisturizing Body Shower 450ml',2385.00,0,'2022-07-25 08:36:51','2022-07-25 08:36:51');
/*!40000 ALTER TABLE `ec_order_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_order_referrals`
--

DROP TABLE IF EXISTS `ec_order_referrals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_order_referrals` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(39) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `landing_domain` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `landing_page` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `landing_params` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referral` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gclid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fclid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `utm_source` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `utm_campaign` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `utm_medium` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `utm_term` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `utm_content` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referrer_url` text COLLATE utf8mb4_unicode_ci,
  `referrer_domain` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ec_order_referrals_order_id_index` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_order_referrals`
--

LOCK TABLES `ec_order_referrals` WRITE;
/*!40000 ALTER TABLE `ec_order_referrals` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_order_referrals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_orders`
--

DROP TABLE IF EXISTS `ec_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_orders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `shipping_option` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_method` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `status` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `amount` decimal(15,2) NOT NULL,
  `tax_amount` decimal(15,2) DEFAULT NULL,
  `shipping_amount` decimal(15,2) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `coupon_code` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_amount` decimal(15,2) DEFAULT NULL,
  `sub_total` decimal(15,2) NOT NULL,
  `is_confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `discount_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_finished` tinyint(1) DEFAULT '1',
  `token` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `store_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ec_orders_user_id_status_created_at_index` (`user_id`,`status`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_orders`
--

LOCK TABLES `ec_orders` WRITE;
/*!40000 ALTER TABLE `ec_orders` DISABLE KEYS */;
INSERT INTO `ec_orders` VALUES (1,4,'1','default','pending',22.00,2.00,0.00,NULL,NULL,0.00,20.00,1,NULL,1,'0DETcgeF4svwAYQ1KZ8ARMUhfDFLa',1,'2022-07-13 16:36:44','2022-07-25 08:36:44',1),(2,4,'1','default','pending',2120.50,105.50,0.00,NULL,NULL,0.00,2015.00,1,NULL,1,'75w2SWgYQM2RBT3SxclG6l9cdogmH',2,'2022-07-20 08:36:44','2022-07-25 08:36:44',5),(3,4,'1','default','pending',1860.00,60.00,0.00,NULL,NULL,0.00,1800.00,1,NULL,1,'FTouXcyvsCWZqinveBj7aKzzKPXuK',3,'2022-07-17 00:36:44','2022-07-25 08:36:45',4),(4,8,'1','default','pending',595.10,54.10,0.00,NULL,NULL,0.00,541.00,1,NULL,1,'CAuEreh97h4gitKO3LJh5nGQCaYZq',4,'2022-07-15 20:36:45','2022-07-25 08:36:45',1),(5,8,'1','default','pending',3428.60,194.60,0.00,NULL,NULL,0.00,3234.00,1,NULL,1,'6FfY8XMZRk82FJhIWTtL5cRwhRP3v',5,'2022-07-15 20:36:45','2022-07-25 08:36:45',5),(6,9,'1','default','pending',1699.10,56.10,0.00,NULL,NULL,0.00,1643.00,1,NULL,1,'M1wHI9eTNCsuIbImn70RFOp72sbv5',6,'2022-07-19 08:36:45','2022-07-25 08:36:45',1),(7,9,'1','default','completed',1066.80,50.80,0.00,NULL,NULL,0.00,1016.00,1,NULL,1,'eWuhqMlvMqwRqd2DpA2ShKU8d5dAv',7,'2022-07-14 20:36:45','2022-07-25 08:36:45',4),(8,9,'1','default','completed',2534.70,120.70,0.00,NULL,NULL,0.00,2414.00,1,NULL,1,'J1cDax0c8suldZKP5ajQjJjRsmkW6',8,'2022-07-12 14:36:45','2022-07-25 08:36:45',4),(9,9,'1','default','completed',2031.70,92.70,0.00,NULL,NULL,0.00,1939.00,1,NULL,1,'S5fmEjgM4VejzO5l2iVnQmhw6eW1c',9,'2022-07-22 12:36:46','2022-07-25 08:36:46',3),(10,10,'1','default','pending',44.55,4.05,0.00,NULL,NULL,0.00,40.50,1,NULL,1,'phbA3Wy6noetP1D7mZPYSGNrtLiG1',10,'2022-07-12 00:36:46','2022-07-25 08:36:46',5),(11,10,'1','default','pending',1574.80,50.80,0.00,NULL,NULL,0.00,1524.00,1,NULL,1,'PWMwRJcXbnPc0pn5mbhz4rwqwguec',11,'2022-07-12 00:36:46','2022-07-25 08:36:46',4),(12,1,'1','default','pending',248.78,8.03,0.00,NULL,NULL,0.00,240.75,1,NULL,1,'e78b65lmRVAZusKIeHDoZCkzMQg0i',12,'2022-07-17 20:36:46','2022-07-25 08:36:46',2),(13,1,'1','default','pending',1136.10,54.10,0.00,NULL,NULL,0.00,1082.00,1,NULL,1,'Idd971EQgRJr9hkcevHjNjrxQCxxh',13,'2022-07-17 20:36:46','2022-07-25 08:36:46',1),(14,1,'1','default','pending',660.00,60.00,0.00,NULL,NULL,0.00,600.00,1,NULL,1,'nIg6te8zhIvfCsTdx3O7YuleGEn5G',14,'2022-07-16 14:36:46','2022-07-25 08:36:46',4),(15,4,'1','default','pending',62.00,2.00,0.00,NULL,NULL,0.00,60.00,1,NULL,1,'aDUZgrtD1UlFVZDzlsylttVgsg1XQ',15,'2022-07-17 04:36:46','2022-07-25 08:36:46',1),(16,4,'1','default','completed',3712.80,176.80,0.00,NULL,NULL,0.00,3536.00,1,NULL,1,'hkMZEobMZfXGwi89ioRyYRGMajlhb',16,'2022-07-18 08:36:47','2022-07-25 08:36:47',5),(17,4,'1','default','completed',3175.20,151.20,0.00,NULL,NULL,0.00,3024.00,1,NULL,1,'HNmpCsyBnvp9i3ZZSFnWOXptf5oYl',17,'2022-07-21 00:36:47','2022-07-25 08:36:47',4),(18,8,'1','default','completed',558.80,50.80,0.00,NULL,NULL,0.00,508.00,1,NULL,1,'MfxEWZ0epcEfCvSMiYpfYSfnDgiT3',18,'2022-07-15 08:36:47','2022-07-25 08:36:47',4),(19,8,'1','default','completed',884.10,42.10,0.00,NULL,NULL,0.00,842.00,1,NULL,1,'4LvjMHg3hFzvX8pJY212Xj6rsOwnS',19,'2022-07-17 08:36:47','2022-07-25 08:36:47',3),(20,9,'1','default','completed',2421.30,115.30,0.00,NULL,NULL,0.00,2306.00,1,NULL,1,'3HDgOEgifFtb1OCJQd7dnPSo5N95t',20,'2022-07-23 12:36:47','2022-07-25 08:36:47',2),(21,9,'1','default','completed',2534.70,120.70,0.00,NULL,NULL,0.00,2414.00,1,NULL,1,'1rfLQkAzMrEZe9H1pVq2Eyn5WOanm',21,'2022-07-20 18:36:47','2022-07-25 08:36:47',4),(22,9,'1','default','completed',878.90,79.90,0.00,NULL,NULL,0.00,799.00,1,NULL,1,'eUrICbeg2Xc6lA3I11flO8AFLvbn5',22,'2022-07-20 18:36:47','2022-07-25 08:36:48',3),(23,4,'1','default','completed',2697.00,87.00,0.00,NULL,NULL,0.00,2610.00,1,NULL,1,'zCf1uo2ltkIIA2P36LNqBBanLfwLm',23,'2022-07-21 04:36:48','2022-07-25 08:36:48',1),(24,4,'1','default','completed',1763.00,122.00,0.00,NULL,NULL,0.00,1641.00,1,NULL,1,'ex4AZxPoV57hUDVhLzkUMBnC87lyY',24,'2022-07-22 00:36:48','2022-07-25 08:36:48',3),(25,10,'1','default','completed',2421.30,115.30,0.00,NULL,NULL,0.00,2306.00,1,NULL,1,'sXRbG2TsSaIzTCBFVhG9RRwgEGHDh',25,'2022-07-21 14:36:48','2022-07-25 08:36:49',2),(26,10,'1','default','completed',2326.80,110.80,0.00,NULL,NULL,0.00,2216.00,1,NULL,1,'u5NQxxeS46p58zdVdblqaG8vNiVCH',26,'2022-07-19 08:36:49','2022-07-25 08:36:49',4),(27,10,'1','default','pending',1305.10,42.10,0.00,NULL,NULL,0.00,1263.00,1,NULL,1,'X8jnWgST5cjDkDYVY0NKW3xzpOaXj',27,'2022-07-22 08:36:49','2022-07-25 08:36:49',3),(28,4,'1','default','pending',2093.10,141.10,0.00,NULL,NULL,0.00,1952.00,1,NULL,1,'UfHtj2hJUSiiMIKDLQBVuzQ9giqqd',28,'2022-07-24 16:36:49','2022-07-25 08:36:49',1),(29,4,'1','default','completed',1268.30,115.30,0.00,NULL,NULL,0.00,1153.00,1,NULL,1,'RgYnGjDgN52B8rWtOwjFMWxOlTkOC',29,'2022-07-18 16:36:49','2022-07-25 08:36:49',2),(30,4,'1','default','completed',1574.80,50.80,0.00,NULL,NULL,0.00,1524.00,1,NULL,1,'48bZjm3zF6pyAkOlf9IG6oBzOCNHN',30,'2022-07-24 16:36:49','2022-07-25 08:36:49',4),(31,9,'1','default','pending',1827.00,87.00,0.00,NULL,NULL,0.00,1740.00,1,NULL,1,'rUrZax4CkYyHmmFm3jkiePhFTQADh',31,'2022-07-19 12:36:49','2022-07-25 08:36:49',1),(32,9,'1','default','completed',603.90,54.90,0.00,NULL,NULL,0.00,549.00,1,NULL,1,'kOXXC0klWzIwzeDAcUSh0F2tX73Se',32,'2022-07-20 02:36:49','2022-07-25 08:36:49',2),(33,9,'1','default','pending',2476.90,79.90,0.00,NULL,NULL,0.00,2397.00,1,NULL,1,'RSiWZuRx6AH9CTyLgeQ3rYYsSZHvH',33,'2022-07-19 12:36:49','2022-07-25 08:36:49',3),(34,9,'1','default','pending',88.28,8.03,0.00,NULL,NULL,0.00,80.25,1,NULL,1,'5o85cuf2dWKVrZeWNYlS3j7iJZmjE',34,'2022-07-24 20:36:49','2022-07-25 08:36:49',2),(35,9,'1','default','completed',1677.90,79.90,0.00,NULL,NULL,0.00,1598.00,1,NULL,1,'ztbRagRhIIV1XHMSDfVBAZ34JS6zK',35,'2022-07-21 08:36:49','2022-07-25 08:36:50',3),(36,9,'1','default','completed',2238.20,72.20,0.00,NULL,NULL,0.00,2166.00,1,NULL,1,'VcydNmEPZtuYwUkPWYIayaIbWTU4Q',36,'2022-07-23 08:36:50','2022-07-25 08:36:50',4),(37,8,'1','default','pending',1677.10,54.10,0.00,NULL,NULL,0.00,1623.00,1,NULL,1,'Fp3wW53miin07i11B9qr0If9wOFim',37,'2022-07-22 00:36:50','2022-07-25 08:36:50',1),(38,8,'1','default','completed',588.50,53.50,0.00,NULL,NULL,0.00,535.00,1,NULL,1,'yQCskm8uEp6P30nvo6thtAmmQgNxM',38,'2022-07-24 12:36:50','2022-07-25 08:36:50',3),(39,4,'1','default','pending',957.00,87.00,0.00,NULL,NULL,0.00,870.00,1,NULL,1,'JWpZ7MPioJ0CszTBfaNjIAsMjZT70',39,'2022-07-22 00:36:50','2022-07-25 08:36:50',1),(40,4,'1','default','completed',1860.00,60.00,0.00,NULL,NULL,0.00,1800.00,1,NULL,1,'uHOi8eY3NkvhHgZkXHVVx7nMabUGV',40,'2022-07-22 08:36:50','2022-07-25 08:36:50',4),(41,4,'1','default','completed',1152.90,54.90,0.00,NULL,NULL,0.00,1098.00,1,NULL,1,'9tvsBBrC7nzdxakyo0tEWFQtxrGbA',41,'2022-07-23 08:36:50','2022-07-25 08:36:51',2),(42,4,'1','default','completed',2704.80,128.80,0.00,NULL,NULL,0.00,2576.00,1,NULL,1,'hvmSLsqOYPMBtegW3fhHBKRL1ZR9Q',42,'2022-07-23 16:36:51','2022-07-25 08:36:51',5),(43,8,'1','default','completed',528.00,48.00,0.00,NULL,NULL,0.00,480.00,1,NULL,1,'EGQASo3Ov3Mr0jSHHIeA4CFWsDPlQ',43,'2022-07-24 14:36:51','2022-07-25 08:36:51',5),(44,8,'1','default','pending',1726.80,110.80,0.00,NULL,NULL,0.00,1616.00,1,NULL,1,'TGEqBulsvDrtyIMKXGpwdgPi2t2yX',44,'2022-07-23 08:36:51','2022-07-25 08:36:51',4),(45,8,'1','default','pending',1677.10,54.10,0.00,NULL,NULL,0.00,1623.00,1,NULL,1,'oHbIoAU0rP3cx3wohQtKwFkdCxKVX',45,'2022-07-25 04:36:51','2022-07-25 08:36:51',1),(46,8,'1','default','completed',1123.50,53.50,0.00,NULL,NULL,0.00,1070.00,1,NULL,1,'Gs7fidOFO9PFNDAvQEffbXWj8gysh',46,'2022-07-24 16:36:51','2022-07-25 08:36:51',3),(47,8,'1','default','completed',603.90,54.90,0.00,NULL,NULL,0.00,549.00,1,NULL,1,'bkmcSGvDtLzwFKCaZSTiiz19q98E9',47,'2022-07-24 16:36:51','2022-07-25 08:36:51',2),(48,9,'1','default','pending',1568.60,50.60,0.00,NULL,NULL,0.00,1518.00,1,NULL,1,'FSzxAEunelZdyXWr2bwXQYKw9Fl1o',48,'2022-07-24 12:36:51','2022-07-25 08:36:51',3),(49,9,'1','default','completed',3992.80,128.80,0.00,NULL,NULL,0.00,3864.00,1,NULL,1,'9bSZD3fpGTX12PU5rpzg9TzfSxac2',49,'2022-07-24 18:36:51','2022-07-25 08:36:52',5);
/*!40000 ALTER TABLE `ec_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_attribute_sets`
--

DROP TABLE IF EXISTS `ec_product_attribute_sets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_attribute_sets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `display_layout` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'swatch_dropdown',
  `is_searchable` tinyint unsigned NOT NULL DEFAULT '1',
  `is_comparable` tinyint unsigned NOT NULL DEFAULT '1',
  `is_use_in_product_listing` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `order` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `use_image_from_product_variation` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_attribute_sets`
--

LOCK TABLES `ec_product_attribute_sets` WRITE;
/*!40000 ALTER TABLE `ec_product_attribute_sets` DISABLE KEYS */;
INSERT INTO `ec_product_attribute_sets` VALUES (1,'Color','color','visual',1,1,1,'published',0,'2022-07-25 08:36:03','2022-07-25 08:36:03',0),(2,'Size','size','text',1,1,1,'published',1,'2022-07-25 08:36:03','2022-07-25 08:36:03',0);
/*!40000 ALTER TABLE `ec_product_attribute_sets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_attribute_sets_translations`
--

DROP TABLE IF EXISTS `ec_product_attribute_sets_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_attribute_sets_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_product_attribute_sets_id` int NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ec_product_attribute_sets_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_attribute_sets_translations`
--

LOCK TABLES `ec_product_attribute_sets_translations` WRITE;
/*!40000 ALTER TABLE `ec_product_attribute_sets_translations` DISABLE KEYS */;
INSERT INTO `ec_product_attribute_sets_translations` VALUES ('vi',1,'Màu sắc'),('vi',2,'Kích thước');
/*!40000 ALTER TABLE `ec_product_attribute_sets_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_attributes`
--

DROP TABLE IF EXISTS `ec_product_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_attributes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `attribute_set_id` int unsigned NOT NULL,
  `title` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `order` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ec_product_attributes_attribute_set_id_status_index` (`attribute_set_id`,`status`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_attributes`
--

LOCK TABLES `ec_product_attributes` WRITE;
/*!40000 ALTER TABLE `ec_product_attributes` DISABLE KEYS */;
INSERT INTO `ec_product_attributes` VALUES (1,1,'Green','green','#5FB7D4',NULL,1,1,'published','2022-07-25 08:36:03','2022-07-25 08:36:03'),(2,1,'Blue','blue','#333333',NULL,0,2,'published','2022-07-25 08:36:03','2022-07-25 08:36:03'),(3,1,'Red','red','#DA323F',NULL,0,3,'published','2022-07-25 08:36:03','2022-07-25 08:36:03'),(4,1,'Black','back','#2F366C',NULL,0,4,'published','2022-07-25 08:36:03','2022-07-25 08:36:03'),(5,1,'Brown','brown','#87554B',NULL,0,5,'published','2022-07-25 08:36:03','2022-07-25 08:36:03'),(6,2,'S','s',NULL,NULL,1,1,'published','2022-07-25 08:36:03','2022-07-25 08:36:03'),(7,2,'M','m',NULL,NULL,0,2,'published','2022-07-25 08:36:03','2022-07-25 08:36:03'),(8,2,'L','l',NULL,NULL,0,3,'published','2022-07-25 08:36:03','2022-07-25 08:36:03'),(9,2,'XL','xl',NULL,NULL,0,4,'published','2022-07-25 08:36:03','2022-07-25 08:36:03'),(10,2,'XXL','xxl',NULL,NULL,0,5,'published','2022-07-25 08:36:03','2022-07-25 08:36:03');
/*!40000 ALTER TABLE `ec_product_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_attributes_translations`
--

DROP TABLE IF EXISTS `ec_product_attributes_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_attributes_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_product_attributes_id` int NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ec_product_attributes_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_attributes_translations`
--

LOCK TABLES `ec_product_attributes_translations` WRITE;
/*!40000 ALTER TABLE `ec_product_attributes_translations` DISABLE KEYS */;
INSERT INTO `ec_product_attributes_translations` VALUES ('vi',1,'Xanh lá cây'),('vi',2,'Xanh da trời'),('vi',3,'Đỏ'),('vi',4,'Đen'),('vi',5,'Nâu'),('vi',6,'S'),('vi',7,'M'),('vi',8,'L'),('vi',9,'XL'),('vi',10,'XXL');
/*!40000 ALTER TABLE `ec_product_attributes_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_categories`
--

DROP TABLE IF EXISTS `ec_product_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int unsigned NOT NULL DEFAULT '0',
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `order` int unsigned NOT NULL DEFAULT '0',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_featured` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ec_product_categories_parent_id_status_created_at_index` (`parent_id`,`status`,`created_at`),
  KEY `ec_product_categories_parent_id_status_index` (`parent_id`,`status`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_categories`
--

LOCK TABLES `ec_product_categories` WRITE;
/*!40000 ALTER TABLE `ec_product_categories` DISABLE KEYS */;
INSERT INTO `ec_product_categories` VALUES (1,'Hot Promotions',0,NULL,'published',0,NULL,0,'2022-07-25 08:35:27','2022-07-25 08:35:27'),(2,'Electronics',0,NULL,'published',1,'product-categories/1.jpg',1,'2022-07-25 08:35:28','2022-07-25 08:35:28'),(3,'Consumer Electronic',2,NULL,'published',0,NULL,0,'2022-07-25 08:35:28','2022-07-25 08:35:28'),(4,'Home Audio & Theaters',3,NULL,'published',0,NULL,0,'2022-07-25 08:35:28','2022-07-25 08:35:28'),(5,'TV & Videos',3,NULL,'published',1,NULL,0,'2022-07-25 08:35:28','2022-07-25 08:35:28'),(6,'Camera, Photos & Videos',3,NULL,'published',2,NULL,0,'2022-07-25 08:35:28','2022-07-25 08:35:28'),(7,'Cellphones & Accessories',3,NULL,'published',3,NULL,0,'2022-07-25 08:35:28','2022-07-25 08:35:28'),(8,'Headphones',3,NULL,'published',4,NULL,0,'2022-07-25 08:35:28','2022-07-25 08:35:28'),(9,'Videos games',3,NULL,'published',5,NULL,0,'2022-07-25 08:35:28','2022-07-25 08:35:28'),(10,'Wireless Speakers',3,NULL,'published',6,NULL,0,'2022-07-25 08:35:28','2022-07-25 08:35:28'),(11,'Office Electronic',3,NULL,'published',7,NULL,0,'2022-07-25 08:35:28','2022-07-25 08:35:28'),(12,'Accessories & Parts',2,NULL,'published',1,NULL,0,'2022-07-25 08:35:28','2022-07-25 08:35:28'),(13,'Digital Cables',12,NULL,'published',0,NULL,0,'2022-07-25 08:35:28','2022-07-25 08:35:28'),(14,'Audio & Video Cables',12,NULL,'published',1,NULL,0,'2022-07-25 08:35:28','2022-07-25 08:35:28'),(15,'Batteries',12,NULL,'published',2,NULL,0,'2022-07-25 08:35:28','2022-07-25 08:35:28'),(16,'Clothing',0,NULL,'published',2,'product-categories/2.jpg',1,'2022-07-25 08:35:28','2022-07-25 08:35:28'),(17,'Computers',0,NULL,'published',3,'product-categories/3.jpg',1,'2022-07-25 08:35:28','2022-07-25 08:35:28'),(18,'Computer & Technologies',17,NULL,'published',0,NULL,0,'2022-07-25 08:35:28','2022-07-25 08:35:28'),(19,'Computer & Tablets',18,NULL,'published',0,NULL,0,'2022-07-25 08:35:28','2022-07-25 08:35:28'),(20,'Laptop',18,NULL,'published',1,NULL,0,'2022-07-25 08:35:28','2022-07-25 08:35:28'),(21,'Monitors',18,NULL,'published',2,NULL,0,'2022-07-25 08:35:28','2022-07-25 08:35:28'),(22,'Computer Components',18,NULL,'published',3,NULL,0,'2022-07-25 08:35:28','2022-07-25 08:35:28'),(23,'Networking',17,NULL,'published',1,NULL,0,'2022-07-25 08:35:28','2022-07-25 08:35:28'),(24,'Drive & Storages',23,NULL,'published',0,NULL,0,'2022-07-25 08:35:28','2022-07-25 08:35:28'),(25,'Gaming Laptop',23,NULL,'published',1,NULL,0,'2022-07-25 08:35:28','2022-07-25 08:35:28'),(26,'Security & Protection',23,NULL,'published',2,NULL,0,'2022-07-25 08:35:28','2022-07-25 08:35:28'),(27,'Accessories',23,NULL,'published',3,NULL,0,'2022-07-25 08:35:28','2022-07-25 08:35:28'),(28,'Home & Kitchen',0,NULL,'published',4,'product-categories/4.jpg',1,'2022-07-25 08:35:28','2022-07-25 08:35:28'),(29,'Health & Beauty',0,NULL,'published',5,'product-categories/5.jpg',1,'2022-07-25 08:35:28','2022-07-25 08:35:28'),(30,'Jewelry & Watch',0,NULL,'published',6,'product-categories/6.jpg',1,'2022-07-25 08:35:28','2022-07-25 08:35:28'),(31,'Technology Toys',0,NULL,'published',7,'product-categories/7.jpg',1,'2022-07-25 08:35:28','2022-07-25 08:35:28'),(32,'Phones',0,NULL,'published',8,'product-categories/8.jpg',1,'2022-07-25 08:35:28','2022-07-25 08:35:28'),(33,'Babies & Moms',0,NULL,'published',9,NULL,0,'2022-07-25 08:35:28','2022-07-25 08:35:28'),(34,'Sport & Outdoor',0,NULL,'published',10,NULL,0,'2022-07-25 08:35:28','2022-07-25 08:35:28'),(35,'Books & Office',0,NULL,'published',11,NULL,0,'2022-07-25 08:35:28','2022-07-25 08:35:28'),(36,'Cars & Motorcycles',0,NULL,'published',12,NULL,0,'2022-07-25 08:35:28','2022-07-25 08:35:28'),(37,'Home Improvements',0,NULL,'published',13,NULL,0,'2022-07-25 08:35:28','2022-07-25 08:35:28');
/*!40000 ALTER TABLE `ec_product_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_categories_translations`
--

DROP TABLE IF EXISTS `ec_product_categories_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_categories_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_product_categories_id` int NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`ec_product_categories_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_categories_translations`
--

LOCK TABLES `ec_product_categories_translations` WRITE;
/*!40000 ALTER TABLE `ec_product_categories_translations` DISABLE KEYS */;
INSERT INTO `ec_product_categories_translations` VALUES ('vi',1,'Khuyến mãi hấp dẫn',NULL),('vi',2,'Điện tử',NULL),('vi',3,'Điện tử tiêu dùng',NULL),('vi',4,'Thiết bị nghe nhìn',NULL),('vi',5,'TV & Videos',NULL),('vi',6,'Camera, Photos & Videos',NULL),('vi',7,'Điện thoại di động & Phụ kiện',NULL),('vi',8,'Tai nghe',NULL),('vi',9,'Trò chơi video',NULL),('vi',10,'Loa không dây',NULL),('vi',11,'Điện tử văn phòng',NULL),('vi',12,'Phụ kiện & Phụ tùng',NULL),('vi',13,'Digital Cables',NULL),('vi',14,'Audio & Video Cables',NULL),('vi',15,'Pin',NULL),('vi',16,'Quần áo',NULL),('vi',17,'Máy tính',NULL),('vi',18,'Máy tính & Công nghệ',NULL),('vi',19,'Máy tính & Máy tính bảng',NULL),('vi',20,'Máy tính xách tay',NULL),('vi',21,'Màn hình',NULL),('vi',22,'Linh kiện Máy tính',NULL),('vi',23,'Mạng máy tính',NULL),('vi',24,'Thiết bị lưu trữ',NULL),('vi',25,'Máy tính xách tay chơi game',NULL),('vi',26,'Thiết bị bảo mật',NULL),('vi',27,'Phụ kiện',NULL),('vi',28,'Đồ dùng làm bếp',NULL),('vi',29,'Sức khỏe & làm đẹp',NULL),('vi',30,'Trang sức & Đồng hồ',NULL),('vi',31,'Đồ chơi công nghệ',NULL),('vi',32,'Điện thoại',NULL),('vi',33,'Mẹ và bé',NULL),('vi',34,'Thể thao & ngoài trời',NULL),('vi',35,'Sách & Văn phòng',NULL),('vi',36,'Ô tô & Xe máy',NULL),('vi',37,'Cải tiến nhà cửa',NULL);
/*!40000 ALTER TABLE `ec_product_categories_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_category_product`
--

DROP TABLE IF EXISTS `ec_product_category_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_category_product` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int unsigned NOT NULL,
  `product_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ec_product_category_product_category_id_index` (`category_id`),
  KEY `ec_product_category_product_product_id_index` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_category_product`
--

LOCK TABLES `ec_product_category_product` WRITE;
/*!40000 ALTER TABLE `ec_product_category_product` DISABLE KEYS */;
INSERT INTO `ec_product_category_product` VALUES (1,37,1),(2,20,1),(3,6,1),(4,24,1),(5,9,2),(6,33,2),(7,36,2),(8,19,2),(9,34,3),(10,4,3),(11,35,3),(12,21,3),(13,27,4),(14,17,4),(15,16,4),(16,24,4),(17,4,5),(18,18,5),(19,19,5),(20,36,5),(21,5,6),(22,25,6),(23,7,6),(24,37,6),(25,14,7),(26,6,7),(27,23,7),(28,21,7),(29,33,8),(30,29,8),(31,35,8),(32,26,8),(33,28,9),(34,23,9),(35,27,9),(36,32,9),(37,14,10),(38,20,10),(39,16,10),(40,28,10),(41,21,11),(42,32,11),(43,7,11),(44,10,12),(45,2,12),(46,24,12),(47,6,13),(48,14,13),(49,8,13),(50,27,13),(51,3,14),(52,35,14),(53,30,14),(54,17,14),(55,37,15),(56,12,15),(57,29,15),(58,21,15),(59,6,16),(60,5,16),(61,36,16),(62,17,16),(63,33,17),(64,10,17),(65,37,17),(66,21,17),(67,34,18),(68,12,18),(69,9,18),(70,35,18),(71,3,19),(72,5,19),(73,29,19),(74,18,19),(75,34,20),(76,29,20),(77,30,20),(78,35,20),(79,33,21),(80,6,21),(81,2,21),(82,31,21),(83,7,22),(84,13,22),(85,34,22),(86,33,22),(87,35,23),(88,33,23),(89,16,23),(90,15,23);
/*!40000 ALTER TABLE `ec_product_category_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_collection_products`
--

DROP TABLE IF EXISTS `ec_product_collection_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_collection_products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_collection_id` int unsigned NOT NULL,
  `product_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ec_product_collection_products_product_collection_id_index` (`product_collection_id`),
  KEY `ec_product_collection_products_product_id_index` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_collection_products`
--

LOCK TABLES `ec_product_collection_products` WRITE;
/*!40000 ALTER TABLE `ec_product_collection_products` DISABLE KEYS */;
INSERT INTO `ec_product_collection_products` VALUES (1,2,1),(2,2,2),(3,2,3),(4,1,4),(5,2,5),(6,3,6),(7,3,7),(8,1,8),(9,3,9),(10,3,10),(11,2,11),(12,2,12),(13,2,13),(14,3,14),(15,2,15),(16,1,16),(17,3,17),(18,3,18),(19,1,19),(20,1,20),(21,1,21),(22,1,22),(23,1,23);
/*!40000 ALTER TABLE `ec_product_collection_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_collections`
--

DROP TABLE IF EXISTS `ec_product_collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_collections` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_featured` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_collections`
--

LOCK TABLES `ec_product_collections` WRITE;
/*!40000 ALTER TABLE `ec_product_collections` DISABLE KEYS */;
INSERT INTO `ec_product_collections` VALUES (1,'New Arrival','new-arrival',NULL,NULL,'published','2022-07-25 08:35:29','2022-07-25 08:35:29',0),(2,'Best Sellers','best-sellers',NULL,NULL,'published','2022-07-25 08:35:29','2022-07-25 08:35:29',0),(3,'Special Offer','special-offer',NULL,NULL,'published','2022-07-25 08:35:29','2022-07-25 08:35:29',0);
/*!40000 ALTER TABLE `ec_product_collections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_collections_translations`
--

DROP TABLE IF EXISTS `ec_product_collections_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_collections_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_product_collections_id` int NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ec_product_collections_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_collections_translations`
--

LOCK TABLES `ec_product_collections_translations` WRITE;
/*!40000 ALTER TABLE `ec_product_collections_translations` DISABLE KEYS */;
INSERT INTO `ec_product_collections_translations` VALUES ('vi',1,'Hàng mới về',NULL),('vi',2,'Bán chạy nhất',NULL),('vi',3,'Khuyến mãi đặc biệt',NULL);
/*!40000 ALTER TABLE `ec_product_collections_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_cross_sale_relations`
--

DROP TABLE IF EXISTS `ec_product_cross_sale_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_cross_sale_relations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `from_product_id` int unsigned NOT NULL,
  `to_product_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ec_product_cross_sale_relations_from_product_id_index` (`from_product_id`),
  KEY `ec_product_cross_sale_relations_to_product_id_index` (`to_product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_cross_sale_relations`
--

LOCK TABLES `ec_product_cross_sale_relations` WRITE;
/*!40000 ALTER TABLE `ec_product_cross_sale_relations` DISABLE KEYS */;
INSERT INTO `ec_product_cross_sale_relations` VALUES (1,1,7),(2,1,11),(3,1,12),(4,1,4),(5,1,10),(6,1,13),(7,1,17),(8,2,14),(9,2,19),(10,2,10),(11,2,16),(12,2,18),(13,2,7),(14,3,6),(15,3,18),(16,3,4),(17,3,8),(18,3,15),(19,3,9),(20,3,5),(21,4,15),(22,4,5),(23,4,8),(24,4,19),(25,4,10),(26,4,1),(27,5,12),(28,5,11),(29,5,8),(30,5,14),(31,5,16),(32,5,9),(33,6,8),(34,6,17),(35,6,2),(36,6,13),(37,6,19),(38,6,1),(39,7,12),(40,7,9),(41,7,3),(42,7,10),(43,7,2),(44,7,20),(45,7,17),(46,8,11),(47,8,10),(48,8,2),(49,8,1),(50,8,14),(51,8,7),(52,9,4),(53,9,14),(54,9,15),(55,9,10),(56,9,18),(57,9,16),(58,9,5),(59,10,9),(60,10,1),(61,10,19),(62,10,20),(63,10,12),(64,10,2),(65,11,4),(66,11,12),(67,11,20),(68,11,17),(69,11,9),(70,11,1),(71,11,8),(72,12,9),(73,12,6),(74,12,19),(75,12,20),(76,12,4),(77,12,2),(78,13,8),(79,13,12),(80,13,6),(81,13,10),(82,13,5),(83,13,7),(84,14,8),(85,14,10),(86,14,19),(87,14,5),(88,14,4),(89,15,20),(90,15,11),(91,15,12),(92,15,9),(93,15,17),(94,15,10),(95,16,7),(96,16,18),(97,16,20),(98,16,2),(99,16,4),(100,16,13),(101,17,6),(102,17,4),(103,17,10),(104,17,12),(105,17,1),(106,17,18),(107,18,5),(108,18,10),(109,18,3),(110,18,11),(111,18,9),(112,19,16),(113,19,6),(114,19,14),(115,19,8),(116,19,18),(117,19,9),(118,20,15),(119,20,3),(120,20,4),(121,20,11),(122,20,18),(123,20,7),(124,21,18),(125,21,4),(126,21,9),(127,21,13),(128,21,14),(129,22,9),(130,22,4),(131,22,14),(132,22,3),(133,22,2),(134,22,12),(135,23,19),(136,23,18),(137,23,4),(138,23,2),(139,23,17),(140,23,12);
/*!40000 ALTER TABLE `ec_product_cross_sale_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_label_products`
--

DROP TABLE IF EXISTS `ec_product_label_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_label_products` (
  `product_label_id` int unsigned NOT NULL,
  `product_id` int unsigned NOT NULL,
  PRIMARY KEY (`product_label_id`,`product_id`),
  KEY `ec_product_label_products_product_label_id_index` (`product_label_id`),
  KEY `ec_product_label_products_product_id_index` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_label_products`
--

LOCK TABLES `ec_product_label_products` WRITE;
/*!40000 ALTER TABLE `ec_product_label_products` DISABLE KEYS */;
INSERT INTO `ec_product_label_products` VALUES (2,6),(2,9),(2,18),(2,21),(3,3),(3,12),(3,15);
/*!40000 ALTER TABLE `ec_product_label_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_labels`
--

DROP TABLE IF EXISTS `ec_product_labels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_labels` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_labels`
--

LOCK TABLES `ec_product_labels` WRITE;
/*!40000 ALTER TABLE `ec_product_labels` DISABLE KEYS */;
INSERT INTO `ec_product_labels` VALUES (1,'Hot','#ec2434','published','2022-07-25 08:35:29','2022-07-25 08:35:29'),(2,'New','#00c9a7','published','2022-07-25 08:35:29','2022-07-25 08:35:29'),(3,'Sale','#fe9931','published','2022-07-25 08:35:29','2022-07-25 08:35:29');
/*!40000 ALTER TABLE `ec_product_labels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_labels_translations`
--

DROP TABLE IF EXISTS `ec_product_labels_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_labels_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_product_labels_id` int NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ec_product_labels_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_labels_translations`
--

LOCK TABLES `ec_product_labels_translations` WRITE;
/*!40000 ALTER TABLE `ec_product_labels_translations` DISABLE KEYS */;
INSERT INTO `ec_product_labels_translations` VALUES ('vi',1,'Nổi bật',NULL),('vi',2,'Mới',NULL),('vi',3,'Giảm giá',NULL);
/*!40000 ALTER TABLE `ec_product_labels_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_related_relations`
--

DROP TABLE IF EXISTS `ec_product_related_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_related_relations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `from_product_id` int unsigned NOT NULL,
  `to_product_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ec_product_related_relations_from_product_id_index` (`from_product_id`),
  KEY `ec_product_related_relations_to_product_id_index` (`to_product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_related_relations`
--

LOCK TABLES `ec_product_related_relations` WRITE;
/*!40000 ALTER TABLE `ec_product_related_relations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_product_related_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_tag_product`
--

DROP TABLE IF EXISTS `ec_product_tag_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_tag_product` (
  `product_id` int unsigned NOT NULL,
  `tag_id` int unsigned NOT NULL,
  PRIMARY KEY (`product_id`,`tag_id`),
  KEY `ec_product_tag_product_product_id_index` (`product_id`),
  KEY `ec_product_tag_product_tag_id_index` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_tag_product`
--

LOCK TABLES `ec_product_tag_product` WRITE;
/*!40000 ALTER TABLE `ec_product_tag_product` DISABLE KEYS */;
INSERT INTO `ec_product_tag_product` VALUES (1,2),(1,5),(2,1),(2,6),(3,5),(4,1),(4,3),(4,6),(5,2),(5,3),(5,6),(6,2),(6,3),(6,4),(7,2),(7,6),(8,2),(8,4),(8,5),(9,1),(9,2),(9,5),(10,1),(10,2),(10,6),(11,4),(11,5),(11,6),(12,4),(12,6),(13,4),(13,6),(14,5),(14,6),(15,1),(15,6),(16,2),(16,5),(17,1),(17,2),(17,3),(18,3),(18,4),(19,1),(19,4),(20,4),(20,6),(21,1),(21,4),(21,5),(22,2),(22,3),(22,6),(23,1),(23,6);
/*!40000 ALTER TABLE `ec_product_tag_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_tags`
--

DROP TABLE IF EXISTS `ec_product_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_tags` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_tags`
--

LOCK TABLES `ec_product_tags` WRITE;
/*!40000 ALTER TABLE `ec_product_tags` DISABLE KEYS */;
INSERT INTO `ec_product_tags` VALUES (1,'Electronic',NULL,'published','2022-07-25 08:36:09','2022-07-25 08:36:09'),(2,'Mobile',NULL,'published','2022-07-25 08:36:09','2022-07-25 08:36:09'),(3,'Iphone',NULL,'published','2022-07-25 08:36:09','2022-07-25 08:36:09'),(4,'Printer',NULL,'published','2022-07-25 08:36:09','2022-07-25 08:36:09'),(5,'Office',NULL,'published','2022-07-25 08:36:09','2022-07-25 08:36:09'),(6,'IT',NULL,'published','2022-07-25 08:36:09','2022-07-25 08:36:09');
/*!40000 ALTER TABLE `ec_product_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_tags_translations`
--

DROP TABLE IF EXISTS `ec_product_tags_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_tags_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_product_tags_id` int NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ec_product_tags_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_tags_translations`
--

LOCK TABLES `ec_product_tags_translations` WRITE;
/*!40000 ALTER TABLE `ec_product_tags_translations` DISABLE KEYS */;
INSERT INTO `ec_product_tags_translations` VALUES ('vi',1,'Electronic'),('vi',2,'Mobile'),('vi',3,'Iphone'),('vi',4,'Printer'),('vi',5,'Office'),('vi',6,'IT');
/*!40000 ALTER TABLE `ec_product_tags_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_up_sale_relations`
--

DROP TABLE IF EXISTS `ec_product_up_sale_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_up_sale_relations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `from_product_id` int unsigned NOT NULL,
  `to_product_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ec_product_up_sale_relations_from_product_id_index` (`from_product_id`),
  KEY `ec_product_up_sale_relations_to_product_id_index` (`to_product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_up_sale_relations`
--

LOCK TABLES `ec_product_up_sale_relations` WRITE;
/*!40000 ALTER TABLE `ec_product_up_sale_relations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_product_up_sale_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_variation_items`
--

DROP TABLE IF EXISTS `ec_product_variation_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_variation_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `attribute_id` int unsigned NOT NULL,
  `variation_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ec_product_variation_items_attribute_id_variation_id_index` (`attribute_id`,`variation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_variation_items`
--

LOCK TABLES `ec_product_variation_items` WRITE;
/*!40000 ALTER TABLE `ec_product_variation_items` DISABLE KEYS */;
INSERT INTO `ec_product_variation_items` VALUES (7,1,4),(11,1,6),(41,1,21),(53,1,27),(55,1,28),(67,1,34),(69,1,35),(75,1,38),(97,1,49),(1,2,1),(9,2,5),(13,2,7),(23,2,12),(25,2,13),(37,2,19),(45,2,23),(51,2,26),(57,2,29),(81,2,41),(83,2,42),(95,2,48),(103,2,52),(107,2,54),(35,3,18),(43,3,22),(49,3,25),(61,3,31),(63,3,32),(71,3,36),(99,3,50),(5,4,3),(17,4,9),(21,4,11),(27,4,14),(33,4,17),(39,4,20),(59,4,30),(77,4,39),(79,4,40),(87,4,44),(89,4,45),(93,4,47),(101,4,51),(105,4,53),(3,5,2),(15,5,8),(19,5,10),(29,5,15),(31,5,16),(47,5,24),(65,5,33),(73,5,37),(85,5,43),(91,5,46),(20,6,10),(38,6,19),(50,6,25),(64,6,32),(70,6,35),(78,6,39),(92,6,46),(96,6,48),(98,6,49),(2,7,1),(8,7,4),(28,7,14),(34,7,17),(44,7,22),(62,7,31),(66,7,33),(68,7,34),(90,7,45),(100,7,50),(4,8,2),(10,8,5),(12,8,6),(14,8,7),(16,8,8),(24,8,12),(26,8,13),(88,8,44),(104,8,52),(18,9,9),(22,9,11),(30,9,15),(40,9,20),(46,9,23),(52,9,26),(72,9,36),(80,9,40),(82,9,41),(84,9,42),(6,10,3),(32,10,16),(36,10,18),(42,10,21),(48,10,24),(54,10,27),(56,10,28),(58,10,29),(60,10,30),(74,10,37),(76,10,38),(86,10,43),(94,10,47),(102,10,51),(106,10,53),(108,10,54);
/*!40000 ALTER TABLE `ec_product_variation_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_variations`
--

DROP TABLE IF EXISTS `ec_product_variations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_variations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int unsigned DEFAULT NULL,
  `configurable_product_id` int unsigned NOT NULL,
  `is_default` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ec_product_variations_product_id_configurable_product_id_index` (`product_id`,`configurable_product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_variations`
--

LOCK TABLES `ec_product_variations` WRITE;
/*!40000 ALTER TABLE `ec_product_variations` DISABLE KEYS */;
INSERT INTO `ec_product_variations` VALUES (1,24,1,1),(2,25,1,0),(3,26,1,0),(4,27,2,1),(5,28,3,1),(6,29,3,0),(7,30,4,1),(8,31,5,1),(9,32,5,0),(10,33,6,1),(11,34,6,0),(12,35,7,1),(13,36,7,0),(14,37,7,0),(15,38,7,0),(16,39,7,0),(17,40,8,1),(18,41,8,0),(19,42,9,1),(20,43,9,0),(21,44,10,1),(22,45,11,1),(23,46,11,0),(24,47,12,1),(25,48,12,0),(26,49,13,1),(27,50,13,0),(28,51,13,0),(29,52,14,1),(30,53,14,0),(31,54,15,1),(32,55,15,0),(33,56,16,1),(34,57,16,0),(35,58,16,0),(36,59,17,1),(37,60,17,0),(38,61,17,0),(39,62,18,1),(40,63,18,0),(41,64,18,0),(42,65,19,1),(43,66,19,0),(44,67,19,0),(45,68,19,0),(46,69,20,1),(47,70,20,0),(48,71,21,1),(49,72,22,1),(50,73,22,0),(51,74,22,0),(52,75,23,1),(53,76,23,0),(54,77,23,0);
/*!40000 ALTER TABLE `ec_product_variations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_with_attribute_set`
--

DROP TABLE IF EXISTS `ec_product_with_attribute_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_with_attribute_set` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `attribute_set_id` int unsigned NOT NULL,
  `product_id` int unsigned NOT NULL,
  `order` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_with_attribute_set`
--

LOCK TABLES `ec_product_with_attribute_set` WRITE;
/*!40000 ALTER TABLE `ec_product_with_attribute_set` DISABLE KEYS */;
INSERT INTO `ec_product_with_attribute_set` VALUES (1,1,1,0),(2,2,1,0),(3,1,2,0),(4,2,2,0),(5,1,3,0),(6,2,3,0),(7,1,4,0),(8,2,4,0),(9,1,5,0),(10,2,5,0),(11,1,6,0),(12,2,6,0),(13,1,7,0),(14,2,7,0),(15,1,8,0),(16,2,8,0),(17,1,9,0),(18,2,9,0),(19,1,10,0),(20,2,10,0),(21,1,11,0),(22,2,11,0),(23,1,12,0),(24,2,12,0),(25,1,13,0),(26,2,13,0),(27,1,14,0),(28,2,14,0),(29,1,15,0),(30,2,15,0),(31,1,16,0),(32,2,16,0),(33,1,17,0),(34,2,17,0),(35,1,18,0),(36,2,18,0),(37,1,19,0),(38,2,19,0),(39,1,20,0),(40,2,20,0),(41,1,21,0),(42,2,21,0),(43,1,22,0),(44,2,22,0),(45,1,23,0),(46,2,23,0);
/*!40000 ALTER TABLE `ec_product_with_attribute_set` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_products`
--

DROP TABLE IF EXISTS `ec_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `images` text COLLATE utf8mb4_unicode_ci,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int unsigned NOT NULL DEFAULT '0',
  `quantity` int unsigned DEFAULT NULL,
  `allow_checkout_when_out_of_stock` tinyint unsigned NOT NULL DEFAULT '0',
  `with_storehouse_management` tinyint unsigned NOT NULL DEFAULT '0',
  `is_featured` tinyint unsigned NOT NULL DEFAULT '0',
  `brand_id` int unsigned DEFAULT NULL,
  `is_variation` tinyint NOT NULL DEFAULT '0',
  `sale_type` tinyint NOT NULL DEFAULT '0',
  `price` double unsigned DEFAULT NULL,
  `sale_price` double unsigned DEFAULT NULL,
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `length` double(8,2) DEFAULT NULL,
  `wide` double(8,2) DEFAULT NULL,
  `height` double(8,2) DEFAULT NULL,
  `weight` double(8,2) DEFAULT NULL,
  `tax_id` int unsigned DEFAULT NULL,
  `views` bigint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `stock_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'in_stock',
  `store_id` int unsigned DEFAULT NULL,
  `created_by_id` int DEFAULT '0',
  `created_by_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `approved_by` int DEFAULT '0',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ec_products_brand_id_status_is_variation_created_at_index` (`brand_id`,`status`,`is_variation`,`created_at`),
  KEY `ec_products_sale_type_index` (`sale_type`),
  KEY `ec_products_start_date_index` (`start_date`),
  KEY `ec_products_end_date_index` (`end_date`),
  KEY `ec_products_sale_price_index` (`sale_price`),
  KEY `ec_products_is_variation_index` (`is_variation`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_products`
--

LOCK TABLES `ec_products` WRITE;
/*!40000 ALTER TABLE `ec_products` DISABLE KEYS */;
INSERT INTO `ec_products` VALUES (1,'Dual Camera 20MP','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/1.jpg\"]','SW-171-A0',0,19,0,1,1,5,0,0,80.25,NULL,NULL,NULL,19.00,17.00,18.00,558.00,1,37712,'2022-07-25 08:35:50','2022-07-25 08:36:42','in_stock',2,0,'Botble\\ACL\\Models\\User',0,NULL),(2,'Smart Watches','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/2.jpg\",\"products\\/2-1.jpg\",\"products\\/2-2.jpg\",\"products\\/2-3.jpg\"]','SW-136-A0',0,11,0,1,1,5,0,0,40.5,NULL,NULL,NULL,19.00,12.00,11.00,645.00,1,10292,'2022-07-25 08:35:50','2022-07-25 08:36:42','in_stock',5,0,'Botble\\ACL\\Models\\User',0,NULL),(3,'Beat Headphone','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/3.jpg\"]','SW-111-A0',0,17,0,1,1,1,0,0,20,NULL,NULL,NULL,19.00,19.00,10.00,520.00,1,38700,'2022-07-25 08:35:50','2022-07-25 08:36:42','in_stock',1,0,'Botble\\ACL\\Models\\User',0,NULL),(4,'Red & Black Headphone','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/4.jpg\",\"products\\/4-1.jpg\",\"products\\/4-2.jpg\",\"products\\/4-3.jpg\"]','SW-121-A0',0,11,0,1,1,5,0,0,552,419.52,NULL,NULL,17.00,15.00,20.00,894.00,1,21062,'2022-07-25 08:35:51','2022-07-25 08:36:42','in_stock',2,0,'Botble\\ACL\\Models\\User',0,NULL),(5,'Smart Watch External','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/5.jpg\",\"products\\/5-1.jpg\",\"products\\/5-2.jpg\",\"products\\/5-3.jpg\"]','SW-148-A0',0,12,0,1,1,6,0,0,870,NULL,NULL,NULL,19.00,15.00,13.00,504.00,1,127665,'2022-07-25 08:35:51','2022-07-25 08:36:42','in_stock',1,0,'Botble\\ACL\\Models\\User',0,NULL),(6,'Nikon HD camera','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/6.jpg\"]','SW-190-A0',0,13,0,1,1,1,0,0,480,NULL,NULL,NULL,16.00,12.00,15.00,712.00,1,81976,'2022-07-25 08:35:51','2022-07-25 08:36:42','in_stock',5,0,'Botble\\ACL\\Models\\User',0,NULL),(7,'Audio Equipment','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/7.jpg\"]','SW-134-A0',0,16,0,1,1,2,0,0,541,NULL,NULL,NULL,19.00,12.00,17.00,510.00,1,183635,'2022-07-25 08:35:51','2022-07-25 08:36:42','in_stock',1,0,'Botble\\ACL\\Models\\User',0,NULL),(8,'Smart Televisions','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/8.jpg\",\"products\\/8-1.jpg\",\"products\\/8-2.jpg\",\"products\\/8-3.jpg\"]','SW-187-A0',0,20,0,1,1,1,0,0,1153,807.1,NULL,NULL,16.00,11.00,14.00,527.00,1,3433,'2022-07-25 08:35:51','2022-07-25 08:36:42','in_stock',2,0,'Botble\\ACL\\Models\\User',0,NULL),(9,'Samsung Smart Phone','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/9.jpg\",\"products\\/9-1.jpg\",\"products\\/9-2.jpg\"]','SW-121-A0',0,16,0,1,1,1,0,0,600,NULL,NULL,NULL,10.00,14.00,13.00,663.00,1,64712,'2022-07-25 08:35:52','2022-07-25 08:36:42','in_stock',4,0,'Botble\\ACL\\Models\\User',0,NULL),(10,'Herschel Leather Duffle Bag In Brown Color','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/10.jpg\",\"products\\/10-1.jpg\",\"products\\/10-2.jpg\"]','SW-161-A0',0,15,0,1,0,5,0,0,1116,NULL,NULL,NULL,19.00,13.00,12.00,783.00,1,168170,'2022-07-25 08:35:52','2022-07-25 08:36:42','in_stock',4,0,'Botble\\ACL\\Models\\User',0,NULL),(11,'Xbox One Wireless Controller Black Color','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/11.jpg\",\"products\\/11-1.jpg\",\"products\\/11-2.jpg\",\"products\\/11-3.jpg\"]','SW-186-A0',0,16,0,1,0,3,0,0,1207,NULL,NULL,NULL,12.00,15.00,12.00,634.00,1,41800,'2022-07-25 08:35:52','2022-07-25 08:36:42','in_stock',4,0,'Botble\\ACL\\Models\\User',0,NULL),(12,'EPSION Plaster Printer','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/12.jpg\",\"products\\/12-1.jpg\",\"products\\/12-2.jpg\",\"products\\/12-3.jpg\"]','SW-176-A0',0,17,0,1,0,3,0,0,506,440.22,NULL,NULL,14.00,13.00,10.00,553.00,1,174517,'2022-07-25 08:35:52','2022-07-25 08:36:42','in_stock',3,0,'Botble\\ACL\\Models\\User',0,NULL),(13,'Sound Intone I65 Earphone White Version','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/13.jpg\",\"products\\/13-1.jpg\"]','SW-199-A0',0,16,0,1,0,3,0,0,535,NULL,NULL,NULL,15.00,16.00,13.00,725.00,1,82824,'2022-07-25 08:35:52','2022-07-25 08:36:42','in_stock',3,0,'Botble\\ACL\\Models\\User',0,NULL),(14,'B&O Play Mini Bluetooth Speaker','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/14.jpg\"]','SW-169-A0',0,17,0,1,0,1,0,0,549,NULL,NULL,NULL,12.00,11.00,20.00,889.00,1,137161,'2022-07-25 08:35:52','2022-07-25 08:36:42','in_stock',2,0,'Botble\\ACL\\Models\\User',0,NULL),(15,'Apple MacBook Air Retina 13.3-Inch Laptop','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/15.jpg\",\"products\\/15-1.jpg\"]','SW-195-A0',0,17,0,1,0,3,0,0,575,NULL,NULL,NULL,16.00,16.00,10.00,740.00,1,173950,'2022-07-25 08:35:52','2022-07-25 08:36:42','in_stock',5,0,'Botble\\ACL\\Models\\User',0,NULL),(16,'Apple MacBook Air Retina 12-Inch Laptop','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/16.jpg\"]','SW-181-A0',0,13,0,1,0,7,0,0,543,390.96,NULL,NULL,17.00,18.00,10.00,743.00,1,58842,'2022-07-25 08:35:53','2022-07-25 08:36:42','in_stock',4,0,'Botble\\ACL\\Models\\User',0,NULL),(17,'Samsung Gear VR Virtual Reality Headset','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/17.jpg\",\"products\\/17-1.jpg\",\"products\\/17-2.jpg\",\"products\\/17-3.jpg\"]','SW-195-A0',0,20,0,1,0,1,0,0,508,NULL,NULL,NULL,14.00,17.00,16.00,874.00,1,55737,'2022-07-25 08:35:53','2022-07-25 08:36:42','in_stock',4,0,'Botble\\ACL\\Models\\User',0,NULL),(18,'Aveeno Moisturizing Body Shower 450ml','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/18.jpg\",\"products\\/18-1.jpg\",\"products\\/18-2.jpg\",\"products\\/18-3.jpg\"]','SW-117-A0',0,13,0,1,0,2,0,0,1288,NULL,NULL,NULL,16.00,16.00,17.00,795.00,1,25026,'2022-07-25 08:35:53','2022-07-25 08:36:42','in_stock',5,0,'Botble\\ACL\\Models\\User',0,NULL),(19,'NYX Beauty Couton Pallete Makeup 12','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/19.jpg\",\"products\\/19-1.jpg\",\"products\\/19-2.jpg\",\"products\\/19-3.jpg\"]','SW-136-A0',0,19,0,1,0,7,0,0,1004,NULL,NULL,NULL,17.00,12.00,12.00,585.00,1,74983,'2022-07-25 08:35:53','2022-07-25 08:36:42','in_stock',4,0,'Botble\\ACL\\Models\\User',0,NULL),(20,'NYX Beauty Couton Pallete Makeup 12','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/20.jpg\",\"products\\/20-1.jpg\",\"products\\/20-2.jpg\",\"products\\/20-3.jpg\"]','SW-197-A0',0,10,0,1,0,3,0,0,799,615.23,NULL,NULL,17.00,17.00,19.00,850.00,1,198743,'2022-07-25 08:35:53','2022-07-25 08:36:43','in_stock',3,0,'Botble\\ACL\\Models\\User',0,NULL),(21,'MVMTH Classical Leather Watch In Black','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/21.jpg\",\"products\\/21-1.jpg\",\"products\\/21-2.jpg\"]','SW-135-A0',0,13,0,1,0,2,0,0,658,NULL,NULL,NULL,15.00,17.00,19.00,784.00,1,153672,'2022-07-25 08:35:53','2022-07-25 08:36:43','in_stock',5,0,'Botble\\ACL\\Models\\User',0,NULL),(22,'Baxter Care Hair Kit For Bearded Mens','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/22.jpg\",\"products\\/22-1.jpg\",\"products\\/22-2.jpg\",\"products\\/22-3.jpg\"]','SW-113-A0',0,14,0,1,0,7,0,0,421,NULL,NULL,NULL,17.00,12.00,17.00,600.00,1,79886,'2022-07-25 08:35:53','2022-07-25 08:36:43','in_stock',3,0,'Botble\\ACL\\Models\\User',0,NULL),(23,'Ciate Palemore Lipstick Bold Red Color','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/23.jpg\",\"products\\/23-1.jpg\",\"products\\/23-2.jpg\",\"products\\/23-3.jpg\"]','SW-133-A0',0,19,0,1,0,4,0,0,722,NULL,NULL,NULL,13.00,14.00,11.00,581.00,1,77125,'2022-07-25 08:35:53','2022-07-25 08:36:43','in_stock',4,0,'Botble\\ACL\\Models\\User',0,NULL),(24,'Dual Camera 20MP',NULL,NULL,'published','[\"products\\/1.jpg\"]','SW-171-A0',0,19,0,1,0,5,1,0,80.25,NULL,NULL,NULL,19.00,17.00,18.00,558.00,NULL,0,'2022-07-25 08:35:54','2022-07-25 08:36:42','in_stock',NULL,0,'Botble\\ACL\\Models\\User',0,NULL),(25,'Dual Camera 20MP',NULL,NULL,'published','[\"products\\/1.jpg\"]','SW-171-A0-A1',0,19,0,1,0,5,1,0,80.25,NULL,NULL,NULL,19.00,17.00,18.00,558.00,NULL,0,'2022-07-25 08:35:54','2022-07-25 08:36:42','in_stock',NULL,0,'Botble\\ACL\\Models\\User',0,NULL),(26,'Dual Camera 20MP',NULL,NULL,'published','[\"products\\/1.jpg\"]','SW-171-A0-A2',0,19,0,1,0,5,1,0,80.25,NULL,NULL,NULL,19.00,17.00,18.00,558.00,NULL,0,'2022-07-25 08:35:54','2022-07-25 08:36:42','in_stock',NULL,0,'Botble\\ACL\\Models\\User',0,NULL),(27,'Smart Watches',NULL,NULL,'published','[\"products\\/2.jpg\"]','SW-136-A0',0,11,0,1,0,5,1,0,40.5,NULL,NULL,NULL,19.00,12.00,11.00,645.00,NULL,0,'2022-07-25 08:35:55','2022-07-25 08:36:42','in_stock',NULL,0,'Botble\\ACL\\Models\\User',0,NULL),(28,'Beat Headphone',NULL,NULL,'published','[\"products\\/3.jpg\"]','SW-111-A0',0,17,0,1,0,1,1,0,20,NULL,NULL,NULL,19.00,19.00,10.00,520.00,NULL,0,'2022-07-25 08:35:55','2022-07-25 08:36:42','in_stock',NULL,0,'Botble\\ACL\\Models\\User',0,NULL),(29,'Beat Headphone',NULL,NULL,'published','[\"products\\/3.jpg\"]','SW-111-A0-A1',0,17,0,1,0,1,1,0,20,NULL,NULL,NULL,19.00,19.00,10.00,520.00,NULL,0,'2022-07-25 08:35:55','2022-07-25 08:36:42','in_stock',NULL,0,'Botble\\ACL\\Models\\User',0,NULL),(30,'Red & Black Headphone',NULL,NULL,'published','[\"products\\/4.jpg\"]','SW-121-A0',0,11,0,1,0,5,1,0,552,419.52,NULL,NULL,17.00,15.00,20.00,894.00,NULL,0,'2022-07-25 08:35:56','2022-07-25 08:36:42','in_stock',NULL,0,'Botble\\ACL\\Models\\User',0,NULL),(31,'Smart Watch External',NULL,NULL,'published','[\"products\\/5.jpg\"]','SW-148-A0',0,12,0,1,0,6,1,0,870,NULL,NULL,NULL,19.00,15.00,13.00,504.00,NULL,0,'2022-07-25 08:35:56','2022-07-25 08:36:42','in_stock',NULL,0,'Botble\\ACL\\Models\\User',0,NULL),(32,'Smart Watch External',NULL,NULL,'published','[\"products\\/5-1.jpg\"]','SW-148-A0-A1',0,12,0,1,0,6,1,0,870,NULL,NULL,NULL,19.00,15.00,13.00,504.00,NULL,0,'2022-07-25 08:35:56','2022-07-25 08:36:42','in_stock',NULL,0,'Botble\\ACL\\Models\\User',0,NULL),(33,'Nikon HD camera',NULL,NULL,'published','[\"products\\/6.jpg\"]','SW-190-A0',0,13,0,1,0,1,1,0,480,NULL,NULL,NULL,16.00,12.00,15.00,712.00,NULL,0,'2022-07-25 08:35:56','2022-07-25 08:36:42','in_stock',NULL,0,'Botble\\ACL\\Models\\User',0,NULL),(34,'Nikon HD camera',NULL,NULL,'published','[\"products\\/6.jpg\"]','SW-190-A0-A1',0,13,0,1,0,1,1,0,480,NULL,NULL,NULL,16.00,12.00,15.00,712.00,NULL,0,'2022-07-25 08:35:57','2022-07-25 08:36:42','in_stock',NULL,0,'Botble\\ACL\\Models\\User',0,NULL),(35,'Audio Equipment',NULL,NULL,'published','[\"products\\/7.jpg\"]','SW-134-A0',0,16,0,1,0,2,1,0,541,NULL,NULL,NULL,19.00,12.00,17.00,510.00,NULL,0,'2022-07-25 08:35:57','2022-07-25 08:36:42','in_stock',NULL,0,'Botble\\ACL\\Models\\User',0,NULL),(36,'Audio Equipment',NULL,NULL,'published','[\"products\\/7.jpg\"]','SW-134-A0-A1',0,16,0,1,0,2,1,0,541,NULL,NULL,NULL,19.00,12.00,17.00,510.00,NULL,0,'2022-07-25 08:35:57','2022-07-25 08:36:42','in_stock',NULL,0,'Botble\\ACL\\Models\\User',0,NULL),(37,'Audio Equipment',NULL,NULL,'published','[\"products\\/7.jpg\"]','SW-134-A0-A2',0,16,0,1,0,2,1,0,541,NULL,NULL,NULL,19.00,12.00,17.00,510.00,NULL,0,'2022-07-25 08:35:57','2022-07-25 08:36:42','in_stock',NULL,0,'Botble\\ACL\\Models\\User',0,NULL),(38,'Audio Equipment',NULL,NULL,'published','[\"products\\/7.jpg\"]','SW-134-A0-A3',0,16,0,1,0,2,1,0,541,NULL,NULL,NULL,19.00,12.00,17.00,510.00,NULL,0,'2022-07-25 08:35:57','2022-07-25 08:36:42','in_stock',NULL,0,'Botble\\ACL\\Models\\User',0,NULL),(39,'Audio Equipment',NULL,NULL,'published','[\"products\\/7.jpg\"]','SW-134-A0-A4',0,16,0,1,0,2,1,0,541,NULL,NULL,NULL,19.00,12.00,17.00,510.00,NULL,0,'2022-07-25 08:35:57','2022-07-25 08:36:42','in_stock',NULL,0,'Botble\\ACL\\Models\\User',0,NULL),(40,'Smart Televisions',NULL,NULL,'published','[\"products\\/8.jpg\"]','SW-187-A0',0,20,0,1,0,1,1,0,1153,807.1,NULL,NULL,16.00,11.00,14.00,527.00,NULL,0,'2022-07-25 08:35:57','2022-07-25 08:36:42','in_stock',NULL,0,'Botble\\ACL\\Models\\User',0,NULL),(41,'Smart Televisions',NULL,NULL,'published','[\"products\\/8-1.jpg\"]','SW-187-A0-A1',0,20,0,1,0,1,1,0,1153,853.22,NULL,NULL,16.00,11.00,14.00,527.00,NULL,0,'2022-07-25 08:35:57','2022-07-25 08:36:42','in_stock',NULL,0,'Botble\\ACL\\Models\\User',0,NULL),(42,'Samsung Smart Phone',NULL,NULL,'published','[\"products\\/9.jpg\"]','SW-121-A0',0,16,0,1,0,1,1,0,600,NULL,NULL,NULL,10.00,14.00,13.00,663.00,NULL,0,'2022-07-25 08:35:58','2022-07-25 08:36:42','in_stock',NULL,0,'Botble\\ACL\\Models\\User',0,NULL),(43,'Samsung Smart Phone',NULL,NULL,'published','[\"products\\/9-1.jpg\"]','SW-121-A0-A1',0,16,0,1,0,1,1,0,600,NULL,NULL,NULL,10.00,14.00,13.00,663.00,NULL,0,'2022-07-25 08:35:58','2022-07-25 08:36:42','in_stock',NULL,0,'Botble\\ACL\\Models\\User',0,NULL),(44,'Herschel Leather Duffle Bag In Brown Color',NULL,NULL,'published','[\"products\\/10.jpg\"]','SW-161-A0',0,15,0,1,0,5,1,0,1116,NULL,NULL,NULL,19.00,13.00,12.00,783.00,NULL,0,'2022-07-25 08:35:58','2022-07-25 08:36:42','in_stock',NULL,0,'Botble\\ACL\\Models\\User',0,NULL),(45,'Xbox One Wireless Controller Black Color',NULL,NULL,'published','[\"products\\/11.jpg\"]','SW-186-A0',0,16,0,1,0,3,1,0,1207,NULL,NULL,NULL,12.00,15.00,12.00,634.00,NULL,0,'2022-07-25 08:35:58','2022-07-25 08:36:42','in_stock',NULL,0,'Botble\\ACL\\Models\\User',0,NULL),(46,'Xbox One Wireless Controller Black Color',NULL,NULL,'published','[\"products\\/11-1.jpg\"]','SW-186-A0-A1',0,16,0,1,0,3,1,0,1207,NULL,NULL,NULL,12.00,15.00,12.00,634.00,NULL,0,'2022-07-25 08:35:58','2022-07-25 08:36:42','in_stock',NULL,0,'Botble\\ACL\\Models\\User',0,NULL),(47,'EPSION Plaster Printer',NULL,NULL,'published','[\"products\\/12.jpg\"]','SW-176-A0',0,17,0,1,0,3,1,0,506,440.22,NULL,NULL,14.00,13.00,10.00,553.00,NULL,0,'2022-07-25 08:35:59','2022-07-25 08:36:42','in_stock',NULL,0,'Botble\\ACL\\Models\\User',0,NULL),(48,'EPSION Plaster Printer',NULL,NULL,'published','[\"products\\/12-1.jpg\"]','SW-176-A0-A1',0,17,0,1,0,3,1,0,506,379.5,NULL,NULL,14.00,13.00,10.00,553.00,NULL,0,'2022-07-25 08:35:59','2022-07-25 08:36:42','in_stock',NULL,0,'Botble\\ACL\\Models\\User',0,NULL),(49,'Sound Intone I65 Earphone White Version',NULL,NULL,'published','[\"products\\/13.jpg\"]','SW-199-A0',0,16,0,1,0,3,1,0,535,NULL,NULL,NULL,15.00,16.00,13.00,725.00,NULL,0,'2022-07-25 08:35:59','2022-07-25 08:36:42','in_stock',NULL,0,'Botble\\ACL\\Models\\User',0,NULL),(50,'Sound Intone I65 Earphone White Version',NULL,NULL,'published','[\"products\\/13-1.jpg\"]','SW-199-A0-A1',0,16,0,1,0,3,1,0,535,NULL,NULL,NULL,15.00,16.00,13.00,725.00,NULL,0,'2022-07-25 08:35:59','2022-07-25 08:36:42','in_stock',NULL,0,'Botble\\ACL\\Models\\User',0,NULL),(51,'Sound Intone I65 Earphone White Version',NULL,NULL,'published','[\"products\\/13.jpg\"]','SW-199-A0-A2',0,16,0,1,0,3,1,0,535,NULL,NULL,NULL,15.00,16.00,13.00,725.00,NULL,0,'2022-07-25 08:35:59','2022-07-25 08:36:42','in_stock',NULL,0,'Botble\\ACL\\Models\\User',0,NULL),(52,'B&O Play Mini Bluetooth Speaker',NULL,NULL,'published','[\"products\\/14.jpg\"]','SW-169-A0',0,17,0,1,0,1,1,0,549,NULL,NULL,NULL,12.00,11.00,20.00,889.00,NULL,0,'2022-07-25 08:35:59','2022-07-25 08:36:42','in_stock',NULL,0,'Botble\\ACL\\Models\\User',0,NULL),(53,'B&O Play Mini Bluetooth Speaker',NULL,NULL,'published','[\"products\\/14.jpg\"]','SW-169-A0-A1',0,17,0,1,0,1,1,0,549,NULL,NULL,NULL,12.00,11.00,20.00,889.00,NULL,0,'2022-07-25 08:35:59','2022-07-25 08:36:42','in_stock',NULL,0,'Botble\\ACL\\Models\\User',0,NULL),(54,'Apple MacBook Air Retina 13.3-Inch Laptop',NULL,NULL,'published','[\"products\\/15.jpg\"]','SW-195-A0',0,17,0,1,0,3,1,0,575,NULL,NULL,NULL,16.00,16.00,10.00,740.00,NULL,0,'2022-07-25 08:35:59','2022-07-25 08:36:42','in_stock',NULL,0,'Botble\\ACL\\Models\\User',0,NULL),(55,'Apple MacBook Air Retina 13.3-Inch Laptop',NULL,NULL,'published','[\"products\\/15-1.jpg\"]','SW-195-A0-A1',0,17,0,1,0,3,1,0,575,NULL,NULL,NULL,16.00,16.00,10.00,740.00,NULL,0,'2022-07-25 08:35:59','2022-07-25 08:36:42','in_stock',NULL,0,'Botble\\ACL\\Models\\User',0,NULL),(56,'Apple MacBook Air Retina 12-Inch Laptop',NULL,NULL,'published','[\"products\\/16.jpg\"]','SW-181-A0',0,13,0,1,0,7,1,0,543,390.96,NULL,NULL,17.00,18.00,10.00,743.00,NULL,0,'2022-07-25 08:35:59','2022-07-25 08:36:42','in_stock',NULL,0,'Botble\\ACL\\Models\\User',0,NULL),(57,'Apple MacBook Air Retina 12-Inch Laptop',NULL,NULL,'published','[\"products\\/16.jpg\"]','SW-181-A0-A1',0,13,0,1,0,7,1,0,543,434.4,NULL,NULL,17.00,18.00,10.00,743.00,NULL,0,'2022-07-25 08:35:59','2022-07-25 08:36:42','in_stock',NULL,0,'Botble\\ACL\\Models\\User',0,NULL),(58,'Apple MacBook Air Retina 12-Inch Laptop',NULL,NULL,'published','[\"products\\/16.jpg\"]','SW-181-A0-A2',0,13,0,1,0,7,1,0,543,477.84,NULL,NULL,17.00,18.00,10.00,743.00,NULL,0,'2022-07-25 08:35:59','2022-07-25 08:36:42','in_stock',NULL,0,'Botble\\ACL\\Models\\User',0,NULL),(59,'Samsung Gear VR Virtual Reality Headset',NULL,NULL,'published','[\"products\\/17.jpg\"]','SW-195-A0',0,20,0,1,0,1,1,0,508,NULL,NULL,NULL,14.00,17.00,16.00,874.00,NULL,0,'2022-07-25 08:35:59','2022-07-25 08:36:42','in_stock',NULL,0,'Botble\\ACL\\Models\\User',0,NULL),(60,'Samsung Gear VR Virtual Reality Headset',NULL,NULL,'published','[\"products\\/17-1.jpg\"]','SW-195-A0-A1',0,20,0,1,0,1,1,0,508,NULL,NULL,NULL,14.00,17.00,16.00,874.00,NULL,0,'2022-07-25 08:35:59','2022-07-25 08:36:42','in_stock',NULL,0,'Botble\\ACL\\Models\\User',0,NULL),(61,'Samsung Gear VR Virtual Reality Headset',NULL,NULL,'published','[\"products\\/17-2.jpg\"]','SW-195-A0-A2',0,20,0,1,0,1,1,0,508,NULL,NULL,NULL,14.00,17.00,16.00,874.00,NULL,0,'2022-07-25 08:35:59','2022-07-25 08:36:42','in_stock',NULL,0,'Botble\\ACL\\Models\\User',0,NULL),(62,'Aveeno Moisturizing Body Shower 450ml',NULL,NULL,'published','[\"products\\/18.jpg\"]','SW-117-A0',0,13,0,1,0,2,1,0,1288,NULL,NULL,NULL,16.00,16.00,17.00,795.00,NULL,0,'2022-07-25 08:35:59','2022-07-25 08:36:42','in_stock',NULL,0,'Botble\\ACL\\Models\\User',0,NULL),(63,'Aveeno Moisturizing Body Shower 450ml',NULL,NULL,'published','[\"products\\/18-1.jpg\"]','SW-117-A0-A1',0,13,0,1,0,2,1,0,1288,NULL,NULL,NULL,16.00,16.00,17.00,795.00,NULL,0,'2022-07-25 08:35:59','2022-07-25 08:36:42','in_stock',NULL,0,'Botble\\ACL\\Models\\User',0,NULL),(64,'Aveeno Moisturizing Body Shower 450ml',NULL,NULL,'published','[\"products\\/18-2.jpg\"]','SW-117-A0-A2',0,13,0,1,0,2,1,0,1288,NULL,NULL,NULL,16.00,16.00,17.00,795.00,NULL,0,'2022-07-25 08:35:59','2022-07-25 08:36:42','in_stock',NULL,0,'Botble\\ACL\\Models\\User',0,NULL),(65,'NYX Beauty Couton Pallete Makeup 12',NULL,NULL,'published','[\"products\\/19.jpg\"]','SW-136-A0',0,19,0,1,0,7,1,0,1004,NULL,NULL,NULL,17.00,12.00,12.00,585.00,NULL,0,'2022-07-25 08:35:59','2022-07-25 08:36:43','in_stock',NULL,0,'Botble\\ACL\\Models\\User',0,NULL),(66,'NYX Beauty Couton Pallete Makeup 12',NULL,NULL,'published','[\"products\\/19-1.jpg\"]','SW-136-A0-A1',0,19,0,1,0,7,1,0,1004,NULL,NULL,NULL,17.00,12.00,12.00,585.00,NULL,0,'2022-07-25 08:35:59','2022-07-25 08:36:43','in_stock',NULL,0,'Botble\\ACL\\Models\\User',0,NULL),(67,'NYX Beauty Couton Pallete Makeup 12',NULL,NULL,'published','[\"products\\/19-2.jpg\"]','SW-136-A0-A2',0,19,0,1,0,7,1,0,1004,NULL,NULL,NULL,17.00,12.00,12.00,585.00,NULL,0,'2022-07-25 08:35:59','2022-07-25 08:36:43','in_stock',NULL,0,'Botble\\ACL\\Models\\User',0,NULL),(68,'NYX Beauty Couton Pallete Makeup 12',NULL,NULL,'published','[\"products\\/19-3.jpg\"]','SW-136-A0-A3',0,19,0,1,0,7,1,0,1004,NULL,NULL,NULL,17.00,12.00,12.00,585.00,NULL,0,'2022-07-25 08:35:59','2022-07-25 08:36:43','in_stock',NULL,0,'Botble\\ACL\\Models\\User',0,NULL),(69,'NYX Beauty Couton Pallete Makeup 12',NULL,NULL,'published','[\"products\\/20.jpg\"]','SW-197-A0',0,10,0,1,0,3,1,0,799,615.23,NULL,NULL,17.00,17.00,19.00,850.00,NULL,0,'2022-07-25 08:35:59','2022-07-25 08:36:43','in_stock',NULL,0,'Botble\\ACL\\Models\\User',0,NULL),(70,'NYX Beauty Couton Pallete Makeup 12',NULL,NULL,'published','[\"products\\/20-1.jpg\"]','SW-197-A0-A1',0,10,0,1,0,3,1,0,799,671.16,NULL,NULL,17.00,17.00,19.00,850.00,NULL,0,'2022-07-25 08:35:59','2022-07-25 08:36:43','in_stock',NULL,0,'Botble\\ACL\\Models\\User',0,NULL),(71,'MVMTH Classical Leather Watch In Black',NULL,NULL,'published','[\"products\\/21.jpg\"]','SW-135-A0',0,13,0,1,0,2,1,0,658,NULL,NULL,NULL,15.00,17.00,19.00,784.00,NULL,0,'2022-07-25 08:36:00','2022-07-25 08:36:43','in_stock',NULL,0,'Botble\\ACL\\Models\\User',0,NULL),(72,'Baxter Care Hair Kit For Bearded Mens',NULL,NULL,'published','[\"products\\/22.jpg\"]','SW-113-A0',0,14,0,1,0,7,1,0,421,NULL,NULL,NULL,17.00,12.00,17.00,600.00,NULL,0,'2022-07-25 08:36:00','2022-07-25 08:36:43','in_stock',NULL,0,'Botble\\ACL\\Models\\User',0,NULL),(73,'Baxter Care Hair Kit For Bearded Mens',NULL,NULL,'published','[\"products\\/22-1.jpg\"]','SW-113-A0-A1',0,14,0,1,0,7,1,0,421,NULL,NULL,NULL,17.00,12.00,17.00,600.00,NULL,0,'2022-07-25 08:36:00','2022-07-25 08:36:43','in_stock',NULL,0,'Botble\\ACL\\Models\\User',0,NULL),(74,'Baxter Care Hair Kit For Bearded Mens',NULL,NULL,'published','[\"products\\/22-2.jpg\"]','SW-113-A0-A2',0,14,0,1,0,7,1,0,421,NULL,NULL,NULL,17.00,12.00,17.00,600.00,NULL,0,'2022-07-25 08:36:00','2022-07-25 08:36:43','in_stock',NULL,0,'Botble\\ACL\\Models\\User',0,NULL),(75,'Ciate Palemore Lipstick Bold Red Color',NULL,NULL,'published','[\"products\\/23.jpg\"]','SW-133-A0',0,19,0,1,0,4,1,0,722,NULL,NULL,NULL,13.00,14.00,11.00,581.00,NULL,0,'2022-07-25 08:36:00','2022-07-25 08:36:43','in_stock',NULL,0,'Botble\\ACL\\Models\\User',0,NULL),(76,'Ciate Palemore Lipstick Bold Red Color',NULL,NULL,'published','[\"products\\/23-1.jpg\"]','SW-133-A0-A1',0,19,0,1,0,4,1,0,722,NULL,NULL,NULL,13.00,14.00,11.00,581.00,NULL,0,'2022-07-25 08:36:00','2022-07-25 08:36:43','in_stock',NULL,0,'Botble\\ACL\\Models\\User',0,NULL),(77,'Ciate Palemore Lipstick Bold Red Color',NULL,NULL,'published','[\"products\\/23-2.jpg\"]','SW-133-A0-A2',0,19,0,1,0,4,1,0,722,NULL,NULL,NULL,13.00,14.00,11.00,581.00,NULL,0,'2022-07-25 08:36:00','2022-07-25 08:36:43','in_stock',NULL,0,'Botble\\ACL\\Models\\User',0,NULL);
/*!40000 ALTER TABLE `ec_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_products_translations`
--

DROP TABLE IF EXISTS `ec_products_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_products_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_products_id` int NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `content` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`ec_products_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_products_translations`
--

LOCK TABLES `ec_products_translations` WRITE;
/*!40000 ALTER TABLE `ec_products_translations` DISABLE KEYS */;
INSERT INTO `ec_products_translations` VALUES ('vi',1,'Dual Camera 20MP',NULL,NULL),('vi',2,'Smart Watches',NULL,NULL),('vi',3,'Beat Headphone',NULL,NULL),('vi',4,'Red & Black Headphone',NULL,NULL),('vi',5,'Smart Watch External',NULL,NULL),('vi',6,'Nikon HD camera',NULL,NULL),('vi',7,'Audio Equipment',NULL,NULL),('vi',8,'Smart Televisions',NULL,NULL),('vi',9,'Samsung Smart Phone',NULL,NULL),('vi',10,'Herschel Leather Duffle Bag In Brown Color',NULL,NULL),('vi',11,'Xbox One Wireless Controller Black Color',NULL,NULL),('vi',12,'EPSION Plaster Printer',NULL,NULL),('vi',13,'Sound Intone I65 Earphone White Version',NULL,NULL),('vi',14,'B&O Play Mini Bluetooth Speaker',NULL,NULL),('vi',15,'Apple MacBook Air Retina 13.3-Inch Laptop',NULL,NULL),('vi',16,'Apple MacBook Air Retina 12-Inch Laptop',NULL,NULL),('vi',17,'Samsung Gear VR Virtual Reality Headset',NULL,NULL),('vi',18,'Aveeno Moisturizing Body Shower 450ml',NULL,NULL),('vi',19,'NYX Beauty Couton Pallete Makeup 12',NULL,NULL),('vi',20,'NYX Beauty Couton Pallete Makeup 12',NULL,NULL),('vi',21,'MVMTH Classical Leather Watch In Black',NULL,NULL),('vi',22,'Baxter Care Hair Kit For Bearded Mens',NULL,NULL),('vi',23,'Ciate Palemore Lipstick Bold Red Color',NULL,NULL),('vi',24,'Dual Camera 20MP',NULL,NULL),('vi',25,'Dual Camera 20MP',NULL,NULL),('vi',26,'Dual Camera 20MP',NULL,NULL),('vi',27,'Smart Watches',NULL,NULL),('vi',28,'Beat Headphone',NULL,NULL),('vi',29,'Beat Headphone',NULL,NULL),('vi',30,'Red & Black Headphone',NULL,NULL),('vi',31,'Smart Watch External',NULL,NULL),('vi',32,'Smart Watch External',NULL,NULL),('vi',33,'Nikon HD camera',NULL,NULL),('vi',34,'Nikon HD camera',NULL,NULL),('vi',35,'Audio Equipment',NULL,NULL),('vi',36,'Audio Equipment',NULL,NULL),('vi',37,'Audio Equipment',NULL,NULL),('vi',38,'Audio Equipment',NULL,NULL),('vi',39,'Audio Equipment',NULL,NULL),('vi',40,'Smart Televisions',NULL,NULL),('vi',41,'Smart Televisions',NULL,NULL),('vi',42,'Samsung Smart Phone',NULL,NULL),('vi',43,'Samsung Smart Phone',NULL,NULL),('vi',44,'Herschel Leather Duffle Bag In Brown Color',NULL,NULL),('vi',45,'Xbox One Wireless Controller Black Color',NULL,NULL),('vi',46,'Xbox One Wireless Controller Black Color',NULL,NULL),('vi',47,'EPSION Plaster Printer',NULL,NULL),('vi',48,'EPSION Plaster Printer',NULL,NULL),('vi',49,'Sound Intone I65 Earphone White Version',NULL,NULL),('vi',50,'Sound Intone I65 Earphone White Version',NULL,NULL),('vi',51,'Sound Intone I65 Earphone White Version',NULL,NULL),('vi',52,'B&O Play Mini Bluetooth Speaker',NULL,NULL),('vi',53,'B&O Play Mini Bluetooth Speaker',NULL,NULL),('vi',54,'Apple MacBook Air Retina 13.3-Inch Laptop',NULL,NULL),('vi',55,'Apple MacBook Air Retina 13.3-Inch Laptop',NULL,NULL),('vi',56,'Apple MacBook Air Retina 12-Inch Laptop',NULL,NULL),('vi',57,'Apple MacBook Air Retina 12-Inch Laptop',NULL,NULL),('vi',58,'Apple MacBook Air Retina 12-Inch Laptop',NULL,NULL),('vi',59,'Samsung Gear VR Virtual Reality Headset',NULL,NULL),('vi',60,'Samsung Gear VR Virtual Reality Headset',NULL,NULL),('vi',61,'Samsung Gear VR Virtual Reality Headset',NULL,NULL),('vi',62,'Aveeno Moisturizing Body Shower 450ml',NULL,NULL),('vi',63,'Aveeno Moisturizing Body Shower 450ml',NULL,NULL),('vi',64,'Aveeno Moisturizing Body Shower 450ml',NULL,NULL),('vi',65,'NYX Beauty Couton Pallete Makeup 12',NULL,NULL),('vi',66,'NYX Beauty Couton Pallete Makeup 12',NULL,NULL),('vi',67,'NYX Beauty Couton Pallete Makeup 12',NULL,NULL),('vi',68,'NYX Beauty Couton Pallete Makeup 12',NULL,NULL),('vi',69,'NYX Beauty Couton Pallete Makeup 12',NULL,NULL),('vi',70,'NYX Beauty Couton Pallete Makeup 12',NULL,NULL),('vi',71,'MVMTH Classical Leather Watch In Black',NULL,NULL),('vi',72,'Baxter Care Hair Kit For Bearded Mens',NULL,NULL),('vi',73,'Baxter Care Hair Kit For Bearded Mens',NULL,NULL),('vi',74,'Baxter Care Hair Kit For Bearded Mens',NULL,NULL),('vi',75,'Ciate Palemore Lipstick Bold Red Color',NULL,NULL),('vi',76,'Ciate Palemore Lipstick Bold Red Color',NULL,NULL),('vi',77,'Ciate Palemore Lipstick Bold Red Color',NULL,NULL);
/*!40000 ALTER TABLE `ec_products_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_reviews`
--

DROP TABLE IF EXISTS `ec_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_reviews` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int unsigned NOT NULL,
  `product_id` int unsigned NOT NULL,
  `star` double(8,2) NOT NULL,
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `images` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `ec_reviews_product_id_customer_id_status_created_at_index` (`product_id`,`customer_id`,`status`,`created_at`),
  KEY `ec_reviews_product_id_customer_id_status_index` (`product_id`,`customer_id`,`status`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_reviews`
--

LOCK TABLES `ec_reviews` WRITE;
/*!40000 ALTER TABLE `ec_reviews` DISABLE KEYS */;
INSERT INTO `ec_reviews` VALUES (1,6,16,5.00,'The script is the best of its class, fast, easy to implement and work with , and the most important thing is the great support team , Recommend with no doubt.','published','2022-07-25 08:36:08','2022-07-25 08:36:08','[\"products\\/1.jpg\",\"products\\/6.jpg\"]'),(2,10,19,1.00,'It\'s not my first experience here on Codecanyon and I can honestly tell you all that Botble puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at Botble are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you Botble :)','published','2022-07-25 08:36:08','2022-07-25 08:36:08','[\"products\\/3.jpg\",\"products\\/6.jpg\",\"products\\/11.jpg\"]'),(3,3,11,4.00,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','2022-07-25 08:36:08','2022-07-25 08:36:08','[\"products\\/4.jpg\",\"products\\/7.jpg\"]'),(4,6,3,4.00,'Customer Support are grade (A*), however the code is a way too over engineered for it\'s purpose.','published','2022-07-25 08:36:08','2022-07-25 08:36:08','[\"products\\/4.jpg\",\"products\\/5.jpg\"]'),(5,6,15,3.00,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','2022-07-25 08:36:08','2022-07-25 08:36:08','[\"products\\/2.jpg\"]'),(6,2,11,3.00,'Perfect +++++++++ i love it really also i get to fast ticket answers... Thanks Lot BOTBLE Teams','published','2022-07-25 08:36:08','2022-07-25 08:36:08','[\"products\\/2.jpg\",\"products\\/7.jpg\"]'),(7,7,10,2.00,'Second or third time that I buy a Botble product, happy with the products and support. You guys do a good job :)','published','2022-07-25 08:36:08','2022-07-25 08:36:08','[\"products\\/1.jpg\",\"products\\/5.jpg\"]'),(8,6,11,2.00,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','2022-07-25 08:36:08','2022-07-25 08:36:08','[\"products\\/4.jpg\",\"products\\/7.jpg\"]'),(9,6,23,4.00,'Cool template. Excellent code quality. The support responds very quickly, which is very rare on themeforest and codecanyon.net, I buy a lot of templates, and everyone will have a response from technical support for two or three days. Thanks to tech support. I recommend to buy.','published','2022-07-25 08:36:08','2022-07-25 08:36:08','[\"products\\/3.jpg\",\"products\\/5.jpg\",\"products\\/16.jpg\"]'),(10,7,17,4.00,'The script is the best of its class, fast, easy to implement and work with , and the most important thing is the great support team , Recommend with no doubt.','published','2022-07-25 08:36:08','2022-07-25 08:36:08','[\"products\\/2.jpg\"]'),(11,10,21,2.00,'Clean & perfect source code','published','2022-07-25 08:36:08','2022-07-25 08:36:08','[\"products\\/1.jpg\",\"products\\/6.jpg\"]'),(12,2,17,3.00,'Clean & perfect source code','published','2022-07-25 08:36:08','2022-07-25 08:36:08','[\"products\\/3.jpg\",\"products\\/13.jpg\"]'),(13,6,2,4.00,'Second or third time that I buy a Botble product, happy with the products and support. You guys do a good job :)','published','2022-07-25 08:36:08','2022-07-25 08:36:08','[\"products\\/3.jpg\",\"products\\/21.jpg\"]'),(14,6,8,2.00,'Good app, good backup service and support. Good documentation.','published','2022-07-25 08:36:08','2022-07-25 08:36:08','[\"products\\/1.jpg\",\"products\\/5.jpg\"]'),(15,1,1,5.00,'Great system, great support, good job Botble. I\'m looking forward to more great functional plugins.','published','2022-07-25 08:36:08','2022-07-25 08:36:08','[\"products\\/2.jpg\",\"products\\/6.jpg\",\"products\\/19.jpg\"]'),(16,2,22,3.00,'Best ecommerce CMS online store!','published','2022-07-25 08:36:08','2022-07-25 08:36:08','[\"products\\/2.jpg\",\"products\\/5.jpg\",\"products\\/21.jpg\"]'),(17,9,22,4.00,'These guys are amazing! Responses immediately, amazing support and help... I immediately feel at ease after Purchasing..','published','2022-07-25 08:36:08','2022-07-25 08:36:08','[\"products\\/4.jpg\",\"products\\/6.jpg\"]'),(18,7,1,5.00,'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.','published','2022-07-25 08:36:08','2022-07-25 08:36:08','[\"products\\/3.jpg\",\"products\\/11.jpg\"]'),(19,8,22,1.00,'These guys are amazing! Responses immediately, amazing support and help... I immediately feel at ease after Purchasing..','published','2022-07-25 08:36:08','2022-07-25 08:36:08','[\"products\\/2.jpg\",\"products\\/7.jpg\"]'),(20,9,11,3.00,'Second or third time that I buy a Botble product, happy with the products and support. You guys do a good job :)','published','2022-07-25 08:36:08','2022-07-25 08:36:08','[\"products\\/2.jpg\",\"products\\/7.jpg\"]'),(21,8,7,5.00,'Great system, great support, good job Botble. I\'m looking forward to more great functional plugins.','published','2022-07-25 08:36:08','2022-07-25 08:36:08','[\"products\\/2.jpg\"]'),(22,6,2,4.00,'Great E-commerce system. And much more : Wonderful Customer Support.','published','2022-07-25 08:36:08','2022-07-25 08:36:08','[\"products\\/1.jpg\",\"products\\/9.jpg\"]'),(23,7,2,5.00,'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.','published','2022-07-25 08:36:08','2022-07-25 08:36:08','[\"products\\/3.jpg\",\"products\\/6.jpg\"]'),(24,3,14,3.00,'Great system, great support, good job Botble. I\'m looking forward to more great functional plugins.','published','2022-07-25 08:36:08','2022-07-25 08:36:08','[\"products\\/4.jpg\",\"products\\/5.jpg\",\"products\\/9.jpg\"]'),(25,7,1,3.00,'Best ecommerce CMS online store!','published','2022-07-25 08:36:08','2022-07-25 08:36:08','[\"products\\/2.jpg\",\"products\\/5.jpg\"]'),(26,7,5,4.00,'Good app, good backup service and support. Good documentation.','published','2022-07-25 08:36:08','2022-07-25 08:36:08','[\"products\\/4.jpg\",\"products\\/6.jpg\"]'),(27,5,20,4.00,'Perfect +++++++++ i love it really also i get to fast ticket answers... Thanks Lot BOTBLE Teams','published','2022-07-25 08:36:08','2022-07-25 08:36:08','[\"products\\/3.jpg\",\"products\\/20.jpg\"]'),(28,9,23,2.00,'Amazing code, amazing support. Overall, im really confident in Botble and im happy I made the right choice! Thank you so much guys for coding this masterpiece','published','2022-07-25 08:36:08','2022-07-25 08:36:08','[\"products\\/1.jpg\",\"products\\/7.jpg\"]'),(29,1,18,4.00,'Cool template. Excellent code quality. The support responds very quickly, which is very rare on themeforest and codecanyon.net, I buy a lot of templates, and everyone will have a response from technical support for two or three days. Thanks to tech support. I recommend to buy.','published','2022-07-25 08:36:08','2022-07-25 08:36:08','[\"products\\/2.jpg\",\"products\\/7.jpg\"]'),(30,1,13,5.00,'Good app, good backup service and support. Good documentation.','published','2022-07-25 08:36:08','2022-07-25 08:36:08','[\"products\\/1.jpg\",\"products\\/5.jpg\",\"products\\/10.jpg\"]'),(31,9,4,5.00,'Good app, good backup service and support. Good documentation.','published','2022-07-25 08:36:08','2022-07-25 08:36:08','[\"products\\/1.jpg\",\"products\\/6.jpg\"]'),(32,5,4,1.00,'Second or third time that I buy a Botble product, happy with the products and support. You guys do a good job :)','published','2022-07-25 08:36:08','2022-07-25 08:36:08','[\"products\\/3.jpg\",\"products\\/5.jpg\"]'),(33,2,11,2.00,'Cool template. Excellent code quality. The support responds very quickly, which is very rare on themeforest and codecanyon.net, I buy a lot of templates, and everyone will have a response from technical support for two or three days. Thanks to tech support. I recommend to buy.','published','2022-07-25 08:36:08','2022-07-25 08:36:08','[\"products\\/1.jpg\",\"products\\/7.jpg\"]'),(34,3,8,3.00,'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the Botble Fans.','published','2022-07-25 08:36:08','2022-07-25 08:36:08','[\"products\\/2.jpg\",\"products\\/21.jpg\"]'),(35,3,4,5.00,'Those guys now what they are doing, the release such a good product that it\'s a pleasure to work with ! Even when I was stuck on the project, I created a ticket and the next day it was replied by the team. GOOD JOB guys. I love working with them :)','published','2022-07-25 08:36:08','2022-07-25 08:36:08','[\"products\\/2.jpg\",\"products\\/7.jpg\"]'),(36,10,11,5.00,'Those guys now what they are doing, the release such a good product that it\'s a pleasure to work with ! Even when I was stuck on the project, I created a ticket and the next day it was replied by the team. GOOD JOB guys. I love working with them :)','published','2022-07-25 08:36:08','2022-07-25 08:36:08','[\"products\\/3.jpg\",\"products\\/5.jpg\"]'),(37,10,22,4.00,'The best store template! Excellent coding! Very good support! Thank you so much for all the help, I really appreciated.','published','2022-07-25 08:36:08','2022-07-25 08:36:08','[\"products\\/2.jpg\",\"products\\/5.jpg\"]'),(38,7,10,2.00,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','2022-07-25 08:36:08','2022-07-25 08:36:08','[\"products\\/4.jpg\",\"products\\/6.jpg\"]'),(39,4,15,1.00,'This web app is really good in design, code quality & features. Besides, the customer support provided by the Botble team was really fast & helpful. You guys are awesome!','published','2022-07-25 08:36:08','2022-07-25 08:36:08','[\"products\\/2.jpg\",\"products\\/5.jpg\",\"products\\/8.jpg\"]'),(40,8,2,3.00,'Solution is too robust for our purpose so we didn\'t use it at the end. But I appreciate customer support during initial configuration.','published','2022-07-25 08:36:08','2022-07-25 08:36:08','[\"products\\/2.jpg\"]'),(41,5,13,1.00,'The best store template! Excellent coding! Very good support! Thank you so much for all the help, I really appreciated.','published','2022-07-25 08:36:09','2022-07-25 08:36:09','[\"products\\/2.jpg\",\"products\\/6.jpg\",\"products\\/17.jpg\"]'),(42,2,11,4.00,'We have received brilliant service support and will be expanding the features with the developer. Nice product!','published','2022-07-25 08:36:09','2022-07-25 08:36:09','[\"products\\/1.jpg\",\"products\\/7.jpg\"]'),(43,7,20,4.00,'Best ecommerce CMS online store!','published','2022-07-25 08:36:09','2022-07-25 08:36:09','[\"products\\/2.jpg\"]'),(44,4,4,3.00,'It\'s not my first experience here on Codecanyon and I can honestly tell you all that Botble puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at Botble are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you Botble :)','published','2022-07-25 08:36:09','2022-07-25 08:36:09','[\"products\\/4.jpg\",\"products\\/6.jpg\"]'),(45,10,6,5.00,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','2022-07-25 08:36:09','2022-07-25 08:36:09','[\"products\\/3.jpg\",\"products\\/19.jpg\"]'),(46,4,22,3.00,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','2022-07-25 08:36:09','2022-07-25 08:36:09','[\"products\\/4.jpg\",\"products\\/6.jpg\"]'),(47,6,21,2.00,'This web app is really good in design, code quality & features. Besides, the customer support provided by the Botble team was really fast & helpful. You guys are awesome!','published','2022-07-25 08:36:09','2022-07-25 08:36:09','[\"products\\/1.jpg\"]'),(48,5,21,1.00,'Solution is too robust for our purpose so we didn\'t use it at the end. But I appreciate customer support during initial configuration.','published','2022-07-25 08:36:09','2022-07-25 08:36:09','[\"products\\/1.jpg\",\"products\\/5.jpg\"]'),(49,6,20,3.00,'The code is good, in general, if you like it, can you give it 5 stars?','published','2022-07-25 08:36:09','2022-07-25 08:36:09','[\"products\\/2.jpg\",\"products\\/7.jpg\"]'),(50,1,14,5.00,'It\'s not my first experience here on Codecanyon and I can honestly tell you all that Botble puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at Botble are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you Botble :)','published','2022-07-25 08:36:09','2022-07-25 08:36:09','[\"products\\/2.jpg\",\"products\\/5.jpg\",\"products\\/13.jpg\"]'),(51,2,17,4.00,'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the Botble Fans.','published','2022-07-25 08:36:09','2022-07-25 08:36:09','[\"products\\/4.jpg\",\"products\\/5.jpg\"]'),(52,6,4,1.00,'Those guys now what they are doing, the release such a good product that it\'s a pleasure to work with ! Even when I was stuck on the project, I created a ticket and the next day it was replied by the team. GOOD JOB guys. I love working with them :)','published','2022-07-25 08:36:09','2022-07-25 08:36:09','[\"products\\/3.jpg\",\"products\\/6.jpg\",\"products\\/21.jpg\"]'),(53,2,2,5.00,'The script is the best of its class, fast, easy to implement and work with , and the most important thing is the great support team , Recommend with no doubt.','published','2022-07-25 08:36:09','2022-07-25 08:36:09','[\"products\\/2.jpg\",\"products\\/6.jpg\"]'),(54,9,19,3.00,'Clean & perfect source code','published','2022-07-25 08:36:09','2022-07-25 08:36:09','[\"products\\/4.jpg\",\"products\\/23.jpg\"]'),(55,8,10,5.00,'We have received brilliant service support and will be expanding the features with the developer. Nice product!','published','2022-07-25 08:36:09','2022-07-25 08:36:09','[\"products\\/2.jpg\"]'),(56,7,20,3.00,'Amazing code, amazing support. Overall, im really confident in Botble and im happy I made the right choice! Thank you so much guys for coding this masterpiece','published','2022-07-25 08:36:09','2022-07-25 08:36:09','[\"products\\/2.jpg\",\"products\\/7.jpg\"]'),(57,5,19,4.00,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','2022-07-25 08:36:09','2022-07-25 08:36:09','[\"products\\/2.jpg\",\"products\\/22.jpg\"]'),(58,8,21,2.00,'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.','published','2022-07-25 08:36:09','2022-07-25 08:36:09','[\"products\\/3.jpg\",\"products\\/6.jpg\"]'),(59,4,15,3.00,'Great E-commerce system. And much more : Wonderful Customer Support.','published','2022-07-25 08:36:09','2022-07-25 08:36:09','[\"products\\/4.jpg\",\"products\\/6.jpg\"]'),(60,7,8,3.00,'These guys are amazing! Responses immediately, amazing support and help... I immediately feel at ease after Purchasing..','published','2022-07-25 08:36:09','2022-07-25 08:36:09','[\"products\\/1.jpg\",\"products\\/21.jpg\"]'),(61,7,15,5.00,'Those guys now what they are doing, the release such a good product that it\'s a pleasure to work with ! Even when I was stuck on the project, I created a ticket and the next day it was replied by the team. GOOD JOB guys. I love working with them :)','published','2022-07-25 08:36:09','2022-07-25 08:36:09','[\"products\\/1.jpg\",\"products\\/6.jpg\",\"products\\/17.jpg\"]'),(62,10,8,1.00,'Amazing code, amazing support. Overall, im really confident in Botble and im happy I made the right choice! Thank you so much guys for coding this masterpiece','published','2022-07-25 08:36:09','2022-07-25 08:36:09','[\"products\\/3.jpg\",\"products\\/22.jpg\"]'),(63,5,10,5.00,'Good app, good backup service and support. Good documentation.','published','2022-07-25 08:36:09','2022-07-25 08:36:09','[\"products\\/2.jpg\"]'),(64,2,10,5.00,'Clean & perfect source code','published','2022-07-25 08:36:09','2022-07-25 08:36:09','[\"products\\/2.jpg\",\"products\\/6.jpg\"]'),(65,9,4,1.00,'Solution is too robust for our purpose so we didn\'t use it at the end. But I appreciate customer support during initial configuration.','published','2022-07-25 08:36:09','2022-07-25 08:36:09','[\"products\\/3.jpg\"]'),(66,3,18,2.00,'Perfect +++++++++ i love it really also i get to fast ticket answers... Thanks Lot BOTBLE Teams','published','2022-07-25 08:36:09','2022-07-25 08:36:09','[\"products\\/3.jpg\",\"products\\/13.jpg\"]'),(67,4,21,1.00,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','2022-07-25 08:36:09','2022-07-25 08:36:09','[\"products\\/4.jpg\",\"products\\/5.jpg\"]'),(68,6,8,2.00,'Perfect +++++++++ i love it really also i get to fast ticket answers... Thanks Lot BOTBLE Teams','published','2022-07-25 08:36:09','2022-07-25 08:36:09','[\"products\\/4.jpg\"]'),(69,8,18,2.00,'Amazing code, amazing support. Overall, im really confident in Botble and im happy I made the right choice! Thank you so much guys for coding this masterpiece','published','2022-07-25 08:36:09','2022-07-25 08:36:09','[\"products\\/4.jpg\",\"products\\/6.jpg\"]'),(70,10,21,4.00,'Great system, great support, good job Botble. I\'m looking forward to more great functional plugins.','published','2022-07-25 08:36:09','2022-07-25 08:36:09','[\"products\\/1.jpg\"]'),(71,3,7,3.00,'Cool template. Excellent code quality. The support responds very quickly, which is very rare on themeforest and codecanyon.net, I buy a lot of templates, and everyone will have a response from technical support for two or three days. Thanks to tech support. I recommend to buy.','published','2022-07-25 08:36:09','2022-07-25 08:36:09','[\"products\\/1.jpg\",\"products\\/5.jpg\",\"products\\/13.jpg\"]'),(72,1,16,5.00,'The best ecommerce CMS! Excellent coding! best support service! Thank you so much..... I really like your hard work.','published','2022-07-25 08:36:09','2022-07-25 08:36:09','[\"products\\/1.jpg\",\"products\\/6.jpg\"]'),(73,3,4,4.00,'Perfect +++++++++ i love it really also i get to fast ticket answers... Thanks Lot BOTBLE Teams','published','2022-07-25 08:36:09','2022-07-25 08:36:09','[\"products\\/2.jpg\"]'),(74,9,20,3.00,'Best ecommerce CMS online store!','published','2022-07-25 08:36:09','2022-07-25 08:36:09','[\"products\\/4.jpg\",\"products\\/6.jpg\",\"products\\/12.jpg\"]'),(75,9,6,5.00,'These guys are amazing! Responses immediately, amazing support and help... I immediately feel at ease after Purchasing..','published','2022-07-25 08:36:09','2022-07-25 08:36:09','[\"products\\/4.jpg\",\"products\\/7.jpg\"]'),(76,4,15,1.00,'Cool template. Excellent code quality. The support responds very quickly, which is very rare on themeforest and codecanyon.net, I buy a lot of templates, and everyone will have a response from technical support for two or three days. Thanks to tech support. I recommend to buy.','published','2022-07-25 08:36:09','2022-07-25 08:36:09','[\"products\\/3.jpg\",\"products\\/6.jpg\"]'),(77,8,15,5.00,'Great E-commerce system. And much more : Wonderful Customer Support.','published','2022-07-25 08:36:09','2022-07-25 08:36:09','[\"products\\/4.jpg\",\"products\\/5.jpg\"]'),(78,5,3,2.00,'It\'s not my first experience here on Codecanyon and I can honestly tell you all that Botble puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at Botble are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you Botble :)','published','2022-07-25 08:36:09','2022-07-25 08:36:09','[\"products\\/4.jpg\",\"products\\/7.jpg\"]'),(79,5,5,2.00,'The best ecommerce CMS! Excellent coding! best support service! Thank you so much..... I really like your hard work.','published','2022-07-25 08:36:09','2022-07-25 08:36:09','[\"products\\/4.jpg\",\"products\\/14.jpg\"]'),(80,4,22,3.00,'Customer Support are grade (A*), however the code is a way too over engineered for it\'s purpose.','published','2022-07-25 08:36:09','2022-07-25 08:36:09','[\"products\\/1.jpg\",\"products\\/6.jpg\"]'),(81,10,10,2.00,'Cool template. Excellent code quality. The support responds very quickly, which is very rare on themeforest and codecanyon.net, I buy a lot of templates, and everyone will have a response from technical support for two or three days. Thanks to tech support. I recommend to buy.','published','2022-07-25 08:36:09','2022-07-25 08:36:09','[\"products\\/4.jpg\"]'),(82,1,22,4.00,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','2022-07-25 08:36:09','2022-07-25 08:36:09','[\"products\\/1.jpg\",\"products\\/6.jpg\",\"products\\/16.jpg\"]'),(83,5,21,2.00,'These guys are amazing! Responses immediately, amazing support and help... I immediately feel at ease after Purchasing..','published','2022-07-25 08:36:09','2022-07-25 08:36:09','[\"products\\/2.jpg\",\"products\\/7.jpg\"]'),(84,1,15,2.00,'Best ecommerce CMS online store!','published','2022-07-25 08:36:09','2022-07-25 08:36:09','[\"products\\/2.jpg\",\"products\\/6.jpg\",\"products\\/10.jpg\"]'),(85,3,12,2.00,'The script is the best of its class, fast, easy to implement and work with , and the most important thing is the great support team , Recommend with no doubt.','published','2022-07-25 08:36:09','2022-07-25 08:36:09','[\"products\\/1.jpg\",\"products\\/6.jpg\"]'),(86,1,13,1.00,'Cool template. Excellent code quality. The support responds very quickly, which is very rare on themeforest and codecanyon.net, I buy a lot of templates, and everyone will have a response from technical support for two or three days. Thanks to tech support. I recommend to buy.','published','2022-07-25 08:36:09','2022-07-25 08:36:09','[\"products\\/3.jpg\",\"products\\/6.jpg\"]'),(87,3,7,2.00,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','2022-07-25 08:36:09','2022-07-25 08:36:09','[\"products\\/4.jpg\"]'),(88,7,3,5.00,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','2022-07-25 08:36:09','2022-07-25 08:36:09','[\"products\\/4.jpg\"]'),(89,4,9,4.00,'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the Botble Fans.','published','2022-07-25 08:36:09','2022-07-25 08:36:09','[\"products\\/1.jpg\",\"products\\/7.jpg\"]'),(90,8,7,2.00,'Great E-commerce system. And much more : Wonderful Customer Support.','published','2022-07-25 08:36:09','2022-07-25 08:36:09','[\"products\\/4.jpg\",\"products\\/5.jpg\"]'),(91,5,6,2.00,'Second or third time that I buy a Botble product, happy with the products and support. You guys do a good job :)','published','2022-07-25 08:36:09','2022-07-25 08:36:09','[\"products\\/2.jpg\"]'),(92,9,6,3.00,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','2022-07-25 08:36:09','2022-07-25 08:36:09','[\"products\\/2.jpg\",\"products\\/6.jpg\"]'),(93,7,5,4.00,'These guys are amazing! Responses immediately, amazing support and help... I immediately feel at ease after Purchasing..','published','2022-07-25 08:36:09','2022-07-25 08:36:09','[\"products\\/2.jpg\",\"products\\/7.jpg\"]'),(94,9,2,5.00,'These guys are amazing! Responses immediately, amazing support and help... I immediately feel at ease after Purchasing..','published','2022-07-25 08:36:09','2022-07-25 08:36:09','[\"products\\/3.jpg\",\"products\\/17.jpg\"]'),(95,6,14,4.00,'Amazing code, amazing support. Overall, im really confident in Botble and im happy I made the right choice! Thank you so much guys for coding this masterpiece','published','2022-07-25 08:36:09','2022-07-25 08:36:09','[\"products\\/3.jpg\",\"products\\/7.jpg\",\"products\\/21.jpg\"]'),(96,2,9,5.00,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','2022-07-25 08:36:09','2022-07-25 08:36:09','[\"products\\/4.jpg\",\"products\\/7.jpg\"]'),(97,5,22,3.00,'It\'s not my first experience here on Codecanyon and I can honestly tell you all that Botble puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at Botble are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you Botble :)','published','2022-07-25 08:36:09','2022-07-25 08:36:09','[\"products\\/2.jpg\"]'),(98,2,13,5.00,'Best ecommerce CMS online store!','published','2022-07-25 08:36:09','2022-07-25 08:36:09','[\"products\\/4.jpg\",\"products\\/5.jpg\"]'),(99,10,19,1.00,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','2022-07-25 08:36:09','2022-07-25 08:36:09','[\"products\\/1.jpg\",\"products\\/5.jpg\"]'),(100,3,8,4.00,'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.','published','2022-07-25 08:36:09','2022-07-25 08:36:09','[\"products\\/4.jpg\",\"products\\/5.jpg\"]');
/*!40000 ALTER TABLE `ec_reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_shipment_histories`
--

DROP TABLE IF EXISTS `ec_shipment_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_shipment_histories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `action` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int unsigned DEFAULT NULL,
  `shipment_id` int unsigned NOT NULL,
  `order_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_shipment_histories`
--

LOCK TABLES `ec_shipment_histories` WRITE;
/*!40000 ALTER TABLE `ec_shipment_histories` DISABLE KEYS */;
INSERT INTO `ec_shipment_histories` VALUES (1,'create_from_order','Shipping was created from order %order_id%',0,1,1,'2022-07-13 16:36:44','2022-07-13 16:36:44'),(2,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,1,1,'2022-07-23 16:36:44','2022-07-25 08:36:44'),(3,'create_from_order','Shipping was created from order %order_id%',0,2,2,'2022-07-20 08:36:44','2022-07-20 08:36:44'),(4,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,2,2,'2022-07-23 16:36:44','2022-07-25 08:36:44'),(5,'create_from_order','Shipping was created from order %order_id%',0,3,3,'2022-07-17 00:36:44','2022-07-17 00:36:44'),(6,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,3,3,'2022-07-23 16:36:45','2022-07-25 08:36:45'),(7,'create_from_order','Shipping was created from order %order_id%',0,4,4,'2022-07-15 20:36:45','2022-07-15 20:36:45'),(8,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,4,4,'2022-07-23 18:36:45','2022-07-25 08:36:45'),(9,'create_from_order','Shipping was created from order %order_id%',0,5,5,'2022-07-15 20:36:45','2022-07-15 20:36:45'),(10,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,5,5,'2022-07-23 18:36:45','2022-07-25 08:36:45'),(11,'create_from_order','Shipping was created from order %order_id%',0,6,6,'2022-07-19 08:36:45','2022-07-19 08:36:45'),(12,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,6,6,'2022-07-23 20:36:45','2022-07-25 08:36:45'),(13,'create_from_order','Shipping was created from order %order_id%',0,7,7,'2022-07-14 20:36:45','2022-07-14 20:36:45'),(14,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,7,7,'2022-07-23 20:36:45','2022-07-25 08:36:45'),(15,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,7,7,'2022-07-25 08:36:45','2022-07-25 08:36:45'),(16,'create_from_order','Shipping was created from order %order_id%',0,8,8,'2022-07-12 14:36:45','2022-07-12 14:36:45'),(17,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,8,8,'2022-07-23 22:36:45','2022-07-25 08:36:45'),(18,'update_cod_status','Updated COD status to Completed . Updated by: %user_name%',0,8,8,'2022-07-25 08:36:45','2022-07-25 08:36:45'),(19,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,8,8,'2022-07-25 08:36:45','2022-07-25 08:36:45'),(20,'create_from_order','Shipping was created from order %order_id%',0,9,9,'2022-07-22 12:36:46','2022-07-22 12:36:46'),(21,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,9,9,'2022-07-23 22:36:46','2022-07-25 08:36:46'),(22,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,9,9,'2022-07-25 08:36:46','2022-07-25 08:36:46'),(23,'create_from_order','Shipping was created from order %order_id%',0,10,10,'2022-07-12 00:36:46','2022-07-12 00:36:46'),(24,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,10,10,'2022-07-24 00:36:46','2022-07-25 08:36:46'),(25,'create_from_order','Shipping was created from order %order_id%',0,11,11,'2022-07-12 00:36:46','2022-07-12 00:36:46'),(26,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,11,11,'2022-07-24 00:36:46','2022-07-25 08:36:46'),(27,'create_from_order','Shipping was created from order %order_id%',0,12,12,'2022-07-17 20:36:46','2022-07-17 20:36:46'),(28,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,12,12,'2022-07-24 02:36:46','2022-07-25 08:36:46'),(29,'create_from_order','Shipping was created from order %order_id%',0,13,13,'2022-07-17 20:36:46','2022-07-17 20:36:46'),(30,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,13,13,'2022-07-24 02:36:46','2022-07-25 08:36:46'),(31,'create_from_order','Shipping was created from order %order_id%',0,14,14,'2022-07-16 14:36:46','2022-07-16 14:36:46'),(32,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,14,14,'2022-07-24 02:36:46','2022-07-25 08:36:46'),(33,'create_from_order','Shipping was created from order %order_id%',0,15,15,'2022-07-17 04:36:46','2022-07-17 04:36:46'),(34,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,15,15,'2022-07-24 04:36:47','2022-07-25 08:36:47'),(35,'create_from_order','Shipping was created from order %order_id%',0,16,16,'2022-07-18 08:36:47','2022-07-18 08:36:47'),(36,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,16,16,'2022-07-24 04:36:47','2022-07-25 08:36:47'),(37,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,16,16,'2022-07-25 08:36:47','2022-07-25 08:36:47'),(38,'create_from_order','Shipping was created from order %order_id%',0,17,17,'2022-07-21 00:36:47','2022-07-21 00:36:47'),(39,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,17,17,'2022-07-24 06:36:47','2022-07-25 08:36:47'),(40,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,17,17,'2022-07-25 08:36:47','2022-07-25 08:36:47'),(41,'create_from_order','Shipping was created from order %order_id%',0,18,18,'2022-07-15 08:36:47','2022-07-15 08:36:47'),(42,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,18,18,'2022-07-24 08:36:47','2022-07-25 08:36:47'),(43,'update_cod_status','Updated COD status to Completed . Updated by: %user_name%',0,18,18,'2022-07-25 08:36:47','2022-07-25 08:36:47'),(44,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,18,18,'2022-07-25 08:36:47','2022-07-25 08:36:47'),(45,'create_from_order','Shipping was created from order %order_id%',0,19,19,'2022-07-17 08:36:47','2022-07-17 08:36:47'),(46,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,19,19,'2022-07-24 08:36:47','2022-07-25 08:36:47'),(47,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,19,19,'2022-07-25 08:36:47','2022-07-25 08:36:47'),(48,'create_from_order','Shipping was created from order %order_id%',0,20,20,'2022-07-23 12:36:47','2022-07-23 12:36:47'),(49,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,20,20,'2022-07-24 10:36:47','2022-07-25 08:36:47'),(50,'update_cod_status','Updated COD status to Completed . Updated by: %user_name%',0,20,20,'2022-07-25 08:36:47','2022-07-25 08:36:47'),(51,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,20,20,'2022-07-25 08:36:47','2022-07-25 08:36:47'),(52,'create_from_order','Shipping was created from order %order_id%',0,21,21,'2022-07-20 18:36:47','2022-07-20 18:36:47'),(53,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,21,21,'2022-07-24 10:36:47','2022-07-25 08:36:47'),(54,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,21,21,'2022-07-25 08:36:47','2022-07-25 08:36:47'),(55,'create_from_order','Shipping was created from order %order_id%',0,22,22,'2022-07-20 18:36:47','2022-07-20 18:36:47'),(56,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,22,22,'2022-07-24 10:36:48','2022-07-25 08:36:48'),(57,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,22,22,'2022-07-25 08:36:48','2022-07-25 08:36:48'),(58,'create_from_order','Shipping was created from order %order_id%',0,23,23,'2022-07-21 04:36:48','2022-07-21 04:36:48'),(59,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,23,23,'2022-07-24 12:36:48','2022-07-25 08:36:48'),(60,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,23,23,'2022-07-25 08:36:48','2022-07-25 08:36:48'),(61,'create_from_order','Shipping was created from order %order_id%',0,24,24,'2022-07-22 00:36:48','2022-07-22 00:36:48'),(62,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,24,24,'2022-07-24 12:36:48','2022-07-25 08:36:48'),(63,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,24,24,'2022-07-25 08:36:48','2022-07-25 08:36:48'),(64,'create_from_order','Shipping was created from order %order_id%',0,25,25,'2022-07-21 14:36:48','2022-07-21 14:36:48'),(65,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,25,25,'2022-07-24 14:36:49','2022-07-25 08:36:49'),(66,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,25,25,'2022-07-25 08:36:49','2022-07-25 08:36:49'),(67,'create_from_order','Shipping was created from order %order_id%',0,26,26,'2022-07-19 08:36:49','2022-07-19 08:36:49'),(68,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,26,26,'2022-07-24 14:36:49','2022-07-25 08:36:49'),(69,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,26,26,'2022-07-25 08:36:49','2022-07-25 08:36:49'),(70,'create_from_order','Shipping was created from order %order_id%',0,27,27,'2022-07-22 08:36:49','2022-07-22 08:36:49'),(71,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,27,27,'2022-07-24 14:36:49','2022-07-25 08:36:49'),(72,'create_from_order','Shipping was created from order %order_id%',0,28,28,'2022-07-24 16:36:49','2022-07-24 16:36:49'),(73,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,28,28,'2022-07-24 16:36:49','2022-07-25 08:36:49'),(74,'create_from_order','Shipping was created from order %order_id%',0,29,29,'2022-07-18 16:36:49','2022-07-18 16:36:49'),(75,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,29,29,'2022-07-24 16:36:49','2022-07-25 08:36:49'),(76,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,29,29,'2022-07-25 08:36:49','2022-07-25 08:36:49'),(77,'create_from_order','Shipping was created from order %order_id%',0,30,30,'2022-07-24 16:36:49','2022-07-24 16:36:49'),(78,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,30,30,'2022-07-24 16:36:49','2022-07-25 08:36:49'),(79,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,30,30,'2022-07-25 08:36:49','2022-07-25 08:36:49'),(80,'create_from_order','Shipping was created from order %order_id%',0,31,31,'2022-07-19 12:36:49','2022-07-19 12:36:49'),(81,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,31,31,'2022-07-24 18:36:49','2022-07-25 08:36:49'),(82,'create_from_order','Shipping was created from order %order_id%',0,32,32,'2022-07-20 02:36:49','2022-07-20 02:36:49'),(83,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,32,32,'2022-07-24 18:36:49','2022-07-25 08:36:49'),(84,'update_cod_status','Updated COD status to Completed . Updated by: %user_name%',0,32,32,'2022-07-25 08:36:49','2022-07-25 08:36:49'),(85,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,32,32,'2022-07-25 08:36:49','2022-07-25 08:36:49'),(86,'create_from_order','Shipping was created from order %order_id%',0,33,33,'2022-07-19 12:36:49','2022-07-19 12:36:49'),(87,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,33,33,'2022-07-24 18:36:49','2022-07-25 08:36:49'),(88,'create_from_order','Shipping was created from order %order_id%',0,34,34,'2022-07-24 20:36:49','2022-07-24 20:36:49'),(89,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,34,34,'2022-07-24 20:36:49','2022-07-25 08:36:49'),(90,'create_from_order','Shipping was created from order %order_id%',0,35,35,'2022-07-21 08:36:49','2022-07-21 08:36:49'),(91,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,35,35,'2022-07-24 20:36:50','2022-07-25 08:36:50'),(92,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,35,35,'2022-07-25 08:36:50','2022-07-25 08:36:50'),(93,'create_from_order','Shipping was created from order %order_id%',0,36,36,'2022-07-23 08:36:50','2022-07-23 08:36:50'),(94,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,36,36,'2022-07-24 20:36:50','2022-07-25 08:36:50'),(95,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,36,36,'2022-07-25 08:36:50','2022-07-25 08:36:50'),(96,'create_from_order','Shipping was created from order %order_id%',0,37,37,'2022-07-22 00:36:50','2022-07-22 00:36:50'),(97,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,37,37,'2022-07-24 22:36:50','2022-07-25 08:36:50'),(98,'create_from_order','Shipping was created from order %order_id%',0,38,38,'2022-07-24 12:36:50','2022-07-24 12:36:50'),(99,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,38,38,'2022-07-24 22:36:50','2022-07-25 08:36:50'),(100,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,38,38,'2022-07-25 08:36:50','2022-07-25 08:36:50'),(101,'create_from_order','Shipping was created from order %order_id%',0,39,39,'2022-07-22 00:36:50','2022-07-22 00:36:50'),(102,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,39,39,'2022-07-25 00:36:50','2022-07-25 08:36:50'),(103,'create_from_order','Shipping was created from order %order_id%',0,40,40,'2022-07-22 08:36:50','2022-07-22 08:36:50'),(104,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,40,40,'2022-07-25 00:36:50','2022-07-25 08:36:50'),(105,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,40,40,'2022-07-25 08:36:50','2022-07-25 08:36:50'),(106,'create_from_order','Shipping was created from order %order_id%',0,41,41,'2022-07-23 08:36:50','2022-07-23 08:36:50'),(107,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,41,41,'2022-07-25 00:36:51','2022-07-25 08:36:51'),(108,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,41,41,'2022-07-25 08:36:51','2022-07-25 08:36:51'),(109,'create_from_order','Shipping was created from order %order_id%',0,42,42,'2022-07-23 16:36:51','2022-07-23 16:36:51'),(110,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,42,42,'2022-07-25 00:36:51','2022-07-25 08:36:51'),(111,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,42,42,'2022-07-25 08:36:51','2022-07-25 08:36:51'),(112,'create_from_order','Shipping was created from order %order_id%',0,43,43,'2022-07-24 14:36:51','2022-07-24 14:36:51'),(113,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,43,43,'2022-07-25 02:36:51','2022-07-25 08:36:51'),(114,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,43,43,'2022-07-25 08:36:51','2022-07-25 08:36:51'),(115,'create_from_order','Shipping was created from order %order_id%',0,44,44,'2022-07-23 08:36:51','2022-07-23 08:36:51'),(116,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,44,44,'2022-07-25 02:36:51','2022-07-25 08:36:51'),(117,'create_from_order','Shipping was created from order %order_id%',0,45,45,'2022-07-25 04:36:51','2022-07-25 04:36:51'),(118,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,45,45,'2022-07-25 04:36:51','2022-07-25 08:36:51'),(119,'create_from_order','Shipping was created from order %order_id%',0,46,46,'2022-07-24 16:36:51','2022-07-24 16:36:51'),(120,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,46,46,'2022-07-25 04:36:51','2022-07-25 08:36:51'),(121,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,46,46,'2022-07-25 08:36:51','2022-07-25 08:36:51'),(122,'create_from_order','Shipping was created from order %order_id%',0,47,47,'2022-07-24 16:36:51','2022-07-24 16:36:51'),(123,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,47,47,'2022-07-25 04:36:51','2022-07-25 08:36:51'),(124,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,47,47,'2022-07-25 08:36:51','2022-07-25 08:36:51'),(125,'create_from_order','Shipping was created from order %order_id%',0,48,48,'2022-07-24 12:36:51','2022-07-24 12:36:51'),(126,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,48,48,'2022-07-25 06:36:51','2022-07-25 08:36:51'),(127,'create_from_order','Shipping was created from order %order_id%',0,49,49,'2022-07-24 18:36:51','2022-07-24 18:36:51'),(128,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,49,49,'2022-07-25 06:36:52','2022-07-25 08:36:52'),(129,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,49,49,'2022-07-25 08:36:52','2022-07-25 08:36:52');
/*!40000 ALTER TABLE `ec_shipment_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_shipments`
--

DROP TABLE IF EXISTS `ec_shipments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_shipments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int unsigned NOT NULL,
  `user_id` int unsigned DEFAULT NULL,
  `weight` double(8,2) DEFAULT '0.00',
  `shipment_id` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `cod_amount` decimal(15,2) DEFAULT '0.00',
  `cod_status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `cross_checking_status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `price` decimal(15,2) DEFAULT '0.00',
  `store_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `tracking_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_company_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tracking_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estimate_date_shipped` datetime DEFAULT NULL,
  `date_shipped` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_shipments`
--

LOCK TABLES `ec_shipments` WRITE;
/*!40000 ALTER TABLE `ec_shipments` DISABLE KEYS */;
INSERT INTO `ec_shipments` VALUES (1,1,NULL,520.00,NULL,'','approved',0.00,'completed','pending',0.00,0,'2022-07-25 08:36:44','2022-07-25 08:36:44','JJD0065857793','AliExpress','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2022-07-31 15:36:44',NULL),(2,2,NULL,2876.00,NULL,'','approved',2120.50,'pending','pending',0.00,0,'2022-07-25 08:36:44','2022-07-25 08:36:44','JJD0040629800','GHN','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2022-08-02 15:36:44',NULL),(3,3,NULL,1989.00,NULL,'','approved',0.00,'completed','pending',0.00,0,'2022-07-25 08:36:45','2022-07-25 08:36:45','JJD0019069493','FastShipping','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2022-07-30 15:36:45',NULL),(4,4,NULL,510.00,NULL,'','approved',0.00,'completed','pending',0.00,0,'2022-07-25 08:36:45','2022-07-25 08:36:45','JJD0096549976','GHN','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2022-08-03 15:36:45',NULL),(5,5,NULL,2374.00,NULL,'','approved',0.00,'completed','pending',0.00,0,'2022-07-25 08:36:45','2022-07-25 08:36:45','JJD0085776701','AliExpress','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2022-07-29 15:36:45',NULL),(6,6,NULL,2050.00,NULL,'','approved',0.00,'completed','pending',0.00,0,'2022-07-25 08:36:45','2022-07-25 08:36:45','JJD0048097856','FastShipping','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2022-07-27 15:36:45',NULL),(7,7,NULL,1748.00,NULL,'','delivered',0.00,'completed','pending',0.00,0,'2022-07-25 08:36:45','2022-07-25 08:36:45','JJD0063334193','AliExpress','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2022-07-28 15:36:45','2022-07-25 15:36:45'),(8,8,NULL,1268.00,NULL,'','delivered',2534.70,'completed','pending',0.00,0,'2022-07-25 08:36:45','2022-07-25 08:36:45','JJD0087723994','AliExpress','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2022-07-31 15:36:45','2022-07-25 15:36:45'),(9,9,NULL,2259.00,NULL,'','delivered',0.00,'completed','pending',0.00,0,'2022-07-25 08:36:46','2022-07-25 08:36:46','JJD0031356856','FastShipping','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2022-08-01 15:36:46','2022-07-25 15:36:46'),(10,10,NULL,645.00,NULL,'','approved',0.00,'completed','pending',0.00,0,'2022-07-25 08:36:46','2022-07-25 08:36:46','JJD0036459303','DHL','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2022-07-31 15:36:46',NULL),(11,11,NULL,2622.00,NULL,'','approved',0.00,'completed','pending',0.00,0,'2022-07-25 08:36:46','2022-07-25 08:36:46','JJD001444838','GHN','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2022-08-03 15:36:46',NULL),(12,12,NULL,1674.00,NULL,'','approved',0.00,'completed','pending',0.00,0,'2022-07-25 08:36:46','2022-07-25 08:36:46','JJD0087647849','GHN','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2022-08-04 15:36:46',NULL),(13,13,NULL,1020.00,NULL,'','approved',1136.10,'pending','pending',0.00,0,'2022-07-25 08:36:46','2022-07-25 08:36:46','JJD0080461259','FastShipping','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2022-08-02 15:36:46',NULL),(14,14,NULL,663.00,NULL,'','approved',0.00,'completed','pending',0.00,0,'2022-07-25 08:36:46','2022-07-25 08:36:46','JJD0014298597','DHL','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2022-07-27 15:36:46',NULL),(15,15,NULL,1560.00,NULL,'','approved',0.00,'completed','pending',0.00,0,'2022-07-25 08:36:46','2022-07-25 08:36:46','JJD0011741516','DHL','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2022-07-28 15:36:46',NULL),(16,16,NULL,3014.00,NULL,'','delivered',0.00,'completed','pending',0.00,0,'2022-07-25 08:36:47','2022-07-25 08:36:47','JJD0059434906','AliExpress','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2022-07-26 15:36:47','2022-07-25 15:36:47'),(17,17,NULL,2918.00,NULL,'','delivered',0.00,'completed','pending',0.00,0,'2022-07-25 08:36:47','2022-07-25 08:36:47','JJD0030884843','FastShipping','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2022-08-04 15:36:47','2022-07-25 15:36:47'),(18,18,NULL,874.00,NULL,'','delivered',558.80,'completed','pending',0.00,0,'2022-07-25 08:36:47','2022-07-25 08:36:47','JJD0051638302','DHL','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2022-08-02 15:36:47','2022-07-25 15:36:47'),(19,19,NULL,1200.00,NULL,'','delivered',0.00,'completed','pending',0.00,0,'2022-07-25 08:36:47','2022-07-25 08:36:47','JJD008844085','DHL','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2022-08-03 15:36:47','2022-07-25 15:36:47'),(20,20,NULL,1054.00,NULL,'','delivered',2421.30,'completed','pending',0.00,0,'2022-07-25 08:36:47','2022-07-25 08:36:47','JJD0036868974','DHL','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2022-07-26 15:36:47','2022-07-25 15:36:47'),(21,21,NULL,1268.00,NULL,'','delivered',0.00,'completed','pending',0.00,0,'2022-07-25 08:36:47','2022-07-25 08:36:47','JJD0087321197','DHL','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2022-08-01 15:36:47','2022-07-25 15:36:47'),(22,22,NULL,850.00,NULL,'','delivered',0.00,'completed','pending',0.00,0,'2022-07-25 08:36:48','2022-07-25 08:36:48','JJD0027235786','DHL','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2022-08-04 15:36:48','2022-07-25 15:36:48'),(23,23,NULL,1512.00,NULL,'','delivered',0.00,'completed','pending',0.00,0,'2022-07-25 08:36:48','2022-07-25 08:36:48','JJD0061805760','GHN','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2022-08-01 15:36:48','2022-07-25 15:36:48'),(24,24,NULL,2050.00,NULL,'','delivered',0.00,'completed','pending',0.00,0,'2022-07-25 08:36:48','2022-07-25 08:36:48','JJD0028382084','AliExpress','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2022-07-29 15:36:48','2022-07-25 15:36:48'),(25,25,NULL,1054.00,NULL,'','delivered',0.00,'completed','pending',0.00,0,'2022-07-25 08:36:49','2022-07-25 08:36:49','JJD0092947888','DHL','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2022-08-04 15:36:48','2022-07-25 15:36:48'),(26,26,NULL,3074.00,NULL,'','delivered',0.00,'completed','pending',0.00,0,'2022-07-25 08:36:49','2022-07-25 08:36:49','JJD005771085','DHL','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2022-07-30 15:36:49','2022-07-25 15:36:49'),(27,27,NULL,1800.00,NULL,'','approved',0.00,'completed','pending',0.00,0,'2022-07-25 08:36:49','2022-07-25 08:36:49','JJD0074944459','AliExpress','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2022-08-02 15:36:49',NULL),(28,28,NULL,1524.00,NULL,'','approved',0.00,'completed','pending',0.00,0,'2022-07-25 08:36:49','2022-07-25 08:36:49','JJD0046778707','DHL','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2022-07-30 15:36:49',NULL),(29,29,NULL,527.00,NULL,'','delivered',0.00,'completed','pending',0.00,0,'2022-07-25 08:36:49','2022-07-25 08:36:49','JJD0088167449','FastShipping','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2022-08-04 15:36:49','2022-07-25 15:36:49'),(30,30,NULL,2622.00,NULL,'','delivered',0.00,'completed','pending',0.00,0,'2022-07-25 08:36:49','2022-07-25 08:36:49','JJD0011922440','GHN','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2022-07-30 15:36:49','2022-07-25 15:36:49'),(31,31,NULL,1008.00,NULL,'','approved',0.00,'completed','pending',0.00,0,'2022-07-25 08:36:49','2022-07-25 08:36:49','JJD0081832175','DHL','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2022-07-27 15:36:49',NULL),(32,32,NULL,889.00,NULL,'','delivered',603.90,'completed','pending',0.00,0,'2022-07-25 08:36:49','2022-07-25 08:36:49','JJD0047898030','GHN','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2022-07-27 15:36:49','2022-07-25 15:36:49'),(33,33,NULL,2550.00,NULL,'','approved',0.00,'completed','pending',0.00,0,'2022-07-25 08:36:49','2022-07-25 08:36:49','JJD0078074113','FastShipping','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2022-08-02 15:36:49',NULL),(34,34,NULL,558.00,NULL,'','approved',0.00,'completed','pending',0.00,0,'2022-07-25 08:36:49','2022-07-25 08:36:49','JJD0022152118','AliExpress','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2022-07-30 15:36:49',NULL),(35,35,NULL,1700.00,NULL,'','delivered',0.00,'completed','pending',0.00,0,'2022-07-25 08:36:50','2022-07-25 08:36:50','JJD0031269636','FastShipping','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2022-07-31 15:36:50','2022-07-25 15:36:50'),(36,36,NULL,1743.00,NULL,'','delivered',0.00,'completed','pending',0.00,0,'2022-07-25 08:36:50','2022-07-25 08:36:50','JJD0093550535','DHL','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2022-07-31 15:36:50','2022-07-25 15:36:50'),(37,37,NULL,1530.00,NULL,'','approved',1677.10,'pending','pending',0.00,0,'2022-07-25 08:36:50','2022-07-25 08:36:50','JJD0021690853','FastShipping','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2022-08-02 15:36:50',NULL),(38,38,NULL,725.00,NULL,'','delivered',0.00,'completed','pending',0.00,0,'2022-07-25 08:36:50','2022-07-25 08:36:50','JJD0074707994','AliExpress','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2022-08-02 15:36:50','2022-07-25 15:36:50'),(39,39,NULL,504.00,NULL,'','approved',957.00,'pending','pending',0.00,0,'2022-07-25 08:36:50','2022-07-25 08:36:50','JJD0070205003','GHN','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2022-08-01 15:36:50',NULL),(40,40,NULL,1989.00,NULL,'','delivered',0.00,'completed','pending',0.00,0,'2022-07-25 08:36:50','2022-07-25 08:36:50','JJD0040524337','FastShipping','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2022-08-01 15:36:50','2022-07-25 15:36:50'),(41,41,NULL,1778.00,NULL,'','delivered',0.00,'completed','pending',0.00,0,'2022-07-25 08:36:51','2022-07-25 08:36:51','JJD0095870187','AliExpress','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2022-08-04 15:36:51','2022-07-25 15:36:51'),(42,42,NULL,1590.00,NULL,'','delivered',0.00,'completed','pending',0.00,0,'2022-07-25 08:36:51','2022-07-25 08:36:51','JJD0099388114','DHL','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2022-07-30 15:36:51','2022-07-25 15:36:51'),(43,43,NULL,712.00,NULL,'','delivered',0.00,'completed','pending',0.00,0,'2022-07-25 08:36:51','2022-07-25 08:36:51','JJD0034040681','AliExpress','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2022-07-31 15:36:51','2022-07-25 15:36:51'),(44,44,NULL,2411.00,NULL,'','approved',0.00,'completed','pending',0.00,0,'2022-07-25 08:36:51','2022-07-25 08:36:51','JJD0079855359','DHL','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2022-08-02 15:36:51',NULL),(45,45,NULL,1530.00,NULL,'','approved',0.00,'completed','pending',0.00,0,'2022-07-25 08:36:51','2022-07-25 08:36:51','JJD0098804341','DHL','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2022-08-02 15:36:51',NULL),(46,46,NULL,1450.00,NULL,'','delivered',0.00,'completed','pending',0.00,0,'2022-07-25 08:36:51','2022-07-25 08:36:51','JJD0030728425','AliExpress','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2022-08-01 15:36:51','2022-07-25 15:36:51'),(47,47,NULL,889.00,NULL,'','delivered',0.00,'completed','pending',0.00,0,'2022-07-25 08:36:51','2022-07-25 08:36:51','JJD0024513741','DHL','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2022-08-03 15:36:51','2022-07-25 15:36:51'),(48,48,NULL,1659.00,NULL,'','approved',0.00,'completed','pending',0.00,0,'2022-07-25 08:36:51','2022-07-25 08:36:51','JJD0013924449','GHN','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2022-07-27 15:36:51',NULL),(49,49,NULL,2385.00,NULL,'','delivered',0.00,'completed','pending',0.00,0,'2022-07-25 08:36:52','2022-07-25 08:36:52','JJD0038977919','FastShipping','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2022-07-30 15:36:52','2022-07-25 15:36:52');
/*!40000 ALTER TABLE `ec_shipments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_shipping`
--

DROP TABLE IF EXISTS `ec_shipping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_shipping` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_shipping`
--

LOCK TABLES `ec_shipping` WRITE;
/*!40000 ALTER TABLE `ec_shipping` DISABLE KEYS */;
INSERT INTO `ec_shipping` VALUES (1,'All',NULL,'2022-07-25 08:36:10','2022-07-25 08:36:10');
/*!40000 ALTER TABLE `ec_shipping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_shipping_rule_items`
--

DROP TABLE IF EXISTS `ec_shipping_rule_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_shipping_rule_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `shipping_rule_id` int unsigned NOT NULL,
  `country` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adjustment_price` decimal(15,2) DEFAULT '0.00',
  `is_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_shipping_rule_items`
--

LOCK TABLES `ec_shipping_rule_items` WRITE;
/*!40000 ALTER TABLE `ec_shipping_rule_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_shipping_rule_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_shipping_rules`
--

DROP TABLE IF EXISTS `ec_shipping_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_shipping_rules` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_id` int unsigned NOT NULL,
  `type` enum('base_on_price','base_on_weight') COLLATE utf8mb4_unicode_ci DEFAULT 'base_on_price',
  `from` decimal(15,2) DEFAULT '0.00',
  `to` decimal(15,2) DEFAULT '0.00',
  `price` decimal(15,2) DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_shipping_rules`
--

LOCK TABLES `ec_shipping_rules` WRITE;
/*!40000 ALTER TABLE `ec_shipping_rules` DISABLE KEYS */;
INSERT INTO `ec_shipping_rules` VALUES (1,'Delivery',1,'base_on_price',0.00,NULL,0.00,'2022-07-25 08:36:10','2022-07-25 08:36:10');
/*!40000 ALTER TABLE `ec_shipping_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_store_locators`
--

DROP TABLE IF EXISTS `ec_store_locators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_store_locators` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_primary` tinyint(1) DEFAULT '0',
  `is_shipping_location` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_store_locators`
--

LOCK TABLES `ec_store_locators` WRITE;
/*!40000 ALTER TABLE `ec_store_locators` DISABLE KEYS */;
INSERT INTO `ec_store_locators` VALUES (1,'Martfury','sales@botble.com','1800979769','502 New Street','AU','Brighton VIC','Brighton VIC',1,1,'2022-07-25 08:36:32','2022-07-25 08:36:32');
/*!40000 ALTER TABLE `ec_store_locators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_taxes`
--

DROP TABLE IF EXISTS `ec_taxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_taxes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `percentage` double(8,6) DEFAULT NULL,
  `priority` int DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_taxes`
--

LOCK TABLES `ec_taxes` WRITE;
/*!40000 ALTER TABLE `ec_taxes` DISABLE KEYS */;
INSERT INTO `ec_taxes` VALUES (1,'VAT',10.000000,1,'published','2022-07-25 08:36:09','2022-07-25 08:36:09'),(2,'None',0.000000,2,'published','2022-07-25 08:36:09','2022-07-25 08:36:09');
/*!40000 ALTER TABLE `ec_taxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_wish_lists`
--

DROP TABLE IF EXISTS `ec_wish_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_wish_lists` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int unsigned NOT NULL,
  `product_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ec_wish_lists_product_id_customer_id_index` (`product_id`,`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_wish_lists`
--

LOCK TABLES `ec_wish_lists` WRITE;
/*!40000 ALTER TABLE `ec_wish_lists` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_wish_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faq_categories`
--

DROP TABLE IF EXISTS `faq_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faq_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faq_categories`
--

LOCK TABLES `faq_categories` WRITE;
/*!40000 ALTER TABLE `faq_categories` DISABLE KEYS */;
INSERT INTO `faq_categories` VALUES (1,'SHIPPING',0,'published','2022-07-25 08:36:31','2022-07-25 08:36:31'),(2,'PAYMENT',1,'published','2022-07-25 08:36:31','2022-07-25 08:36:31'),(3,'ORDER & RETURNS',2,'published','2022-07-25 08:36:31','2022-07-25 08:36:31');
/*!40000 ALTER TABLE `faq_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faq_categories_translations`
--

DROP TABLE IF EXISTS `faq_categories_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faq_categories_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `faq_categories_id` int NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`faq_categories_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faq_categories_translations`
--

LOCK TABLES `faq_categories_translations` WRITE;
/*!40000 ALTER TABLE `faq_categories_translations` DISABLE KEYS */;
INSERT INTO `faq_categories_translations` VALUES ('vi',1,'VẬN CHUYỂN'),('vi',2,'THANH TOÁN'),('vi',3,'ĐƠN HÀNG & HOÀN TRẢ');
/*!40000 ALTER TABLE `faq_categories_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faqs`
--

DROP TABLE IF EXISTS `faqs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faqs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `question` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int unsigned NOT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faqs`
--

LOCK TABLES `faqs` WRITE;
/*!40000 ALTER TABLE `faqs` DISABLE KEYS */;
INSERT INTO `faqs` VALUES (1,'What Shipping Methods Are Available?','Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.',1,'published','2022-07-25 08:36:31','2022-07-25 08:36:31'),(2,'Do You Ship Internationally?','Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.',1,'published','2022-07-25 08:36:31','2022-07-25 08:36:31'),(3,'How Long Will It Take To Get My Package?','Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.',1,'published','2022-07-25 08:36:31','2022-07-25 08:36:31'),(4,'What Payment Methods Are Accepted?','Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.',2,'published','2022-07-25 08:36:31','2022-07-25 08:36:31'),(5,'Is Buying On-Line Safe?','Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.',2,'published','2022-07-25 08:36:31','2022-07-25 08:36:31'),(6,'How do I place an Order?','Keytar cray slow-carb, Godard banh mi salvia pour-over. Slow-carb Odd Future seitan normcore. Master cleanse American Apparel gentrify flexitarian beard slow-carb next level. Raw denim polaroid paleo farm-to-table, put a bird on it lo-fi tattooed Wes Anderson Pinterest letterpress. Fingerstache McSweeney’s pour-over, letterpress Schlitz photo booth master cleanse bespoke hashtag chillwave gentrify.',3,'published','2022-07-25 08:36:31','2022-07-25 08:36:31'),(7,'How Can I Cancel Or Change My Order?','Plaid letterpress leggings craft beer meh ethical Pinterest. Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth.',3,'published','2022-07-25 08:36:31','2022-07-25 08:36:31'),(8,'Do I need an account to place an order?','Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY. Cray ugh 3 wolf moon fap, fashion axe irony butcher cornhole typewriter chambray VHS banjo street art.',3,'published','2022-07-25 08:36:31','2022-07-25 08:36:31'),(9,'How Do I Track My Order?','Keytar cray slow-carb, Godard banh mi salvia pour-over. Slow-carb @Odd Future seitan normcore. Master cleanse American Apparel gentrify flexitarian beard slow-carb next level.',3,'published','2022-07-25 08:36:31','2022-07-25 08:36:31'),(10,'How Can I Return a Product?','Kale chips Truffaut Williamsburg, hashtag fixie Pinterest raw denim c hambray drinking vinegar Carles street art Bushwick gastropub. Wolf Tumblr paleo church-key. Plaid food truck Echo Park YOLO bitters hella, direct trade Thundercats leggings quinoa before they sold out. You probably haven’t heard of them wayfarers authentic umami drinking vinegar Pinterest Cosby sweater, fingerstache fap High Life.',3,'published','2022-07-25 08:36:31','2022-07-25 08:36:31');
/*!40000 ALTER TABLE `faqs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faqs_translations`
--

DROP TABLE IF EXISTS `faqs_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faqs_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `faqs_id` int NOT NULL,
  `question` text COLLATE utf8mb4_unicode_ci,
  `answer` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`faqs_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faqs_translations`
--

LOCK TABLES `faqs_translations` WRITE;
/*!40000 ALTER TABLE `faqs_translations` DISABLE KEYS */;
INSERT INTO `faqs_translations` VALUES ('vi',1,'Có những phương thức vận chuyển nào?','Ex Portland Pitchfork irure ria mép. Eutra fap trước khi họ bán hết theo đúng nghĩa đen. Aliquip ugh quyền xe đạp thực sự mlkshk, rượu bia thủ công mực seitan. '),('vi',2,'Bạn có giao hàng quốc tế không?','Áo hoodie túi tote Tofu mixtape. Quần đùi jean đánh chữ Wolf quinoa, túi messenger hữu cơ freegan cray. '),('vi',3,'Mất bao lâu để nhận được gói hàng của tôi?','Bữa nửa buổi ăn sáng bằng bụng heo quay từ máy đánh chữ VHS, cà phê có nguồn gốc đơn Paleo, Wes Anderson. Khoan Pitchfork linh hoạt, theo nghĩa đen là đổ qua fap theo nghĩa đen. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray bền vững slow-carb raw denim Church-key fap chillwave Etsy. +1 bộ dụng cụ đánh máy, đậu phụ Banksy Vice của American Apparel. '),('vi',4,'Phương thức thanh toán nào được chấp nhận?','Fashion Axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Quầy ảnh Voluptate fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur ria mép. Twee chia gian hàng chụp ảnh xe bán đồ ăn sẵn, bữa tiệc trên mái áo hoodie swag keytar PBR DIY. '),('vi',5,'Mua trực tuyến có an toàn không?','Bữa tiệc nghệ thuật đích thực freegan semiotics jean shorts chia credit. Tiệc trên mái nhà Neutra Austin Brooklyn, Thundercats swag synth gian hàng ảnh 8-bit. Xà cạp letterpress kẻ sọc thủ công bia meh đạo đức Pinterest. '),('vi',6,'Làm cách nào để đặt hàng?','Keytar cray slow-carb, Godard banh mi salvia pour-over. Slow-carb Odd Định mức seitan trong tương lai. Master làm sạch American Apparel nhẹ nhàng làm sạch râu linh hoạt chậm carb cấp độ tiếp theo. Vải thô denim polaroid nhạt từ trang trại đến bàn, đặt một con chim trên đó hình xăm lo-fi Wes Anderson Pinterest letterpress. Bậc thầy gian hàng ảnh Schlitz của Fingerstache McSweeney đang làm sạch thẻ bắt đầu bằng hashtag theo yêu cầu riêng, chillwave gentrify. '),('vi',7,'Làm cách nào để tôi có thể hủy hoặc thay đổi đơn hàng của mình?','Xà cạp letterpress kẻ sọc thủ công bia meh đạo đức Pinterest. Bữa tiệc nghệ thuật đích thực freegan semiotics jean shorts chia tín. Tiệc trên mái nhà Neutra Austin ở Brooklyn, synth Thundercats có gian hàng ảnh 8-bit. '),('vi',8,'Tôi có cần tài khoản để đặt hàng không?','Thundercats làm lung lay gian hàng ảnh 8-bit. Xà cạp letterpress kẻ sọc thủ công bia meh đạo đức Pinterest. Twee chia ảnh gian hàng xe bán thức ăn làm sẵn, bữa tiệc trên mái áo hoodie swag keytar PBR DIY. Cray ugh 3 wolf moon fap, rìu thời trang mỉa mai người bán thịt máy đánh chữ chambray VHS banjo nghệ thuật đường phố. '),('vi',9,'Làm cách nào để theo dõi đơn hàng của tôi?','Keytar cray slow-carb, Godard banh mi salvia pour-over. Slow-carb @Odd Định mức seitan trong tương lai. Bậc thầy làm sạch American Apparel nhẹ nhàng làm sạch râu linh hoạt theo kiểu chậm carb cấp độ tiếp theo. '),('vi',10,'Làm cách nào để trả lại sản phẩm?','Kale chips Truffaut Williamsburg, fixie hashtag Pinterest raw denim c hambray uống giấm Carles street art Bushwick gastropub. Chìa khóa nhà thờ Wolf Tumblr. Xe tải thực phẩm kẻ sọc Echo Park YOLO cắn hella, giao dịch trực tiếp Thundercats legging quinoa trước khi bán hết. Có thể bạn chưa từng nghe nói về họ những người truyền bá vị umami đích thực uống giấm Pinterest Áo len Cosby, fingerstache fap High Life. ');
/*!40000 ALTER TABLE `faqs_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `language_meta`
--

DROP TABLE IF EXISTS `language_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `language_meta` (
  `lang_meta_id` int unsigned NOT NULL AUTO_INCREMENT,
  `lang_meta_code` text COLLATE utf8mb4_unicode_ci,
  `lang_meta_origin` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` int unsigned NOT NULL,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`lang_meta_id`),
  KEY `language_meta_reference_id_index` (`reference_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language_meta`
--

LOCK TABLES `language_meta` WRITE;
/*!40000 ALTER TABLE `language_meta` DISABLE KEYS */;
INSERT INTO `language_meta` VALUES (1,'en_US','252c3ec166209eae790ebd5d26ec329a',1,'Botble\\SimpleSlider\\Models\\SimpleSlider'),(2,'vi','252c3ec166209eae790ebd5d26ec329a',2,'Botble\\SimpleSlider\\Models\\SimpleSlider'),(3,'en_US','5c582af334c0b7be134ccb7efe4cbd9b',1,'Botble\\Menu\\Models\\MenuLocation'),(4,'en_US','c12038ea58622f3c9584c864d98b7293',1,'Botble\\Menu\\Models\\Menu'),(5,'en_US','6510f55e2eae65f048b8368e29c6fad5',2,'Botble\\Menu\\Models\\Menu'),(6,'en_US','0b8246a4ed5cf054deab742aec5ddf66',3,'Botble\\Menu\\Models\\Menu'),(7,'en_US','0c0adb19188a23ef623fe5128510bd52',4,'Botble\\Menu\\Models\\Menu'),(8,'vi','657903aa6608666f7c4982e444c71e35',2,'Botble\\Menu\\Models\\MenuLocation'),(9,'vi','c12038ea58622f3c9584c864d98b7293',5,'Botble\\Menu\\Models\\Menu'),(10,'vi','6510f55e2eae65f048b8368e29c6fad5',6,'Botble\\Menu\\Models\\Menu'),(11,'vi','0b8246a4ed5cf054deab742aec5ddf66',7,'Botble\\Menu\\Models\\Menu'),(12,'vi','0c0adb19188a23ef623fe5128510bd52',8,'Botble\\Menu\\Models\\Menu');
/*!40000 ALTER TABLE `language_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `language_meta_backup`
--

DROP TABLE IF EXISTS `language_meta_backup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `language_meta_backup` (
  `lang_meta_id` int unsigned NOT NULL AUTO_INCREMENT,
  `lang_meta_code` text COLLATE utf8mb4_unicode_ci,
  `lang_meta_origin` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` int unsigned NOT NULL,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`lang_meta_id`),
  KEY `language_meta_reference_id_index` (`reference_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language_meta_backup`
--

LOCK TABLES `language_meta_backup` WRITE;
/*!40000 ALTER TABLE `language_meta_backup` DISABLE KEYS */;
/*!40000 ALTER TABLE `language_meta_backup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `languages` (
  `lang_id` int unsigned NOT NULL AUTO_INCREMENT,
  `lang_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_locale` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_flag` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang_is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `lang_order` int NOT NULL DEFAULT '0',
  `lang_is_rtl` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`lang_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES (1,'English','en','en_US','us',1,0,0),(2,'Tiếng Việt','vi','vi','vn',0,0,0);
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_files`
--

DROP TABLE IF EXISTS `media_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_files` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `folder_id` int unsigned NOT NULL DEFAULT '0',
  `mime_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `media_files_user_id_index` (`user_id`),
  KEY `media_files_index` (`folder_id`,`user_id`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_files`
--

LOCK TABLES `media_files` WRITE;
/*!40000 ALTER TABLE `media_files` DISABLE KEYS */;
INSERT INTO `media_files` VALUES (1,0,'1',1,'image/jpeg',2200,'brands/1.jpg','[]','2022-07-25 08:35:23','2022-07-25 08:35:23',NULL),(2,0,'2',1,'image/jpeg',2685,'brands/2.jpg','[]','2022-07-25 08:35:23','2022-07-25 08:35:23',NULL),(3,0,'3',1,'image/jpeg',2311,'brands/3.jpg','[]','2022-07-25 08:35:23','2022-07-25 08:35:23',NULL),(4,0,'4',1,'image/jpeg',2374,'brands/4.jpg','[]','2022-07-25 08:35:23','2022-07-25 08:35:23',NULL),(5,0,'5',1,'image/jpeg',1927,'brands/5.jpg','[]','2022-07-25 08:35:23','2022-07-25 08:35:23',NULL),(6,0,'6',1,'image/jpeg',2519,'brands/6.jpg','[]','2022-07-25 08:35:24','2022-07-25 08:35:24',NULL),(7,0,'7',1,'image/jpeg',3043,'brands/7.jpg','[]','2022-07-25 08:35:24','2022-07-25 08:35:24',NULL),(8,0,'1',2,'image/jpeg',5173,'product-categories/1.jpg','[]','2022-07-25 08:35:25','2022-07-25 08:35:25',NULL),(9,0,'2',2,'image/jpeg',7355,'product-categories/2.jpg','[]','2022-07-25 08:35:26','2022-07-25 08:35:26',NULL),(10,0,'3',2,'image/jpeg',4427,'product-categories/3.jpg','[]','2022-07-25 08:35:26','2022-07-25 08:35:26',NULL),(11,0,'4',2,'image/jpeg',2963,'product-categories/4.jpg','[]','2022-07-25 08:35:27','2022-07-25 08:35:27',NULL),(12,0,'5',2,'image/jpeg',5016,'product-categories/5.jpg','[]','2022-07-25 08:35:27','2022-07-25 08:35:27',NULL),(13,0,'6',2,'image/jpeg',4101,'product-categories/6.jpg','[]','2022-07-25 08:35:27','2022-07-25 08:35:27',NULL),(14,0,'7',2,'image/jpeg',2576,'product-categories/7.jpg','[]','2022-07-25 08:35:27','2022-07-25 08:35:27',NULL),(15,0,'8',2,'image/jpeg',4670,'product-categories/8.jpg','[]','2022-07-25 08:35:27','2022-07-25 08:35:27',NULL),(16,0,'1',3,'image/jpeg',4911,'products/1.jpg','[]','2022-07-25 08:35:29','2022-07-25 08:35:29',NULL),(17,0,'10-1',3,'image/jpeg',120755,'products/10-1.jpg','[]','2022-07-25 08:35:30','2022-07-25 08:35:30',NULL),(18,0,'10-2',3,'image/jpeg',148563,'products/10-2.jpg','[]','2022-07-25 08:35:30','2022-07-25 08:35:30',NULL),(19,0,'10',3,'image/jpeg',11176,'products/10.jpg','[]','2022-07-25 08:35:30','2022-07-25 08:35:30',NULL),(20,0,'11-1',3,'image/jpeg',13706,'products/11-1.jpg','[]','2022-07-25 08:35:30','2022-07-25 08:35:30',NULL),(21,0,'11-2',3,'image/jpeg',16809,'products/11-2.jpg','[]','2022-07-25 08:35:31','2022-07-25 08:35:31',NULL),(22,0,'11-3',3,'image/jpeg',23991,'products/11-3.jpg','[]','2022-07-25 08:35:31','2022-07-25 08:35:31',NULL),(23,0,'11',3,'image/jpeg',8234,'products/11.jpg','[]','2022-07-25 08:35:31','2022-07-25 08:35:31',NULL),(24,0,'12-1',3,'image/jpeg',47775,'products/12-1.jpg','[]','2022-07-25 08:35:31','2022-07-25 08:35:31',NULL),(25,0,'12-2',3,'image/jpeg',52722,'products/12-2.jpg','[]','2022-07-25 08:35:31','2022-07-25 08:35:31',NULL),(26,0,'12-3',3,'image/jpeg',57295,'products/12-3.jpg','[]','2022-07-25 08:35:32','2022-07-25 08:35:32',NULL),(27,0,'12',3,'image/jpeg',9642,'products/12.jpg','[]','2022-07-25 08:35:32','2022-07-25 08:35:32',NULL),(28,0,'13-1',3,'image/jpeg',7494,'products/13-1.jpg','[]','2022-07-25 08:35:32','2022-07-25 08:35:32',NULL),(29,0,'13',3,'image/jpeg',7266,'products/13.jpg','[]','2022-07-25 08:35:32','2022-07-25 08:35:32',NULL),(30,0,'14',3,'image/jpeg',6626,'products/14.jpg','[]','2022-07-25 08:35:32','2022-07-25 08:35:32',NULL),(31,0,'15-1',3,'image/jpeg',9014,'products/15-1.jpg','[]','2022-07-25 08:35:32','2022-07-25 08:35:32',NULL),(32,0,'15',3,'image/jpeg',6629,'products/15.jpg','[]','2022-07-25 08:35:33','2022-07-25 08:35:33',NULL),(33,0,'16',3,'image/jpeg',8558,'products/16.jpg','[]','2022-07-25 08:35:33','2022-07-25 08:35:33',NULL),(34,0,'17-1',3,'image/jpeg',63248,'products/17-1.jpg','[]','2022-07-25 08:35:33','2022-07-25 08:35:33',NULL),(35,0,'17-2',3,'image/jpeg',71404,'products/17-2.jpg','[]','2022-07-25 08:35:33','2022-07-25 08:35:33',NULL),(36,0,'17-3',3,'image/jpeg',58949,'products/17-3.jpg','[]','2022-07-25 08:35:34','2022-07-25 08:35:34',NULL),(37,0,'17',3,'image/jpeg',7050,'products/17.jpg','[]','2022-07-25 08:35:34','2022-07-25 08:35:34',NULL),(38,0,'18-1',3,'image/jpeg',527022,'products/18-1.jpg','[]','2022-07-25 08:35:34','2022-07-25 08:35:34',NULL),(39,0,'18-2',3,'image/jpeg',43849,'products/18-2.jpg','[]','2022-07-25 08:35:34','2022-07-25 08:35:34',NULL),(40,0,'18-3',3,'image/jpeg',63876,'products/18-3.jpg','[]','2022-07-25 08:35:35','2022-07-25 08:35:35',NULL),(41,0,'18',3,'image/jpeg',61587,'products/18.jpg','[]','2022-07-25 08:35:35','2022-07-25 08:35:35',NULL),(42,0,'19-1',3,'image/jpeg',23166,'products/19-1.jpg','[]','2022-07-25 08:35:35','2022-07-25 08:35:35',NULL),(43,0,'19-2',3,'image/jpeg',12306,'products/19-2.jpg','[]','2022-07-25 08:35:35','2022-07-25 08:35:35',NULL),(44,0,'19-3',3,'image/jpeg',51458,'products/19-3.jpg','[]','2022-07-25 08:35:35','2022-07-25 08:35:35',NULL),(45,0,'19',3,'image/jpeg',227872,'products/19.jpg','[]','2022-07-25 08:35:35','2022-07-25 08:35:35',NULL),(46,0,'2-1',3,'image/jpeg',85522,'products/2-1.jpg','[]','2022-07-25 08:35:36','2022-07-25 08:35:36',NULL),(47,0,'2-2',3,'image/jpeg',122423,'products/2-2.jpg','[]','2022-07-25 08:35:36','2022-07-25 08:35:36',NULL),(48,0,'2-3',3,'image/jpeg',61996,'products/2-3.jpg','[]','2022-07-25 08:35:36','2022-07-25 08:35:36',NULL),(49,0,'2',3,'image/jpeg',10832,'products/2.jpg','[]','2022-07-25 08:35:36','2022-07-25 08:35:36',NULL),(50,0,'20-1',3,'image/jpeg',108013,'products/20-1.jpg','[]','2022-07-25 08:35:37','2022-07-25 08:35:37',NULL),(51,0,'20-2',3,'image/jpeg',107598,'products/20-2.jpg','[]','2022-07-25 08:35:37','2022-07-25 08:35:37',NULL),(52,0,'20-3',3,'image/jpeg',31959,'products/20-3.jpg','[]','2022-07-25 08:35:37','2022-07-25 08:35:37',NULL),(53,0,'20',3,'image/jpeg',12798,'products/20.jpg','[]','2022-07-25 08:35:38','2022-07-25 08:35:38',NULL),(54,0,'21-1',3,'image/jpeg',92022,'products/21-1.jpg','[]','2022-07-25 08:35:38','2022-07-25 08:35:38',NULL),(55,0,'21-2',3,'image/jpeg',73796,'products/21-2.jpg','[]','2022-07-25 08:35:39','2022-07-25 08:35:39',NULL),(56,0,'21',3,'image/jpeg',72410,'products/21.jpg','[]','2022-07-25 08:35:40','2022-07-25 08:35:40',NULL),(57,0,'22-1',3,'image/jpeg',50174,'products/22-1.jpg','[]','2022-07-25 08:35:40','2022-07-25 08:35:40',NULL),(58,0,'22-2',3,'image/jpeg',63267,'products/22-2.jpg','[]','2022-07-25 08:35:41','2022-07-25 08:35:41',NULL),(59,0,'22-3',3,'image/jpeg',125017,'products/22-3.jpg','[]','2022-07-25 08:35:41','2022-07-25 08:35:41',NULL),(60,0,'22',3,'image/jpeg',88636,'products/22.jpg','[]','2022-07-25 08:35:42','2022-07-25 08:35:42',NULL),(61,0,'23-1',3,'image/jpeg',64117,'products/23-1.jpg','[]','2022-07-25 08:35:42','2022-07-25 08:35:42',NULL),(62,0,'23-2',3,'image/jpeg',96786,'products/23-2.jpg','[]','2022-07-25 08:35:42','2022-07-25 08:35:42',NULL),(63,0,'23-3',3,'image/jpeg',46477,'products/23-3.jpg','[]','2022-07-25 08:35:42','2022-07-25 08:35:42',NULL),(64,0,'23',3,'image/jpeg',68142,'products/23.jpg','[]','2022-07-25 08:35:43','2022-07-25 08:35:43',NULL),(65,0,'3',3,'image/jpeg',8388,'products/3.jpg','[]','2022-07-25 08:35:43','2022-07-25 08:35:43',NULL),(66,0,'4-1',3,'image/jpeg',39071,'products/4-1.jpg','[]','2022-07-25 08:35:43','2022-07-25 08:35:43',NULL),(67,0,'4-2',3,'image/jpeg',35982,'products/4-2.jpg','[]','2022-07-25 08:35:44','2022-07-25 08:35:44',NULL),(68,0,'4-3',3,'image/jpeg',62867,'products/4-3.jpg','[]','2022-07-25 08:35:44','2022-07-25 08:35:44',NULL),(69,0,'4',3,'image/jpeg',5547,'products/4.jpg','[]','2022-07-25 08:35:44','2022-07-25 08:35:44',NULL),(70,0,'5-1',3,'image/jpeg',72383,'products/5-1.jpg','[]','2022-07-25 08:35:44','2022-07-25 08:35:44',NULL),(71,0,'5-2',3,'image/jpeg',108591,'products/5-2.jpg','[]','2022-07-25 08:35:45','2022-07-25 08:35:45',NULL),(72,0,'5-3',3,'image/jpeg',63741,'products/5-3.jpg','[]','2022-07-25 08:35:45','2022-07-25 08:35:45',NULL),(73,0,'5',3,'image/jpeg',98052,'products/5.jpg','[]','2022-07-25 08:35:45','2022-07-25 08:35:45',NULL),(74,0,'6',3,'image/jpeg',10944,'products/6.jpg','[]','2022-07-25 08:35:46','2022-07-25 08:35:46',NULL),(75,0,'7',3,'image/jpeg',10160,'products/7.jpg','[]','2022-07-25 08:35:46','2022-07-25 08:35:46',NULL),(76,0,'8-1',3,'image/jpeg',9986,'products/8-1.jpg','[]','2022-07-25 08:35:46','2022-07-25 08:35:46',NULL),(77,0,'8-2',3,'image/jpeg',8132,'products/8-2.jpg','[]','2022-07-25 08:35:46','2022-07-25 08:35:46',NULL),(78,0,'8-3',3,'image/jpeg',7867,'products/8-3.jpg','[]','2022-07-25 08:35:46','2022-07-25 08:35:46',NULL),(79,0,'8',3,'image/jpeg',10459,'products/8.jpg','[]','2022-07-25 08:35:46','2022-07-25 08:35:46',NULL),(80,0,'9-1',3,'image/jpeg',623616,'products/9-1.jpg','[]','2022-07-25 08:35:47','2022-07-25 08:35:47',NULL),(81,0,'9-2',3,'image/jpeg',647454,'products/9-2.jpg','[]','2022-07-25 08:35:47','2022-07-25 08:35:47',NULL),(82,0,'9',3,'image/jpeg',16733,'products/9.jpg','[]','2022-07-25 08:35:47','2022-07-25 08:35:47',NULL),(83,0,'1',4,'image/jpeg',11752,'customers/1.jpg','[]','2022-07-25 08:36:03','2022-07-25 08:36:03',NULL),(84,0,'10',4,'image/jpeg',27814,'customers/10.jpg','[]','2022-07-25 08:36:03','2022-07-25 08:36:03',NULL),(85,0,'2',4,'image/jpeg',19005,'customers/2.jpg','[]','2022-07-25 08:36:03','2022-07-25 08:36:03',NULL),(86,0,'3',4,'image/jpeg',20400,'customers/3.jpg','[]','2022-07-25 08:36:03','2022-07-25 08:36:03',NULL),(87,0,'4',4,'image/jpeg',26819,'customers/4.jpg','[]','2022-07-25 08:36:04','2022-07-25 08:36:04',NULL),(88,0,'5',4,'image/jpeg',14367,'customers/5.jpg','[]','2022-07-25 08:36:04','2022-07-25 08:36:04',NULL),(89,0,'6',4,'image/jpeg',12367,'customers/6.jpg','[]','2022-07-25 08:36:04','2022-07-25 08:36:04',NULL),(90,0,'7',4,'image/jpeg',20652,'customers/7.jpg','[]','2022-07-25 08:36:04','2022-07-25 08:36:04',NULL),(91,0,'8',4,'image/jpeg',21164,'customers/8.jpg','[]','2022-07-25 08:36:04','2022-07-25 08:36:04',NULL),(92,0,'9',4,'image/jpeg',6084,'customers/9.jpg','[]','2022-07-25 08:36:05','2022-07-25 08:36:05',NULL),(93,0,'1',5,'image/jpeg',532819,'news/1.jpg','[]','2022-07-25 08:36:11','2022-07-25 08:36:11',NULL),(94,0,'10',5,'image/jpeg',342651,'news/10.jpg','[]','2022-07-25 08:36:12','2022-07-25 08:36:12',NULL),(95,0,'11',5,'image/jpeg',296740,'news/11.jpg','[]','2022-07-25 08:36:13','2022-07-25 08:36:13',NULL),(96,0,'2',5,'image/jpeg',553729,'news/2.jpg','[]','2022-07-25 08:36:14','2022-07-25 08:36:14',NULL),(97,0,'3',5,'image/jpeg',522223,'news/3.jpg','[]','2022-07-25 08:36:15','2022-07-25 08:36:15',NULL),(98,0,'4',5,'image/jpeg',910908,'news/4.jpg','[]','2022-07-25 08:36:16','2022-07-25 08:36:16',NULL),(99,0,'5',5,'image/jpeg',666561,'news/5.jpg','[]','2022-07-25 08:36:16','2022-07-25 08:36:16',NULL),(100,0,'6',5,'image/jpeg',431929,'news/6.jpg','[]','2022-07-25 08:36:17','2022-07-25 08:36:17',NULL),(101,0,'7',5,'image/jpeg',568268,'news/7.jpg','[]','2022-07-25 08:36:18','2022-07-25 08:36:18',NULL),(102,0,'8',5,'image/jpeg',351088,'news/8.jpg','[]','2022-07-25 08:36:18','2022-07-25 08:36:18',NULL),(103,0,'9',5,'image/jpeg',353751,'news/9.jpg','[]','2022-07-25 08:36:19','2022-07-25 08:36:19',NULL),(104,0,'1-lg',6,'image/jpeg',66405,'sliders/1-lg.jpg','[]','2022-07-25 08:36:24','2022-07-25 08:36:24',NULL),(105,0,'1-md',6,'image/jpeg',40964,'sliders/1-md.jpg','[]','2022-07-25 08:36:24','2022-07-25 08:36:24',NULL),(106,0,'1-sm',6,'image/jpeg',40964,'sliders/1-sm.jpg','[]','2022-07-25 08:36:24','2022-07-25 08:36:24',NULL),(107,0,'2-lg',6,'image/jpeg',37835,'sliders/2-lg.jpg','[]','2022-07-25 08:36:24','2022-07-25 08:36:24',NULL),(108,0,'2-md',6,'image/jpeg',31875,'sliders/2-md.jpg','[]','2022-07-25 08:36:25','2022-07-25 08:36:25',NULL),(109,0,'2-sm',6,'image/jpeg',31875,'sliders/2-sm.jpg','[]','2022-07-25 08:36:25','2022-07-25 08:36:25',NULL),(110,0,'3-lg',6,'image/jpeg',40072,'sliders/3-lg.jpg','[]','2022-07-25 08:36:25','2022-07-25 08:36:25',NULL),(111,0,'3-md',6,'image/jpeg',32107,'sliders/3-md.jpg','[]','2022-07-25 08:36:25','2022-07-25 08:36:25',NULL),(112,0,'3-sm',6,'image/jpeg',32107,'sliders/3-sm.jpg','[]','2022-07-25 08:36:26','2022-07-25 08:36:26',NULL),(113,0,'1',7,'image/jpeg',56015,'promotion/1.jpg','[]','2022-07-25 08:36:28','2022-07-25 08:36:28',NULL),(114,0,'2',7,'image/jpeg',39964,'promotion/2.jpg','[]','2022-07-25 08:36:28','2022-07-25 08:36:28',NULL),(115,0,'3',7,'image/jpeg',71948,'promotion/3.jpg','[]','2022-07-25 08:36:29','2022-07-25 08:36:29',NULL),(116,0,'4',7,'image/jpeg',94590,'promotion/4.jpg','[]','2022-07-25 08:36:29','2022-07-25 08:36:29',NULL),(117,0,'5',7,'image/jpeg',96153,'promotion/5.jpg','[]','2022-07-25 08:36:29','2022-07-25 08:36:29',NULL),(118,0,'6',7,'image/jpeg',160910,'promotion/6.jpg','[]','2022-07-25 08:36:29','2022-07-25 08:36:29',NULL),(119,0,'7',7,'image/jpeg',59044,'promotion/7.jpg','[]','2022-07-25 08:36:29','2022-07-25 08:36:29',NULL),(120,0,'8',7,'image/jpeg',39964,'promotion/8.jpg','[]','2022-07-25 08:36:30','2022-07-25 08:36:30',NULL),(121,0,'9',7,'image/jpeg',54865,'promotion/9.jpg','[]','2022-07-25 08:36:30','2022-07-25 08:36:30',NULL),(122,0,'app',8,'image/png',88771,'general/app.png','[]','2022-07-25 08:36:35','2022-07-25 08:36:35',NULL),(123,0,'coming-soon',8,'image/jpeg',83359,'general/coming-soon.jpg','[]','2022-07-25 08:36:35','2022-07-25 08:36:35',NULL),(124,0,'favicon',8,'image/png',5147,'general/favicon.png','[]','2022-07-25 08:36:36','2022-07-25 08:36:36',NULL),(125,0,'logo-dark',8,'image/png',906,'general/logo-dark.png','[]','2022-07-25 08:36:36','2022-07-25 08:36:36',NULL),(126,0,'logo-light',8,'image/png',1430,'general/logo-light.png','[]','2022-07-25 08:36:36','2022-07-25 08:36:36',NULL),(127,0,'logo',8,'image/png',892,'general/logo.png','[]','2022-07-25 08:36:36','2022-07-25 08:36:36',NULL),(128,0,'newsletter',8,'image/jpeg',25569,'general/newsletter.jpg','[]','2022-07-25 08:36:36','2022-07-25 08:36:36',NULL),(129,0,'payment-method-1',8,'image/jpeg',976,'general/payment-method-1.jpg','[]','2022-07-25 08:36:36','2022-07-25 08:36:36',NULL),(130,0,'payment-method-2',8,'image/jpeg',1122,'general/payment-method-2.jpg','[]','2022-07-25 08:36:36','2022-07-25 08:36:36',NULL),(131,0,'payment-method-3',8,'image/jpeg',1040,'general/payment-method-3.jpg','[]','2022-07-25 08:36:37','2022-07-25 08:36:37',NULL),(132,0,'payment-method-4',8,'image/jpeg',722,'general/payment-method-4.jpg','[]','2022-07-25 08:36:37','2022-07-25 08:36:37',NULL),(133,0,'payment-method-5',8,'image/jpeg',773,'general/payment-method-5.jpg','[]','2022-07-25 08:36:37','2022-07-25 08:36:37',NULL),(134,0,'1',9,'image/png',11920,'stores/1.png','[]','2022-07-25 08:36:37','2022-07-25 08:36:37',NULL),(135,0,'10',9,'image/png',6583,'stores/10.png','[]','2022-07-25 08:36:38','2022-07-25 08:36:38',NULL),(136,0,'11',9,'image/png',6934,'stores/11.png','[]','2022-07-25 08:36:38','2022-07-25 08:36:38',NULL),(137,0,'12',9,'image/png',7396,'stores/12.png','[]','2022-07-25 08:36:38','2022-07-25 08:36:38',NULL),(138,0,'13',9,'image/png',5881,'stores/13.png','[]','2022-07-25 08:36:38','2022-07-25 08:36:38',NULL),(139,0,'14',9,'image/png',7188,'stores/14.png','[]','2022-07-25 08:36:38','2022-07-25 08:36:38',NULL),(140,0,'15',9,'image/png',7142,'stores/15.png','[]','2022-07-25 08:36:39','2022-07-25 08:36:39',NULL),(141,0,'16',9,'image/png',4659,'stores/16.png','[]','2022-07-25 08:36:39','2022-07-25 08:36:39',NULL),(142,0,'17',9,'image/png',6781,'stores/17.png','[]','2022-07-25 08:36:39','2022-07-25 08:36:39',NULL),(143,0,'2',9,'image/png',12300,'stores/2.png','[]','2022-07-25 08:36:39','2022-07-25 08:36:39',NULL),(144,0,'3',9,'image/png',10778,'stores/3.png','[]','2022-07-25 08:36:39','2022-07-25 08:36:39',NULL),(145,0,'4',9,'image/png',10771,'stores/4.png','[]','2022-07-25 08:36:39','2022-07-25 08:36:39',NULL),(146,0,'5',9,'image/png',13041,'stores/5.png','[]','2022-07-25 08:36:40','2022-07-25 08:36:40',NULL),(147,0,'6',9,'image/png',14006,'stores/6.png','[]','2022-07-25 08:36:40','2022-07-25 08:36:40',NULL),(148,0,'7',9,'image/png',5978,'stores/7.png','[]','2022-07-25 08:36:40','2022-07-25 08:36:40',NULL),(149,0,'8',9,'image/png',6586,'stores/8.png','[]','2022-07-25 08:36:40','2022-07-25 08:36:40',NULL),(150,0,'9',9,'image/png',6173,'stores/9.png','[]','2022-07-25 08:36:40','2022-07-25 08:36:40',NULL);
/*!40000 ALTER TABLE `media_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_folders`
--

DROP TABLE IF EXISTS `media_folders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_folders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `media_folders_user_id_index` (`user_id`),
  KEY `media_folders_index` (`parent_id`,`user_id`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_folders`
--

LOCK TABLES `media_folders` WRITE;
/*!40000 ALTER TABLE `media_folders` DISABLE KEYS */;
INSERT INTO `media_folders` VALUES (1,0,'brands','brands',0,'2022-07-25 08:35:23','2022-07-25 08:35:23',NULL),(2,0,'product-categories','product-categories',0,'2022-07-25 08:35:25','2022-07-25 08:35:25',NULL),(3,0,'products','products',0,'2022-07-25 08:35:29','2022-07-25 08:35:29',NULL),(4,0,'customers','customers',0,'2022-07-25 08:36:03','2022-07-25 08:36:03',NULL),(5,0,'news','news',0,'2022-07-25 08:36:11','2022-07-25 08:36:11',NULL),(6,0,'sliders','sliders',0,'2022-07-25 08:36:24','2022-07-25 08:36:24',NULL),(7,0,'promotion','promotion',0,'2022-07-25 08:36:28','2022-07-25 08:36:28',NULL),(8,0,'general','general',0,'2022-07-25 08:36:35','2022-07-25 08:36:35',NULL),(9,0,'stores','stores',0,'2022-07-25 08:36:37','2022-07-25 08:36:37',NULL);
/*!40000 ALTER TABLE `media_folders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_settings`
--

DROP TABLE IF EXISTS `media_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `media_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_settings`
--

LOCK TABLES `media_settings` WRITE;
/*!40000 ALTER TABLE `media_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `media_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_locations`
--

DROP TABLE IF EXISTS `menu_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_locations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int unsigned NOT NULL,
  `location` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_locations_menu_id_created_at_index` (`menu_id`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_locations`
--

LOCK TABLES `menu_locations` WRITE;
/*!40000 ALTER TABLE `menu_locations` DISABLE KEYS */;
INSERT INTO `menu_locations` VALUES (1,1,'main-menu','2022-07-25 08:36:33','2022-07-25 08:36:33'),(2,5,'main-menu','2022-07-25 08:36:33','2022-07-25 08:36:33');
/*!40000 ALTER TABLE `menu_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_nodes`
--

DROP TABLE IF EXISTS `menu_nodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_nodes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int unsigned NOT NULL,
  `parent_id` int unsigned NOT NULL DEFAULT '0',
  `reference_id` int unsigned DEFAULT NULL,
  `reference_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon_font` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` tinyint unsigned NOT NULL DEFAULT '0',
  `title` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `css_class` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `has_child` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_nodes_menu_id_index` (`menu_id`),
  KEY `menu_nodes_parent_id_index` (`parent_id`),
  KEY `reference_id` (`reference_id`),
  KEY `reference_type` (`reference_type`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_nodes`
--

LOCK TABLES `menu_nodes` WRITE;
/*!40000 ALTER TABLE `menu_nodes` DISABLE KEYS */;
INSERT INTO `menu_nodes` VALUES (1,1,0,NULL,NULL,'/',NULL,0,'Home',NULL,'_self',0,'2022-07-25 08:36:33','2022-07-25 08:36:33'),(2,1,0,NULL,NULL,'#',NULL,0,'Pages',NULL,'_self',1,'2022-07-25 08:36:33','2022-07-25 08:36:33'),(3,1,2,2,'Botble\\Page\\Models\\Page','/about-us',NULL,0,'About us',NULL,'_self',0,'2022-07-25 08:36:33','2022-07-25 08:36:33'),(4,1,2,3,'Botble\\Page\\Models\\Page','/terms-of-use',NULL,0,'Terms Of Use',NULL,'_self',0,'2022-07-25 08:36:33','2022-07-25 08:36:33'),(5,1,2,4,'Botble\\Page\\Models\\Page','/terms-conditions',NULL,0,'Terms & Conditions',NULL,'_self',0,'2022-07-25 08:36:33','2022-07-25 08:36:33'),(6,1,2,5,'Botble\\Page\\Models\\Page','/refund-policy',NULL,0,'Refund Policy',NULL,'_self',0,'2022-07-25 08:36:33','2022-07-25 08:36:33'),(7,1,2,12,'Botble\\Page\\Models\\Page','/coming-soon',NULL,0,'Coming soon',NULL,'_self',0,'2022-07-25 08:36:33','2022-07-25 08:36:33'),(8,1,0,NULL,NULL,'/products',NULL,0,'Shop',NULL,'_self',1,'2022-07-25 08:36:33','2022-07-25 08:36:33'),(9,1,8,NULL,NULL,'/products',NULL,0,'All products',NULL,'_self',0,'2022-07-25 08:36:33','2022-07-25 08:36:33'),(10,1,8,15,'Botble\\Ecommerce\\Models\\ProductCategory','/product-categories/batteries',NULL,0,'Products Of Category',NULL,'_self',0,'2022-07-25 08:36:33','2022-07-25 08:36:33'),(11,1,8,NULL,NULL,'/products/beat-headphone',NULL,0,'Product Single',NULL,'_self',0,'2022-07-25 08:36:33','2022-07-25 08:36:33'),(12,1,0,NULL,NULL,'/stores',NULL,0,'Stores',NULL,'_self',0,'2022-07-25 08:36:33','2022-07-25 08:36:33'),(13,1,0,6,'Botble\\Page\\Models\\Page','/blog',NULL,0,'Blog',NULL,'_self',0,'2022-07-25 08:36:33','2022-07-25 08:36:33'),(14,1,0,7,'Botble\\Page\\Models\\Page','/faqs',NULL,0,'FAQs',NULL,'_self',0,'2022-07-25 08:36:33','2022-07-25 08:36:34'),(15,1,0,8,'Botble\\Page\\Models\\Page','/contact',NULL,0,'Contact',NULL,'_self',0,'2022-07-25 08:36:33','2022-07-25 08:36:34'),(16,2,0,3,'Botble\\Page\\Models\\Page','/terms-of-use',NULL,0,'Terms Of Use',NULL,'_self',0,'2022-07-25 08:36:33','2022-07-25 08:36:34'),(17,2,0,4,'Botble\\Page\\Models\\Page','/terms-conditions',NULL,0,'Terms & Conditions',NULL,'_self',0,'2022-07-25 08:36:33','2022-07-25 08:36:34'),(18,2,0,5,'Botble\\Page\\Models\\Page','/refund-policy',NULL,0,'Refund Policy',NULL,'_self',0,'2022-07-25 08:36:33','2022-07-25 08:36:34'),(19,2,0,7,'Botble\\Page\\Models\\Page','/faqs',NULL,0,'FAQs',NULL,'_self',0,'2022-07-25 08:36:33','2022-07-25 08:36:34'),(20,2,0,NULL,NULL,'/nothing',NULL,0,'404 Page',NULL,'_self',0,'2022-07-25 08:36:33','2022-07-25 08:36:33'),(21,3,0,2,'Botble\\Page\\Models\\Page','/about-us',NULL,0,'About us',NULL,'_self',0,'2022-07-25 08:36:33','2022-07-25 08:36:34'),(22,3,0,10,'Botble\\Page\\Models\\Page','/affiliate',NULL,0,'Affiliate',NULL,'_self',0,'2022-07-25 08:36:33','2022-07-25 08:36:34'),(23,3,0,11,'Botble\\Page\\Models\\Page','/career',NULL,0,'Career',NULL,'_self',0,'2022-07-25 08:36:33','2022-07-25 08:36:34'),(24,3,0,8,'Botble\\Page\\Models\\Page','/contact',NULL,0,'Contact us',NULL,'_self',0,'2022-07-25 08:36:33','2022-07-25 08:36:34'),(25,4,0,6,'Botble\\Page\\Models\\Page','/blog',NULL,0,'Our blog',NULL,'_self',0,'2022-07-25 08:36:33','2022-07-25 08:36:34'),(26,4,0,NULL,NULL,'/cart',NULL,0,'Cart',NULL,'_self',0,'2022-07-25 08:36:33','2022-07-25 08:36:33'),(27,4,0,NULL,NULL,'/customer/overview',NULL,0,'My account',NULL,'_self',0,'2022-07-25 08:36:33','2022-07-25 08:36:33'),(28,4,0,NULL,NULL,'/products',NULL,0,'Shop',NULL,'_self',0,'2022-07-25 08:36:33','2022-07-25 08:36:33'),(29,5,0,NULL,NULL,'/',NULL,0,'Trang chủ',NULL,'_self',0,'2022-07-25 08:36:33','2022-07-25 08:36:33'),(30,5,0,NULL,NULL,'#',NULL,0,'Trang',NULL,'_self',1,'2022-07-25 08:36:33','2022-07-25 08:36:33'),(31,5,30,2,'Botble\\Page\\Models\\Page','/about-us',NULL,0,'Về chúng tôi',NULL,'_self',0,'2022-07-25 08:36:33','2022-07-25 08:36:34'),(32,5,30,3,'Botble\\Page\\Models\\Page','/terms-of-use',NULL,0,'Điều khoản sử dụng',NULL,'_self',0,'2022-07-25 08:36:33','2022-07-25 08:36:34'),(33,5,30,4,'Botble\\Page\\Models\\Page','/terms-conditions',NULL,0,'Điều khoản và quy định',NULL,'_self',0,'2022-07-25 08:36:33','2022-07-25 08:36:34'),(34,5,30,5,'Botble\\Page\\Models\\Page','/refund-policy',NULL,0,'Chính sách hoàn hàng',NULL,'_self',0,'2022-07-25 08:36:33','2022-07-25 08:36:34'),(35,5,30,12,'Botble\\Page\\Models\\Page','/coming-soon',NULL,0,'Sắp ra mắt',NULL,'_self',0,'2022-07-25 08:36:33','2022-07-25 08:36:34'),(36,5,0,NULL,NULL,'/products',NULL,0,'Sản phẩm',NULL,'_self',1,'2022-07-25 08:36:33','2022-07-25 08:36:33'),(37,5,36,NULL,NULL,'/products',NULL,0,'Tất cả sản phẩm',NULL,'_self',0,'2022-07-25 08:36:33','2022-07-25 08:36:33'),(38,5,36,15,'Botble\\Ecommerce\\Models\\ProductCategory','/product-categories/batteries',NULL,0,'Danh mục sản phẩm',NULL,'_self',0,'2022-07-25 08:36:33','2022-07-25 08:36:34'),(39,5,36,NULL,NULL,'/products/beat-headphone',NULL,0,'Sản phẩm chi tiết',NULL,'_self',0,'2022-07-25 08:36:33','2022-07-25 08:36:33'),(40,5,0,NULL,NULL,'/stores',NULL,0,'Cửa hàng',NULL,'_self',0,'2022-07-25 08:36:33','2022-07-25 08:36:33'),(41,5,0,6,'Botble\\Page\\Models\\Page','/blog',NULL,0,'Tin tức',NULL,'_self',0,'2022-07-25 08:36:33','2022-07-25 08:36:34'),(42,5,0,7,'Botble\\Page\\Models\\Page','/faqs',NULL,0,'FAQs',NULL,'_self',0,'2022-07-25 08:36:33','2022-07-25 08:36:34'),(43,5,0,8,'Botble\\Page\\Models\\Page','/contact',NULL,0,'Liên hệ',NULL,'_self',0,'2022-07-25 08:36:33','2022-07-25 08:36:34'),(44,6,0,3,'Botble\\Page\\Models\\Page','/terms-of-use',NULL,0,'Điều khoản sử dụng',NULL,'_self',0,'2022-07-25 08:36:33','2022-07-25 08:36:34'),(45,6,0,4,'Botble\\Page\\Models\\Page','/terms-conditions',NULL,0,'Điều khoản và quy định',NULL,'_self',0,'2022-07-25 08:36:33','2022-07-25 08:36:34'),(46,6,0,5,'Botble\\Page\\Models\\Page','/refund-policy',NULL,0,'Chính sách hoàn hàng',NULL,'_self',0,'2022-07-25 08:36:33','2022-07-25 08:36:34'),(47,6,0,6,'Botble\\Page\\Models\\Page','/blog',NULL,0,'FAQs',NULL,'_self',0,'2022-07-25 08:36:33','2022-07-25 08:36:34'),(48,6,0,NULL,NULL,'/nothing',NULL,0,'404 Page',NULL,'_self',0,'2022-07-25 08:36:33','2022-07-25 08:36:33'),(49,7,0,2,'Botble\\Page\\Models\\Page','/about-us',NULL,0,'Về chúng tôi',NULL,'_self',0,'2022-07-25 08:36:33','2022-07-25 08:36:35'),(50,7,0,10,'Botble\\Page\\Models\\Page','/affiliate',NULL,0,'Tiếp thị liên kết',NULL,'_self',0,'2022-07-25 08:36:33','2022-07-25 08:36:35'),(51,7,0,11,'Botble\\Page\\Models\\Page','/career',NULL,0,'Tuyển dụng',NULL,'_self',0,'2022-07-25 08:36:33','2022-07-25 08:36:35'),(52,7,0,8,'Botble\\Page\\Models\\Page','/contact',NULL,0,'Liên hệ',NULL,'_self',0,'2022-07-25 08:36:33','2022-07-25 08:36:35'),(53,8,0,6,'Botble\\Page\\Models\\Page','/blog',NULL,0,'Tin tức',NULL,'_self',0,'2022-07-25 08:36:33','2022-07-25 08:36:35'),(54,8,0,NULL,NULL,'/cart',NULL,0,'Giỏ hàng',NULL,'_self',0,'2022-07-25 08:36:33','2022-07-25 08:36:33'),(55,8,0,NULL,NULL,'/customer/overview',NULL,0,'Tài khoản',NULL,'_self',0,'2022-07-25 08:36:33','2022-07-25 08:36:33'),(56,8,0,NULL,NULL,'/products',NULL,0,'Sản phẩm',NULL,'_self',0,'2022-07-25 08:36:33','2022-07-25 08:36:33');
/*!40000 ALTER TABLE `menu_nodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menus` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (1,'Main menu','main-menu','published','2022-07-25 08:36:33','2022-07-25 08:36:33'),(2,'Quick links','quick-links','published','2022-07-25 08:36:33','2022-07-25 08:36:33'),(3,'Company','company','published','2022-07-25 08:36:33','2022-07-25 08:36:33'),(4,'Business','business','published','2022-07-25 08:36:33','2022-07-25 08:36:33'),(5,'Menu chính','menu-chinh','published','2022-07-25 08:36:33','2022-07-25 08:36:33'),(6,'Liên kết nhanh','lien-ket-nhanh','published','2022-07-25 08:36:33','2022-07-25 08:36:33'),(7,'Công ty','cong-ty','published','2022-07-25 08:36:33','2022-07-25 08:36:33'),(8,'Doanh nghiệp','doanh-nghiep','published','2022-07-25 08:36:33','2022-07-25 08:36:33');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meta_boxes`
--

DROP TABLE IF EXISTS `meta_boxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meta_boxes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_value` text COLLATE utf8mb4_unicode_ci,
  `reference_id` int unsigned NOT NULL,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `meta_boxes_reference_id_index` (`reference_id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meta_boxes`
--

LOCK TABLES `meta_boxes` WRITE;
/*!40000 ALTER TABLE `meta_boxes` DISABLE KEYS */;
INSERT INTO `meta_boxes` VALUES (1,'icon','[\"icon-star\"]',1,'Botble\\Ecommerce\\Models\\ProductCategory','2022-07-25 08:35:28','2022-07-25 08:35:28'),(2,'icon','[\"icon-laundry\"]',2,'Botble\\Ecommerce\\Models\\ProductCategory','2022-07-25 08:35:28','2022-07-25 08:35:28'),(3,'icon','[\"icon-shirt\"]',16,'Botble\\Ecommerce\\Models\\ProductCategory','2022-07-25 08:35:28','2022-07-25 08:35:28'),(4,'icon','[\"icon-desktop\"]',17,'Botble\\Ecommerce\\Models\\ProductCategory','2022-07-25 08:35:28','2022-07-25 08:35:28'),(5,'icon','[\"icon-lampshade\"]',28,'Botble\\Ecommerce\\Models\\ProductCategory','2022-07-25 08:35:28','2022-07-25 08:35:28'),(6,'icon','[\"icon-heart-pulse\"]',29,'Botble\\Ecommerce\\Models\\ProductCategory','2022-07-25 08:35:28','2022-07-25 08:35:28'),(7,'icon','[\"icon-diamond2\"]',30,'Botble\\Ecommerce\\Models\\ProductCategory','2022-07-25 08:35:28','2022-07-25 08:35:28'),(8,'icon','[\"icon-desktop\"]',31,'Botble\\Ecommerce\\Models\\ProductCategory','2022-07-25 08:35:28','2022-07-25 08:35:28'),(9,'icon','[\"icon-smartphone\"]',32,'Botble\\Ecommerce\\Models\\ProductCategory','2022-07-25 08:35:28','2022-07-25 08:35:28'),(10,'icon','[\"icon-baby-bottle\"]',33,'Botble\\Ecommerce\\Models\\ProductCategory','2022-07-25 08:35:28','2022-07-25 08:35:28'),(11,'icon','[\"icon-baseball\"]',34,'Botble\\Ecommerce\\Models\\ProductCategory','2022-07-25 08:35:28','2022-07-25 08:35:28'),(12,'icon','[\"icon-book2\"]',35,'Botble\\Ecommerce\\Models\\ProductCategory','2022-07-25 08:35:28','2022-07-25 08:35:28'),(13,'icon','[\"icon-car-siren\"]',36,'Botble\\Ecommerce\\Models\\ProductCategory','2022-07-25 08:35:28','2022-07-25 08:35:28'),(14,'icon','[\"icon-wrench\"]',37,'Botble\\Ecommerce\\Models\\ProductCategory','2022-07-25 08:35:28','2022-07-25 08:35:28'),(15,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',1,'Botble\\Ecommerce\\Models\\Product','2022-07-25 08:35:50','2022-07-25 08:35:50'),(16,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',2,'Botble\\Ecommerce\\Models\\Product','2022-07-25 08:35:50','2022-07-25 08:35:50'),(17,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',3,'Botble\\Ecommerce\\Models\\Product','2022-07-25 08:35:51','2022-07-25 08:35:51'),(18,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',4,'Botble\\Ecommerce\\Models\\Product','2022-07-25 08:35:51','2022-07-25 08:35:51'),(19,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',5,'Botble\\Ecommerce\\Models\\Product','2022-07-25 08:35:51','2022-07-25 08:35:51'),(20,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',6,'Botble\\Ecommerce\\Models\\Product','2022-07-25 08:35:51','2022-07-25 08:35:51'),(21,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',7,'Botble\\Ecommerce\\Models\\Product','2022-07-25 08:35:51','2022-07-25 08:35:51'),(22,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',8,'Botble\\Ecommerce\\Models\\Product','2022-07-25 08:35:52','2022-07-25 08:35:52'),(23,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',9,'Botble\\Ecommerce\\Models\\Product','2022-07-25 08:35:52','2022-07-25 08:35:52'),(24,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',10,'Botble\\Ecommerce\\Models\\Product','2022-07-25 08:35:52','2022-07-25 08:35:52'),(25,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',11,'Botble\\Ecommerce\\Models\\Product','2022-07-25 08:35:52','2022-07-25 08:35:52'),(26,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',12,'Botble\\Ecommerce\\Models\\Product','2022-07-25 08:35:52','2022-07-25 08:35:52'),(27,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',13,'Botble\\Ecommerce\\Models\\Product','2022-07-25 08:35:52','2022-07-25 08:35:52'),(28,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',14,'Botble\\Ecommerce\\Models\\Product','2022-07-25 08:35:52','2022-07-25 08:35:52'),(29,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',15,'Botble\\Ecommerce\\Models\\Product','2022-07-25 08:35:53','2022-07-25 08:35:53'),(30,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',16,'Botble\\Ecommerce\\Models\\Product','2022-07-25 08:35:53','2022-07-25 08:35:53'),(31,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',17,'Botble\\Ecommerce\\Models\\Product','2022-07-25 08:35:53','2022-07-25 08:35:53'),(32,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',18,'Botble\\Ecommerce\\Models\\Product','2022-07-25 08:35:53','2022-07-25 08:35:53'),(33,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',19,'Botble\\Ecommerce\\Models\\Product','2022-07-25 08:35:53','2022-07-25 08:35:53'),(34,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',20,'Botble\\Ecommerce\\Models\\Product','2022-07-25 08:35:53','2022-07-25 08:35:53'),(35,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',21,'Botble\\Ecommerce\\Models\\Product','2022-07-25 08:35:53','2022-07-25 08:35:53'),(36,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',22,'Botble\\Ecommerce\\Models\\Product','2022-07-25 08:35:53','2022-07-25 08:35:53'),(37,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',23,'Botble\\Ecommerce\\Models\\Product','2022-07-25 08:35:54','2022-07-25 08:35:54'),(38,'tablet_image','[\"sliders\\/1-md.jpg\"]',1,'Botble\\SimpleSlider\\Models\\SimpleSliderItem','2022-07-25 08:36:26','2022-07-25 08:36:26'),(39,'mobile_image','[\"sliders\\/1-sm.jpg\"]',1,'Botble\\SimpleSlider\\Models\\SimpleSliderItem','2022-07-25 08:36:26','2022-07-25 08:36:26'),(40,'tablet_image','[\"sliders\\/2-md.jpg\"]',2,'Botble\\SimpleSlider\\Models\\SimpleSliderItem','2022-07-25 08:36:26','2022-07-25 08:36:26'),(41,'mobile_image','[\"sliders\\/2-sm.jpg\"]',2,'Botble\\SimpleSlider\\Models\\SimpleSliderItem','2022-07-25 08:36:26','2022-07-25 08:36:26'),(42,'tablet_image','[\"sliders\\/3-md.jpg\"]',3,'Botble\\SimpleSlider\\Models\\SimpleSliderItem','2022-07-25 08:36:26','2022-07-25 08:36:26'),(43,'mobile_image','[\"sliders\\/3-sm.jpg\"]',3,'Botble\\SimpleSlider\\Models\\SimpleSliderItem','2022-07-25 08:36:26','2022-07-25 08:36:26'),(44,'tablet_image','[\"sliders\\/1-md.jpg\"]',4,'Botble\\SimpleSlider\\Models\\SimpleSliderItem','2022-07-25 08:36:27','2022-07-25 08:36:27'),(45,'mobile_image','[\"sliders\\/1-sm.jpg\"]',4,'Botble\\SimpleSlider\\Models\\SimpleSliderItem','2022-07-25 08:36:27','2022-07-25 08:36:27'),(46,'tablet_image','[\"sliders\\/2-md.jpg\"]',5,'Botble\\SimpleSlider\\Models\\SimpleSliderItem','2022-07-25 08:36:27','2022-07-25 08:36:27'),(47,'mobile_image','[\"sliders\\/2-sm.jpg\"]',5,'Botble\\SimpleSlider\\Models\\SimpleSliderItem','2022-07-25 08:36:27','2022-07-25 08:36:27'),(48,'tablet_image','[\"sliders\\/3-md.jpg\"]',6,'Botble\\SimpleSlider\\Models\\SimpleSliderItem','2022-07-25 08:36:27','2022-07-25 08:36:27'),(49,'mobile_image','[\"sliders\\/3-sm.jpg\"]',6,'Botble\\SimpleSlider\\Models\\SimpleSliderItem','2022-07-25 08:36:27','2022-07-25 08:36:27');
/*!40000 ALTER TABLE `meta_boxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2013_04_09_032329_create_base_tables',1),(2,'2013_04_09_062329_create_revisions_table',1),(3,'2014_10_12_000000_create_users_table',1),(4,'2014_10_12_100000_create_password_resets_table',1),(5,'2015_06_18_033822_create_blog_table',1),(6,'2015_06_29_025744_create_audit_history',1),(7,'2016_06_10_230148_create_acl_tables',1),(8,'2016_06_14_230857_create_menus_table',1),(9,'2016_06_17_091537_create_contacts_table',1),(10,'2016_06_28_221418_create_pages_table',1),(11,'2016_10_03_032336_create_languages_table',1),(12,'2016_10_05_074239_create_setting_table',1),(13,'2016_10_07_193005_create_translations_table',1),(14,'2016_11_28_032840_create_dashboard_widget_tables',1),(15,'2016_12_16_084601_create_widgets_table',1),(16,'2017_05_09_070343_create_media_tables',1),(17,'2017_05_18_080441_create_payment_tables',1),(18,'2017_07_11_140018_create_simple_slider_table',1),(19,'2017_10_24_154832_create_newsletter_table',1),(20,'2017_11_03_070450_create_slug_table',1),(21,'2018_07_09_221238_create_faq_table',1),(22,'2019_01_05_053554_create_jobs_table',1),(23,'2019_08_19_000000_create_failed_jobs_table',1),(24,'2019_11_18_061011_create_country_table',1),(25,'2020_03_05_041139_create_ecommerce_tables',1),(26,'2020_11_18_150916_ads_create_ads_table',1),(27,'2021_01_01_044147_ecommerce_create_flash_sale_table',1),(28,'2021_01_17_082713_add_column_is_featured_to_product_collections_table',1),(29,'2021_01_18_024333_add_zip_code_into_table_customer_addresses',1),(30,'2021_02_16_092633_remove_default_value_for_author_type',1),(31,'2021_02_18_073505_update_table_ec_reviews',1),(32,'2021_03_10_024419_add_column_confirmed_at_to_table_ec_customers',1),(33,'2021_03_10_025153_change_column_tax_amount',1),(34,'2021_03_20_033103_add_column_availability_to_table_ec_products',1),(35,'2021_03_27_144913_add_customer_type_into_table_payments',1),(36,'2021_04_28_074008_ecommerce_create_product_label_table',1),(37,'2021_05_24_034720_make_column_currency_nullable',1),(38,'2021_05_31_173037_ecommerce_create_ec_products_translations',1),(39,'2021_06_28_153141_correct_slugs_data',1),(40,'2021_07_06_030002_create_marketplace_table',1),(41,'2021_08_02_084121_fix_old_shortcode',1),(42,'2021_08_09_161302_add_metadata_column_to_payments_table',1),(43,'2021_08_17_105016_remove_column_currency_id_in_some_tables',1),(44,'2021_08_30_142128_add_images_column_to_ec_reviews_table',1),(45,'2021_09_01_115151_remove_unused_fields_in_ec_products',1),(46,'2021_09_04_150137_add_vendor_verified_at_to_ec_customers_table',1),(47,'2021_10_04_030050_add_column_created_by_to_table_ec_products',1),(48,'2021_10_04_033903_add_column_approved_by_into_table_ec_products',1),(49,'2021_10_05_122616_add_status_column_to_ec_customers_table',1),(50,'2021_10_06_124943_add_transaction_id_column_to_mp_customer_withdrawals_table',1),(51,'2021_10_10_054216_add_columns_to_mp_customer_revenues_table',1),(52,'2021_10_19_020859_update_metadata_field',1),(53,'2021_10_25_021023_fix-priority-load-for-language-advanced',1),(54,'2021_11_03_025806_nullable_phone_number_in_ec_customer_addresses',1),(55,'2021_11_23_071403_correct_languages_for_product_variations',1),(56,'2021_11_28_031808_add_product_tags_translations',1),(57,'2021_12_01_031123_add_featured_image_to_ec_products',1),(58,'2021_12_02_035301_add_ads_translations_table',1),(59,'2021_12_03_030600_create_blog_translations',1),(60,'2021_12_03_075608_create_page_translations',1),(61,'2021_12_03_082134_create_faq_translations',1),(62,'2021_12_03_084118_create_location_translations',1),(63,'2021_12_03_094518_migrate_old_location_data',1),(64,'2021_12_06_031304_update_table_mp_customer_revenues',1),(65,'2021_12_10_034440_switch_plugin_location_to_use_language_advanced',1),(66,'2022_01_01_033107_update_table_ec_shipments',1),(67,'2022_01_16_085908_improve_plugin_location',1),(68,'2022_02_16_042457_improve_product_attribute_sets',1),(69,'2022_03_22_075758_correct_product_name',1),(70,'2022_04_19_113334_add_index_to_ec_products',1),(71,'2022_04_19_113923_add_index_to_table_posts',1),(72,'2022_04_20_100851_add_index_to_media_table',1),(73,'2022_04_20_101046_add_index_to_menu_table',1),(74,'2022_04_28_144405_remove_unused_table',1),(75,'2022_05_05_115015_create_ec_customer_recently_viewed_products_table',1),(76,'2022_05_18_143720_add_index_to_table_ec_product_categories',1),(77,'2022_06_16_095633_add_index_to_some_tables',1),(78,'2022_06_28_151901_activate_paypal_stripe_plugin',1),(79,'2022_06_30_035148_create_order_referrals_table',1),(80,'2022_07_07_153354_update_charge_id_in_table_payments',1),(81,'2022_07_10_034813_move_lang_folder_to_root',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp_customer_revenues`
--

DROP TABLE IF EXISTS `mp_customer_revenues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mp_customer_revenues` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int unsigned DEFAULT NULL,
  `order_id` int unsigned DEFAULT NULL,
  `sub_amount` decimal(15,2) DEFAULT '0.00',
  `fee` decimal(15,2) unsigned DEFAULT '0.00',
  `amount` decimal(15,2) DEFAULT '0.00',
  `current_balance` decimal(15,2) DEFAULT '0.00',
  `currency` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int unsigned NOT NULL DEFAULT '0',
  `type` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp_customer_revenues`
--

LOCK TABLES `mp_customer_revenues` WRITE;
/*!40000 ALTER TABLE `mp_customer_revenues` DISABLE KEYS */;
INSERT INTO `mp_customer_revenues` VALUES (1,6,7,1066.80,0.00,1066.80,0.00,'USD',NULL,'2022-07-24 16:36:52','2022-07-24 16:36:52',0,NULL),(2,5,9,2031.70,0.00,2031.70,0.00,'USD',NULL,'2022-07-22 20:36:52','2022-07-22 20:36:52',0,NULL),(3,7,16,3712.80,0.00,3712.80,0.00,'USD',NULL,'2022-07-22 12:36:52','2022-07-22 12:36:52',0,NULL),(4,6,17,3175.20,0.00,3175.20,1066.80,'USD',NULL,'2022-07-10 08:36:52','2022-07-10 08:36:52',0,NULL),(5,5,19,884.10,0.00,884.10,2031.70,'USD',NULL,'2022-07-20 08:36:53','2022-07-20 08:36:53',0,NULL),(6,6,21,2534.70,0.00,2534.70,4242.00,'USD',NULL,'2022-07-07 00:36:53','2022-07-07 00:36:53',0,NULL),(7,5,22,878.90,0.00,878.90,2915.80,'USD',NULL,'2022-07-10 00:36:53','2022-07-10 00:36:53',0,NULL),(8,2,23,2697.00,0.00,2697.00,0.00,'USD',NULL,'2022-07-05 08:36:53','2022-07-05 08:36:53',0,NULL),(9,5,24,1763.00,0.00,1763.00,3794.70,'USD',NULL,'2022-07-23 06:36:53','2022-07-23 06:36:53',0,NULL),(10,6,26,2326.80,0.00,2326.80,6776.70,'USD',NULL,'2022-07-11 20:36:54','2022-07-11 20:36:54',0,NULL),(11,3,29,1268.30,0.00,1268.30,0.00,'USD',NULL,'2022-06-30 08:36:54','2022-06-30 08:36:54',0,NULL),(12,6,30,1574.80,0.00,1574.80,9103.50,'USD',NULL,'2022-07-17 14:36:54','2022-07-17 14:36:54',0,NULL),(13,5,35,1677.90,0.00,1677.90,5557.70,'USD',NULL,'2022-07-04 08:36:54','2022-07-04 08:36:54',0,NULL),(14,6,36,2238.20,0.00,2238.20,10678.30,'USD',NULL,'2022-07-16 02:36:55','2022-07-16 02:36:55',0,NULL),(15,5,38,588.50,0.00,588.50,7235.60,'USD',NULL,'2022-07-02 14:36:55','2022-07-02 14:36:55',0,NULL),(16,6,40,1860.00,0.00,1860.00,12916.50,'USD',NULL,'2022-07-04 20:36:55','2022-07-04 20:36:55',0,NULL),(17,3,41,1152.90,0.00,1152.90,1268.30,'USD',NULL,'2022-07-14 20:36:55','2022-07-14 20:36:55',0,NULL),(18,7,43,528.00,0.00,528.00,3712.80,'USD',NULL,'2022-07-03 08:36:56','2022-07-03 08:36:56',0,NULL),(19,5,46,1123.50,0.00,1123.50,7824.10,'USD',NULL,'2022-07-13 14:36:56','2022-07-13 14:36:56',0,NULL),(20,7,49,3992.80,0.00,3992.80,4240.80,'USD',NULL,'2022-07-04 12:36:56','2022-07-04 12:36:56',0,NULL);
/*!40000 ALTER TABLE `mp_customer_revenues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp_customer_withdrawals`
--

DROP TABLE IF EXISTS `mp_customer_withdrawals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mp_customer_withdrawals` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int unsigned DEFAULT NULL,
  `fee` decimal(15,2) unsigned DEFAULT '0.00',
  `amount` decimal(15,2) unsigned DEFAULT '0.00',
  `current_balance` decimal(15,2) unsigned DEFAULT '0.00',
  `currency` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `bank_info` text COLLATE utf8mb4_unicode_ci,
  `payment_channel` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `images` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `transaction_id` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp_customer_withdrawals`
--

LOCK TABLES `mp_customer_withdrawals` WRITE;
/*!40000 ALTER TABLE `mp_customer_withdrawals` DISABLE KEYS */;
INSERT INTO `mp_customer_withdrawals` VALUES (1,2,0.00,573.00,2697.00,'USD','','{\"name\":\"Bradley Bartoletti\",\"number\":\"+13856766361\",\"full_name\":\"Mireya Rowe\",\"description\":\"Ms. Tamara Leannon\"}',NULL,0,'completed',NULL,'2022-07-25 08:36:57','2022-07-25 08:36:57',NULL),(2,2,0.00,47.00,2124.00,'USD','','{\"name\":\"Bradley Bartoletti\",\"number\":\"+13856766361\",\"full_name\":\"Mireya Rowe\",\"description\":\"Ms. Tamara Leannon\"}',NULL,0,'processing',NULL,'2022-07-25 08:36:57','2022-07-25 08:36:57',NULL),(3,2,0.00,257.00,2077.00,'USD','','{\"name\":\"Bradley Bartoletti\",\"number\":\"+13856766361\",\"full_name\":\"Mireya Rowe\",\"description\":\"Ms. Tamara Leannon\"}',NULL,0,'processing',NULL,'2022-07-25 08:36:57','2022-07-25 08:36:57',NULL),(4,2,0.00,522.00,1820.00,'USD','','{\"name\":\"Bradley Bartoletti\",\"number\":\"+13856766361\",\"full_name\":\"Mireya Rowe\",\"description\":\"Ms. Tamara Leannon\"}',NULL,0,'processing',NULL,'2022-07-25 08:36:57','2022-07-25 08:36:57',NULL),(5,3,0.00,677.00,2421.20,'USD','','{\"name\":\"Jarrod Lynch Jr.\",\"number\":\"+16789651219\",\"full_name\":\"Cleveland Jast\",\"description\":\"Adrianna Legros III\"}',NULL,0,'processing',NULL,'2022-07-25 08:36:58','2022-07-25 08:36:58',NULL),(6,3,0.00,268.00,1744.20,'USD','','{\"name\":\"Jarrod Lynch Jr.\",\"number\":\"+16789651219\",\"full_name\":\"Cleveland Jast\",\"description\":\"Adrianna Legros III\"}',NULL,0,'processing',NULL,'2022-07-25 08:36:58','2022-07-25 08:36:58',NULL),(7,5,0.00,1334.00,8947.60,'USD','','{\"name\":\"Prof. Hallie Bartoletti DVM\",\"number\":\"+14083099923\",\"full_name\":\"Archibald Schaden\",\"description\":\"Winfield Schmeler\"}',NULL,0,'processing',NULL,'2022-07-25 08:36:58','2022-07-25 08:36:58',NULL),(8,5,0.00,2228.00,7613.60,'USD','','{\"name\":\"Prof. Hallie Bartoletti DVM\",\"number\":\"+14083099923\",\"full_name\":\"Archibald Schaden\",\"description\":\"Winfield Schmeler\"}',NULL,0,'processing',NULL,'2022-07-25 08:36:58','2022-07-25 08:36:58',NULL),(9,5,0.00,807.00,5385.60,'USD','','{\"name\":\"Prof. Hallie Bartoletti DVM\",\"number\":\"+14083099923\",\"full_name\":\"Archibald Schaden\",\"description\":\"Winfield Schmeler\"}',NULL,0,'processing',NULL,'2022-07-25 08:36:58','2022-07-25 08:36:58',NULL),(10,5,0.00,1057.00,4578.60,'USD','','{\"name\":\"Prof. Hallie Bartoletti DVM\",\"number\":\"+14083099923\",\"full_name\":\"Archibald Schaden\",\"description\":\"Winfield Schmeler\"}',NULL,0,'completed',NULL,'2022-07-25 08:36:59','2022-07-25 08:36:59',NULL),(11,6,0.00,1985.00,14776.50,'USD','','{\"name\":\"Melyssa Gibson Sr.\",\"number\":\"+16144694051\",\"full_name\":\"Dale Toy\",\"description\":\"Mr. Reilly Rath DDS\"}',NULL,0,'processing',NULL,'2022-07-25 08:37:00','2022-07-25 08:37:00',NULL),(12,6,0.00,3178.00,12791.50,'USD','','{\"name\":\"Melyssa Gibson Sr.\",\"number\":\"+16144694051\",\"full_name\":\"Dale Toy\",\"description\":\"Mr. Reilly Rath DDS\"}',NULL,0,'processing',NULL,'2022-07-25 08:37:00','2022-07-25 08:37:00',NULL),(13,7,0.00,2407.00,8233.60,'USD','','{\"name\":\"Dwight Luettgen\",\"number\":\"+16469931830\",\"full_name\":\"Dr. Merlin Swaniawski I\",\"description\":\"Lavinia Heidenreich\"}',NULL,0,'completed',NULL,'2022-07-25 08:37:00','2022-07-25 08:37:00',NULL),(14,7,0.00,955.00,5826.60,'USD','','{\"name\":\"Dwight Luettgen\",\"number\":\"+16469931830\",\"full_name\":\"Dr. Merlin Swaniawski I\",\"description\":\"Lavinia Heidenreich\"}',NULL,0,'completed',NULL,'2022-07-25 08:37:01','2022-07-25 08:37:01',NULL);
/*!40000 ALTER TABLE `mp_customer_withdrawals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp_stores`
--

DROP TABLE IF EXISTS `mp_stores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mp_stores` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` int unsigned DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `vendor_verified_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp_stores`
--

LOCK TABLES `mp_stores` WRITE;
/*!40000 ALTER TABLE `mp_stores` DISABLE KEYS */;
INSERT INTO `mp_stores` VALUES (1,'GoPro','purdy.benny@example.net','+19047945151','12073 Josephine Fields','SY','Arizona','South Dejonview',2,'stores/1.png','Ea dolores et voluptatem harum facilis.','Voluptate rerum ratione rerum non et odio est eum. Officia nisi deserunt mollitia sequi. Pariatur omnis velit modi.','published',NULL,'2022-07-25 08:36:42','2022-07-25 08:36:42'),(2,'Global Office','karianne68@example.org','+16828149779','566 Johnson Vista Suite 425','TT','Alabama','East Johnsonview',3,'stores/2.png','Nihil iure ab enim accusantium et dolorem et.','Non aut quo odit eaque fugiat. Voluptas libero quia et modi nihil est velit. Ut ut animi sint rem non optio.','published',NULL,'2022-07-25 08:36:42','2022-07-25 08:36:42'),(3,'Young Shop','rgleichner@example.org','+15805726345','155 Sporer Pass','NL','Oklahoma','West Lawrence',5,'stores/3.png','Aut ratione ut similique in eius illum molestias.','Aut neque nihil et ab magnam. Ea quos nobis at dignissimos recusandae aut. Eum voluptatem nihil assumenda id beatae necessitatibus.','published',NULL,'2022-07-25 08:36:42','2022-07-25 08:36:42'),(4,'Global Store','altenwerth.gerda@example.net','+14793141265','896 Prohaska Island Apt. 123','BO','New Mexico','North Lucienneshire',6,'stores/4.png','Pariatur voluptatem non odit earum qui cum ab.','In nisi sit natus non et nulla. Ut quisquam dolores dolorem fuga. Aliquam rerum explicabo quia occaecati. Dolor est non totam laboriosam.','published',NULL,'2022-07-25 08:36:42','2022-07-25 08:36:42'),(5,'Robert’s Store','meredith47@example.org','+12837963102','4503 Deangelo Shoals Suite 664','UZ','Kentucky','Haneborough',7,'stores/5.png','Consectetur eveniet sit debitis et.','Amet illo aut voluptas in debitis eveniet ab. Ex quis id voluptas et est laboriosam dolores vel.','published',NULL,'2022-07-25 08:36:42','2022-07-25 08:36:42');
/*!40000 ALTER TABLE `mp_stores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp_vendor_info`
--

DROP TABLE IF EXISTS `mp_vendor_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mp_vendor_info` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int unsigned NOT NULL DEFAULT '0',
  `balance` decimal(15,2) NOT NULL DEFAULT '0.00',
  `total_fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `total_revenue` decimal(15,2) NOT NULL DEFAULT '0.00',
  `signature` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_info` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp_vendor_info`
--

LOCK TABLES `mp_vendor_info` WRITE;
/*!40000 ALTER TABLE `mp_vendor_info` DISABLE KEYS */;
INSERT INTO `mp_vendor_info` VALUES (1,2,1298.00,0.00,2697.00,'$2y$10$ElhrXnl1WhTZL1sejLCKguEOZdk4v5.ebtXtNdBNsNX15QakVdjUC','{\"name\":\"Bradley Bartoletti\",\"number\":\"+13856766361\",\"full_name\":\"Mireya Rowe\",\"description\":\"Ms. Tamara Leannon\"}','2022-07-25 08:36:41','2022-07-25 08:36:58'),(2,3,1476.20,0.00,2421.20,'$2y$10$wLToYDp2Qy3u3OiCotYhzenD/Q33ahWtasuTtvuxXryvY4urhrQvO','{\"name\":\"Jarrod Lynch Jr.\",\"number\":\"+16789651219\",\"full_name\":\"Cleveland Jast\",\"description\":\"Adrianna Legros III\"}','2022-07-25 08:36:41','2022-07-25 08:36:58'),(3,5,3521.60,0.00,8947.60,'$2y$10$oD/AW3PeEVjZxzPQjUlzEOv/hAjLpscrIaImMy9pPGJjkTu8qWRP.','{\"name\":\"Prof. Hallie Bartoletti DVM\",\"number\":\"+14083099923\",\"full_name\":\"Archibald Schaden\",\"description\":\"Winfield Schmeler\"}','2022-07-25 08:36:41','2022-07-25 08:36:59'),(4,6,9613.50,0.00,14776.50,'$2y$10$ydFWIhOpVzzYvoe4vRft..5i8bZ2WPidwLGBfyeYZDJkj7Z6GOveG','{\"name\":\"Melyssa Gibson Sr.\",\"number\":\"+16144694051\",\"full_name\":\"Dale Toy\",\"description\":\"Mr. Reilly Rath DDS\"}','2022-07-25 08:36:41','2022-07-25 08:37:00'),(5,7,4871.60,0.00,8233.60,'$2y$10$KPd/MZhjEAyKtBbZzkts5enEZuUcbnAmhOx99V9/kUmr8SLAIENLu','{\"name\":\"Dwight Luettgen\",\"number\":\"+16469931830\",\"full_name\":\"Dr. Merlin Swaniawski I\",\"description\":\"Lavinia Heidenreich\"}','2022-07-25 08:36:41','2022-07-25 08:37:01');
/*!40000 ALTER TABLE `mp_vendor_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsletters`
--

DROP TABLE IF EXISTS `newsletters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `newsletters` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'subscribed',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsletters`
--

LOCK TABLES `newsletters` WRITE;
/*!40000 ALTER TABLE `newsletters` DISABLE KEYS */;
/*!40000 ALTER TABLE `newsletters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `user_id` int NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_featured` tinyint NOT NULL DEFAULT '0',
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (1,'Home','<div>[simple-slider key=\"home-slider\" ads_1=\"VC2C8Q1UGCBG\" ads_2=\"NBDWRXTSVZ8N\"][/simple-slider]</div><div>[site-features icon1=\"icon-rocket\" title1=\"Free Delivery\" subtitle1=\"For all orders over $99\" icon2=\"icon-sync\" title2=\"90 Days Return\" subtitle2=\"If goods have problems\" icon3=\"icon-credit-card\" title3=\"Secure Payment\" subtitle3=\"100% secure payment\" icon4=\"icon-bubbles\" title4=\"24/7 Support\" subtitle4=\"Dedicated support\" icon5=\"icon-gift\" title5=\"Gift Service\" subtitle5=\"Support gift service\"][/site-features]</div><div>[flash-sale title=\"Deal of the day\" flash_sale_id=\"1\"][/flash-sale]</div><div>[featured-product-categories title=\"Top Categories\"][/featured-product-categories]</div><div>[theme-ads key_1=\"IZ6WU8KUALYD\" key_2=\"ILSFJVYFGCPZ\" key_3=\"ZDOZUZZIU7FT\"][/theme-ads]</div><div>[featured-products title=\"Featured products\"][/featured-products]</div><div>[theme-ads key_1=\"Q9YDUIC9HSWS\" key_2=\"IZ6WU8KUALYE\"][/theme-ads]</div><div>[product-collections title=\"Exclusive Products\"][/product-collections]</div><div>[product-category-products category_id=\"18\"][/product-category-products]</div><div>[download-app title=\"Download Martfury App Now!\" subtitle=\"Shopping fastly and easily more with our app. Get a link to download the app on your phone.\" screenshot=\"general/app.png\" android_app_url=\"https://www.appstore.com\" ios_app_url=\"https://play.google.com/store\"][/download-app]</div><div>[product-category-products category_id=\"23\"][/product-category-products]</div><div>[newsletter-form title=\"Join Our Newsletter Now\" subtitle=\"Subscribe to get information about products and coupons\"][/newsletter-form]</div>',1,NULL,'homepage',0,NULL,'published','2022-07-25 08:36:27','2022-07-25 08:36:27'),(2,'About us','<p>SOMEBODY ought to be otherwise.\"\' \'I think you could keep it to the general conclusion, that wherever you go on? It\'s by far the most curious thing I ask! It\'s always six o\'clock now.\' A bright idea came into her face, and was a little before she gave her answer. \'They\'re done with a round face, and was a paper label, with the Duchess, digging her sharp little chin into Alice\'s head. \'Is that the meeting adjourn, for the pool of tears which she had got its neck nicely straightened out, and was.</p><p>In the very tones of the earth. At last the Mouse, getting up and said, without opening its eyes, for it was a general clapping of hands at this: it was too much pepper in my kitchen AT ALL. Soup does very well to introduce some other subject of conversation. \'Are you--are you fond--of--of dogs?\' The Mouse gave a look askance-- Said he thanked the whiting kindly, but he could think of nothing better to say which), and they walked off together. Alice was not much larger than a pig, my dear,\'.</p><p>I must, I must,\' the King eagerly, and he wasn\'t going to give the hedgehog had unrolled itself, and was a little quicker. \'What a curious dream!\' said Alice, looking down with wonder at the bottom of a candle is like after the others. \'Are their heads downward! The Antipathies, I think--\' (for, you see, as they came nearer, Alice could only see her. She is such a dreadful time.\' So Alice began to repeat it, but her voice sounded hoarse and strange, and the pair of gloves and the great.</p><p>Duchess\'s knee, while plates and dishes crashed around it--once more the pig-baby was sneezing and howling alternately without a cat! It\'s the most confusing thing I ask! It\'s always six o\'clock now.\' A bright idea came into Alice\'s shoulder as he could think of nothing better to say to itself, half to Alice. \'Only a thimble,\' said Alice in a louder tone. \'ARE you to offer it,\' said Alice. \'Come on, then!\' roared the Queen, and in another moment it was just possible it had entirely.</p>',1,NULL,'default',0,NULL,'published','2022-07-25 08:36:27','2022-07-25 08:36:27'),(3,'Terms Of Use','<p>Alice gave a little door about fifteen inches high: she tried to say anything. \'Why,\' said the Mouse. \'Of course,\' the Mock Turtle, \'they--you\'ve seen them, of course?\' \'Yes,\' said Alice to herself, as she ran; but the Dodo could not stand, and she tried the little golden key in the morning, just time to begin again, it was sneezing on the trumpet, and called out in a hot tureen! Who for such a noise inside, no one to listen to me! When I used to say.\' \'So he did, so he did,\' said the King.</p><p>Five. \'I heard the Queen shouted at the Caterpillar\'s making such a noise inside, no one else seemed inclined to say \"HOW DOTH THE LITTLE BUSY BEE,\" but it just grazed his nose, and broke to pieces against one of the well, and noticed that the poor animal\'s feelings. \'I quite forgot how to begin.\' He looked anxiously at the White Rabbit; \'in fact, there\'s nothing written on the shingle--will you come to the Knave. The Knave shook his head off outside,\' the Queen shouted at the bottom of a.</p><p>Hatter began, in a voice she had to double themselves up and beg for its dinner, and all that,\' he said in a dreamy sort of mixed flavour of cherry-tart, custard, pine-apple, roast turkey, toffee, and hot buttered toast,) she very seldom followed it), and handed them round as prizes. There was no time she\'d have everybody executed, all round. \'But she must have been ill.\' \'So they were,\' said the Cat: \'we\'re all mad here. I\'m mad. You\'re mad.\' \'How do you know what it was neither more nor less.</p><p>Alice said very politely, \'if I had it written up somewhere.\' Down, down, down. Would the fall was over. However, when they met in the after-time, be herself a grown woman; and how she was now the right size for ten minutes together!\' \'Can\'t remember WHAT things?\' said the Cat. \'--so long as there was nothing so VERY remarkable in that; nor did Alice think it was,\' he said. (Which he certainly did NOT, being made entirely of cardboard.) \'All right, so far,\' said the King repeated angrily, \'or.</p>',1,NULL,'default',0,NULL,'published','2022-07-25 08:36:28','2022-07-25 08:36:28'),(4,'Terms & Conditions','<p>Mock Turtle with a teacup in one hand and a large canvas bag, which tied up at the mouth with strings: into this they slipped the guinea-pig, head first, and then dipped suddenly down, so suddenly that Alice could see her after the birds! Why, she\'ll eat a little door about fifteen inches high: she tried another question. \'What sort of idea that they were mine before. If I or she fell past it. \'Well!\' thought Alice to herself, and once again the tiny hands were clasped upon her arm, and.</p><p>I\'ll manage better this time,\' she said, \'and see whether it\'s marked \"poison\" or not\'; for she could not even get her head through the little golden key, and when she looked at each other for some time with one finger, as he found it made Alice quite hungry to look at me like a frog; and both creatures hid their faces in their mouths--and they\'re all over crumbs.\' \'You\'re wrong about the games now.\' CHAPTER X. The Lobster Quadrille The Mock Turtle in a long, low hall, which was the fan and.</p><p>Duchess, who seemed to think that will be much the most curious thing I know. Silence all round, if you were or might have been ill.\' \'So they were,\' said the Mock Turtle: \'nine the next, and so on; then, when you\'ve cleared all the first day,\' said the Mock Turtle, and said to Alice; and Alice looked at her, and the arm that was lying on the ground near the entrance of the teacups as the March Hare interrupted in a solemn tone, \'For the Duchess. \'Everything\'s got a moral, if only you can find.</p><p>Gryphon as if he wasn\'t one?\' Alice asked. \'We called him a fish)--and rapped loudly at the March Hare was said to Alice, and she at once set to work very diligently to write this down on one of the other side of the Nile On every golden scale! \'How cheerfully he seems to be a queer thing, to be talking in a twinkling! Half-past one, time for dinner!\' (\'I only wish people knew that: then they wouldn\'t be so kind,\' Alice replied, rather shyly, \'I--I hardly know, sir, just at first, but, after.</p>',1,NULL,'default',0,NULL,'published','2022-07-25 08:36:28','2022-07-25 08:36:28'),(5,'Refund Policy','<p>There\'s no pleasing them!\' Alice was more hopeless than ever: she sat down again into its face was quite a long way. So she began: \'O Mouse, do you want to stay with it as to go near the looking-glass. There was a treacle-well.\' \'There\'s no such thing!\' Alice was not even get her head through the doorway; \'and even if my head would go round and round goes the clock in a melancholy way, being quite unable to move. She soon got it out to her full size by this very sudden change, but she could.</p><p>Caterpillar seemed to have been that,\' said the King: \'however, it may kiss my hand if it thought that she was looking up into the garden. Then she went out, but it is.\' \'Then you shouldn\'t talk,\' said the Duchess: \'what a clear way you have just been reading about; and when she heard was a long tail, certainly,\' said Alice to herself. \'Shy, they seem to come upon them THIS size: why, I should be like then?\' And she went on: \'But why did they draw?\' said Alice, \'it\'s very easy to know your.</p><p>It was all finished, the Owl, as a last resource, she put them into a large ring, with the bread-knife.\' The March Hare moved into the Dormouse\'s place, and Alice guessed in a deep sigh, \'I was a dead silence. \'It\'s a pun!\' the King say in a louder tone. \'ARE you to learn?\' \'Well, there was no use in waiting by the little dears came jumping merrily along hand in hand with Dinah, and saying \"Come up again, dear!\" I shall be punished for it flashed across her mind that she was ever to get in?\'.</p><p>After a time she saw in my life!\' Just as she fell very slowly, for she could not stand, and she did not seem to be\"--or if you\'d rather not.\' \'We indeed!\' cried the Gryphon, and, taking Alice by the Hatter, and here the conversation a little. \'\'Tis so,\' said Alice. \'Nothing WHATEVER?\' persisted the King. Here one of the edge with each hand. \'And now which is which?\' she said to Alice, and she heard it before,\' said the Dormouse, not choosing to notice this last remark, \'it\'s a vegetable. It.</p>',1,NULL,'default',0,NULL,'published','2022-07-25 08:36:28','2022-07-25 08:36:28'),(6,'Blog','<p>---</p>',1,NULL,'blog-sidebar',0,NULL,'published','2022-07-25 08:36:28','2022-07-25 08:36:28'),(7,'FAQs','<div>[faq title=\"Frequently Asked Questions\"][/faq]</div>',1,NULL,'default',0,NULL,'published','2022-07-25 08:36:28','2022-07-25 08:36:28'),(8,'Contact','<div>[google-map]502 New Street, Brighton VIC, Australia[/google-map]</div><div>[contact-info-boxes title=\"Contact Us For Any Questions\"][/contact-info-boxes]</div><div>[contact-form][/contact-form]</div>',1,NULL,'full-width',0,NULL,'published','2022-07-25 08:36:28','2022-07-25 08:36:28'),(9,'Cookie Policy','<h3>EU Cookie Consent</h3><p>To use this Website we are using Cookies and collecting some Data. To be compliant with the EU GDPR we give you to choose if you allow us to use certain Cookies and to collect some Data.</p><h4>Essential Data</h4><p>The Essential Data is needed to run the Site you are visiting technically. You can not deactivate them.</p><p>- Session Cookie: PHP uses a Cookie to identify user sessions. Without this Cookie the Website is not working.</p><p>- XSRF-Token Cookie: Laravel automatically generates a CSRF \"token\" for each active user session managed by the application. This token is used to verify that the authenticated user is the one actually making the requests to the application.</p>',1,NULL,'default',0,NULL,'published','2022-07-25 08:36:28','2022-07-25 08:36:28'),(10,'Affiliate','<p>Duchess said in an undertone, \'important--unimportant--unimportant--important--\' as if he had taken advantage of the e--e--evening, Beautiful, beautiful Soup! Beau--ootiful Soo--oop! Soo--oop of the trial.\' \'Stupid things!\' Alice began in a very hopeful tone though), \'I won\'t indeed!\' said the Gryphon interrupted in a minute. Alice began to say to itself \'Then I\'ll go round and get in at the thought that it might be some sense in your pocket?\' he went on again:-- \'I didn\'t write it, and.</p><p>Please, Ma\'am, is this New Zealand or Australia?\' (and she tried to fancy to cats if you want to go! Let me see: I\'ll give them a new pair of white kid gloves while she was about a whiting before.\' \'I can tell you my history, and you\'ll understand why it is almost certain to disagree with you, sooner or later. However, this bottle was a table in the pictures of him), while the Mouse was swimming away from him, and said nothing. \'When we were little,\' the Mock Turtle. \'And how did you begin?\'.</p><p>Presently the Rabbit whispered in a very decided tone: \'tell her something about the right way of expecting nothing but out-of-the-way things had happened lately, that Alice said; \'there\'s a large fan in the other: the only difficulty was, that if something wasn\'t done about it just missed her. Alice caught the flamingo and brought it back, the fight was over, and she thought it over here,\' said the Dormouse, and repeated her question. \'Why did they draw?\' said Alice, a little shriek and a.</p><p>Shakespeare, in the air. \'--as far out to the beginning again?\' Alice ventured to ask. \'Suppose we change the subject of conversation. \'Are you--are you fond--of--of dogs?\' The Mouse only growled in reply. \'Please come back with the bones and the m--\' But here, to Alice\'s side as she wandered about in the middle, wondering how she would have appeared to them she heard a little nervous about this; \'for it might be hungry, in which you usually see Shakespeare, in the sand with wooden spades.</p>',1,NULL,'default',0,NULL,'published','2022-07-25 08:36:28','2022-07-25 08:36:28'),(11,'Career','<p>March Hare said--\' \'I didn\'t!\' the March Hare. \'Sixteenth,\' added the Hatter, who turned pale and fidgeted. \'Give your evidence,\' the King said to Alice, she went on, half to Alice. \'Only a thimble,\' said Alice sharply, for she thought, \'and hand round the neck of the trees as well say,\' added the March Hare. \'It was the King; and the great puzzle!\' And she thought it over a little bit, and said to herself, and fanned herself with one finger pressed upon its forehead (the position in which.</p><p>Hatter. \'You might just as well. The twelve jurors were all turning into little cakes as they all cheered. Alice thought to herself as she leant against a buttercup to rest her chin in salt water. Her first idea was that it was only sobbing,\' she thought, \'till its ears have come, or at least one of its little eyes, but it all is! I\'ll try if I must, I must,\' the King put on his knee, and the Queen, tossing her head was so ordered about by mice and rabbits. I almost wish I\'d gone to see it.</p><p>MUST be more to do this, so she bore it as a cushion, resting their elbows on it, (\'which certainly was not here before,\' said Alice,) and round Alice, every now and then turned to the Knave of Hearts, and I shall think nothing of tumbling down stairs! How brave they\'ll all think me for asking! No, it\'ll never do to hold it. As soon as she went on, \'and most things twinkled after that--only the March Hare said--\' \'I didn\'t!\' the March Hare and the other players, and shouting \'Off with her head.</p><p>The question is, what?\' The great question certainly was, what? Alice looked up, and began talking to herself, and once she remembered trying to find any. And yet you incessantly stand on their faces, and the little door: but, alas! either the locks were too large, or the key was lying on the hearth and grinning from ear to ear. \'Please would you tell me, please, which way it was the same as they came nearer, Alice could speak again. In a minute or two. \'They couldn\'t have done that?\' she.</p>',1,NULL,'default',0,NULL,'published','2022-07-25 08:36:28','2022-07-25 08:36:28'),(12,'Coming soon','<p>Condimentum ipsum a adipiscing hac dolor set consectetur urna commodo elit parturient <br/>molestie ut nisl partu convallier ullamcorpe.</p><div>[coming-soon time=\"December 30, 2022 15:37:25\" image=\"general/coming-soon.jpg\"][/coming-soon]</div>',1,NULL,'coming-soon',0,NULL,'published','2022-07-25 08:36:28','2022-07-25 08:36:28');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages_translations`
--

DROP TABLE IF EXISTS `pages_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pages_id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`pages_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages_translations`
--

LOCK TABLES `pages_translations` WRITE;
/*!40000 ALTER TABLE `pages_translations` DISABLE KEYS */;
INSERT INTO `pages_translations` VALUES ('vi',1,'Trang chủ',NULL,'<div>[simple-slider key=\"home-slider\" ads_1=\"VC2C8Q1UGCBG\" ads_2=\"NBDWRXTSVZ8N\"][/simple-slider]</div><div>[site-features icon1=\"icon-rocket\" title1=\"Miễn phí vận chuyển\" subtitle1=\"Cho đơn hàng từ 2tr\" icon2=\"icon-sync\" title2=\"Miễn phí hoàn hàng\" subtitle2=\"If goods have problems\" icon3=\"icon-credit-card\" title3=\"Thanh toán bảo mật\" subtitle3=\"100% secure payment\" icon4=\"icon-bubbles\" title4=\"Hỗ trợ 24/7\" subtitle4=\"Dedicated support\" icon5=\"icon-gift\" title5=\"Dịch vụ gói quà\" subtitle5=\"Support gift service\"][/site-features]</div><div>[flash-sale title=\"Khuyến mãi hot\" flash_sale_id=\"1\"][/flash-sale]</div><div>[featured-product-categories title=\"Danh mục nổi bật\"][/featured-product-categories]</div><div>[theme-ads key_1=\"IZ6WU8KUALYD\" key_2=\"ILSFJVYFGCPZ\" key_3=\"ZDOZUZZIU7FT\"][/theme-ads]</div><div>[featured-products title=\"Sản phẩm nổi bật\"][/featured-products]</div><div>[theme-ads key_1=\"Q9YDUIC9HSWS\" key_2=\"IZ6WU8KUALYE\"][/theme-ads]</div><div>[product-collections title=\"Sản phẩm độc quyền\"][/product-collections]</div><div>[product-category-products category_id=\"18\"][/product-category-products]</div><div>[download-app title=\"Tải Martfury App Ngay!\" subtitle=\"Mua sắm nhanh chóng và dễ dàng hơn với ứng dụng của chúng tôi. Nhận liên kết để tải xuống ứng dụng trên điện thoại của bạn.\" screenshot=\"general/app.png\" android_app_url=\"https://www.appstore.com\" ios_app_url=\"https://play.google.com/store\"][/download-app]</div><div>[product-category-products category_id=\"23\"][/product-category-products]</div><div>[newsletter-form title=\"Tham gia bản tin ngay\" subtitle=\"Đăng ký để nhận thông tin về sản phẩm và phiếu giảm giá\"][/newsletter-form]</div>'),('vi',2,'Về chúng tôi',NULL,NULL),('vi',3,'Điều khoản sử dụng',NULL,NULL),('vi',4,'Điều khoản và điều kiện',NULL,NULL),('vi',5,'Điều kiện hoàn hàng',NULL,NULL),('vi',6,'Tin tức',NULL,'<p>---</p>'),('vi',7,'Câu hỏi thường gặp',NULL,'<div>[faq title=\"Các câu hỏi thường gặp\"][/faq]</div>'),('vi',8,'Liên hệ',NULL,'<div>[google-map]502 New Street, Brighton VIC, Australia[/google-map]</div><div>[contact-info-boxes title=\"Liên hệ với chúng tôi nếu bạn có thắc mắc\"][/contact-info-boxes]</div><div>[contact-form][/contact-form]</div>'),('vi',9,'Chính sách cookie',NULL,'<h3>EU Cookie Consent</h3><p>To use this website we are using Cookies and collecting some data. To be compliant with the EU GDPR we give you to choose if you allow us to use certain Cookies and to collect some Data.</p><h4>Essential Data</h4><p>The Essential Data is needed to run the Site you are visiting technically. You can not deactivate them.</p><p>- Session Cookie: PHP uses a Cookie to identify user sessions. Without this Cookie the Website is not working.</p><p>- XSRF-Token Cookie: Laravel automatically generates a CSRF \"token\" for each active user session managed by the application. This token is used to verify that the authenticated user is the one actually making the requests to the application.</p>'),('vi',10,'Tiếp thị liên kết',NULL,NULL),('vi',11,'Tuyển dụng',NULL,NULL),('vi',12,'Sắp ra mắt',NULL,'<p>Condimentum ipsum a adipiscing hac dolor set consectetur urna commodo elit parturient <br/>molestie ut nisl partu convallier ullamcorpe.</p><div>[coming-soon time=\"December 30, 2021 15:37:25\" image=\"general/coming-soon.jpg\"][/coming-soon]</div>');
/*!40000 ALTER TABLE `pages_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `currency` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int unsigned NOT NULL DEFAULT '0',
  `charge_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_channel` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(15,2) unsigned NOT NULL,
  `order_id` int unsigned DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT 'pending',
  `payment_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'confirm',
  `customer_id` int unsigned DEFAULT NULL,
  `refunded_amount` decimal(15,2) unsigned DEFAULT NULL,
  `refund_note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `customer_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `metadata` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,'USD',0,'RPD4L91KBB','paystack',NULL,22.00,1,'completed','confirm',4,NULL,NULL,'2022-07-25 08:36:44','2022-07-25 08:36:44','Botble\\Ecommerce\\Models\\Customer',NULL),(2,'USD',0,'1WHONF3NEP','cod',NULL,2120.50,2,'pending','confirm',4,NULL,NULL,'2022-07-25 08:36:44','2022-07-25 08:36:44','Botble\\Ecommerce\\Models\\Customer',NULL),(3,'USD',0,'PFP5LPJQXW','paypal',NULL,1860.00,3,'completed','confirm',4,NULL,NULL,'2022-07-25 08:36:45','2022-07-25 08:36:45','Botble\\Ecommerce\\Models\\Customer',NULL),(4,'USD',0,'RVCR6T8NCE','paypal',NULL,595.10,4,'completed','confirm',8,NULL,NULL,'2022-07-25 08:36:45','2022-07-25 08:36:45','Botble\\Ecommerce\\Models\\Customer',NULL),(5,'USD',0,'VHANIY93U6','bank_transfer',NULL,3428.60,5,'pending','confirm',8,NULL,NULL,'2022-07-25 08:36:45','2022-07-25 08:36:45','Botble\\Ecommerce\\Models\\Customer',NULL),(6,'USD',0,'E5LFOCMLKX','sslcommerz',NULL,1699.10,6,'completed','confirm',9,NULL,NULL,'2022-07-25 08:36:45','2022-07-25 08:36:45','Botble\\Ecommerce\\Models\\Customer',NULL),(7,'USD',0,'PJ57WZRKSK','stripe',NULL,1066.80,7,'completed','confirm',9,NULL,NULL,'2022-07-25 08:36:45','2022-07-25 08:36:45','Botble\\Ecommerce\\Models\\Customer',NULL),(8,'USD',0,'ELMWZLQUMI','cod',NULL,2534.70,8,'pending','confirm',9,NULL,NULL,'2022-07-25 08:36:45','2022-07-25 08:36:45','Botble\\Ecommerce\\Models\\Customer',NULL),(9,'USD',0,'NURKTCHH1Y','stripe',NULL,2031.70,9,'completed','confirm',9,NULL,NULL,'2022-07-25 08:36:46','2022-07-25 08:36:46','Botble\\Ecommerce\\Models\\Customer',NULL),(10,'USD',0,'QY1HSVHZ8R','razorpay',NULL,44.55,10,'completed','confirm',10,NULL,NULL,'2022-07-25 08:36:46','2022-07-25 08:36:46','Botble\\Ecommerce\\Models\\Customer',NULL),(11,'USD',0,'KBHEP2ONQC','bank_transfer',NULL,1574.80,11,'pending','confirm',10,NULL,NULL,'2022-07-25 08:36:46','2022-07-25 08:36:46','Botble\\Ecommerce\\Models\\Customer',NULL),(12,'USD',0,'VFQFPHRWFH','sslcommerz',NULL,248.78,12,'completed','confirm',1,NULL,NULL,'2022-07-25 08:36:46','2022-07-25 08:36:46','Botble\\Ecommerce\\Models\\Customer',NULL),(13,'USD',0,'3C6HJ3EVF2','cod',NULL,1136.10,13,'pending','confirm',1,NULL,NULL,'2022-07-25 08:36:46','2022-07-25 08:36:46','Botble\\Ecommerce\\Models\\Customer',NULL),(14,'USD',0,'EE5WFPWPUP','mollie',NULL,660.00,14,'completed','confirm',1,NULL,NULL,'2022-07-25 08:36:46','2022-07-25 08:36:46','Botble\\Ecommerce\\Models\\Customer',NULL),(15,'USD',0,'F4WSECS0M6','paypal',NULL,62.00,15,'completed','confirm',4,NULL,NULL,'2022-07-25 08:36:46','2022-07-25 08:36:46','Botble\\Ecommerce\\Models\\Customer',NULL),(16,'USD',0,'QVWDWWPJPA','mollie',NULL,3712.80,16,'completed','confirm',4,NULL,NULL,'2022-07-25 08:36:47','2022-07-25 08:36:47','Botble\\Ecommerce\\Models\\Customer',NULL),(17,'USD',0,'N5GHYBT7RP','stripe',NULL,3175.20,17,'completed','confirm',4,NULL,NULL,'2022-07-25 08:36:47','2022-07-25 08:36:47','Botble\\Ecommerce\\Models\\Customer',NULL),(18,'USD',0,'5XADEIMKGG','cod',NULL,558.80,18,'pending','confirm',8,NULL,NULL,'2022-07-25 08:36:47','2022-07-25 08:36:47','Botble\\Ecommerce\\Models\\Customer',NULL),(19,'USD',0,'8QNPSXXNNT','stripe',NULL,884.10,19,'completed','confirm',8,NULL,NULL,'2022-07-25 08:36:47','2022-07-25 08:36:47','Botble\\Ecommerce\\Models\\Customer',NULL),(20,'USD',0,'HPQDT6EBE1','cod',NULL,2421.30,20,'pending','confirm',9,NULL,NULL,'2022-07-25 08:36:47','2022-07-25 08:36:47','Botble\\Ecommerce\\Models\\Customer',NULL),(21,'USD',0,'SWVHEO3I3O','paypal',NULL,2534.70,21,'completed','confirm',9,NULL,NULL,'2022-07-25 08:36:47','2022-07-25 08:36:47','Botble\\Ecommerce\\Models\\Customer',NULL),(22,'USD',0,'LCTN4RBDMD','paystack',NULL,878.90,22,'completed','confirm',9,NULL,NULL,'2022-07-25 08:36:48','2022-07-25 08:36:48','Botble\\Ecommerce\\Models\\Customer',NULL),(23,'USD',0,'5OJK5DG8XU','paystack',NULL,2697.00,23,'completed','confirm',4,NULL,NULL,'2022-07-25 08:36:48','2022-07-25 08:36:48','Botble\\Ecommerce\\Models\\Customer',NULL),(24,'USD',0,'SLLSWIYB2R','paystack',NULL,1763.00,24,'completed','confirm',4,NULL,NULL,'2022-07-25 08:36:48','2022-07-25 08:36:48','Botble\\Ecommerce\\Models\\Customer',NULL),(25,'USD',0,'QZHONCKS0T','bank_transfer',NULL,2421.30,25,'pending','confirm',10,NULL,NULL,'2022-07-25 08:36:48','2022-07-25 08:36:48','Botble\\Ecommerce\\Models\\Customer',NULL),(26,'USD',0,'ZGUPXB4XPP','stripe',NULL,2326.80,26,'completed','confirm',10,NULL,NULL,'2022-07-25 08:36:49','2022-07-25 08:36:49','Botble\\Ecommerce\\Models\\Customer',NULL),(27,'USD',0,'F4STSEMVU0','paystack',NULL,1305.10,27,'completed','confirm',10,NULL,NULL,'2022-07-25 08:36:49','2022-07-25 08:36:49','Botble\\Ecommerce\\Models\\Customer',NULL),(28,'USD',0,'WV5MDWQCAU','bank_transfer',NULL,2093.10,28,'pending','confirm',4,NULL,NULL,'2022-07-25 08:36:49','2022-07-25 08:36:49','Botble\\Ecommerce\\Models\\Customer',NULL),(29,'USD',0,'ZQN2KE4H0Z','paypal',NULL,1268.30,29,'completed','confirm',4,NULL,NULL,'2022-07-25 08:36:49','2022-07-25 08:36:49','Botble\\Ecommerce\\Models\\Customer',NULL),(30,'USD',0,'24FF9A52TN','mollie',NULL,1574.80,30,'completed','confirm',4,NULL,NULL,'2022-07-25 08:36:49','2022-07-25 08:36:49','Botble\\Ecommerce\\Models\\Customer',NULL),(31,'USD',0,'JTAQCWEQIQ','paypal',NULL,1827.00,31,'completed','confirm',9,NULL,NULL,'2022-07-25 08:36:49','2022-07-25 08:36:49','Botble\\Ecommerce\\Models\\Customer',NULL),(32,'USD',0,'TO9XZYWYAU','cod',NULL,603.90,32,'pending','confirm',9,NULL,NULL,'2022-07-25 08:36:49','2022-07-25 08:36:49','Botble\\Ecommerce\\Models\\Customer',NULL),(33,'USD',0,'HUDZGO2XS1','paypal',NULL,2476.90,33,'completed','confirm',9,NULL,NULL,'2022-07-25 08:36:49','2022-07-25 08:36:49','Botble\\Ecommerce\\Models\\Customer',NULL),(34,'USD',0,'MAKPSKF5JM','mollie',NULL,88.28,34,'completed','confirm',9,NULL,NULL,'2022-07-25 08:36:49','2022-07-25 08:36:49','Botble\\Ecommerce\\Models\\Customer',NULL),(35,'USD',0,'BLXIN1SZVE','stripe',NULL,1677.90,35,'completed','confirm',9,NULL,NULL,'2022-07-25 08:36:50','2022-07-25 08:36:50','Botble\\Ecommerce\\Models\\Customer',NULL),(36,'USD',0,'CTIVELXRLH','paypal',NULL,2238.20,36,'completed','confirm',9,NULL,NULL,'2022-07-25 08:36:50','2022-07-25 08:36:50','Botble\\Ecommerce\\Models\\Customer',NULL),(37,'USD',0,'YYKWD46LQO','cod',NULL,1677.10,37,'pending','confirm',8,NULL,NULL,'2022-07-25 08:36:50','2022-07-25 08:36:50','Botble\\Ecommerce\\Models\\Customer',NULL),(38,'USD',0,'SPGYI5K05B','razorpay',NULL,588.50,38,'completed','confirm',8,NULL,NULL,'2022-07-25 08:36:50','2022-07-25 08:36:50','Botble\\Ecommerce\\Models\\Customer',NULL),(39,'USD',0,'GMDAW2N59C','cod',NULL,957.00,39,'pending','confirm',4,NULL,NULL,'2022-07-25 08:36:50','2022-07-25 08:36:50','Botble\\Ecommerce\\Models\\Customer',NULL),(40,'USD',0,'UREMDYHBZX','stripe',NULL,1860.00,40,'completed','confirm',4,NULL,NULL,'2022-07-25 08:36:50','2022-07-25 08:36:50','Botble\\Ecommerce\\Models\\Customer',NULL),(41,'USD',0,'GQEU6APXC2','sslcommerz',NULL,1152.90,41,'completed','confirm',4,NULL,NULL,'2022-07-25 08:36:50','2022-07-25 08:36:50','Botble\\Ecommerce\\Models\\Customer',NULL),(42,'USD',0,'STSLRRRJTL','bank_transfer',NULL,2704.80,42,'pending','confirm',4,NULL,NULL,'2022-07-25 08:36:51','2022-07-25 08:36:51','Botble\\Ecommerce\\Models\\Customer',NULL),(43,'USD',0,'O4LSPRUITV','paypal',NULL,528.00,43,'completed','confirm',8,NULL,NULL,'2022-07-25 08:36:51','2022-07-25 08:36:51','Botble\\Ecommerce\\Models\\Customer',NULL),(44,'USD',0,'0FE03ZIN6D','paypal',NULL,1726.80,44,'completed','confirm',8,NULL,NULL,'2022-07-25 08:36:51','2022-07-25 08:36:51','Botble\\Ecommerce\\Models\\Customer',NULL),(45,'USD',0,'LOF5ELGIKB','paystack',NULL,1677.10,45,'completed','confirm',8,NULL,NULL,'2022-07-25 08:36:51','2022-07-25 08:36:51','Botble\\Ecommerce\\Models\\Customer',NULL),(46,'USD',0,'S8HQ4JTHA8','razorpay',NULL,1123.50,46,'completed','confirm',8,NULL,NULL,'2022-07-25 08:36:51','2022-07-25 08:36:51','Botble\\Ecommerce\\Models\\Customer',NULL),(47,'USD',0,'AXNSDI7MTI','bank_transfer',NULL,603.90,47,'pending','confirm',8,NULL,NULL,'2022-07-25 08:36:51','2022-07-25 08:36:51','Botble\\Ecommerce\\Models\\Customer',NULL),(48,'USD',0,'3XOJQZGJXW','stripe',NULL,1568.60,48,'completed','confirm',9,NULL,NULL,'2022-07-25 08:36:51','2022-07-25 08:36:51','Botble\\Ecommerce\\Models\\Customer',NULL),(49,'USD',0,'GZZF57A4DG','sslcommerz',NULL,3992.80,49,'completed','confirm',9,NULL,NULL,'2022-07-25 08:36:52','2022-07-25 08:36:52','Botble\\Ecommerce\\Models\\Customer',NULL);
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_categories`
--

DROP TABLE IF EXISTS `post_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int unsigned NOT NULL,
  `post_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_categories`
--

LOCK TABLES `post_categories` WRITE;
/*!40000 ALTER TABLE `post_categories` DISABLE KEYS */;
INSERT INTO `post_categories` VALUES (1,2,1),(2,3,1),(3,1,2),(4,4,2),(5,1,3),(6,3,3),(7,1,4),(8,3,4),(9,1,5),(10,4,5),(11,1,6),(12,4,6),(13,2,7),(14,4,7),(15,1,8),(16,4,8),(17,2,9),(18,3,9),(19,1,10),(20,3,10),(21,2,11),(22,3,11);
/*!40000 ALTER TABLE `post_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_tags`
--

DROP TABLE IF EXISTS `post_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_tags` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tag_id` int unsigned NOT NULL,
  `post_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_tags`
--

LOCK TABLES `post_tags` WRITE;
/*!40000 ALTER TABLE `post_tags` DISABLE KEYS */;
INSERT INTO `post_tags` VALUES (1,1,1),(2,2,1),(3,3,1),(4,4,1),(5,5,1),(6,1,2),(7,2,2),(8,3,2),(9,4,2),(10,5,2),(11,1,3),(12,2,3),(13,3,3),(14,4,3),(15,5,3),(16,1,4),(17,2,4),(18,3,4),(19,4,4),(20,5,4),(21,1,5),(22,2,5),(23,3,5),(24,4,5),(25,5,5),(26,1,6),(27,2,6),(28,3,6),(29,4,6),(30,5,6),(31,1,7),(32,2,7),(33,3,7),(34,4,7),(35,5,7),(36,1,8),(37,2,8),(38,3,8),(39,4,8),(40,5,8),(41,1,9),(42,2,9),(43,3,9),(44,4,9),(45,5,9),(46,1,10),(47,2,10),(48,3,10),(49,4,10),(50,5,10),(51,1,11),(52,2,11),(53,3,11),(54,4,11),(55,5,11);
/*!40000 ALTER TABLE `post_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `author_id` int NOT NULL,
  `author_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `is_featured` tinyint unsigned NOT NULL DEFAULT '0',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `views` int unsigned NOT NULL DEFAULT '0',
  `format_type` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `author_id` (`author_id`),
  KEY `author_type` (`author_type`),
  KEY `created_at` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'4 Expert Tips On How To Choose The Right Men’s Wallet','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n','published',1,'Botble\\ACL\\Models\\User',1,'news/1.jpg',2064,NULL,'2022-07-25 08:36:22','2022-07-25 08:36:22'),(2,'Sexy Clutches: How to Buy & Wear a Designer Clutch Bag','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n','published',1,'Botble\\ACL\\Models\\User',1,'news/2.jpg',154,NULL,'2022-07-25 08:36:22','2022-07-25 08:36:22'),(3,'The Top 2020 Handbag Trends to Know','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n','published',1,'Botble\\ACL\\Models\\User',1,'news/3.jpg',1314,NULL,'2022-07-25 08:36:22','2022-07-25 08:36:22'),(4,'How to Match the Color of Your Handbag With an Outfit','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n','published',1,'Botble\\ACL\\Models\\User',1,'news/4.jpg',1999,NULL,'2022-07-25 08:36:22','2022-07-25 08:36:22'),(5,'How to Care for Leather Bags','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n','published',1,'Botble\\ACL\\Models\\User',1,'news/5.jpg',1087,NULL,'2022-07-25 08:36:22','2022-07-25 08:36:22'),(6,'We\'re Crushing Hard on Summer\'s 10 Biggest Bag Trends','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n','published',1,'Botble\\ACL\\Models\\User',1,'news/6.jpg',1645,NULL,'2022-07-25 08:36:22','2022-07-25 08:36:22'),(7,'Essential Qualities of Highly Successful Music','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n','published',1,'Botble\\ACL\\Models\\User',1,'news/7.jpg',1405,NULL,'2022-07-25 08:36:22','2022-07-25 08:36:22'),(8,'9 Things I Love About Shaving My Head','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n','published',1,'Botble\\ACL\\Models\\User',1,'news/8.jpg',2374,NULL,'2022-07-25 08:36:22','2022-07-25 08:36:22'),(9,'Why Teamwork Really Makes The Dream Work','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n','published',1,'Botble\\ACL\\Models\\User',1,'news/9.jpg',1897,NULL,'2022-07-25 08:36:22','2022-07-25 08:36:22'),(10,'The World Caters to Average People','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n','published',1,'Botble\\ACL\\Models\\User',1,'news/10.jpg',1346,NULL,'2022-07-25 08:36:22','2022-07-25 08:36:22'),(11,'The litigants on the screen are not actors','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n','published',1,'Botble\\ACL\\Models\\User',0,'news/11.jpg',2103,NULL,'2022-07-25 08:36:22','2022-07-25 08:36:22');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts_translations`
--

DROP TABLE IF EXISTS `posts_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `posts_id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`posts_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts_translations`
--

LOCK TABLES `posts_translations` WRITE;
/*!40000 ALTER TABLE `posts_translations` DISABLE KEYS */;
INSERT INTO `posts_translations` VALUES ('vi',1,'4 Lời khuyên của Chuyên gia về Cách Chọn Ví Nam Phù hợp','Bạn nên chú ý hơn khi chọn ví. Có rất nhiều trong số chúng trên thị trường với các mẫu mã và phong cách khác nhau. Khi bạn lựa chọn cẩn thận, bạn sẽ có thể mua một chiếc ví phù hợp với nhu cầu của bạn. Chưa kể nó sẽ giúp nâng tầm phong cách của bạn một cách đáng kể.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n'),('vi',2,'Sexy Clutches: Cách Mua & Đeo Túi Clutch Thiết kế','Bạn nên chú ý hơn khi chọn ví. Có rất nhiều trong số chúng trên thị trường với các mẫu mã và phong cách khác nhau. Khi bạn lựa chọn cẩn thận, bạn sẽ có thể mua một chiếc ví phù hợp với nhu cầu của bạn. Chưa kể nó sẽ giúp nâng tầm phong cách của bạn một cách đáng kể.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n'),('vi',3,'Xu hướng túi xách hàng đầu năm 2020 cần biết','Bạn nên chú ý hơn khi chọn ví. Có rất nhiều trong số chúng trên thị trường với các mẫu mã và phong cách khác nhau. Khi bạn lựa chọn cẩn thận, bạn sẽ có thể mua một chiếc ví phù hợp với nhu cầu của bạn. Chưa kể nó sẽ giúp nâng tầm phong cách của bạn một cách đáng kể.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n'),('vi',4,'Cách Phối Màu Túi Xách Của Bạn Với Trang Phục','Bạn nên chú ý hơn khi chọn ví. Có rất nhiều trong số chúng trên thị trường với các mẫu mã và phong cách khác nhau. Khi bạn lựa chọn cẩn thận, bạn sẽ có thể mua một chiếc ví phù hợp với nhu cầu của bạn. Chưa kể nó sẽ giúp nâng tầm phong cách của bạn một cách đáng kể.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n'),('vi',5,'Cách Chăm sóc Túi Da','Bạn nên chú ý hơn khi chọn ví. Có rất nhiều trong số chúng trên thị trường với các mẫu mã và phong cách khác nhau. Khi bạn lựa chọn cẩn thận, bạn sẽ có thể mua một chiếc ví phù hợp với nhu cầu của bạn. Chưa kể nó sẽ giúp nâng tầm phong cách của bạn một cách đáng kể.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n'),('vi',6,'Chúng tôi đang nghiền ngẫm 10 xu hướng túi lớn nhất của mùa hè','Bạn nên chú ý hơn khi chọn ví. Có rất nhiều trong số chúng trên thị trường với các mẫu mã và phong cách khác nhau. Khi bạn lựa chọn cẩn thận, bạn sẽ có thể mua một chiếc ví phù hợp với nhu cầu của bạn. Chưa kể nó sẽ giúp nâng tầm phong cách của bạn một cách đáng kể.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n'),('vi',7,'Những phẩm chất cần thiết của âm nhạc thành công cao','Bạn nên chú ý hơn khi chọn ví. Có rất nhiều trong số chúng trên thị trường với các mẫu mã và phong cách khác nhau. Khi bạn lựa chọn cẩn thận, bạn sẽ có thể mua một chiếc ví phù hợp với nhu cầu của bạn. Chưa kể nó sẽ giúp nâng tầm phong cách của bạn một cách đáng kể.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n'),('vi',8,'9 điều tôi thích khi cạo đầu','Bạn nên chú ý hơn khi chọn ví. Có rất nhiều trong số chúng trên thị trường với các mẫu mã và phong cách khác nhau. Khi bạn lựa chọn cẩn thận, bạn sẽ có thể mua một chiếc ví phù hợp với nhu cầu của bạn. Chưa kể nó sẽ giúp nâng tầm phong cách của bạn một cách đáng kể.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n'),('vi',9,'Tại sao làm việc theo nhóm thực sự biến giấc mơ thành công','Bạn nên chú ý hơn khi chọn ví. Có rất nhiều trong số chúng trên thị trường với các mẫu mã và phong cách khác nhau. Khi bạn lựa chọn cẩn thận, bạn sẽ có thể mua một chiếc ví phù hợp với nhu cầu của bạn. Chưa kể nó sẽ giúp nâng tầm phong cách của bạn một cách đáng kể.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n'),('vi',10,'Thế giới phục vụ cho những người trung bình','Bạn nên chú ý hơn khi chọn ví. Có rất nhiều trong số chúng trên thị trường với các mẫu mã và phong cách khác nhau. Khi bạn lựa chọn cẩn thận, bạn sẽ có thể mua một chiếc ví phù hợp với nhu cầu của bạn. Chưa kể nó sẽ giúp nâng tầm phong cách của bạn một cách đáng kể.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n'),('vi',11,'Các đương sự trên màn hình không phải là diễn viên','Bạn nên chú ý hơn khi chọn ví. Có rất nhiều trong số chúng trên thị trường với các mẫu mã và phong cách khác nhau. Khi bạn lựa chọn cẩn thận, bạn sẽ có thể mua một chiếc ví phù hợp với nhu cầu của bạn. Chưa kể nó sẽ giúp nâng tầm phong cách của bạn một cách đáng kể.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n');
/*!40000 ALTER TABLE `posts_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `revisions`
--

DROP TABLE IF EXISTS `revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `revisions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `revisionable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revisionable_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `old_value` text COLLATE utf8mb4_unicode_ci,
  `new_value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `revisions_revisionable_id_revisionable_type_index` (`revisionable_id`,`revisionable_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revisions`
--

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;
/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_users`
--

DROP TABLE IF EXISTS `role_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `role_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_users_user_id_index` (`user_id`),
  KEY `role_users_role_id_index` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_users`
--

LOCK TABLES `role_users` WRITE;
/*!40000 ALTER TABLE `role_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `created_by` int unsigned NOT NULL,
  `updated_by` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_slug_unique` (`slug`),
  KEY `roles_created_by_index` (`created_by`),
  KEY `roles_updated_by_index` (`updated_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=194 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'activated_plugins','[\"language\",\"language-advanced\",\"ads\",\"analytics\",\"audit-log\",\"backup\",\"blog\",\"captcha\",\"contact\",\"cookie-consent\",\"ecommerce\",\"faq\",\"location\",\"marketplace\",\"newsletter\",\"payment\",\"paypal\",\"paystack\",\"razorpay\",\"simple-slider\",\"social-login\",\"sslcommerz\",\"stripe\",\"translation\",\"mollie\"]',NULL,NULL),(6,'simple_slider_using_assets','0',NULL,NULL),(8,'permalink-botble-blog-models-post','blog',NULL,NULL),(9,'permalink-botble-blog-models-category','blog',NULL,NULL),(14,'plugins_ecommerce_customer_new_order_status','0',NULL,NULL),(15,'plugins_ecommerce_admin_new_order_status','0',NULL,NULL),(23,'theme','martfury',NULL,NULL),(24,'admin_logo','general/logo-light.png',NULL,NULL),(98,'language_hide_default','1',NULL,NULL),(99,'language_switcher_display','dropdown',NULL,NULL),(100,'language_display','all',NULL,NULL),(101,'language_hide_languages','[]',NULL,NULL),(103,'media_random_hash','d0904a510f5cb0fc1d26f506ff801af5',NULL,NULL),(104,'payment_cod_status','1',NULL,NULL),(105,'payment_cod_description','Please pay money directly to the postman, if you choose cash on delivery method (COD).',NULL,NULL),(106,'payment_bank_transfer_status','1',NULL,NULL),(107,'payment_bank_transfer_description','Please send money to our bank account: ACB - 1990 8422 19.',NULL,NULL),(108,'ecommerce_load_countries_states_cities_from_location_plugin','0',NULL,NULL),(113,'ecommerce_store_name','Martfury',NULL,NULL),(114,'ecommerce_store_phone','1800979769',NULL,NULL),(115,'ecommerce_store_address','502 New Street',NULL,NULL),(116,'ecommerce_store_state','Brighton VIC',NULL,NULL),(117,'ecommerce_store_city','Brighton VIC',NULL,NULL),(118,'ecommerce_store_country','AU',NULL,NULL),(119,'theme-martfury-site_title','Martfury - Laravel Ecommerce system',NULL,NULL),(120,'theme-martfury-copyright','© 2022 Martfury. All Rights Reserved.',NULL,NULL),(121,'theme-martfury-favicon','general/favicon.png',NULL,NULL),(122,'theme-martfury-logo','general/logo.png',NULL,NULL),(123,'theme-martfury-welcome_message','Welcome to Martfury Online Shopping Store!',NULL,NULL),(124,'theme-martfury-address','502 New Street, Brighton VIC, Australia',NULL,NULL),(125,'theme-martfury-hotline','1800 97 97 69',NULL,NULL),(126,'theme-martfury-email','contact@martfury.co',NULL,NULL),(127,'theme-martfury-payment_methods','[\"general\\/payment-method-1.jpg\",\"general\\/payment-method-2.jpg\",\"general\\/payment-method-3.jpg\",\"general\\/payment-method-4.jpg\",\"general\\/payment-method-5.jpg\"]',NULL,NULL),(128,'theme-martfury-newsletter_image','general/newsletter.jpg',NULL,NULL),(129,'theme-martfury-homepage_id','1',NULL,NULL),(130,'theme-martfury-blog_page_id','6',NULL,NULL),(131,'theme-martfury-cookie_consent_message','Your experience on this site will be improved by allowing cookies ',NULL,NULL),(132,'theme-martfury-cookie_consent_learn_more_url','http://martfury.test/cookie-policy',NULL,NULL),(133,'theme-martfury-cookie_consent_learn_more_text','Cookie Policy',NULL,NULL),(134,'theme-martfury-number_of_products_per_page','42',NULL,NULL),(135,'theme-martfury-product_feature_1_title','Shipping worldwide',NULL,NULL),(136,'theme-martfury-product_feature_1_icon','icon-network',NULL,NULL),(137,'theme-martfury-product_feature_2_title','Free 7-day return if eligible, so easy',NULL,NULL),(138,'theme-martfury-product_feature_2_icon','icon-3d-rotate',NULL,NULL),(139,'theme-martfury-product_feature_3_title','Supplier give bills for this product.',NULL,NULL),(140,'theme-martfury-product_feature_3_icon','icon-receipt',NULL,NULL),(141,'theme-martfury-product_feature_4_title','Pay online or when receiving goods',NULL,NULL),(142,'theme-martfury-product_feature_4_icon','icon-credit-card',NULL,NULL),(143,'theme-martfury-contact_info_box_1_title','Contact Directly',NULL,NULL),(144,'theme-martfury-contact_info_box_1_subtitle','contact@martfury.com',NULL,NULL),(145,'theme-martfury-contact_info_box_1_details','(+004) 912-3548-07',NULL,NULL),(146,'theme-martfury-contact_info_box_2_title','Headquarters',NULL,NULL),(147,'theme-martfury-contact_info_box_2_subtitle','17 Queen St, Southbank, Melbourne 10560, Australia',NULL,NULL),(148,'theme-martfury-contact_info_box_2_details','',NULL,NULL),(149,'theme-martfury-contact_info_box_3_title','Work With Us',NULL,NULL),(150,'theme-martfury-contact_info_box_3_subtitle','Send your CV to our email:',NULL,NULL),(151,'theme-martfury-contact_info_box_3_details','career@martfury.com',NULL,NULL),(152,'theme-martfury-contact_info_box_4_title','Customer Service',NULL,NULL),(153,'theme-martfury-contact_info_box_4_subtitle','customercare@martfury.com',NULL,NULL),(154,'theme-martfury-contact_info_box_4_details','(800) 843-2446',NULL,NULL),(155,'theme-martfury-contact_info_box_5_title','Media Relations',NULL,NULL),(156,'theme-martfury-contact_info_box_5_subtitle','media@martfury.com',NULL,NULL),(157,'theme-martfury-contact_info_box_5_details','(801) 947-3564',NULL,NULL),(158,'theme-martfury-contact_info_box_6_title','Vendor Support',NULL,NULL),(159,'theme-martfury-contact_info_box_6_subtitle','vendorsupport@martfury.com',NULL,NULL),(160,'theme-martfury-contact_info_box_6_details','(801) 947-3100',NULL,NULL),(161,'theme-martfury-number_of_cross_sale_product','7',NULL,NULL),(162,'theme-martfury-logo_in_the_checkout_page','general/logo-dark.png',NULL,NULL),(163,'theme-martfury-logo_in_invoices','general/logo-dark.png',NULL,NULL),(164,'theme-martfury-logo_vendor_dashboard','general/logo-dark.png',NULL,NULL),(167,'theme-martfury-social-name-1','Facebook',NULL,NULL),(168,'theme-martfury-social-url-1','https://www.facebook.com/',NULL,NULL),(169,'theme-martfury-social-icon-1','fa-facebook',NULL,NULL),(170,'theme-martfury-social-color-1','#3b5999',NULL,NULL),(171,'theme-martfury-social-name-2','Twitter',NULL,NULL),(172,'theme-martfury-social-url-2','https://www.twitter.com/',NULL,NULL),(173,'theme-martfury-social-icon-2','fa-twitter',NULL,NULL),(174,'theme-martfury-social-color-2','#55ACF9',NULL,NULL),(175,'theme-martfury-social-name-3','Instagram',NULL,NULL),(176,'theme-martfury-social-url-3','https://www.instagram.com/',NULL,NULL),(177,'theme-martfury-social-icon-3','fa-instagram',NULL,NULL),(178,'theme-martfury-social-color-3','#E1306C',NULL,NULL),(179,'theme-martfury-social-name-4','Youtube',NULL,NULL),(180,'theme-martfury-social-url-4','https://www.youtube.com/',NULL,NULL),(181,'theme-martfury-social-icon-4','fa-youtube',NULL,NULL),(182,'theme-martfury-social-color-4','#FF0000',NULL,NULL),(183,'theme-martfury-vi-copyright','© 2022 Martfury. Tất cả quyền đã được bảo hộ.',NULL,NULL),(184,'theme-martfury-vi-welcome_message','Chào mừng đến với Martfury - Cửa Hàng Mua Sắm Online!',NULL,NULL),(185,'theme-martfury-vi-homepage_id','1',NULL,NULL),(186,'theme-martfury-vi-blog_page_id','6',NULL,NULL),(187,'theme-martfury-vi-cookie_consent_message','Trải nghiệm của bạn trên trang web này sẽ được cải thiện bằng cách cho phép cookie ',NULL,NULL),(188,'theme-martfury-vi-cookie_consent_learn_more_url','http://martfury.test/cookie-policy',NULL,NULL),(189,'theme-martfury-vi-cookie_consent_learn_more_text','Chính sách cookie',NULL,NULL),(190,'theme-martfury-vi-product_feature_1_title','Vận chuyển toàn cầu',NULL,NULL),(191,'theme-martfury-vi-product_feature_2_title','Miễn phí hoàn hàng 7 ngày',NULL,NULL),(192,'theme-martfury-vi-product_feature_3_title','Nhà cung cấp sẽ cấp hóa đơn cho sản phẩm này',NULL,NULL),(193,'theme-martfury-vi-product_feature_4_title','Thanh toán online hoặc trực tiếp',NULL,NULL);
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `simple_slider_items`
--

DROP TABLE IF EXISTS `simple_slider_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `simple_slider_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `simple_slider_id` int unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `order` int unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `simple_slider_items`
--

LOCK TABLES `simple_slider_items` WRITE;
/*!40000 ALTER TABLE `simple_slider_items` DISABLE KEYS */;
INSERT INTO `simple_slider_items` VALUES (1,1,'Slider 1','sliders/1-lg.jpg','/products',NULL,1,'2022-07-25 08:36:26','2022-07-25 08:36:26'),(2,1,'Slider 2','sliders/2-lg.jpg','/products',NULL,2,'2022-07-25 08:36:26','2022-07-25 08:36:26'),(3,1,'Slider 3','sliders/3-lg.jpg','/products',NULL,3,'2022-07-25 08:36:26','2022-07-25 08:36:26'),(4,2,'Slider 1','sliders/1-lg.jpg','/products',NULL,1,'2022-07-25 08:36:27','2022-07-25 08:36:27'),(5,2,'Slider 2','sliders/2-lg.jpg','/products',NULL,2,'2022-07-25 08:36:27','2022-07-25 08:36:27'),(6,2,'Slider 3','sliders/3-lg.jpg','/products',NULL,3,'2022-07-25 08:36:27','2022-07-25 08:36:27');
/*!40000 ALTER TABLE `simple_slider_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `simple_sliders`
--

DROP TABLE IF EXISTS `simple_sliders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `simple_sliders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `simple_sliders`
--

LOCK TABLES `simple_sliders` WRITE;
/*!40000 ALTER TABLE `simple_sliders` DISABLE KEYS */;
INSERT INTO `simple_sliders` VALUES (1,'Home slider','home-slider','The main slider on homepage','published','2022-07-25 08:36:26','2022-07-25 08:36:26'),(2,'Slider trang chủ','slider-trang-chu','Slider chính trên trang chủ','published','2022-07-25 08:36:26','2022-07-25 08:36:26');
/*!40000 ALTER TABLE `simple_sliders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slugs`
--

DROP TABLE IF EXISTS `slugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `slugs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` int unsigned NOT NULL,
  `reference_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prefix` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slugs`
--

LOCK TABLES `slugs` WRITE;
/*!40000 ALTER TABLE `slugs` DISABLE KEYS */;
INSERT INTO `slugs` VALUES (1,'fashion-live',1,'Botble\\Ecommerce\\Models\\Brand','brands','2022-07-25 08:35:24','2022-07-25 08:35:24'),(2,'hand-crafted',2,'Botble\\Ecommerce\\Models\\Brand','brands','2022-07-25 08:35:24','2022-07-25 08:35:24'),(3,'mestonix',3,'Botble\\Ecommerce\\Models\\Brand','brands','2022-07-25 08:35:24','2022-07-25 08:35:24'),(4,'sunshine',4,'Botble\\Ecommerce\\Models\\Brand','brands','2022-07-25 08:35:24','2022-07-25 08:35:24'),(5,'pure',5,'Botble\\Ecommerce\\Models\\Brand','brands','2022-07-25 08:35:24','2022-07-25 08:35:24'),(6,'anfold',6,'Botble\\Ecommerce\\Models\\Brand','brands','2022-07-25 08:35:24','2022-07-25 08:35:24'),(7,'automotive',7,'Botble\\Ecommerce\\Models\\Brand','brands','2022-07-25 08:35:24','2022-07-25 08:35:24'),(8,'hot-promotions',1,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-07-25 08:35:28','2022-07-25 08:35:28'),(9,'electronics',2,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-07-25 08:35:28','2022-07-25 08:35:28'),(10,'consumer-electronic',3,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-07-25 08:35:28','2022-07-25 08:35:28'),(11,'home-audio-theaters',4,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-07-25 08:35:28','2022-07-25 08:35:28'),(12,'tv-videos',5,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-07-25 08:35:28','2022-07-25 08:35:28'),(13,'camera-photos-videos',6,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-07-25 08:35:28','2022-07-25 08:35:28'),(14,'cellphones-accessories',7,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-07-25 08:35:28','2022-07-25 08:35:28'),(15,'headphones',8,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-07-25 08:35:28','2022-07-25 08:35:28'),(16,'videos-games',9,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-07-25 08:35:28','2022-07-25 08:35:28'),(17,'wireless-speakers',10,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-07-25 08:35:28','2022-07-25 08:35:28'),(18,'office-electronic',11,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-07-25 08:35:28','2022-07-25 08:35:28'),(19,'accessories-parts',12,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-07-25 08:35:28','2022-07-25 08:35:28'),(20,'digital-cables',13,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-07-25 08:35:28','2022-07-25 08:35:28'),(21,'audio-video-cables',14,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-07-25 08:35:28','2022-07-25 08:35:28'),(22,'batteries',15,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-07-25 08:35:28','2022-07-25 08:35:28'),(23,'clothing',16,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-07-25 08:35:28','2022-07-25 08:35:28'),(24,'computers',17,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-07-25 08:35:28','2022-07-25 08:35:28'),(25,'computer-technologies',18,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-07-25 08:35:28','2022-07-25 08:35:28'),(26,'computer-tablets',19,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-07-25 08:35:28','2022-07-25 08:35:28'),(27,'laptop',20,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-07-25 08:35:28','2022-07-25 08:35:28'),(28,'monitors',21,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-07-25 08:35:28','2022-07-25 08:35:28'),(29,'computer-components',22,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-07-25 08:35:28','2022-07-25 08:35:28'),(30,'networking',23,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-07-25 08:35:28','2022-07-25 08:35:28'),(31,'drive-storages',24,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-07-25 08:35:28','2022-07-25 08:35:28'),(32,'gaming-laptop',25,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-07-25 08:35:28','2022-07-25 08:35:28'),(33,'security-protection',26,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-07-25 08:35:28','2022-07-25 08:35:28'),(34,'accessories',27,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-07-25 08:35:28','2022-07-25 08:35:28'),(35,'home-kitchen',28,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-07-25 08:35:28','2022-07-25 08:35:28'),(36,'health-beauty',29,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-07-25 08:35:28','2022-07-25 08:35:28'),(37,'jewelry-watch',30,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-07-25 08:35:28','2022-07-25 08:35:28'),(38,'technology-toys',31,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-07-25 08:35:28','2022-07-25 08:35:28'),(39,'phones',32,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-07-25 08:35:28','2022-07-25 08:35:28'),(40,'babies-moms',33,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-07-25 08:35:28','2022-07-25 08:35:28'),(41,'sport-outdoor',34,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-07-25 08:35:28','2022-07-25 08:35:28'),(42,'books-office',35,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-07-25 08:35:28','2022-07-25 08:35:28'),(43,'cars-motorcycles',36,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-07-25 08:35:28','2022-07-25 08:35:28'),(44,'home-improvements',37,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-07-25 08:35:28','2022-07-25 08:35:28'),(45,'dual-camera-20mp',1,'Botble\\Ecommerce\\Models\\Product','products','2022-07-25 08:35:50','2022-07-25 08:35:50'),(46,'smart-watches',2,'Botble\\Ecommerce\\Models\\Product','products','2022-07-25 08:35:50','2022-07-25 08:35:50'),(47,'beat-headphone',3,'Botble\\Ecommerce\\Models\\Product','products','2022-07-25 08:35:50','2022-07-25 08:35:50'),(48,'red-black-headphone',4,'Botble\\Ecommerce\\Models\\Product','products','2022-07-25 08:35:51','2022-07-25 08:35:51'),(49,'smart-watch-external',5,'Botble\\Ecommerce\\Models\\Product','products','2022-07-25 08:35:51','2022-07-25 08:35:51'),(50,'nikon-hd-camera',6,'Botble\\Ecommerce\\Models\\Product','products','2022-07-25 08:35:51','2022-07-25 08:35:51'),(51,'audio-equipment',7,'Botble\\Ecommerce\\Models\\Product','products','2022-07-25 08:35:51','2022-07-25 08:35:51'),(52,'smart-televisions',8,'Botble\\Ecommerce\\Models\\Product','products','2022-07-25 08:35:52','2022-07-25 08:35:52'),(53,'samsung-smart-phone',9,'Botble\\Ecommerce\\Models\\Product','products','2022-07-25 08:35:52','2022-07-25 08:35:52'),(54,'herschel-leather-duffle-bag-in-brown-color',10,'Botble\\Ecommerce\\Models\\Product','products','2022-07-25 08:35:52','2022-07-25 08:35:52'),(55,'xbox-one-wireless-controller-black-color',11,'Botble\\Ecommerce\\Models\\Product','products','2022-07-25 08:35:52','2022-07-25 08:35:52'),(56,'epsion-plaster-printer',12,'Botble\\Ecommerce\\Models\\Product','products','2022-07-25 08:35:52','2022-07-25 08:35:52'),(57,'sound-intone-i65-earphone-white-version',13,'Botble\\Ecommerce\\Models\\Product','products','2022-07-25 08:35:52','2022-07-25 08:35:52'),(58,'bo-play-mini-bluetooth-speaker',14,'Botble\\Ecommerce\\Models\\Product','products','2022-07-25 08:35:52','2022-07-25 08:35:52'),(59,'apple-macbook-air-retina-133-inch-laptop',15,'Botble\\Ecommerce\\Models\\Product','products','2022-07-25 08:35:53','2022-07-25 08:35:53'),(60,'apple-macbook-air-retina-12-inch-laptop',16,'Botble\\Ecommerce\\Models\\Product','products','2022-07-25 08:35:53','2022-07-25 08:35:53'),(61,'samsung-gear-vr-virtual-reality-headset',17,'Botble\\Ecommerce\\Models\\Product','products','2022-07-25 08:35:53','2022-07-25 08:35:53'),(62,'aveeno-moisturizing-body-shower-450ml',18,'Botble\\Ecommerce\\Models\\Product','products','2022-07-25 08:35:53','2022-07-25 08:35:53'),(63,'nyx-beauty-couton-pallete-makeup-12',19,'Botble\\Ecommerce\\Models\\Product','products','2022-07-25 08:35:53','2022-07-25 08:35:53'),(64,'nyx-beauty-couton-pallete-makeup-12',20,'Botble\\Ecommerce\\Models\\Product','products','2022-07-25 08:35:53','2022-07-25 08:35:53'),(65,'mvmth-classical-leather-watch-in-black',21,'Botble\\Ecommerce\\Models\\Product','products','2022-07-25 08:35:53','2022-07-25 08:35:53'),(66,'baxter-care-hair-kit-for-bearded-mens',22,'Botble\\Ecommerce\\Models\\Product','products','2022-07-25 08:35:53','2022-07-25 08:35:53'),(67,'ciate-palemore-lipstick-bold-red-color',23,'Botble\\Ecommerce\\Models\\Product','products','2022-07-25 08:35:54','2022-07-25 08:35:54'),(68,'electronic',1,'Botble\\Ecommerce\\Models\\ProductTag','product-tags','2022-07-25 08:36:09','2022-07-25 08:36:09'),(69,'mobile',2,'Botble\\Ecommerce\\Models\\ProductTag','product-tags','2022-07-25 08:36:09','2022-07-25 08:36:09'),(70,'iphone',3,'Botble\\Ecommerce\\Models\\ProductTag','product-tags','2022-07-25 08:36:09','2022-07-25 08:36:09'),(71,'printer',4,'Botble\\Ecommerce\\Models\\ProductTag','product-tags','2022-07-25 08:36:09','2022-07-25 08:36:09'),(72,'office',5,'Botble\\Ecommerce\\Models\\ProductTag','product-tags','2022-07-25 08:36:09','2022-07-25 08:36:09'),(73,'it',6,'Botble\\Ecommerce\\Models\\ProductTag','product-tags','2022-07-25 08:36:09','2022-07-25 08:36:09'),(74,'ecommerce',1,'Botble\\Blog\\Models\\Category','blog','2022-07-25 08:36:21','2022-07-25 08:36:32'),(75,'fashion',2,'Botble\\Blog\\Models\\Category','blog','2022-07-25 08:36:21','2022-07-25 08:36:32'),(76,'electronic',3,'Botble\\Blog\\Models\\Category','blog','2022-07-25 08:36:21','2022-07-25 08:36:32'),(77,'commercial',4,'Botble\\Blog\\Models\\Category','blog','2022-07-25 08:36:21','2022-07-25 08:36:32'),(78,'general',1,'Botble\\Blog\\Models\\Tag','tag','2022-07-25 08:36:22','2022-07-25 08:36:22'),(79,'design',2,'Botble\\Blog\\Models\\Tag','tag','2022-07-25 08:36:22','2022-07-25 08:36:22'),(80,'fashion',3,'Botble\\Blog\\Models\\Tag','tag','2022-07-25 08:36:22','2022-07-25 08:36:22'),(81,'branding',4,'Botble\\Blog\\Models\\Tag','tag','2022-07-25 08:36:22','2022-07-25 08:36:22'),(82,'modern',5,'Botble\\Blog\\Models\\Tag','tag','2022-07-25 08:36:22','2022-07-25 08:36:22'),(83,'4-expert-tips-on-how-to-choose-the-right-mens-wallet',1,'Botble\\Blog\\Models\\Post','blog','2022-07-25 08:36:22','2022-07-25 08:36:32'),(84,'sexy-clutches-how-to-buy-wear-a-designer-clutch-bag',2,'Botble\\Blog\\Models\\Post','blog','2022-07-25 08:36:22','2022-07-25 08:36:32'),(85,'the-top-2020-handbag-trends-to-know',3,'Botble\\Blog\\Models\\Post','blog','2022-07-25 08:36:22','2022-07-25 08:36:32'),(86,'how-to-match-the-color-of-your-handbag-with-an-outfit',4,'Botble\\Blog\\Models\\Post','blog','2022-07-25 08:36:22','2022-07-25 08:36:32'),(87,'how-to-care-for-leather-bags',5,'Botble\\Blog\\Models\\Post','blog','2022-07-25 08:36:22','2022-07-25 08:36:32'),(88,'were-crushing-hard-on-summers-10-biggest-bag-trends',6,'Botble\\Blog\\Models\\Post','blog','2022-07-25 08:36:22','2022-07-25 08:36:32'),(89,'essential-qualities-of-highly-successful-music',7,'Botble\\Blog\\Models\\Post','blog','2022-07-25 08:36:22','2022-07-25 08:36:32'),(90,'9-things-i-love-about-shaving-my-head',8,'Botble\\Blog\\Models\\Post','blog','2022-07-25 08:36:22','2022-07-25 08:36:32'),(91,'why-teamwork-really-makes-the-dream-work',9,'Botble\\Blog\\Models\\Post','blog','2022-07-25 08:36:22','2022-07-25 08:36:32'),(92,'the-world-caters-to-average-people',10,'Botble\\Blog\\Models\\Post','blog','2022-07-25 08:36:22','2022-07-25 08:36:32'),(93,'the-litigants-on-the-screen-are-not-actors',11,'Botble\\Blog\\Models\\Post','blog','2022-07-25 08:36:23','2022-07-25 08:36:32'),(94,'home',1,'Botble\\Page\\Models\\Page','','2022-07-25 08:36:27','2022-07-25 08:36:27'),(95,'about-us',2,'Botble\\Page\\Models\\Page','','2022-07-25 08:36:28','2022-07-25 08:36:28'),(96,'terms-of-use',3,'Botble\\Page\\Models\\Page','','2022-07-25 08:36:28','2022-07-25 08:36:28'),(97,'terms-conditions',4,'Botble\\Page\\Models\\Page','','2022-07-25 08:36:28','2022-07-25 08:36:28'),(98,'refund-policy',5,'Botble\\Page\\Models\\Page','','2022-07-25 08:36:28','2022-07-25 08:36:28'),(99,'blog',6,'Botble\\Page\\Models\\Page','','2022-07-25 08:36:28','2022-07-25 08:36:28'),(100,'faqs',7,'Botble\\Page\\Models\\Page','','2022-07-25 08:36:28','2022-07-25 08:36:28'),(101,'contact',8,'Botble\\Page\\Models\\Page','','2022-07-25 08:36:28','2022-07-25 08:36:28'),(102,'cookie-policy',9,'Botble\\Page\\Models\\Page','','2022-07-25 08:36:28','2022-07-25 08:36:28'),(103,'affiliate',10,'Botble\\Page\\Models\\Page','','2022-07-25 08:36:28','2022-07-25 08:36:28'),(104,'career',11,'Botble\\Page\\Models\\Page','','2022-07-25 08:36:28','2022-07-25 08:36:28'),(105,'coming-soon',12,'Botble\\Page\\Models\\Page','','2022-07-25 08:36:28','2022-07-25 08:36:28'),(106,'gopro',1,'Botble\\Marketplace\\Models\\Store','stores','2022-07-25 08:36:42','2022-07-25 08:36:42'),(107,'global-office',2,'Botble\\Marketplace\\Models\\Store','stores','2022-07-25 08:36:42','2022-07-25 08:36:42'),(108,'young-shop',3,'Botble\\Marketplace\\Models\\Store','stores','2022-07-25 08:36:42','2022-07-25 08:36:42'),(109,'global-store',4,'Botble\\Marketplace\\Models\\Store','stores','2022-07-25 08:36:42','2022-07-25 08:36:42'),(110,'roberts-store',5,'Botble\\Marketplace\\Models\\Store','stores','2022-07-25 08:36:42','2022-07-25 08:36:42');
/*!40000 ALTER TABLE `slugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states`
--

DROP TABLE IF EXISTS `states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `states` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abbreviation` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` int unsigned DEFAULT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states`
--

LOCK TABLES `states` WRITE;
/*!40000 ALTER TABLE `states` DISABLE KEYS */;
/*!40000 ALTER TABLE `states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states_backup`
--

DROP TABLE IF EXISTS `states_backup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `states_backup` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abbreviation` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` int unsigned DEFAULT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states_backup`
--

LOCK TABLES `states_backup` WRITE;
/*!40000 ALTER TABLE `states_backup` DISABLE KEYS */;
/*!40000 ALTER TABLE `states_backup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states_translations`
--

DROP TABLE IF EXISTS `states_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `states_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `states_id` int NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `abbreviation` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`states_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states_translations`
--

LOCK TABLES `states_translations` WRITE;
/*!40000 ALTER TABLE `states_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `states_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author_id` int NOT NULL,
  `author_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'General',1,'Botble\\ACL\\Models\\User','','published','2022-07-25 08:36:22','2022-07-25 08:36:22'),(2,'Design',1,'Botble\\ACL\\Models\\User','','published','2022-07-25 08:36:22','2022-07-25 08:36:22'),(3,'Fashion',1,'Botble\\ACL\\Models\\User','','published','2022-07-25 08:36:22','2022-07-25 08:36:22'),(4,'Branding',1,'Botble\\ACL\\Models\\User','','published','2022-07-25 08:36:22','2022-07-25 08:36:22'),(5,'Modern',1,'Botble\\ACL\\Models\\User','','published','2022-07-25 08:36:22','2022-07-25 08:36:22');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags_translations`
--

DROP TABLE IF EXISTS `tags_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tags_id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`tags_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags_translations`
--

LOCK TABLES `tags_translations` WRITE;
/*!40000 ALTER TABLE `tags_translations` DISABLE KEYS */;
INSERT INTO `tags_translations` VALUES ('vi',1,'Chung',NULL),('vi',2,'Thiết kế',NULL),('vi',3,'Thời trang',NULL),('vi',4,'Thương hiệu',NULL),('vi',5,'Hiện đại',NULL);
/*!40000 ALTER TABLE `tags_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translations`
--

DROP TABLE IF EXISTS `translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `translations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `status` int NOT NULL DEFAULT '0',
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4816 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translations`
--

LOCK TABLES `translations` WRITE;
/*!40000 ALTER TABLE `translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_meta`
--

DROP TABLE IF EXISTS `user_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_meta` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_meta_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_meta`
--

LOCK TABLES `user_meta` WRITE;
/*!40000 ALTER TABLE `user_meta` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar_id` int unsigned DEFAULT NULL,
  `super_user` tinyint(1) NOT NULL DEFAULT '0',
  `manage_supers` tinyint(1) NOT NULL DEFAULT '0',
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `last_login` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin@botble.com',NULL,'$2y$10$Fro/H.1FHvGRO91wZ5uHnOIVXssI9Cmu4PUkVsigDoOtc8VeC9f5e',NULL,'2022-07-25 08:36:32','2022-07-25 08:36:32','System','Admin','botble',NULL,1,1,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `widgets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `widget_id` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sidebar_id` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `theme` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` tinyint unsigned NOT NULL DEFAULT '0',
  `data` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
INSERT INTO `widgets` VALUES (1,'CustomMenuWidget','footer_sidebar','martfury',1,'{\"id\":\"CustomMenuWidget\",\"name\":\"Quick links\",\"menu_id\":\"quick-links\"}','2022-07-25 08:36:37','2022-07-25 08:36:37'),(2,'CustomMenuWidget','footer_sidebar','martfury',2,'{\"id\":\"CustomMenuWidget\",\"name\":\"Company\",\"menu_id\":\"company\"}','2022-07-25 08:36:37','2022-07-25 08:36:37'),(3,'CustomMenuWidget','footer_sidebar','martfury',3,'{\"id\":\"CustomMenuWidget\",\"name\":\"Business\",\"menu_id\":\"business\"}','2022-07-25 08:36:37','2022-07-25 08:36:37'),(4,'BlogSearchWidget','primary_sidebar','martfury',1,'{\"id\":\"BlogSearchWidget\",\"name\":\"Search\"}','2022-07-25 08:36:37','2022-07-25 08:36:37'),(5,'BlogCategoriesWidget','primary_sidebar','martfury',2,'{\"id\":\"BlogCategoriesWidget\",\"name\":\"Categories\"}','2022-07-25 08:36:37','2022-07-25 08:36:37'),(6,'RecentPostsWidget','primary_sidebar','martfury',3,'{\"id\":\"RecentPostsWidget\",\"name\":\"Recent Posts\"}','2022-07-25 08:36:37','2022-07-25 08:36:37'),(7,'TagsWidget','primary_sidebar','martfury',4,'{\"id\":\"TagsWidget\",\"name\":\"Popular Tags\"}','2022-07-25 08:36:37','2022-07-25 08:36:37'),(8,'ProductCategoriesWidget','bottom_footer_sidebar','martfury',1,'{\"id\":\"ProductCategoriesWidget\",\"name\":\"Consumer Electric\",\"categories\":[18,2,3,4,5,6,7]}','2022-07-25 08:36:37','2022-07-25 08:36:37'),(9,'ProductCategoriesWidget','bottom_footer_sidebar','martfury',2,'{\"id\":\"ProductCategoriesWidget\",\"name\":\"Clothing & Apparel\",\"categories\":[8,9,10,11,12]}','2022-07-25 08:36:37','2022-07-25 08:36:37'),(10,'ProductCategoriesWidget','bottom_footer_sidebar','martfury',3,'{\"id\":\"ProductCategoriesWidget\",\"name\":\"Home, Garden & Kitchen\",\"categories\":[13,14,15,16,17]}','2022-07-25 08:36:37','2022-07-25 08:36:37'),(11,'ProductCategoriesWidget','bottom_footer_sidebar','martfury',4,'{\"id\":\"ProductCategoriesWidget\",\"name\":\"Health & Beauty\",\"categories\":[20,21,22,23,24]}','2022-07-25 08:36:37','2022-07-25 08:36:37'),(12,'ProductCategoriesWidget','bottom_footer_sidebar','martfury',5,'{\"id\":\"ProductCategoriesWidget\",\"name\":\"Computer & Technologies\",\"categories\":[25,26,27,28,29,19]}','2022-07-25 08:36:37','2022-07-25 08:36:37'),(13,'CustomMenuWidget','footer_sidebar','martfury-vi',1,'{\"id\":\"CustomMenuWidget\",\"name\":\"Li\\u00ean k\\u1ebft nhanh\",\"menu_id\":\"lien-ket-nhanh\"}','2022-07-25 08:36:37','2022-07-25 08:36:37'),(14,'CustomMenuWidget','footer_sidebar','martfury-vi',2,'{\"id\":\"CustomMenuWidget\",\"name\":\"C\\u00f4ng ty\",\"menu_id\":\"cong-ty\"}','2022-07-25 08:36:37','2022-07-25 08:36:37'),(15,'CustomMenuWidget','footer_sidebar','martfury-vi',3,'{\"id\":\"CustomMenuWidget\",\"name\":\"Doanh nghi\\u1ec7p\",\"menu_id\":\"doanh-nghiep\"}','2022-07-25 08:36:37','2022-07-25 08:36:37'),(16,'BlogSearchWidget','primary_sidebar','martfury-vi',1,'{\"id\":\"BlogSearchWidget\",\"name\":\"T\\u00ecm ki\\u1ebfm\"}','2022-07-25 08:36:37','2022-07-25 08:36:37'),(17,'BlogCategoriesWidget','primary_sidebar','martfury-vi',2,'{\"id\":\"BlogCategoriesWidget\",\"name\":\"Danh m\\u1ee5c b\\u00e0i vi\\u1ebft\"}','2022-07-25 08:36:37','2022-07-25 08:36:37'),(18,'RecentPostsWidget','primary_sidebar','martfury-vi',3,'{\"id\":\"RecentPostsWidget\",\"name\":\"B\\u00e0i vi\\u1ebft g\\u1ea7n \\u0111\\u00e2y\"}','2022-07-25 08:36:37','2022-07-25 08:36:37'),(19,'TagsWidget','primary_sidebar','martfury-vi',4,'{\"id\":\"TagsWidget\",\"name\":\"Tags ph\\u1ed5 bi\\u1ebfn\"}','2022-07-25 08:36:37','2022-07-25 08:36:37'),(20,'ProductCategoriesWidget','bottom_footer_sidebar','martfury-vi',1,'{\"id\":\"ProductCategoriesWidget\",\"name\":\"\\u0110\\u1ed3 d\\u00f9ng \\u0111i\\u1ec7n t\\u1eed\",\"categories\":[18,2,3,4,5,6,7]}','2022-07-25 08:36:37','2022-07-25 08:36:37'),(21,'ProductCategoriesWidget','bottom_footer_sidebar','martfury-vi',2,'{\"id\":\"ProductCategoriesWidget\",\"name\":\"Qu\\u1ea7n \\u00e1o & may m\\u1eb7c\",\"categories\":[8,9,10,11,12]}','2022-07-25 08:36:37','2022-07-25 08:36:37'),(22,'ProductCategoriesWidget','bottom_footer_sidebar','martfury-vi',3,'{\"id\":\"ProductCategoriesWidget\",\"name\":\"D\\u1ee5ng c\\u1ee5 nh\\u00e0 b\\u1ebfp\",\"categories\":[13,14,15,16,17]}','2022-07-25 08:36:37','2022-07-25 08:36:37'),(23,'ProductCategoriesWidget','bottom_footer_sidebar','martfury-vi',4,'{\"id\":\"ProductCategoriesWidget\",\"name\":\"S\\u1ee9c kh\\u1ecfe & l\\u00e0m \\u0111\\u1eb9p\",\"categories\":[20,21,22,23,24]}','2022-07-25 08:36:37','2022-07-25 08:36:37'),(24,'ProductCategoriesWidget','bottom_footer_sidebar','martfury-vi',5,'{\"id\":\"ProductCategoriesWidget\",\"name\":\"M\\u00e1y t\\u00ednh & c\\u00f4ng ngh\\u1ec7\",\"categories\":[25,26,27,28,29,19]}','2022-07-25 08:36:37','2022-07-25 08:36:37');
/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-25 22:38:35