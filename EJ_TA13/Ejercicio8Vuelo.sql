-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: 192.168.8.120    Database: ejercicio8Vuelo
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
-- Table structure for table `Avion`
--

DROP TABLE IF EXISTS `Avion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Avion` (
  `id_codigo_avion` int NOT NULL,
  `num_plazas` int DEFAULT NULL,
  PRIMARY KEY (`id_codigo_avion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Avion`
--

LOCK TABLES `Avion` WRITE;
/*!40000 ALTER TABLE `Avion` DISABLE KEYS */;
/*!40000 ALTER TABLE `Avion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cliente`
--

DROP TABLE IF EXISTS `Cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Cliente` (
  `id_cliente` int NOT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cliente`
--

LOCK TABLES `Cliente` WRITE;
/*!40000 ALTER TABLE `Cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `Cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Obtiene`
--

DROP TABLE IF EXISTS `Obtiene`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Obtiene` (
  `id_tarjeta` int NOT NULL,
  `id_asiento` int NOT NULL,
  PRIMARY KEY (`id_tarjeta`,`id_asiento`),
  KEY `id_asiento` (`id_asiento`),
  CONSTRAINT `Obtiene_ibfk_1` FOREIGN KEY (`id_tarjeta`) REFERENCES `Tarjeta_Embarque` (`id_tarjeta`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Obtiene_ibfk_2` FOREIGN KEY (`id_asiento`) REFERENCES `Reserva` (`id_asiento`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Obtiene`
--

LOCK TABLES `Obtiene` WRITE;
/*!40000 ALTER TABLE `Obtiene` DISABLE KEYS */;
/*!40000 ALTER TABLE `Obtiene` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Reserva`
--

DROP TABLE IF EXISTS `Reserva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Reserva` (
  `id_asiento` int NOT NULL,
  `fila` int DEFAULT NULL,
  `columna` int DEFAULT NULL,
  `planta` int DEFAULT NULL,
  `tarjeta_credito` char(25) DEFAULT NULL,
  PRIMARY KEY (`id_asiento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Reserva`
--

LOCK TABLES `Reserva` WRITE;
/*!40000 ALTER TABLE `Reserva` DISABLE KEYS */;
/*!40000 ALTER TABLE `Reserva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Reserva_vuelo`
--

DROP TABLE IF EXISTS `Reserva_vuelo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Reserva_vuelo` (
  `id_cliente` int NOT NULL,
  `id_vuelo_codigo_unico` int NOT NULL,
  `id_asiento` int NOT NULL,
  PRIMARY KEY (`id_cliente`,`id_vuelo_codigo_unico`,`id_asiento`),
  KEY `id_vuelo_codigo_unico` (`id_vuelo_codigo_unico`),
  KEY `id_asiento` (`id_asiento`),
  CONSTRAINT `Reserva_vuelo_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `Cliente` (`id_cliente`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Reserva_vuelo_ibfk_2` FOREIGN KEY (`id_vuelo_codigo_unico`) REFERENCES `Vuelo` (`id_codigo_unico`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Reserva_vuelo_ibfk_3` FOREIGN KEY (`id_asiento`) REFERENCES `Reserva` (`id_asiento`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Reserva_vuelo`
--

LOCK TABLES `Reserva_vuelo` WRITE;
/*!40000 ALTER TABLE `Reserva_vuelo` DISABLE KEYS */;
/*!40000 ALTER TABLE `Reserva_vuelo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tarjeta_Embarque`
--

DROP TABLE IF EXISTS `Tarjeta_Embarque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Tarjeta_Embarque` (
  `id_tarjeta` int NOT NULL,
  `num_reserva` int DEFAULT NULL,
  `columna` int DEFAULT NULL,
  PRIMARY KEY (`id_tarjeta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tarjeta_Embarque`
--

LOCK TABLES `Tarjeta_Embarque` WRITE;
/*!40000 ALTER TABLE `Tarjeta_Embarque` DISABLE KEYS */;
/*!40000 ALTER TABLE `Tarjeta_Embarque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Vuelo`
--

DROP TABLE IF EXISTS `Vuelo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Vuelo` (
  `id_codigo_unico` int NOT NULL,
  `fecha_salida` date DEFAULT NULL,
  `hora_llegada` char(20) DEFAULT NULL,
  `fecha_llegada` date DEFAULT NULL,
  `hora_salida` char(20) DEFAULT NULL,
  `aero_llegada` char(30) DEFAULT NULL,
  `aero_salida` char(30) DEFAULT NULL,
  `id_codigo_avion` int DEFAULT NULL,
  PRIMARY KEY (`id_codigo_unico`),
  KEY `id_codigo_avion` (`id_codigo_avion`),
  CONSTRAINT `Vuelo_ibfk_1` FOREIGN KEY (`id_codigo_avion`) REFERENCES `Avion` (`id_codigo_avion`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Vuelo`
--

LOCK TABLES `Vuelo` WRITE;
/*!40000 ALTER TABLE `Vuelo` DISABLE KEYS */;
/*!40000 ALTER TABLE `Vuelo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-19 12:01:51
