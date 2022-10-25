CREATE DATABASE  IF NOT EXISTS `ejercicio1Biblioteca` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ejercicio1Biblioteca`;
-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: 192.168.8.120    Database: ejercicio1Biblioteca
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
-- Table structure for table `Biblioteca`
--

DROP TABLE IF EXISTS `Biblioteca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Biblioteca` (
  `ID_Biblioteca` int NOT NULL,
  PRIMARY KEY (`ID_Biblioteca`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Libros`
--

DROP TABLE IF EXISTS `Libros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Libros` (
  `ID_Libro` int NOT NULL,
  `ID_Biblioteca` int DEFAULT NULL,
  `ID_Prestamo` int DEFAULT NULL,
  `titulo` varchar(20) DEFAULT NULL,
  `editorial` varchar(20) DEFAULT NULL,
  `año` date DEFAULT NULL,
  `autores` varchar(100) DEFAULT NULL,
  `año_edicion` date DEFAULT NULL,
  `ISBN` varchar(18) DEFAULT NULL,
  `deteriorado` tinyint DEFAULT NULL,
  PRIMARY KEY (`ID_Libro`),
  KEY `ID_Biblioteca` (`ID_Biblioteca`),
  KEY `ID_Prestamo` (`ID_Prestamo`),
  CONSTRAINT `Libros_ibfk_1` FOREIGN KEY (`ID_Biblioteca`) REFERENCES `Biblioteca` (`ID_Biblioteca`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Libros_ibfk_2` FOREIGN KEY (`ID_Prestamo`) REFERENCES `Prestamo` (`Id_prestamo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Persona`
--

DROP TABLE IF EXISTS `Persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Persona` (
  `id_socio` int NOT NULL,
  `dni` char(20) DEFAULT NULL,
  `direccion` char(50) DEFAULT NULL,
  `telefono` char(16) DEFAULT NULL,
  `nombre` char(12) DEFAULT NULL,
  `apellidos` char(25) DEFAULT NULL,
  PRIMARY KEY (`id_socio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Prestamo`
--

DROP TABLE IF EXISTS `Prestamo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Prestamo` (
  `Id_prestamo` int NOT NULL,
  `id_codigo_socio` int DEFAULT NULL,
  `fecha_realiza` date DEFAULT NULL,
  `fecha_esperada` date DEFAULT NULL,
  `fecha_devolucion` date DEFAULT NULL,
  PRIMARY KEY (`Id_prestamo`),
  KEY `id_codigo_socio` (`id_codigo_socio`),
  CONSTRAINT `Prestamo_ibfk_1` FOREIGN KEY (`id_codigo_socio`) REFERENCES `Persona` (`id_socio`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-19  9:54:27
