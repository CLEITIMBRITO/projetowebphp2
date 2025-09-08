-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: bdcontrolepatrimonio
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

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
-- Table structure for table `tbmanutencao`
--

DROP TABLE IF EXISTS `tbmanutencao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbmanutencao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dataentrada` datetime NOT NULL DEFAULT current_timestamp(),
  `responsavel` varchar(200) NOT NULL,
  `descricao` text NOT NULL,
  `status` varchar(40) DEFAULT NULL CHECK (`status` in ('Aberto','Em manutenção','Aguardando peças','Concluído')),
  `codigomovel` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `codigomovel` (`codigomovel`),
  CONSTRAINT `tbmanutencao_ibfk_1` FOREIGN KEY (`codigomovel`) REFERENCES `tbmoveis` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbmanutencao`
--

LOCK TABLES `tbmanutencao` WRITE;
/*!40000 ALTER TABLE `tbmanutencao` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbmanutencao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbmoveis`
--

DROP TABLE IF EXISTS `tbmoveis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbmoveis` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(200) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbmoveis`
--

LOCK TABLES `tbmoveis` WRITE;
/*!40000 ALTER TABLE `tbmoveis` DISABLE KEYS */;
INSERT INTO `tbmoveis` VALUES (1,'mesa de escritório amarela MobiCenter'),(2,'mesa de computador cinza Makfer'),(3,'cadeira giratória secretária preta'),(4,'cadeira giratória secretária azul'),(5,'cadeira fixa encosto alto preta'),(6,'cadeira giratória com regulagem'),(7,'lata de lixo preta pequena'),(8,'balcão de ferramentas'),(9,'ARMÁRIO GRANDE'),(10,'ARMÁRIO DE AÇO 1,2M X 1,20M'),(11,'ARMÁRIO PARA BIBLIOTECA ABERTO'),(12,'CARRINHO DE TRANSPORTE PARA LIVROS'),(13,'ARMÁRIO DE PAREDE PARA FERRAMENTAS'),(14,'MESA COM BANQUETA ACOPLADA'),(15,'FOGÃO'),(16,'GELADEIRA'),(17,'MÁQUINA DE CAFÉ EXPRESSO'),(18,'FORNO MICROONDAS');
/*!40000 ALTER TABLE `tbmoveis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbmovelsala`
--

DROP TABLE IF EXISTS `tbmovelsala`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbmovelsala` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dataentrada` date NOT NULL DEFAULT current_timestamp(),
  `notafiscal` varchar(20) DEFAULT NULL,
  `garantia` varchar(200) DEFAULT NULL,
  `idsala` int(11) NOT NULL,
  `codigomovel` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idsala` (`idsala`),
  KEY `codigomovel` (`codigomovel`),
  CONSTRAINT `tbmovelsala_ibfk_1` FOREIGN KEY (`idsala`) REFERENCES `tbsalas` (`id`),
  CONSTRAINT `tbmovelsala_ibfk_2` FOREIGN KEY (`codigomovel`) REFERENCES `tbmoveis` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbmovelsala`
--

LOCK TABLES `tbmovelsala` WRITE;
/*!40000 ALTER TABLE `tbmovelsala` DISABLE KEYS */;
INSERT INTO `tbmovelsala` VALUES (1,'2025-08-04','1232024','1 ano',1,8),(2,'2025-08-04','1232024','1 ano',2,8),(3,'2025-08-04','1232024','1 ano',3,8),(4,'2025-08-04','1232024','1 ano',4,8),(5,'2025-08-04','658958','2 anos',1,7),(6,'2025-08-04','658958','2 anos',2,7),(7,'2025-08-04','658958','2 anos',3,7),(8,'2025-08-04','658958','2 anos',4,7),(9,'2025-08-04','435345','1 mês',5,1),(10,'2025-08-11',NULL,NULL,11,9),(11,'2025-08-11',NULL,NULL,11,5),(12,'2025-08-11',NULL,NULL,11,5),(13,'2025-08-11',NULL,NULL,11,5),(14,'2025-08-11',NULL,NULL,11,14),(15,'2025-08-11',NULL,NULL,11,14),(16,'2025-08-11',NULL,NULL,11,14),(17,'2025-08-11',NULL,NULL,11,14),(18,'2025-08-11',NULL,NULL,11,14),(19,'2025-08-11',NULL,NULL,11,14),(20,'2025-08-11',NULL,NULL,11,14),(21,'2025-08-11',NULL,NULL,11,14),(22,'2025-08-11',NULL,NULL,12,15),(23,'2025-08-11',NULL,NULL,12,16),(24,'2025-08-11',NULL,NULL,12,17),(25,'2025-08-11',NULL,NULL,12,18);
/*!40000 ALTER TABLE `tbmovelsala` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbsalas`
--

DROP TABLE IF EXISTS `tbsalas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbsalas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(50) NOT NULL,
  `bloco` varchar(10) NOT NULL,
  `andar` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbsalas`
--

LOCK TABLES `tbsalas` WRITE;
/*!40000 ALTER TABLE `tbsalas` DISABLE KEYS */;
INSERT INTO `tbsalas` VALUES (1,'Laboratório B114','B','1'),(2,'Laboratório B115','B','1'),(3,'Laboratório B116','B','1'),(4,'Laboratório B117','B','1'),(5,'Biblioteca','D',NULL),(6,'Direção','A','térreo'),(7,'Laboratório B119','B','1'),(8,'Laboratório B112','B','1'),(9,'Laboratório B118','B','1'),(10,'Sala de aula B109','B','1'),(11,'REFEITÓRIO','BLOCO A','TÉRREO'),(12,'sala de reuniões','BLOCO A','TÉRREO'),(13,'BANHEIRO FEMININO','BLOCO A','TÉRREO'),(14,'BANHEIRO MASCULINO','BLOCO A','TÉRREO'),(15,'BANHEIRO FEMININO ACESSÍVEL','BLOCO A','TÉRREO'),(16,'BANHEIRO MASCULINO ACESSÍVEL','BLOCO A','TÉRREO'),(17,'SALA DE APOIO EDUCACIONAL','BLOCO B','ANDAR 1'),(18,'Mesanino','Quadra','Térreo');
/*!40000 ALTER TABLE `tbsalas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'bdcontrolepatrimonio'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-08 19:34:49
