-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: dbcinema
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `boleto`
--

DROP TABLE IF EXISTS `boleto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `boleto` (
  `idboleto` int NOT NULL AUTO_INCREMENT,
  `idusuario` int NOT NULL,
  `fechacompra` date DEFAULT NULL,
  `horacompra` time DEFAULT NULL,
  PRIMARY KEY (`idboleto`),
  KEY `idusuario` (`idusuario`),
  CONSTRAINT `boleto_ibfk_1` FOREIGN KEY (`idusuario`) REFERENCES `usuarios` (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boleto`
--

LOCK TABLES `boleto` WRITE;
/*!40000 ALTER TABLE `boleto` DISABLE KEYS */;
INSERT INTO `boleto` VALUES (5,40,'2025-05-10','18:00:00');
/*!40000 ALTER TABLE `boleto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cine`
--

DROP TABLE IF EXISTS `cine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cine` (
  `idcine` int NOT NULL AUTO_INCREMENT,
  `idciudad` int NOT NULL,
  `cine` varchar(50) NOT NULL,
  PRIMARY KEY (`idcine`),
  KEY `idciudad` (`idciudad`),
  CONSTRAINT `cine_ibfk_1` FOREIGN KEY (`idciudad`) REFERENCES `ciudad` (`idciudad`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cine`
--

LOCK TABLES `cine` WRITE;
/*!40000 ALTER TABLE `cine` DISABLE KEYS */;
INSERT INTO `cine` VALUES (1,1,'Galerias');
/*!40000 ALTER TABLE `cine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ciudad`
--

DROP TABLE IF EXISTS `ciudad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ciudad` (
  `idciudad` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`idciudad`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciudad`
--

LOCK TABLES `ciudad` WRITE;
/*!40000 ALTER TABLE `ciudad` DISABLE KEYS */;
INSERT INTO `ciudad` VALUES (1,'Saltillo'),(2,'Monterrey'),(3,'Ciudad de México');
/*!40000 ALTER TABLE `ciudad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clasificacion`
--

DROP TABLE IF EXISTS `clasificacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clasificacion` (
  `idclasificacion` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`idclasificacion`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clasificacion`
--

LOCK TABLES `clasificacion` WRITE;
/*!40000 ALTER TABLE `clasificacion` DISABLE KEYS */;
INSERT INTO `clasificacion` VALUES (1,'d'),(2,'B'),(3,'E');
/*!40000 ALTER TABLE `clasificacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genero`
--

DROP TABLE IF EXISTS `genero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genero` (
  `idgenero` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`idgenero`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genero`
--

LOCK TABLES `genero` WRITE;
/*!40000 ALTER TABLE `genero` DISABLE KEYS */;
INSERT INTO `genero` VALUES (26,'terror'),(27,'Drama');
/*!40000 ALTER TABLE `genero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pago`
--

DROP TABLE IF EXISTS `pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pago` (
  `idpago` int NOT NULL AUTO_INCREMENT,
  `idboleto` int NOT NULL,
  `idtipopago` int NOT NULL,
  `monto` int NOT NULL,
  PRIMARY KEY (`idpago`),
  KEY `idtipopago` (`idtipopago`),
  KEY `idboleto` (`idboleto`),
  CONSTRAINT `pago_ibfk_1` FOREIGN KEY (`idtipopago`) REFERENCES `tipopago` (`idtipopago`),
  CONSTRAINT `pago_ibfk_2` FOREIGN KEY (`idboleto`) REFERENCES `boleto` (`idboleto`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pago`
--

LOCK TABLES `pago` WRITE;
/*!40000 ALTER TABLE `pago` DISABLE KEYS */;
/*!40000 ALTER TABLE `pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pelicula`
--

DROP TABLE IF EXISTS `pelicula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pelicula` (
  `idpelicula` int NOT NULL AUTO_INCREMENT,
  `idclasificacion` int NOT NULL,
  `idgenero` int NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `duracion` int NOT NULL,
  `sinopsis` text,
  `imagen_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idpelicula`),
  KEY `fk_pelicula_genero` (`idgenero`),
  KEY `fk_pelicula_clasificacion` (`idclasificacion`),
  CONSTRAINT `fk_pelicula_clasificacion` FOREIGN KEY (`idclasificacion`) REFERENCES `clasificacion` (`idclasificacion`),
  CONSTRAINT `fk_pelicula_genero` FOREIGN KEY (`idgenero`) REFERENCES `genero` (`idgenero`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelicula`
--

LOCK TABLES `pelicula` WRITE;
/*!40000 ALTER TABLE `pelicula` DISABLE KEYS */;
INSERT INTO `pelicula` VALUES (20,1,26,'Batman',120,'asdada','asdasd'),(21,3,27,'Forest Gump',120,'sadasdad','forest.png');
/*!40000 ALTER TABLE `pelicula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proyeccion`
--

DROP TABLE IF EXISTS `proyeccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proyeccion` (
  `idproyeccion` int NOT NULL AUTO_INCREMENT,
  `idpelicula` int NOT NULL,
  `idsala` int NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  PRIMARY KEY (`idproyeccion`),
  KEY `idpelicula` (`idpelicula`),
  KEY `idsala` (`idsala`),
  CONSTRAINT `proyeccion_ibfk_1` FOREIGN KEY (`idpelicula`) REFERENCES `pelicula` (`idpelicula`),
  CONSTRAINT `proyeccion_ibfk_2` FOREIGN KEY (`idsala`) REFERENCES `sala` (`idsala`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proyeccion`
--

LOCK TABLES `proyeccion` WRITE;
/*!40000 ALTER TABLE `proyeccion` DISABLE KEYS */;
INSERT INTO `proyeccion` VALUES (1,21,10,'2025-05-15','22:00:00'),(4,20,8,'2025-04-28','10:00:00'),(5,20,8,'2025-04-30','15:00:00'),(6,20,8,'2025-04-15','06:06:00'),(7,20,8,'2025-04-22','07:07:00'),(8,20,8,'2025-04-01','09:24:00'),(9,20,8,'2025-05-01','16:30:00'),(10,21,10,'2025-04-30','13:06:00'),(11,21,10,'2025-04-30','13:06:00'),(14,21,8,'2025-04-28','22:31:00'),(15,20,8,'2025-04-30','20:00:00'),(16,21,9,'2025-05-01','09:31:00'),(17,21,10,'2025-05-03','17:23:00'),(18,20,10,'2025-05-02','15:38:00'),(19,21,8,'2025-05-07','15:11:00'),(20,21,10,'2025-05-08','01:08:00'),(21,20,10,'2025-05-07','00:19:00'),(22,20,9,'2025-05-07','09:35:00'),(23,21,10,'2025-05-08','09:20:00'),(24,20,9,'2025-05-08','09:21:00'),(25,20,9,'2025-05-08','09:24:00'),(26,20,10,'2025-05-08','02:45:00'),(30,21,9,'2025-05-13','15:38:00'),(31,20,10,'2025-05-12','12:40:00'),(33,20,9,'2025-05-14','09:34:00'),(34,21,8,'2025-05-30','09:34:00'),(36,20,8,'2025-09-03','12:52:00');
/*!40000 ALTER TABLE `proyeccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `puesto`
--

DROP TABLE IF EXISTS `puesto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `puesto` (
  `idpuesto` int NOT NULL AUTO_INCREMENT,
  `puesto` varchar(50) NOT NULL,
  PRIMARY KEY (`idpuesto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puesto`
--

LOCK TABLES `puesto` WRITE;
/*!40000 ALTER TABLE `puesto` DISABLE KEYS */;
/*!40000 ALTER TABLE `puesto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sala`
--

DROP TABLE IF EXISTS `sala`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sala` (
  `idsala` int NOT NULL AUTO_INCREMENT,
  `capacidad` int NOT NULL,
  `id_tipo_sala` int DEFAULT NULL,
  PRIMARY KEY (`idsala`),
  KEY `fk_sala_tipo` (`id_tipo_sala`),
  CONSTRAINT `fk_sala_tipo` FOREIGN KEY (`id_tipo_sala`) REFERENCES `tipo_sala` (`id_tipo_sala`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sala`
--

LOCK TABLES `sala` WRITE;
/*!40000 ALTER TABLE `sala` DISABLE KEYS */;
INSERT INTO `sala` VALUES (8,234,7),(9,123,8),(10,20,9);
/*!40000 ALTER TABLE `sala` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salaasiento`
--

DROP TABLE IF EXISTS `salaasiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salaasiento` (
  `idsalaasiento` int NOT NULL AUTO_INCREMENT,
  `idproyeccion` int NOT NULL,
  `idboleto` int NOT NULL,
  `idfila` int DEFAULT NULL,
  `idasiento` int DEFAULT NULL,
  PRIMARY KEY (`idsalaasiento`),
  KEY `idboleto` (`idboleto`),
  KEY `idproyeccion` (`idproyeccion`),
  CONSTRAINT `salaasiento_ibfk_1` FOREIGN KEY (`idboleto`) REFERENCES `boleto` (`idboleto`),
  CONSTRAINT `salaasiento_ibfk_2` FOREIGN KEY (`idproyeccion`) REFERENCES `proyeccion` (`idproyeccion`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salaasiento`
--

LOCK TABLES `salaasiento` WRITE;
/*!40000 ALTER TABLE `salaasiento` DISABLE KEYS */;
INSERT INTO `salaasiento` VALUES (1,1,5,1,1);
/*!40000 ALTER TABLE `salaasiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_sala`
--

DROP TABLE IF EXISTS `tipo_sala`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_sala` (
  `id_tipo_sala` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  PRIMARY KEY (`id_tipo_sala`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_sala`
--

LOCK TABLES `tipo_sala` WRITE;
/*!40000 ALTER TABLE `tipo_sala` DISABLE KEYS */;
INSERT INTO `tipo_sala` VALUES (7,'3D'),(8,'VIP'),(9,'MAX');
/*!40000 ALTER TABLE `tipo_sala` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipopago`
--

DROP TABLE IF EXISTS `tipopago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipopago` (
  `idtipopago` int NOT NULL AUTO_INCREMENT,
  `tipopago` varchar(20) NOT NULL,
  PRIMARY KEY (`idtipopago`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipopago`
--

LOCK TABLES `tipopago` WRITE;
/*!40000 ALTER TABLE `tipopago` DISABLE KEYS */;
INSERT INTO `tipopago` VALUES (1,'Efectivo'),(2,'Tarjeta de Crédito'),(3,'Tarjeta de Debito');
/*!40000 ALTER TABLE `tipopago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `idusuario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `idtipousuario` int NOT NULL,
  `idestatus` int NOT NULL,
  `apellido_paterno` varchar(255) NOT NULL,
  `apellido_materno` varchar(255) NOT NULL,
  PRIMARY KEY (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (40,'Admin','admin@gmail.com','admin1',1,1,'Is','Trador'),(41,'Erick','erick@gmail.com','erick1',2,1,'Jimenez','Linares'),(42,'Leo','messi@gmail.com','messi1',1,1,'Messi','Cuccitini'),(43,'Neymar','neymar@gmail.com','neymar1',2,1,'Junior','Junior'),(44,'lamine','lamine@gmail.com','lamine',2,1,'yamal','oro');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-09 11:28:51
