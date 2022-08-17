-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: netflix_db
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `genrescatalog`
--

DROP TABLE IF EXISTS `genrescatalog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genrescatalog` (
  `id` int NOT NULL,
  `genre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genrescatalog`
--

LOCK TABLES `genrescatalog` WRITE;
/*!40000 ALTER TABLE `genrescatalog` DISABLE KEYS */;
INSERT INTO `genrescatalog` VALUES (1,'Documentaries\r'),(2,'International TV Shows\r'),(3,'Crime TV Shows\r'),(4,'Docuseries\r'),(5,'TV Dramas\r'),(6,'Children & Family Movies\r'),(7,'Dramas\r'),(8,'British TV Shows\r'),(9,'Comedies\r'),(10,'TV Comedies\r'),(11,'Thrillers\r'),(12,'Horror Movies\r'),(13,'Kids\' TV\r'),(14,'Action & Adventure\r'),(15,'Reality TV\r'),(16,'Anime Series\r'),(17,'International Movies\r'),(18,'Sci-Fi & Fantasy\r'),(19,'Classic Movies\r'),(20,'TV Shows\r'),(21,'Stand-Up Comedy\r'),(22,'TV Action & Adventure\r'),(23,'Movies\r'),(24,'Stand-Up Comedy & Talk Shows\r'),(25,'Classic & Cult TV\r'),(26,'Anime Features\r'),(27,'Romantic TV Shows\r'),(28,'Cult Movies\r'),(29,'Independent Movies\r'),(30,'TV Horror\r'),(31,'Spanish-Language TV Shows\r'),(32,'Music & Musicals\r'),(33,'Romantic Movies\r'),(34,'LGBTQ Movies\r'),(35,'TV Sci-Fi & Fantasy\r'),(36,'Sports Movies\r'),(37,'N\r'),(38,' TV Dramas\r'),(39,' International TV Shows\r'),(40,' Reality TV\r'),(41,' Romantic TV Shows\r'),(42,' TV Horror\r'),(43,' Independent Movies\r'),(44,' Dramas\r'),(45,' Docuseries\r'),(46,' International Movies\r'),(47,' Comedies\r'),(48,' Crime TV Shows\r'),(49,' Spanish-Language TV Shows\r'),(50,' TV Action & Adventure\r'),(51,' Sci-Fi & Fantasy\r'),(52,' TV Comedies\r'),(53,' TV Sci-Fi & Fantasy\r'),(54,' Classic Movies\r'),(55,' Horror Movies\r'),(56,' Thrillers\r'),(57,' Anime Features\r'),(58,' Kids\' TV\r'),(59,' Korean TV Shows\r'),(60,' Sports Movies\r'),(61,' Music & Musicals\r'),(62,' Science & Nature TV\r'),(63,' Romantic Movies\r'),(64,' Cult Movies\r'),(65,' Children & Family Movies\r'),(66,' Faith & Spirituality\r'),(67,' LGBTQ Movies\r'),(68,' Teen TV Shows\r'),(69,' TV Mysteries\r'),(70,' Stand-Up Comedy & Talk Shows\r'),(71,' Documentaries\r'),(72,' TV Thrillers\r'),(73,' Classic & Cult TV\r'),(74,' Stand-Up Comedy\r');
/*!40000 ALTER TABLE `genrescatalog` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-08-16 19:55:40
