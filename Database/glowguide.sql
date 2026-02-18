-- MySQL dump 10.13  Distrib 8.0.44, for macos15 (x86_64)
--
-- Host: localhost    Database: glowguide
-- ------------------------------------------------------
-- Server version	9.5.0

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ 'd3d3a408-ce36-11f0-8cdd-e3e1bc0afcd4:1-274';

--
-- Table structure for table `Product`
--

DROP TABLE IF EXISTS `Product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Product` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `brand` varchar(50) NOT NULL,
  `skin_type` varchar(20) NOT NULL,
  `description` text,
  `concern` varchar(50) DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `category` varchar(30) NOT NULL,
  PRIMARY KEY (`product_id`),
  KEY `idx_product_skin` (`skin_type`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Product`
--

LOCK TABLES `Product` WRITE;
/*!40000 ALTER TABLE `Product` DISABLE KEYS */;
INSERT INTO `Product` VALUES (1,'Hydrating Cleanser','CeraVe','Dry','Gentle hydrating face wash','hydration','images/cleansers/cerave_hydrating_cleanser.jpg','Cleansers'),(2,'Gentle Cleanser','Cetaphil','Dry','Non-irritating daily cleanser','redness','images/cleansers/cetaphil.jpg','Cleansers'),(3,'Effaclar Cleanser','La Roche-Posay','Oily','Acne control cleanser','acne','images/cleansers/la_roche_effaclar.jpg','Cleansers'),(4,'Micellar Water Oil Control','Garnier','Oily','Micellar cleansing water','oil_control','images/cleansers/garnier_micellar.jpg','Cleansers'),(5,'Foaming Cleanser','CeraVe','Combination','Balanced foaming cleanser','pores','images/cleansers/cerave_foaming_cleanser.jpg','Cleansers'),(6,'Refreshing Cleanser','Simple','Combination','Gentle daily cleanser','sensitive','images/cleansers/simple_cleanser.jpg','Cleansers'),(7,'Hydro Boost Gel','Neutrogena','Dry','Deep hydration gel','hydration','images/moisturizers/neutrogena_hydro_boost.jpg','Moisturizers'),(8,'Lait-Crème','Embryolisse','Dry','Rich moisturizing cream','dryness','images/moisturizers/embryolisse.jpg','Moisturizers'),(9,'Clinique Gel','Clinique','Oily','Oil free gel moisturizer','oil_control','images/moisturizers/clinique_ddmg.jpg','Moisturizers'),(10,'Soft Cream','Nivea','Oily','Light daily cream','hydration','images/moisturizers/nivea_soft.jpg','Moisturizers'),(11,'PM Lightweight Lotion','CeraVe','Combination','Night moisturizer','anti_aging','images/moisturizers/cerave_pm.jpg','Moisturizers'),(12,'Regenerist Cream','Olay','Combination','Firming anti-aging cream','anti_aging','images/moisturizers/olay_regenerist.jpg','Moisturizers'),(13,'Hyaluronic Acid Serum','The Ordinary','All','Hydration booster serum','hydration','images/concerns/hyaluronic_acid.jpg','Concerns'),(14,'Ceramide Repair Serum','CeraVe','Dry','Restores skin barrier','hydration','images/concerns/ceramide_serum.jpg','Concerns'),(15,'Lightweight Hydrating Gel','Neutrogena','Combination','Light daily hydrator','hydration','images/concerns/lightweight_hydrator.jpg','Concerns'),(16,'Oil-Free Water Gel','Clinique','Oily','Gel hydrator','hydration','images/concerns/oil_free_hydrator.jpg','Concerns'),(17,'Niacinamide 10% + Zinc','The Ordinary','Oily','Oil balancing serum','acne','images/concerns/the_ordinary_niacinamide.jpg','Concerns'),(18,'Salicylic Acid 2%','The Ordinary','Oily','Acne treatment','acne','images/concerns/salicylic_acid.jpg','Concerns'),(19,'Balancing Acne Control Serum','La Roche-Posay','Combination','Acne serum','acne','images/concerns/combination_acne_serum.jpg','Concerns'),(20,'Gentle Acne Serum for Dry Skin','CeraVe','Dry','Low-irritation acne serum','acne','images/concerns/dry_skin_acne_serum.jpg','Concerns'),(21,'Retinol Serum for Dry Skin','La Roche-Posay','Dry','Anti-aging retinol','anti_aging','images/concerns/retinol.jpg','Concerns'),(22,'Rich Peptide Eye Cream','Olay','Dry','Eye anti-aging treatment','anti_aging','images/concerns/eye_cream.jpg','Concerns'),(23,'Oil-Free Retinol Gel','The Ordinary','Oily','Retinol gel','anti_aging','images/concerns/lightweight_retinol.jpg','Concerns'),(24,'Balanced Retinol Serum','The Ordinary','Combination','Balanced anti-aging serum','anti_aging','images/concerns/balanced_retinol.jpg','Concerns'),(25,'Vitamin C Brightening Serum','La Roche-Posay','All','Glow boosting serum','brightening','images/concerns/vitamin_c_serum.jpg','Concerns'),(26,'Oil-Free Vitamin C Gel','The Ordinary','Oily','Vitamin C gel','brightening','images/concerns/oil_free_vitamin_c.jpg','Concerns'),(27,'Glow Enhancing Toner','Pixi','All','Glow toner','brightening','images/concerns/glow_toner.jpg','Concerns'),(28,'Alpha Arbutin Serum','The Ordinary','All','Dark spot corrector','dark_spots','images/concerns/alpha_arbutin.jpg','Concerns'),(29,'Dark Spot Corrector','Eucerin','All','Pigmentation corrector','dark_spots','images/concerns/dark_spot_corrector.jpg','Concerns'),(30,'Aloe Vera Calming Gel','Holika Holika','Dry','Soothing aloe gel','redness','images/concerns/aloe_gel.jpg','Concerns'),(31,'Centella Soothing Serum','COSRX','All','Redness calming serum','redness','images/concerns/centella_serum.jpg','Concerns'),(32,'Pore Tightening Toner','Some By Mi','Oily','Pore minimizing toner','pore','images/concerns/pore_toner.jpg','Concerns'),(33,'Purifying Clay Mask','L’Oreal','Oily','Deep cleaning mask','pore','images/concerns/clay_mask.jpg','Concerns'),(34,'Gentle Pore Refining Mask','Avene','Dry','Gentle clay mask','pore','images/concerns/gentle_pore_mask.jpg','Concerns'),(35,'AHA Exfoliating Serum','The Ordinary','All','Texture refining serum','texture','images/concerns/aha_exfoliant.jpg','Concerns'),(36,'Lactic Acid Gentle Exfoliant','The Ordinary','Dry','Gentle exfoliant','texture','images/concerns/lactic_acid.jpg','Concerns'),(37,'Weekly Peeling Solution','The Ordinary','All','Chemical exfoliation mask','texture','images/concerns/peeling_solution.jpg','Concerns'),(38,'Eucerin Oil Control SPF50+','Eucerin','Oily','Oil control sunscreen','suncare','images/suncare/eucerin_oil_control.jpg','Sun Protection'),(39,'Biore UV Aqua Rich SPF50+','Biore','Oily','Water based sunscreen','suncare','images/suncare/biore_uv.jpg','Sun Protection'),(40,'La Roche-Posay Anthelios SPF50+','La Roche-Posay','Dry','High protection sunscreen','suncare','images/suncare/la_roche_sunscreen.jpg','Sun Protection'),(41,'CeraVe Hydrating SPF50','CeraVe','Dry','Hydrating sunscreen','suncare','images/suncare/cerave_spf.jpg','Sun Protection'),(42,'Anthelios SPF50+ (Combo)','La Roche-Posay','Combination','Daily sunscreen','suncare','images/suncare/la_roche_sunscreen.jpg','Sun Protection'),(43,'Biore UV Aqua Rich SPF50+ (Combo)','Biore','Combination','Gel sunscreen','suncare','images/suncare/biore_uv.jpg','Sun Protection');
/*!40000 ALTER TABLE `Product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_answers`
--

DROP TABLE IF EXISTS `quiz_answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quiz_answers` (
  `quiz_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `q1` varchar(20) DEFAULT NULL,
  `q2` varchar(20) DEFAULT NULL,
  `q3` varchar(20) DEFAULT NULL,
  `q4` varchar(20) DEFAULT NULL,
  `q5` varchar(20) DEFAULT NULL,
  `q6` varchar(20) DEFAULT NULL,
  `q7` varchar(20) DEFAULT NULL,
  `q8` varchar(20) DEFAULT NULL,
  `q9` varchar(20) DEFAULT NULL,
  `q10` varchar(20) DEFAULT NULL,
  `q11` varchar(20) DEFAULT NULL,
  `q12` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`quiz_id`),
  KEY `fk_quiz_user` (`user_id`),
  CONSTRAINT `fk_quiz_user` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `quiz_answers_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_answers`
