-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: 192.168.8.120    Database: ejercicio11Geografico
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `Accidente_Geografico`
--

DROP TABLE IF EXISTS `Accidente_Geografico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Accidente_Geografico` (
  `id_accidente` int NOT NULL,
  `nombre` char(20) DEFAULT NULL,
  `pos_horizontal` int DEFAULT NULL,
  `pos_vertical` int DEFAULT NULL,
  PRIMARY KEY (`id_accidente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Accidente_Geografico`
--

LOCK TABLES `Accidente_Geografico` WRITE;
/*!40000 ALTER TABLE `Accidente_Geografico` DISABLE KEYS */;
/*!40000 ALTER TABLE `Accidente_Geografico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Hay`
--

DROP TABLE IF EXISTS `Hay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Hay` (
  `id_accidente` int NOT NULL,
  `id_pais` int NOT NULL,
  PRIMARY KEY (`id_pais`,`id_accidente`),
  KEY `id_accidente` (`id_accidente`),
  CONSTRAINT `Hay_ibfk_1` FOREIGN KEY (`id_accidente`) REFERENCES `Accidente_Geografico` (`id_accidente`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Hay_ibfk_2` FOREIGN KEY (`id_pais`) REFERENCES `Pais` (`id_pais`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Hay`
--

LOCK TABLES `Hay` WRITE;
/*!40000 ALTER TABLE `Hay` DISABLE KEYS */;
/*!40000 ALTER TABLE `Hay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Lagos`
--

DROP TABLE IF EXISTS `Lagos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Lagos` (
  `id_accidente` int NOT NULL,
  `extension` int DEFAULT NULL,
  PRIMARY KEY (`id_accidente`),
  CONSTRAINT `Lagos_ibfk_1` FOREIGN KEY (`id_accidente`) REFERENCES `Accidente_Geografico` (`id_accidente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Lagos`
--

LOCK TABLES `Lagos` WRITE;
/*!40000 ALTER TABLE `Lagos` DISABLE KEYS */;
/*!40000 ALTER TABLE `Lagos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Localidad`
--

DROP TABLE IF EXISTS `Localidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Localidad` (
  `id_localidad` int NOT NULL,
  `nombre` char(35) DEFAULT NULL,
  PRIMARY KEY (`id_localidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Localidad`
--

LOCK TABLES `Localidad` WRITE;
/*!40000 ALTER TABLE `Localidad` DISABLE KEYS */;
/*!40000 ALTER TABLE `Localidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Montañas`
--

DROP TABLE IF EXISTS `Montañas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Montañas` (
  `id_accidente` int NOT NULL,
  `altura` int DEFAULT NULL,
  PRIMARY KEY (`id_accidente`),
  CONSTRAINT `Montañas_ibfk_1` FOREIGN KEY (`id_accidente`) REFERENCES `Accidente_Geografico` (`id_accidente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Montañas`
--

LOCK TABLES `Montañas` WRITE;
/*!40000 ALTER TABLE `Montañas` DISABLE KEYS */;
/*!40000 ALTER TABLE `Montañas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Pais`
--

DROP TABLE IF EXISTS `Pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Pais` (
  `id_pais` int NOT NULL,
  `poblacion` int DEFAULT NULL,
  `extension` int DEFAULT NULL,
  PRIMARY KEY (`id_pais`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pais`
--

LOCK TABLES `Pais` WRITE;
/*!40000 ALTER TABLE `Pais` DISABLE KEYS */;
/*!40000 ALTER TABLE `Pais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Pasa_por`
--

DROP TABLE IF EXISTS `Pasa_por`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Pasa_por` (
  `id_localidad` int NOT NULL,
  `id_accidente` int NOT NULL,
  PRIMARY KEY (`id_localidad`,`id_accidente`),
  KEY `id_accidente` (`id_accidente`),
  CONSTRAINT `Pasa_por_ibfk_1` FOREIGN KEY (`id_accidente`) REFERENCES `Accidente_Geografico` (`id_accidente`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Pasa_por_ibfk_2` FOREIGN KEY (`id_localidad`) REFERENCES `Localidad` (`id_localidad`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pasa_por`
--

LOCK TABLES `Pasa_por` WRITE;
/*!40000 ALTER TABLE `Pasa_por` DISABLE KEYS */;
/*!40000 ALTER TABLE `Pasa_por` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Rios`
--

DROP TABLE IF EXISTS `Rios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Rios` (
  `id_accidente` int NOT NULL,
  `longitud` int DEFAULT NULL,
  PRIMARY KEY (`id_accidente`),
  CONSTRAINT `Rios_ibfk_1` FOREIGN KEY (`id_accidente`) REFERENCES `Accidente_Geografico` (`id_accidente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Rios`
--

LOCK TABLES `Rios` WRITE;
/*!40000 ALTER TABLE `Rios` DISABLE KEYS */;
/*!40000 ALTER TABLE `Rios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-19 12:25:30
