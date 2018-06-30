CREATE DATABASE  IF NOT EXISTS `rede_social` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `rede_social`;
-- MySQL dump 10.13  Distrib 8.0.11, for Win64 (x86_64)
--
-- Host: localhost    Database: rede_social
-- ------------------------------------------------------
-- Server version	8.0.11

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `comentario`
--

DROP TABLE IF EXISTS `comentario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `comentario` (
  `idcomentario` int(11) NOT NULL AUTO_INCREMENT,
  `fkid_postagem` int(11) NOT NULL,
  `fkid_pessoa` int(11) NOT NULL,
  PRIMARY KEY (`idcomentario`),
  KEY `fk_comentario_postagem_idx` (`fkid_postagem`),
  KEY `fk_comentario_pessoa_idx` (`fkid_pessoa`),
  CONSTRAINT `fk_comentario_pessoa` FOREIGN KEY (`fkid_pessoa`) REFERENCES `pessoa` (`idpessoa`),
  CONSTRAINT `fk_comentario_postagem` FOREIGN KEY (`fkid_postagem`) REFERENCES `postagem` (`idpostagem`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentario`
--

LOCK TABLES `comentario` WRITE;
/*!40000 ALTER TABLE `comentario` DISABLE KEYS */;
/*!40000 ALTER TABLE `comentario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compartilhamento`
--

DROP TABLE IF EXISTS `compartilhamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `compartilhamento` (
  `idcompartilhamento` int(11) NOT NULL AUTO_INCREMENT,
  `fkid_postagem` int(11) NOT NULL,
  `fkid_pessoa` int(11) NOT NULL,
  PRIMARY KEY (`idcompartilhamento`),
  KEY `fk_compartilhamento_postagem_idx` (`fkid_postagem`),
  KEY `fk_compartilhamento_pessoa_idx` (`fkid_pessoa`),
  CONSTRAINT `fk_compartilhamento_pessoa` FOREIGN KEY (`fkid_pessoa`) REFERENCES `pessoa` (`idpessoa`),
  CONSTRAINT `fk_compartilhamento_postagem` FOREIGN KEY (`fkid_postagem`) REFERENCES `postagem` (`idpostagem`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compartilhamento`
--

LOCK TABLES `compartilhamento` WRITE;
/*!40000 ALTER TABLE `compartilhamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `compartilhamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curtiu`
--

DROP TABLE IF EXISTS `curtiu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `curtiu` (
  `idlike` int(11) NOT NULL AUTO_INCREMENT,
  `fkid_postagem` int(11) NOT NULL,
  `fkid_pessoa` int(11) NOT NULL,
  PRIMARY KEY (`idlike`),
  KEY `fk_like_postagem_idx` (`fkid_postagem`),
  KEY `fk_like_pessoa_idx` (`fkid_pessoa`),
  CONSTRAINT `fk_like_pessoa` FOREIGN KEY (`fkid_pessoa`) REFERENCES `pessoa` (`idpessoa`),
  CONSTRAINT `fk_like_postagem` FOREIGN KEY (`fkid_postagem`) REFERENCES `postagem` (`idpostagem`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curtiu`
--

LOCK TABLES `curtiu` WRITE;
/*!40000 ALTER TABLE `curtiu` DISABLE KEYS */;
INSERT INTO `curtiu` VALUES (1,1,1),(2,2,2),(3,2,1),(4,3,1),(5,3,3),(6,1,2);
/*!40000 ALTER TABLE `curtiu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `exerciciohardcore`
--

DROP TABLE IF EXISTS `exerciciohardcore`;
/*!50001 DROP VIEW IF EXISTS `exerciciohardcore`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `exerciciohardcore` AS SELECT 
 1 AS `idpostagem`,
 1 AS `postagem`,
 1 AS `fkid_pessoa`,
 1 AS `Quem Curtiu`,
 1 AS `Quem Compartilhou`,
 1 AS `Quem Comentou`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `pessoa`
--

DROP TABLE IF EXISTS `pessoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `pessoa` (
  `idpessoa` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idpessoa`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoa`
--

LOCK TABLES `pessoa` WRITE;
/*!40000 ALTER TABLE `pessoa` DISABLE KEYS */;
INSERT INTO `pessoa` VALUES (1,'Pessoa 01'),(2,'Pessoa 02'),(3,'Pessoa 03');
/*!40000 ALTER TABLE `pessoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pessoa_permissao`
--

DROP TABLE IF EXISTS `pessoa_permissao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `pessoa_permissao` (
  `idpessoa_permissao` int(11) NOT NULL AUTO_INCREMENT,
  `fkidpessoa` int(11) NOT NULL,
  `fkidpessoa_no_perfil` int(11) NOT NULL,
  `ver_perfil` tinyint(4) NOT NULL DEFAULT '1',
  `postar_no_perfil` tinyint(4) NOT NULL DEFAULT '1',
  `comentar_no_perfil` tinyint(4) NOT NULL DEFAULT '1',
  `dar_like_na_postagem` tinyint(4) NOT NULL DEFAULT '1',
  `compartilhar_postagem` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idpessoa_permissao`),
  KEY `fkid_pessoa_idx` (`fkidpessoa`),
  CONSTRAINT `fkid_permissao_pessoa` FOREIGN KEY (`fkidpessoa`) REFERENCES `pessoa` (`idpessoa`),
  CONSTRAINT `fkid_pessoa_permissao` FOREIGN KEY (`fkidpessoa`) REFERENCES `pessoa` (`idpessoa`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoa_permissao`
--

LOCK TABLES `pessoa_permissao` WRITE;
/*!40000 ALTER TABLE `pessoa_permissao` DISABLE KEYS */;
INSERT INTO `pessoa_permissao` VALUES (1,1,2,1,1,1,1,1),(2,1,3,0,0,0,0,0),(3,2,1,1,1,0,0,0),(4,2,3,1,1,1,1,1),(5,3,1,1,1,1,1,1),(6,3,2,0,0,0,0,0);
/*!40000 ALTER TABLE `pessoa_permissao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `postagem`
--

DROP TABLE IF EXISTS `postagem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `postagem` (
  `idpostagem` int(11) NOT NULL AUTO_INCREMENT,
  `postagem` longtext,
  `fkid_pessoa` int(11) NOT NULL,
  PRIMARY KEY (`idpostagem`),
  KEY `fk_pessoa_postagem_idx` (`fkid_pessoa`),
  CONSTRAINT `fk_pessoa_postagem` FOREIGN KEY (`fkid_pessoa`) REFERENCES `pessoa` (`idpessoa`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `postagem`
--

LOCK TABLES `postagem` WRITE;
/*!40000 ALTER TABLE `postagem` DISABLE KEYS */;
INSERT INTO `postagem` VALUES (1,'\"Digite o que esta pensando\"',2),(2,'\"Estou no Trainee da UDS\"',3),(3,'\"Eu quero uma oportunidade.\"',3),(4,'\"Aula do Jean cowboy\"',1);
/*!40000 ALTER TABLE `postagem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'rede_social'
--

--
-- Dumping routines for database 'rede_social'
--

--
-- Final view structure for view `exerciciohardcore`
--

/*!50001 DROP VIEW IF EXISTS `exerciciohardcore`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `exerciciohardcore` AS select `postagem`.`idpostagem` AS `idpostagem`,`postagem`.`postagem` AS `postagem`,`postagem`.`fkid_pessoa` AS `fkid_pessoa`,`quem_curtiu`.`nome` AS `Quem Curtiu`,`quem_compartilhou`.`nome` AS `Quem Compartilhou`,`quem_comentou`.`nome` AS `Quem Comentou` from (((`postagem` left join (select distinct `pessoa`.`nome` AS `nome`,`curtiu`.`fkid_postagem` AS `fkid_postagem` from (`curtiu` join `pessoa` on((`pessoa`.`idpessoa` = `curtiu`.`fkid_pessoa`)))) `quem_curtiu` on((`quem_curtiu`.`fkid_postagem` = `postagem`.`idpostagem`))) left join (select distinct `pessoa`.`nome` AS `nome`,`compartilhamento`.`fkid_postagem` AS `fkid_postagem` from (`compartilhamento` join `pessoa` on((`pessoa`.`idpessoa` = `compartilhamento`.`fkid_pessoa`)))) `quem_compartilhou` on((`quem_compartilhou`.`fkid_postagem` = `postagem`.`idpostagem`))) left join (select distinct `pessoa`.`nome` AS `nome`,`comentario`.`fkid_postagem` AS `fkid_postagem` from (`comentario` join `pessoa` on((`pessoa`.`idpessoa` = `comentario`.`fkid_pessoa`)))) `quem_comentou` on((`quem_comentou`.`fkid_postagem` = `postagem`.`idpostagem`))) order by `postagem`.`idpostagem` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-30 16:39:37