--

LOCK TABLES `quiz_answers` WRITE;
/*!40000 ALTER TABLE `quiz_answers` DISABLE KEYS */;
INSERT INTO `quiz_answers` VALUES (1,1,'normal','normal','normal','normal','sensitive','sometimes','humid','daily','dry','some','no','hydration,acne,brightening,dark_spots,pore','2025-12-05 01:09:52'),(2,1,'normal','normal','normal','normal','sensitive','sometimes','humid','daily','dry','some','no','acne,anti_aging,brightening,dark_spots,pore','2025-12-05 13:14:29'),(3,2,'dry','normal','dry','oily','normal','no','humid','daily','oily','no','no','','2025-12-09 17:57:13'),(4,3,'dry','dry','normal','dry','sensitive','sometimes','humid','sometimes','dry','some','sometimes','','2025-12-09 18:02:04'),(5,2,'dry','normal','dry','dry','normal','no','humid','daily','oily','no','no','hydration,brightening,pore,texture','2025-12-09 18:28:48'),(6,3,'dry','normal','dry','normal','sensitive','no','humid','sometimes','normal','no','sometimes','hydration,brightening,dark_spots,texture','2025-12-09 19:07:19'),(7,4,'oily','oily','normal','normal','normal','often','humid','daily','oily','no','no','oil_control,acne,pore,texture','2025-12-09 19:11:26'),(8,4,'oily','oily','oily','oily','normal','no','humid','daily','oily','no','no','oil_control,acne,pore,texture','2025-12-09 19:12:17'),(9,5,'dry','normal','dry','dry','normal','no','humid','sometimes','normal','no','no','hydration,acne,brightening,texture','2025-12-09 23:00:27'),(10,6,'oily','normal','normal','dry','normal','sometimes','humid','daily','oily','some','no','hydration,oil_control,dark_spots,pore','2025-12-10 15:47:17'),(11,6,'oily','oily','normal','dry','normal','sometimes','humid','daily','oily','some','no','hydration,oil_control,dark_spots,pore','2025-12-10 16:06:43'),(12,6,'oily','oily','oily','oily','very_sensitive','often','humid','daily','oily','many','often','pore','2025-12-10 16:14:07'),(13,6,'oily','normal','normal','dry','normal','sometimes','humid','daily','oily','some','no','hydration,oil_control,dark_spots,pore','2025-12-10 16:16:09'),(14,6,'dry','dry','normal','dry','normal','sometimes','humid','sometimes','oily','some','sometimes','hydration,oil_control,acne','2025-12-11 07:42:03');
/*!40000 ALTER TABLE `quiz_answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Routine`
--

DROP TABLE IF EXISTS `Routine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Routine` (
  `routine_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `routine_name` varchar(50) NOT NULL,
  PRIMARY KEY (`routine_id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `idx_routine_user` (`user_id`),
  CONSTRAINT `routine_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Routine`
--

LOCK TABLES `Routine` WRITE;
/*!40000 ALTER TABLE `Routine` DISABLE KEYS */;
INSERT INTO `Routine` VALUES (2,1,'My Skincare Routine'),(3,2,'My Skincare Routine'),(4,3,'My Skincare Routine'),(5,4,'My Skincare Routine'),(6,5,'My Skincare Routine'),(7,6,'My Skincare Routine');
/*!40000 ALTER TABLE `Routine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RoutineItem`
--

DROP TABLE IF EXISTS `RoutineItem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RoutineItem` (
  `item_id` int NOT NULL AUTO_INCREMENT,
  `routine_id` int NOT NULL,
  `product_id` int NOT NULL,
  `step_order` int NOT NULL,
  PRIMARY KEY (`item_id`),
  KEY `product_id` (`product_id`),
  KEY `idx_routine_item_routine` (`routine_id`),
  CONSTRAINT `routineitem_ibfk_1` FOREIGN KEY (`routine_id`) REFERENCES `Routine` (`routine_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `routineitem_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `Product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RoutineItem`
--

LOCK TABLES `RoutineItem` WRITE;
/*!40000 ALTER TABLE `RoutineItem` DISABLE KEYS */;
INSERT INTO `RoutineItem` VALUES (25,2,5,1),(26,2,11,3),(27,2,17,2),(29,2,43,4),(31,2,19,2),(38,4,2,1),(39,4,8,3),(40,4,40,4),(41,3,1,1),(42,3,8,3),(43,3,13,2),(45,3,40,4),(46,3,25,2),(48,4,25,2),(49,4,27,2),(50,5,3,1),(51,5,9,3),(53,5,19,2),(54,5,38,4),(55,5,37,2),(56,6,1,1),(57,6,8,3),(58,6,13,2),(59,6,19,2),(60,6,24,2),(61,6,25,2),(62,6,41,4),(65,7,29,2),(69,7,1,1),(70,7,8,3),(71,7,13,2),(72,7,40,4);
/*!40000 ALTER TABLE `RoutineItem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SkinQuizResult`
--

DROP TABLE IF EXISTS `SkinQuizResult`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SkinQuizResult` (
  `result_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `skin_type` varchar(20) NOT NULL,
  `analysis_text` text,
  PRIMARY KEY (`result_id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `idx_quiz_user` (`user_id`),
  CONSTRAINT `skinquizresult_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SkinQuizResult`
--

LOCK TABLES `SkinQuizResult` WRITE;
/*!40000 ALTER TABLE `SkinQuizResult` DISABLE KEYS */;
INSERT INTO `SkinQuizResult` VALUES (1,1,'Combination','Based on your answers, your skin type is Combination. Your skincare goals include: acne, anti_aging, brightening, dark_spots, pore. Recommended routine and products are generated accordingly.'),(3,2,'Dry','Based on your answers, your skin type is Dry. Your skincare goals include: hydration, brightening, pore, texture. Recommended routine and products are generated accordingly.'),(4,3,'Dry','Based on your answers, your skin type is Dry. Your skincare goals include: hydration, brightening, dark_spots, texture. Recommended routine and products are generated accordingly.'),(7,4,'Oily','Based on your answers, your skin type is Oily. Your skincare goals include: oil_control, acne, pore, texture. Recommended routine and products are generated accordingly.'),(9,5,'Dry','Based on your answers, your skin type is Dry. Your skincare goals include: hydration, acne, brightening, texture. Recommended routine and products are generated accordingly.'),(10,6,'Dry','Based on your answers, your skin type is Dry. Your skincare goals include: hydration, oil_control, acne. Recommended routine and products are generated accordingly.');
/*!40000 ALTER TABLE `SkinQuizResult` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `User` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `age` int NOT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `skin_type` varchar(20) DEFAULT NULL,
  `role` varchar(20) DEFAULT 'USER',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`),
  KEY `idx_user_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES (1,'Dema','2230005685@iau.edu.sa','ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f',21,'Female','Combination','USER'),(2,'Hessa','2230004230@iau.edu.sa','ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f',21,'Female','Dry','USER'),(3,'Fooz','2230005774@iau.edu.sa','ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f',21,'Female','Dry','USER'),(4,'Jood','2230006311@iau.edu.sa','ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f',20,'Female','Oily','USER'),(5,'Alhanoof','2230003177@iau.edu.sa','ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f',20,'Female','Dry','USER'),(6,'Reenad','2230001522@iau.edu.sa','ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f',22,'Female','Dry','USER'),(7,'Admin','admin@glowguide.com','ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f',25,NULL,NULL,'ADMIN');
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-18 22:49:30
