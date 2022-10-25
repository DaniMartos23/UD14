-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: 192.168.8.120    Database: ejercicio4Paises
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
-- Table structure for table `Bando`
--

DROP TABLE IF EXISTS `Bando`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Bando` (
  `nombre_bando` char(20) NOT NULL,
  `ganadores` char(255) DEFAULT NULL,
  PRIMARY KEY (`nombre_bando`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Bando`
--

LOCK TABLES `Bando` WRITE;
/*!40000 ALTER TABLE `Bando` DISABLE KEYS */;
/*!40000 ALTER TABLE `Bando` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Guerra`
--

DROP TABLE IF EXISTS `Guerra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Guerra` (
  `id_guerra` int NOT NULL,
  `año_empieza` date DEFAULT NULL,
  `año_acaba` date DEFAULT NULL,
  `nombre` char(50) DEFAULT NULL,
  PRIMARY KEY (`id_guerra`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Guerra`
--

LOCK TABLES `Guerra` WRITE;
/*!40000 ALTER TABLE `Guerra` DISABLE KEYS */;
/*!40000 ALTER TABLE `Guerra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Pais`
--

DROP TABLE IF EXISTS `Pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Pais` (
  `Nombre` char(20) NOT NULL,
  PRIMARY KEY (`Nombre`)
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
-- Table structure for table `Participo`
--

DROP TABLE IF EXISTS `Participo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Participo` (
  `id_guerra` int NOT NULL,
  `nombre_bando` char(20) NOT NULL,
  PRIMARY KEY (`id_guerra`,`nombre_bando`),
  KEY `nombre_bando` (`nombre_bando`),
  CONSTRAINT `Participo_ibfk_1` FOREIGN KEY (`id_guerra`) REFERENCES `Guerra` (`id_guerra`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Participo_ibfk_2` FOREIGN KEY (`nombre_bando`) REFERENCES `Bando` (`nombre_bando`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Participo`
--

LOCK TABLES `Participo` WRITE;
/*!40000 ALTER TABLE `Participo` DISABLE KEYS */;
/*!40000 ALTER TABLE `Participo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Periodo`
--

DROP TABLE IF EXISTS `Periodo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Periodo` (
  `id_periodo` int NOT NULL,
  `año_indepe` date DEFAULT NULL,
  `fin_año_indepe` date DEFAULT NULL,
  `id_pais_nombre` char(20) NOT NULL,
  PRIMARY KEY (`id_periodo`),
  KEY `id_pais_nombre` (`id_pais_nombre`),
  CONSTRAINT `Periodo_ibfk_1` FOREIGN KEY (`id_pais_nombre`) REFERENCES `Pais` (`Nombre`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Periodo`
--

LOCK TABLES `Periodo` WRITE;
/*!40000 ALTER TABLE `Periodo` DISABLE KEYS */;
/*!40000 ALTER TABLE `Periodo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Pertenece`
--

DROP TABLE IF EXISTS `Pertenece`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Pertenece` (
  `Id_nombre` char(20) NOT NULL,
  `id_nombre_bando` char(20) NOT NULL,
  `fecha_union` date DEFAULT NULL,
  PRIMARY KEY (`id_nombre_bando`,`Id_nombre`),
  KEY `Id_nombre` (`Id_nombre`),
  CONSTRAINT `Pertenece_ibfk_1` FOREIGN KEY (`Id_nombre`) REFERENCES `Pais` (`Nombre`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Pertenece_ibfk_2` FOREIGN KEY (`id_nombre_bando`) REFERENCES `Bando` (`nombre_bando`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pertenece`
--

LOCK TABLES `Pertenece` WRITE;
/*!40000 ALTER TABLE `Pertenece` DISABLE KEYS */;
/*!40000 ALTER TABLE `Pertenece` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-19 10:26:13
