CREATE DATABASE  IF NOT EXISTS 'projeto';
USE 'projeto';


DROP TABLE IF EXISTS `empresa`;

CREATE TABLE `empresa` (
  `cnpj` int NOT NULL,
  `endereco` varchar(60) DEFAULT NULL,
  `telefone` varchar(11) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `cod_verificacao` int DEFAULT NULL,
  `fkUsuario` int DEFAULT NULL,
  `relatorio` int DEFAULT NULL,
  PRIMARY KEY (`cnpj`),
  KEY `fkUsuario` (`fkUsuario`),
  KEY `relatorio` (`relatorio`),
  CONSTRAINT `empresa_ibfk_1` FOREIGN KEY (`fkUsuario`) REFERENCES `usuario` (`idUsuario`),
  CONSTRAINT `empresa_ibfk_2` FOREIGN KEY (`relatorio`) REFERENCES `empresa` (`cnpj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


--
-- Dumping data for table `empresa`
--

LOCK TABLES `empresa` WRITE;

UNLOCK TABLES;





DROP TABLE IF EXISTS `relatorio`;
CREATE TABLE `relatorio` (
  `idRelatorio` int NOT NULL AUTO_INCREMENT,
  `localizacao` varchar(50) DEFAULT NULL,
  `data_relatorio` date DEFAULT NULL,
  `horario` time DEFAULT NULL,
  PRIMARY KEY (`idRelatorio`)
) ENGINE=InnoDB AUTO_INCREMENT=1100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



LOCK TABLES `relatorio` WRITE;

UNLOCK TABLES;


DROP TABLE IF EXISTS `sensor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sensor` (
  `idSensor` int NOT NULL AUTO_INCREMENT,
  `data_sensor` date DEFAULT NULL,
  `horario` time DEFAULT NULL,
  `fkRelatorio` int DEFAULT NULL,
  PRIMARY KEY (`idSensor`),
  KEY `fkRelatorio` (`fkRelatorio`),
  CONSTRAINT `sensor_ibfk_1` FOREIGN KEY (`fkRelatorio`) REFERENCES `relatorio` (`idRelatorio`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sensor`
--

LOCK TABLES `sensor` WRITE;
/*!40000 ALTER TABLE `sensor` DISABLE KEYS */;
/*!40000 ALTER TABLE `sensor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setor`
--

DROP TABLE IF EXISTS `setor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `setor` (
  `idSetor` int NOT NULL AUTO_INCREMENT,
  `fkEmpresa` int DEFAULT NULL,
  `fkSensor` int DEFAULT NULL,
  PRIMARY KEY (`idSetor`),
  KEY `fkEmpresa` (`fkEmpresa`),
  KEY `fkSensor` (`fkSensor`),
  CONSTRAINT `setor_ibfk_1` FOREIGN KEY (`fkEmpresa`) REFERENCES `empresa` (`cnpj`),
  CONSTRAINT `setor_ibfk_2` FOREIGN KEY (`fkSensor`) REFERENCES `sensor` (`idSensor`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setor`
--

LOCK TABLES `setor` WRITE;
/*!40000 ALTER TABLE `setor` DISABLE KEYS */;
/*!40000 ALTER TABLE `setor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `idUsuario` int NOT NULL AUTO_INCREMENT,
  `email` varchar(50) DEFAULT NULL,
  `senha` char(12) DEFAULT NULL,
  PRIMARY KEY (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-15 20:18:27
