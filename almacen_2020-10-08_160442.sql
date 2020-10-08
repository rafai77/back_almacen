/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


CREATE DATABASE /*!32312 IF NOT EXISTS*/ `almacen` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `almacen`;
DROP TABLE IF EXISTS `cm1`;
CREATE TABLE `cm1` (
  `id_inve` int NOT NULL AUTO_INCREMENT,
  `id_producto` varchar(50) NOT NULL,
  `total` decimal(12,3) NOT NULL,
  PRIMARY KEY (`id_inve`),
  UNIQUE KEY `total` (`total`,`id_producto`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `cm1_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=183 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `cm2`;
CREATE TABLE `cm2` (
  `id_inve` int NOT NULL AUTO_INCREMENT,
  `id_producto` varchar(50) NOT NULL,
  `total` decimal(12,3) NOT NULL,
  PRIMARY KEY (`id_inve`),
  UNIQUE KEY `total` (`total`,`id_producto`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `cm2_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `cm4_p`;
CREATE TABLE `cm4_p` (
  `id_inve` int NOT NULL AUTO_INCREMENT,
  `id_producto` varchar(50) NOT NULL,
  `total` decimal(12,3) NOT NULL,
  PRIMARY KEY (`id_inve`),
  UNIQUE KEY `total` (`total`,`id_producto`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `cm4_p_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `cm4_t`;
CREATE TABLE `cm4_t` (
  `id_inve` int NOT NULL AUTO_INCREMENT,
  `id_producto` varchar(50) NOT NULL,
  `total` decimal(12,3) NOT NULL,
  PRIMARY KEY (`id_inve`),
  UNIQUE KEY `total` (`total`,`id_producto`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `cm4_t_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `cm5`;
CREATE TABLE `cm5` (
  `id_inve` int NOT NULL AUTO_INCREMENT,
  `id_producto` varchar(50) NOT NULL,
  `total` decimal(12,3) NOT NULL,
  PRIMARY KEY (`id_inve`),
  UNIQUE KEY `total` (`total`,`id_producto`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `cm5_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `cm6_p`;
CREATE TABLE `cm6_p` (
  `id_inve` int NOT NULL AUTO_INCREMENT,
  `id_producto` varchar(50) NOT NULL,
  `total` decimal(12,3) NOT NULL,
  PRIMARY KEY (`id_inve`),
  UNIQUE KEY `total` (`total`,`id_producto`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `cm6_p_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `cm6_t`;
CREATE TABLE `cm6_t` (
  `id_inve` int NOT NULL AUTO_INCREMENT,
  `id_producto` varchar(50) NOT NULL,
  `total` decimal(12,3) NOT NULL,
  PRIMARY KEY (`id_inve`),
  UNIQUE KEY `total` (`total`,`id_producto`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `cm6_t_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `cms`;
CREATE TABLE `cms` (
  `id_cm` int NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `invernaderos` varchar(50) NOT NULL,
  `planta` varchar(10) DEFAULT NULL,
  `nom2` varchar(10) NOT NULL,
  PRIMARY KEY (`id_cm`),
  UNIQUE KEY `nombre` (`nombre`,`planta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `consumocm1`;
CREATE TABLE `consumocm1` (
  `id_consucm1` int NOT NULL AUTO_INCREMENT,
  `id_producto` varchar(50) NOT NULL,
  `cantidad` decimal(12,3) NOT NULL,
  `id_cm` int NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`id_consucm1`),
  UNIQUE KEY `id_producto` (`id_producto`,`id_cm`,`fecha`),
  KEY `id_cm` (`id_cm`),
  CONSTRAINT `consumocm1_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`),
  CONSTRAINT `consumocm1_ibfk_2` FOREIGN KEY (`id_cm`) REFERENCES `cms` (`id_cm`)
) ENGINE=InnoDB AUTO_INCREMENT=1978 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `formulas`;
CREATE TABLE `formulas` (
  `id_fromula` int NOT NULL AUTO_INCREMENT,
  `id_producto` varchar(50) NOT NULL,
  `cantidad` decimal(10,6) NOT NULL,
  `id_cm` int NOT NULL,
  PRIMARY KEY (`id_fromula`),
  UNIQUE KEY `id_producto` (`id_producto`,`id_cm`),
  KEY `id_cm` (`id_cm`),
  CONSTRAINT `formulas_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`),
  CONSTRAINT `formulas_ibfk_2` FOREIGN KEY (`id_cm`) REFERENCES `cms` (`id_cm`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `inventario`;
CREATE TABLE `inventario` (
  `id_inve` int NOT NULL AUTO_INCREMENT,
  `id_producto` varchar(50) NOT NULL,
  `total` decimal(12,3) NOT NULL,
  PRIMARY KEY (`id_inve`),
  UNIQUE KEY `total` (`total`,`id_producto`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `inventario_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `pedido_producto`;
CREATE TABLE `pedido_producto` (
  `id_pp` int NOT NULL AUTO_INCREMENT,
  `id_producto` varchar(50) NOT NULL,
  `id_pedido` int NOT NULL,
  `cantidad` decimal(10,5) NOT NULL,
  `cantidad_entrgada` decimal(10,5) NOT NULL,
  PRIMARY KEY (`id_pp`),
  KEY `id_producto` (`id_producto`),
  KEY `id_pedido` (`id_pedido`),
  CONSTRAINT `pedido_producto_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`),
  CONSTRAINT `pedido_producto_ibfk_2` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id_pedido`)
) ENGINE=InnoDB AUTO_INCREMENT=652 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `pedidos`;
CREATE TABLE `pedidos` (
  `id_pedido` int NOT NULL AUTO_INCREMENT,
  `status` varchar(10) NOT NULL,
  `id_cm` int NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`id_pedido`),
  UNIQUE KEY `fecha` (`fecha`,`id_cm`),
  KEY `id_cm` (`id_cm`),
  CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`id_cm`) REFERENCES `cms` (`id_cm`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `productos`;
CREATE TABLE `productos` (
  `id_producto` varchar(9) NOT NULL,
  `producto` varchar(50) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `unidad` varchar(4) NOT NULL,
  PRIMARY KEY (`id_producto`),
  UNIQUE KEY `producto` (`producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `traspasos`;
CREATE TABLE `traspasos` (
  `id_traspasos` int NOT NULL AUTO_INCREMENT,
  `id_cm` int NOT NULL,
  `id_cm2` int NOT NULL,
  `fecha` date NOT NULL,
  `status` varchar(15) NOT NULL,
  PRIMARY KEY (`id_traspasos`),
  UNIQUE KEY `id_cm` (`id_cm`,`id_cm2`,`fecha`),
  CONSTRAINT `traspasos_ibfk_1` FOREIGN KEY (`id_cm`) REFERENCES `cms` (`id_cm`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `traspasos_producto`;
CREATE TABLE `traspasos_producto` (
  `id_tp` int NOT NULL AUTO_INCREMENT,
  `status` varchar(10) NOT NULL,
  `id_producto` varchar(50) NOT NULL,
  `id_traspasos` int NOT NULL,
  `valor` decimal(10,3) NOT NULL,
  PRIMARY KEY (`id_tp`),
  KEY `id_producto` (`id_producto`),
  KEY `id_traspasos` (`id_traspasos`),
  CONSTRAINT `traspasos_producto_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`),
  CONSTRAINT `traspasos_producto_ibfk_2` FOREIGN KEY (`id_traspasos`) REFERENCES `traspasos` (`id_traspasos`)
) ENGINE=InnoDB AUTO_INCREMENT=148 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `user_cms`;
CREATE TABLE `user_cms` (
  `id_user` int NOT NULL,
  `id_cm` int NOT NULL,
  PRIMARY KEY (`id_user`,`id_cm`),
  KEY `id_cm` (`id_cm`),
  CONSTRAINT `user_cms_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `usuarios` (`id_user`),
  CONSTRAINT `user_cms_ibfk_2` FOREIGN KEY (`id_cm`) REFERENCES `cms` (`id_cm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios` (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `user` varchar(50) NOT NULL,
  `pass` blob,
  `rol` varchar(50) NOT NULL,
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `user` (`user`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `cm1` (`id_inve`,`id_producto`,`total`) VALUES (164,'FERS0003',0.000),(166,'FERS0007',0.000),(171,'FERS0015',0.000),(174,'FERS0029',0.000),(175,'FERS0030',0.000),(176,'FERS0031',0.000),(177,'FERS0032',0.000),(182,'FERS0040',0.000),(162,'FERS0001',10.000),(170,'FERS0014',26.300),(159,'FERL0007',34.000),(181,'FERS0039',180.000),(180,'FERS0038',246.000),(161,'FERL0012',335.500),(178,'FERS0034',498.000),(179,'FERS0036',725.000),(173,'FERS0028',740.000),(160,'FERL0010',990.000),(172,'FERS0019',1012.500),(165,'FERS0004',1913.000),(167,'FERS0008',2003.000),(158,'FERL0002',2365.000),(168,'FERS0009',2425.000),(157,'FERL0001',5541.000),(163,'FERS0002',5789.000),(169,'FERS0010',6560.000);

INSERT INTO `cm2` (`id_inve`,`id_producto`,`total`) VALUES (4,'FERL0010',0.000),(5,'FERL0012',0.000),(10,'FERS0007',0.000),(17,'FERS0028',0.000),(18,'FERS0029',0.000),(19,'FERS0030',0.000),(20,'FERS0031',0.000),(21,'FERS0032',0.000),(24,'FERS0038',0.000),(26,'FERS0040',0.000),(15,'FERS0015',57.000),(3,'FERL0007',100.000),(6,'FERS0001',150.000),(14,'FERS0014',159.900),(25,'FERS0039',225.000),(12,'FERS0009',300.000),(9,'FERS0004',600.000),(2,'FERL0002',640.000),(23,'FERS0036',725.000),(16,'FERS0019',912.000),(8,'FERS0003',1300.000),(22,'FERS0034',1320.000),(1,'FERL0001',1924.000),(11,'FERS0008',3095.000),(13,'FERS0010',6951.000),(7,'FERS0002',12997.000);

INSERT INTO `cm4_p` (`id_inve`,`id_producto`,`total`) VALUES (2,'FERL0002',0.000),(4,'FERL0010',0.000),(5,'FERL0012',0.000),(6,'FERS0001',0.000),(10,'FERS0007',0.000),(15,'FERS0015',0.000),(17,'FERS0028',0.000),(18,'FERS0029',0.000),(19,'FERS0030',0.000),(20,'FERS0031',0.000),(21,'FERS0032',0.000),(24,'FERS0038',0.000),(25,'FERS0039',0.000),(26,'FERS0040',0.000),(3,'FERL0007',140.000),(22,'FERS0034',340.000),(14,'FERS0014',470.200),(16,'FERS0019',760.000),(23,'FERS0036',1100.000),(1,'FERL0001',1300.000),(12,'FERS0009',2775.000),(11,'FERS0008',3900.000),(9,'FERS0004',4250.000),(8,'FERS0003',5500.000),(13,'FERS0010',6500.000),(7,'FERS0002',21600.000);

INSERT INTO `cm4_t` (`id_inve`,`id_producto`,`total`) VALUES (3,'FERL0007',0.000),(5,'FERL0012',0.000),(6,'FERS0001',0.000),(14,'FERS0014',0.000),(15,'FERS0015',0.000),(16,'FERS0019',0.000),(23,'FERS0036',0.000),(25,'FERS0039',0.000),(26,'FERS0040',0.000),(24,'FERS0038',100.000),(19,'FERS0030',180.000),(22,'FERS0034',180.000),(21,'FERS0032',255.000),(2,'FERL0002',640.000),(10,'FERS0007',800.000),(8,'FERS0003',975.000),(4,'FERL0010',1200.000),(20,'FERS0031',1425.000),(18,'FERS0029',2292.100),(12,'FERS0009',3935.000),(1,'FERL0001',4000.000),(9,'FERS0004',4400.000),(17,'FERS0028',7549.450),(13,'FERS0010',19236.000),(11,'FERS0008',20554.000),(7,'FERS0002',55029.000);

INSERT INTO `cm5` (`id_inve`,`id_producto`,`total`) VALUES (3,'FERL0007',0.000),(5,'FERL0012',0.000),(6,'FERS0001',0.000),(14,'FERS0014',0.000),(15,'FERS0015',0.000),(16,'FERS0019',0.000),(23,'FERS0036',0.000),(25,'FERS0039',0.000),(24,'FERS0038',80.000),(21,'FERS0032',160.000),(19,'FERS0030',180.000),(20,'FERS0031',200.000),(26,'FERS0040',237.500),(2,'FERL0002',440.000),(22,'FERS0034',480.000),(4,'FERL0010',520.000),(10,'FERS0007',1140.000),(18,'FERS0029',1343.100),(12,'FERS0009',2150.000),(17,'FERS0028',2875.000),(8,'FERS0003',3500.000),(13,'FERS0010',3825.000),(1,'FERL0001',4000.000),(9,'FERS0004',8250.000),(11,'FERS0008',19800.000),(7,'FERS0002',46900.000);

INSERT INTO `cm6_p` (`id_inve`,`id_producto`,`total`) VALUES (2,'FERL0002',0.000),(4,'FERL0010',0.000),(5,'FERL0012',0.000),(10,'FERS0007',0.000),(14,'FERS0014',0.000),(15,'FERS0015',0.000),(18,'FERS0029',0.000),(19,'FERS0030',0.000),(20,'FERS0031',0.000),(21,'FERS0032',0.000),(24,'FERS0038',0.000),(25,'FERS0039',0.000),(26,'FERS0040',0.000),(3,'FERL0007',80.000),(17,'FERS0028',90.000),(6,'FERS0001',200.000),(22,'FERS0034',340.000),(16,'FERS0019',720.000),(1,'FERL0001',750.000),(12,'FERS0009',1150.000),(23,'FERS0036',2600.000),(9,'FERS0004',2769.000),(8,'FERS0003',2925.000),(11,'FERS0008',3296.000),(13,'FERS0010',4396.000),(7,'FERS0002',17601.000);

INSERT INTO `cm6_t` (`id_inve`,`id_producto`,`total`) VALUES (15,'FERS0015',57.000),(5,'FERL0012',335.000),(6,'FERS0001',350.000),(26,'FERS0040',425.000),(3,'FERL0007',442.000),(19,'FERS0030',480.000),(21,'FERS0032',540.000),(24,'FERS0038',600.000),(14,'FERS0014',653.400),(25,'FERS0039',725.000),(20,'FERS0031',1700.000),(22,'FERS0034',3202.000),(10,'FERS0007',3420.000),(4,'FERL0010',4180.000),(23,'FERS0036',4425.000),(16,'FERS0019',4633.800),(2,'FERL0002',5940.000),(18,'FERS0029',11824.400),(12,'FERS0009',13320.000),(8,'FERS0003',14740.000),(1,'FERL0001',17548.000),(17,'FERS0028',19039.450),(9,'FERS0004',30975.000),(13,'FERS0010',57885.000),(11,'FERS0008',80975.000),(7,'FERS0002',187680.000);

INSERT INTO `cms` (`id_cm`,`nombre`,`invernaderos`,`planta`,`nom2`) VALUES (1,'Cuarto de maquinas 1-Pimiento','1,2,3,4','Pimiento','cm1'),(2,'Cuarto de maquinas 2-3-Pimiento','5,6,7,8','Pimiento','cm2'),(3,'Cuarto de maquinas 4-Pimiento','9,10','Pimiento','cm4_p'),(4,'Cuarto de maquinas 4-Tomate','11,12','Tomate','cm4_t'),(5,'Cuarto de maquinas 5-Tomate','13,14','Tomate','cm5'),(6,'Cuarto de maquinas 6-Pimiento','17,18','Pimiento','cm6_p'),(7,'Cuarto de maquinas 6-Tomate','15,16','Tomate','cm6_t'),(8,'Alamacen General','NAN','NAN','inventario');

INSERT INTO `consumocm1` (`id_consucm1`,`id_producto`,`cantidad`,`id_cm`,`fecha`) VALUES (1234,'FERL0010',50.000,1,'2020-09-14'),(1235,'FERL0001',100.000,1,'2020-09-14'),(1236,'FERL0002',275.000,1,'2020-09-14'),(1237,'FERL0007',2.000,1,'2020-09-14'),(1238,'FERS0004',100.000,1,'2020-09-14'),(1239,'FERS0014',1.500,1,'2020-09-14'),(1240,'FERS0019',12.500,1,'2020-09-14'),(1241,'FERS0008',150.000,1,'2020-09-14'),(1242,'FERS0009',25.000,1,'2020-09-14'),(1244,'FERL0010',50.000,1,'2020-09-17'),(1245,'FERL0001',100.000,1,'2020-09-17'),(1246,'FERL0002',275.000,1,'2020-09-17'),(1247,'FERL0007',2.000,1,'2020-09-17'),(1248,'FERS0004',100.000,1,'2020-09-17'),(1249,'FERS0014',1.500,1,'2020-09-17'),(1250,'FERS0019',12.500,1,'2020-09-17'),(1251,'FERS0008',150.000,1,'2020-09-17'),(1252,'FERS0009',25.000,1,'2020-09-17'),(1271,'FERL0010',50.000,1,'2020-09-18'),(1272,'FERL0001',100.000,1,'2020-09-18'),(1273,'FERL0002',275.000,1,'2020-09-18'),(1274,'FERL0007',2.000,1,'2020-09-18'),(1275,'FERS0004',100.000,1,'2020-09-18'),(1276,'FERS0014',1.500,1,'2020-09-18'),(1277,'FERS0019',12.500,1,'2020-09-18'),(1278,'FERS0008',150.000,1,'2020-09-18'),(1279,'FERS0009',25.000,1,'2020-09-18'),(1316,'FERL0010',32.000,1,'2020-09-19'),(1317,'FERL0001',125.000,1,'2020-09-19'),(1318,'FERL0002',150.000,1,'2020-09-19'),(1319,'FERL0007',15.000,1,'2020-09-19'),(1320,'FERS0004',100.000,1,'2020-09-19'),(1321,'FERS0014',5.000,1,'2020-09-19'),(1322,'FERS0019',50.000,1,'2020-09-19'),(1323,'FERS0008',235.000,1,'2020-09-19'),(1324,'FERS0009',20.000,1,'2020-09-19'),(1355,'FERL0010',35.000,1,'2020-09-21'),(1356,'FERL0001',15.000,1,'2020-09-21'),(1357,'FERL0002',150.000,1,'2020-09-21'),(1358,'FERS0028',10.000,1,'2020-09-21'),(1359,'FERL0007',15.000,1,'2020-09-21'),(1360,'FERS0004',175.000,1,'2020-09-21'),(1361,'FERS0014',10.000,1,'2020-09-21'),(1362,'FERS0019',100.000,1,'2020-09-21'),(1363,'FERS0008',235.000,1,'2020-09-21'),(1364,'FERS0009',5.000,1,'2020-09-21'),(1395,'FERL0010',35.000,1,'2020-09-20'),(1396,'FERL0001',15.000,1,'2020-09-20'),(1397,'FERL0002',150.000,1,'2020-09-20'),(1398,'FERS0028',10.000,1,'2020-09-20'),(1399,'FERL0007',15.000,1,'2020-09-20'),(1400,'FERS0004',175.000,1,'2020-09-20'),(1401,'FERS0014',10.000,1,'2020-09-20'),(1402,'FERS0019',100.000,1,'2020-09-20'),(1403,'FERS0008',235.000,1,'2020-09-20'),(1404,'FERS0009',5.000,1,'2020-09-20'),(1456,'FERL0010',35.000,1,'2020-09-22'),(1457,'FERL0001',15.000,1,'2020-09-22'),(1458,'FERL0002',150.000,1,'2020-09-22'),(1459,'FERS0028',10.000,1,'2020-09-22'),(1460,'FERL0007',15.000,1,'2020-09-22'),(1461,'FERS0004',175.000,1,'2020-09-22'),(1462,'FERS0014',10.000,1,'2020-09-22'),(1463,'FERS0019',100.000,1,'2020-09-22'),(1464,'FERS0008',235.000,1,'2020-09-22'),(1465,'FERS0009',5.000,1,'2020-09-22'),(1466,'FERL0010',10.000,1,'2020-09-23'),(1467,'FERL0001',5.000,1,'2020-09-23'),(1468,'FERL0002',75.000,1,'2020-09-23'),(1469,'FERS0028',10.000,1,'2020-09-23'),(1470,'FERL0007',4.000,1,'2020-09-23'),(1471,'FERS0004',50.000,1,'2020-09-23'),(1472,'FERS0014',2.000,1,'2020-09-23'),(1473,'FERS0019',125.000,1,'2020-09-23'),(1474,'FERS0008',100.000,1,'2020-09-23'),(1475,'FERS0009',10.000,1,'2020-09-23'),(1476,'FERL0010',10.000,1,'2020-09-24'),(1477,'FERL0001',5.000,1,'2020-09-24'),(1478,'FERL0002',75.000,1,'2020-09-24'),(1479,'FERS0028',10.000,1,'2020-09-24'),(1480,'FERL0007',4.000,1,'2020-09-24'),(1481,'FERS0004',50.000,1,'2020-09-24'),(1482,'FERS0014',2.000,1,'2020-09-24'),(1483,'FERS0019',125.000,1,'2020-09-24'),(1484,'FERS0008',100.000,1,'2020-09-24'),(1485,'FERS0009',10.000,1,'2020-09-24'),(1506,'FERL0010',10.000,1,'2020-09-25'),(1507,'FERL0001',5.000,1,'2020-09-25'),(1508,'FERL0002',75.000,1,'2020-09-25'),(1509,'FERS0028',10.000,1,'2020-09-25'),(1510,'FERL0007',4.000,1,'2020-09-25'),(1511,'FERS0004',50.000,1,'2020-09-25'),(1512,'FERS0014',2.000,1,'2020-09-25'),(1513,'FERS0019',125.000,1,'2020-09-25'),(1514,'FERS0008',100.000,1,'2020-09-25'),(1515,'FERS0009',10.000,1,'2020-09-25'),(1537,'FERL0010',10.000,1,'2020-09-30'),(1538,'FERL0001',5.000,1,'2020-09-30'),(1539,'FERL0002',75.000,1,'2020-09-30'),(1540,'FERS0028',10.000,1,'2020-09-30'),(1541,'FERL0007',4.000,1,'2020-09-30'),(1542,'FERS0004',50.000,1,'2020-09-30'),(1543,'FERS0014',2.000,1,'2020-09-30'),(1544,'FERS0019',125.000,1,'2020-09-30'),(1545,'FERS0008',100.000,1,'2020-09-30'),(1546,'FERS0009',10.000,1,'2020-09-30'),(1567,'FERL0010',10.000,1,'2020-10-02'),(1568,'FERL0001',5.000,1,'2020-10-02'),(1569,'FERL0002',75.000,1,'2020-10-02'),(1570,'FERS0028',10.000,1,'2020-10-02'),(1571,'FERL0007',4.000,1,'2020-10-02'),(1572,'FERS0004',50.000,1,'2020-10-02'),(1573,'FERS0014',2.000,1,'2020-10-02'),(1574,'FERS0019',125.000,1,'2020-10-02'),(1575,'FERS0008',100.000,1,'2020-10-02'),(1576,'FERS0009',10.000,1,'2020-10-02'),(1587,'FERL0010',10.000,1,'2020-10-06'),(1588,'FERL0001',5.000,1,'2020-10-06'),(1589,'FERL0002',75.000,1,'2020-10-06'),(1590,'FERS0028',10.000,1,'2020-10-06'),(1591,'FERL0007',4.000,1,'2020-10-06'),(1592,'FERS0004',50.000,1,'2020-10-06'),(1593,'FERS0014',2.000,1,'2020-10-06'),(1594,'FERS0019',125.000,1,'2020-10-06'),(1595,'FERS0008',100.000,1,'2020-10-06'),(1596,'FERS0009',10.000,1,'2020-10-06'),(1607,'FERL0010',10.000,1,'2020-10-07'),(1608,'FERL0001',5.000,1,'2020-10-07'),(1609,'FERL0002',75.000,1,'2020-10-07'),(1610,'FERS0028',10.000,1,'2020-10-07'),(1611,'FERL0007',4.000,1,'2020-10-07'),(1612,'FERS0004',50.000,1,'2020-10-07'),(1613,'FERS0014',2.000,1,'2020-10-07'),(1614,'FERS0019',125.000,1,'2020-10-07'),(1615,'FERS0008',100.000,1,'2020-10-07'),(1616,'FERS0009',10.000,1,'2020-10-07'),(1968,'FERL0001',35.000,2,'2020-10-08'),(1969,'FERS0002',10.000,2,'2020-10-08'),(1970,'FERS0010',15.000,2,'2020-10-08'),(1971,'FERS0019',56.000,2,'2020-10-08'),(1972,'FERS0008',20.000,2,'2020-10-08');

INSERT INTO `formulas` (`id_fromula`,`id_producto`,`cantidad`,`id_cm`) VALUES (34,'FERS0010',20.000000,1),(35,'FERS0002',12.000000,1),(36,'FERL0001',2.000000,1),(37,'FERS0009',1.000000,1),(38,'FERL0002',30.000000,1),(39,'FERS0008',50.000000,1),(40,'FERS0004',10.000000,1),(41,'FERS0019',45.000000,1),(42,'FERL0010',5.000000,1),(43,'FERS0028',5.000000,1),(44,'FERL0007',10.000000,1),(45,'FERS0014',1.000000,1),(46,'FERS0003',25.000000,1),(52,'FERS0002',10.000000,2),(53,'FERS0010',15.000000,2),(54,'FERS0008',20.000000,2),(55,'FERL0001',35.000000,2),(56,'FERS0019',56.000000,2);

INSERT INTO `inventario` (`id_inve`,`id_producto`,`total`) VALUES (38,'FERS0001',406.000),(37,'FERL0012',454.000),(56,'FERS0038',469.000),(35,'FERL0007',542.000),(51,'FERS0030',645.000),(53,'FERS0032',692.000),(46,'FERS0014',739.400),(57,'FERS0039',840.000),(52,'FERS0031',1905.000),(54,'FERS0034',3954.000),(42,'FERS0007',4013.000),(36,'FERL0010',4491.000),(55,'FERS0036',5096.000),(47,'FERS0015',5897.000),(58,'FERS0040',6025.000),(34,'FERL0002',6805.000),(48,'FERS0019',10273.800),(50,'FERS0029',11947.400),(40,'FERS0003',17741.000),(33,'FERL0001',33608.000),(41,'FERS0004',34117.000),(49,'FERS0028',39533.450),(45,'FERS0010',59010.000),(43,'FERS0008',82539.000),(44,'FERS0009',181635.000),(39,'FERS0002',199265.000);

INSERT INTO `pedido_producto` (`id_pp`,`id_producto`,`id_pedido`,`cantidad`,`cantidad_entrgada`) VALUES (80,'FERS0002',23,25.00000,25.00000),(81,'FERS0008',23,87.00000,87.00000),(82,'FERS0010',23,95.00000,95.00000),(83,'FERS0004',23,21.00000,21.00000),(84,'FERS0028',23,5487.00000,5487.00000),(85,'FERL0001',23,5457.00000,5457.00000),(86,'FERS0003',23,541.00000,541.00000),(87,'FERS0009',23,254.00000,474.00000),(88,'FERS0029',23,21.00000,21.00000),(89,'FERL0002',23,854.00000,854.00000),(90,'FERS0019',23,5521.00000,5521.00000),(91,'FERS0036',23,541.00000,541.00000),(92,'FERL0010',23,254.00000,254.00000),(93,'FERS0007',23,526.00000,526.00000),(94,'FERS0034',23,632.00000,632.00000),(95,'FERS0031',23,145.00000,145.00000),(96,'FERS0039',23,5.00000,5.00000),(97,'FERS0014',23,9.00000,9.00000),(98,'FERS0038',23,55.00000,55.00000),(99,'FERS0032',23,12.00000,12.00000),(100,'FERS0030',23,55.00000,55.00000),(101,'FERL0007',23,0.00000,0.00000),(102,'FERS0040',23,0.00000,0.00000),(103,'FERS0001',23,0.00000,0.00000),(104,'FERL0012',23,0.00000,0.00000),(105,'FERS0015',23,0.00000,0.00000),(106,'FERS0002',24,123.00000,123.00000),(107,'FERS0008',24,76.00000,76.00000),(108,'FERS0010',24,67.00000,97.00000),(109,'FERS0004',24,0.00000,0.00000),(110,'FERS0028',24,765.00000,765.00000),(111,'FERL0001',24,56.00000,56.00000),(112,'FERS0003',24,5.00000,5.00000),(113,'FERS0009',24,656.00000,656.00000),(114,'FERS0029',24,56.00000,56.00000),(115,'FERL0002',24,6.00000,6.00000),(116,'FERS0019',24,65.00000,65.00000),(117,'FERS0036',24,56.00000,56.00000),(118,'FERL0010',24,56.00000,56.00000),(119,'FERS0007',24,65.00000,65.00000),(120,'FERS0034',24,65.00000,65.00000),(121,'FERS0031',24,56.00000,56.00000),(122,'FERS0039',24,56.00000,56.00000),(123,'FERS0014',24,56.00000,56.00000),(124,'FERS0038',24,56.00000,56.00000),(125,'FERS0032',24,56.00000,56.00000),(126,'FERS0030',24,56.00000,56.00000),(127,'FERL0007',24,65.00000,65.00000),(128,'FERS0040',24,56.00000,56.00000),(129,'FERS0001',24,56.00000,56.00000),(130,'FERL0012',24,65.00000,65.00000),(131,'FERS0015',24,65.00000,65.00000),(132,'FERS0002',26,0.00000,0.00000),(133,'FERS0008',26,878.00000,700.00000),(134,'FERS0010',26,45.00000,35.00000),(135,'FERS0004',26,4.00000,0.00000),(136,'FERS0028',26,5.00000,0.00000),(137,'FERL0001',26,548.00000,0.00000),(138,'FERS0003',26,7.00000,0.00000),(139,'FERS0009',26,54521.00000,54000.00000),(140,'FERS0029',26,1851.00000,0.00000),(141,'FERL0002',26,2.00000,0.00000),(142,'FERS0019',26,1.00000,0.00000),(143,'FERS0036',26,21.00000,0.00000),(144,'FERL0010',26,5.00000,0.00000),(145,'FERS0007',26,12.00000,0.00000),(146,'FERS0034',26,1.00000,0.00000),(147,'FERS0031',26,524.00000,0.00000),(148,'FERS0039',26,54.00000,0.00000),(149,'FERS0014',26,12.00000,0.00000),(150,'FERS0038',26,1.00000,0.00000),(151,'FERS0032',26,564.00000,0.00000),(152,'FERS0030',26,51.00000,0.00000),(153,'FERL0007',26,52.00000,0.00000),(154,'FERS0040',26,1.00000,0.00000),(155,'FERS0001',26,5.00000,0.00000),(156,'FERL0012',26,21.00000,0.00000),(157,'FERS0015',26,564.00000,0.00000),(158,'FERS0002',27,87.00000,87.00000),(159,'FERS0008',27,8.00000,8.00000),(160,'FERS0010',27,78.00000,98.00000),(161,'FERS0004',27,541.00000,541.00000),(162,'FERS0028',27,2.00000,2.00000),(163,'FERL0001',27,12.00000,12.00000),(164,'FERS0003',27,215.00000,215.00000),(165,'FERS0009',27,48.00000,48.00000),(166,'FERS0029',27,4.00000,4.00000),(167,'FERL0002',27,5.00000,5.00000),(168,'FERS0019',27,54.00000,54.00000),(169,'FERS0036',27,54.00000,54.00000),(170,'FERL0010',27,1.00000,1.00000),(171,'FERS0007',27,2.00000,2.00000),(172,'FERS0034',27,55.00000,55.00000),(173,'FERS0031',27,4.00000,4.00000),(174,'FERS0039',27,54.00000,54.00000),(175,'FERS0014',27,21.00000,21.00000),(176,'FERS0038',27,4.00000,4.00000),(177,'FERS0032',27,84.00000,84.00000),(178,'FERS0030',27,54.00000,54.00000),(179,'FERL0007',27,5.00000,5.00000),(180,'FERS0040',27,5454.00000,5454.00000),(181,'FERS0001',27,0.00000,0.00000),(182,'FERL0012',27,54.00000,54.00000),(183,'FERS0015',27,5445.00000,5445.00000),(184,'FERS0002',30,1243.00000,1243.00000),(185,'FERS0008',30,342.00000,342.00000),(186,'FERS0010',30,124.00000,120.00000),(187,'FERS0004',30,453.00000,450.00000),(188,'FERS0028',30,567.00000,560.00000),(189,'FERL0001',30,678.00000,535.00000),(190,'FERS0003',30,678.00000,500.00000),(191,'FERS0009',30,0.00000,0.00000),(192,'FERS0029',30,0.00000,0.00000),(193,'FERL0002',30,0.00000,0.00000),(194,'FERS0019',30,0.00000,0.00000),(195,'FERS0036',30,0.00000,0.00000),(196,'FERL0010',30,0.00000,0.00000),(197,'FERS0007',30,0.00000,0.00000),(198,'FERS0034',30,0.00000,0.00000),(199,'FERS0031',30,0.00000,0.00000),(200,'FERS0039',30,0.00000,0.00000),(201,'FERS0014',30,0.00000,0.00000),(202,'FERS0038',30,0.00000,0.00000),(203,'FERS0032',30,0.00000,0.00000),(204,'FERS0030',30,0.00000,0.00000),(205,'FERL0007',30,0.00000,0.00000),(206,'FERS0040',30,0.00000,0.00000),(207,'FERS0001',30,0.00000,0.00000),(208,'FERL0012',30,0.00000,0.00000),(209,'FERS0015',30,0.00000,0.00000),(210,'FERS0002',31,2133.00000,1500.00000),(211,'FERS0008',31,1234.00000,0.00000),(212,'FERS0010',31,4352.00000,0.00000),(213,'FERS0004',31,1234.00000,0.00000),(214,'FERS0028',31,2134.00000,0.00000),(215,'FERL0001',31,2345.00000,0.00000),(216,'FERS0003',31,987.00000,0.00000),(217,'FERS0009',31,679.00000,0.00000),(218,'FERS0029',31,789.00000,0.00000),(219,'FERL0002',31,67.00000,0.00000),(220,'FERS0019',31,0.00000,0.00000),(221,'FERS0036',31,0.00000,0.00000),(222,'FERL0010',31,0.00000,0.00000),(223,'FERS0007',31,0.00000,0.00000),(224,'FERS0034',31,0.00000,0.00000),(225,'FERS0031',31,0.00000,0.00000),(226,'FERS0039',31,0.00000,0.00000),(227,'FERS0014',31,0.00000,0.00000),(228,'FERS0038',31,0.00000,0.00000),(229,'FERS0032',31,0.00000,0.00000),(230,'FERS0030',31,0.00000,0.00000),(231,'FERL0007',31,0.00000,0.00000),(232,'FERS0040',31,0.00000,0.00000),(233,'FERS0001',31,0.00000,0.00000),(234,'FERL0012',31,0.00000,0.00000),(235,'FERS0015',31,0.00000,0.00000),(236,'FERS0002',32,50.00000,45.00000),(237,'FERS0009',32,87.00000,0.00000),(238,'FERS0008',32,98.00000,0.00000),(239,'FERS0010',32,56.00000,35.00000),(240,'FERS0028',32,2.00000,0.00000),(241,'FERS0004',32,15.00000,0.00000),(242,'FERL0001',32,21.00000,0.00000),(243,'FERS0003',32,20.00000,0.00000),(244,'FERS0029',32,56.00000,0.00000),(245,'FERS0019',32,36.00000,0.00000),(246,'FERL0002',32,78.00000,0.00000),(247,'FERS0040',32,96.00000,90.00000),(248,'FERS0015',32,547.00000,0.00000),(249,'FERS0036',32,89.00000,0.00000),(250,'FERL0010',32,42.00000,0.00000),(251,'FERS0007',32,0.00000,0.00000),(252,'FERS0034',32,0.00000,0.00000),(253,'FERS0031',32,0.00000,0.00000),(254,'FERS0039',32,0.00000,0.00000),(255,'FERS0014',32,0.00000,0.00000),(256,'FERS0038',32,0.00000,0.00000),(257,'FERS0032',32,0.00000,0.00000),(258,'FERS0030',32,0.00000,0.00000),(259,'FERL0007',32,0.00000,0.00000),(260,'FERL0012',32,0.00000,0.00000),(261,'FERS0001',32,0.00000,0.00000),(262,'FERS0002',33,1234.00000,1000.00000),(263,'FERS0009',33,0.00000,0.00000),(264,'FERS0008',33,0.00000,0.00000),(265,'FERS0010',33,0.00000,0.00000),(266,'FERS0028',33,0.00000,0.00000),(267,'FERS0004',33,0.00000,0.00000),(268,'FERL0001',33,0.00000,0.00000),(269,'FERS0003',33,0.00000,0.00000),(270,'FERS0029',33,0.00000,0.00000),(271,'FERS0019',33,0.00000,0.00000),(272,'FERL0002',33,0.00000,0.00000),(273,'FERS0040',33,0.00000,0.00000),(274,'FERS0015',33,0.00000,0.00000),(275,'FERS0036',33,0.00000,0.00000),(276,'FERL0010',33,0.00000,0.00000),(277,'FERS0007',33,0.00000,0.00000),(278,'FERS0034',33,0.00000,0.00000),(279,'FERS0031',33,0.00000,0.00000),(280,'FERS0039',33,0.00000,0.00000),(281,'FERS0014',33,0.00000,0.00000),(282,'FERS0038',33,0.00000,0.00000),(283,'FERS0032',33,0.00000,0.00000),(284,'FERS0030',33,0.00000,0.00000),(285,'FERL0007',33,0.00000,0.00000),(286,'FERL0012',33,0.00000,0.00000),(287,'FERS0001',33,0.00000,0.00000),(288,'FERS0002',35,987.00000,800.00000),(289,'FERS0009',35,432.00000,0.00000),(290,'FERS0008',35,321.00000,0.00000),(291,'FERS0010',35,231.00000,0.00000),(292,'FERS0028',35,0.00000,0.00000),(293,'FERS0004',35,0.00000,0.00000),(294,'FERL0001',35,0.00000,0.00000),(295,'FERS0003',35,0.00000,0.00000),(296,'FERS0029',35,0.00000,0.00000),(297,'FERS0019',35,0.00000,0.00000),(298,'FERL0002',35,0.00000,0.00000),(299,'FERS0040',35,0.00000,0.00000),(300,'FERS0015',35,0.00000,0.00000),(301,'FERS0036',35,0.00000,0.00000),(302,'FERL0010',35,0.00000,0.00000),(303,'FERS0007',35,0.00000,0.00000),(304,'FERS0034',35,0.00000,0.00000),(305,'FERS0031',35,0.00000,0.00000),(306,'FERS0039',35,0.00000,0.00000),(307,'FERS0014',35,0.00000,0.00000),(308,'FERS0038',35,0.00000,0.00000),(309,'FERS0032',35,0.00000,0.00000),(310,'FERS0030',35,0.00000,0.00000),(311,'FERL0007',35,0.00000,0.00000),(312,'FERL0012',35,0.00000,0.00000),(313,'FERS0001',35,0.00000,0.00000),(314,'FERS0002',36,123.00000,120.00000),(315,'FERS0009',36,324.00000,200.00000),(316,'FERS0008',36,432.00000,0.00000),(317,'FERS0010',36,123.00000,0.00000),(318,'FERS0028',36,324.00000,0.00000),(319,'FERS0004',36,0.00000,0.00000),(320,'FERL0001',36,0.00000,0.00000),(321,'FERS0003',36,0.00000,0.00000),(322,'FERS0029',36,0.00000,0.00000),(323,'FERS0019',36,0.00000,0.00000),(324,'FERL0002',36,0.00000,0.00000),(325,'FERS0040',36,0.00000,0.00000),(326,'FERS0015',36,0.00000,0.00000),(327,'FERS0036',36,0.00000,0.00000),(328,'FERL0010',36,0.00000,0.00000),(329,'FERS0007',36,0.00000,0.00000),(330,'FERS0034',36,0.00000,0.00000),(331,'FERS0031',36,0.00000,0.00000),(332,'FERS0039',36,0.00000,0.00000),(333,'FERS0014',36,0.00000,0.00000),(334,'FERS0038',36,0.00000,0.00000),(335,'FERS0032',36,0.00000,0.00000),(336,'FERS0030',36,0.00000,0.00000),(337,'FERL0007',36,0.00000,0.00000),(338,'FERL0012',36,0.00000,0.00000),(339,'FERS0001',36,0.00000,0.00000),(340,'FERS0002',37,321.00000,0.00000),(341,'FERS0009',37,987.00000,400.00000),(342,'FERS0008',37,542.00000,0.00000),(343,'FERS0010',37,30.00000,0.00000),(344,'FERS0028',37,12.00000,0.00000),(345,'FERS0004',37,548.00000,0.00000),(346,'FERL0001',37,963.00000,0.00000),(347,'FERS0003',37,68.00000,0.00000),(348,'FERS0029',37,487.00000,0.00000),(349,'FERS0019',37,145.00000,0.00000),(350,'FERL0002',37,320.00000,0.00000),(351,'FERS0040',37,985.00000,0.00000),(352,'FERS0015',37,325.00000,0.00000),(353,'FERS0036',37,6580.00000,0.00000),(354,'FERL0010',37,78.00000,0.00000),(355,'FERS0007',37,96.00000,0.00000),(356,'FERS0034',37,321.00000,0.00000),(357,'FERS0031',37,22.00000,0.00000),(358,'FERS0039',37,36.00000,0.00000),(359,'FERS0014',37,987.00000,0.00000),(360,'FERS0038',37,78.00000,0.00000),(361,'FERS0032',37,25.00000,0.00000),(362,'FERS0030',37,47.00000,0.00000),(363,'FERL0007',37,25.00000,0.00000),(364,'FERL0012',37,63.00000,0.00000),(365,'FERS0001',37,3.00000,0.00000),(366,'FERS0002',38,12.00000,0.00000),(367,'FERS0009',38,312.00000,0.00000),(368,'FERS0008',38,123.00000,0.00000),(369,'FERS0010',38,546.00000,0.00000),(370,'FERS0028',38,86.00000,0.00000),(371,'FERS0004',38,47.00000,0.00000),(372,'FERL0001',38,54.00000,0.00000),(373,'FERS0003',38,12.00000,0.00000),(374,'FERS0029',38,0.00000,0.00000),(375,'FERS0019',38,0.00000,0.00000),(376,'FERL0002',38,0.00000,0.00000),(377,'FERS0040',38,12.00000,0.00000),(378,'FERS0015',38,0.00000,0.00000),(379,'FERS0036',38,0.00000,0.00000),(380,'FERL0010',38,0.00000,0.00000),(381,'FERS0007',38,0.00000,0.00000),(382,'FERS0034',38,0.00000,0.00000),(383,'FERS0031',38,0.00000,0.00000),(384,'FERS0039',38,0.00000,0.00000),(385,'FERS0014',38,0.00000,0.00000),(386,'FERS0038',38,0.00000,0.00000),(387,'FERS0032',38,0.00000,0.00000),(388,'FERS0030',38,0.00000,0.00000),(389,'FERL0007',38,0.00000,0.00000),(390,'FERL0012',38,0.00000,0.00000),(391,'FERS0001',38,0.00000,0.00000),(522,'FERS0002',46,4455.00000,646.00000),(523,'FERS0009',46,745.00000,300.00000),(524,'FERS0008',46,5.00000,0.00000),(525,'FERS0010',46,187.00000,0.00000),(526,'FERS0028',46,15.00000,0.00000),(527,'FERS0004',46,0.00000,0.00000),(528,'FERL0001',46,0.00000,0.00000),(529,'FERS0003',46,0.00000,0.00000),(530,'FERS0029',46,0.00000,0.00000),(531,'FERS0019',46,0.00000,0.00000),(532,'FERL0002',46,0.00000,0.00000),(533,'FERS0040',46,0.00000,0.00000),(534,'FERS0015',46,0.00000,0.00000),(535,'FERS0036',46,0.00000,0.00000),(536,'FERL0010',46,0.00000,0.00000),(537,'FERS0007',46,0.00000,0.00000),(538,'FERS0034',46,0.00000,0.00000),(539,'FERS0031',46,0.00000,0.00000),(540,'FERS0039',46,0.00000,0.00000),(541,'FERS0014',46,0.00000,0.00000),(542,'FERS0038',46,0.00000,0.00000),(543,'FERS0032',46,0.00000,0.00000),(544,'FERS0030',46,0.00000,0.00000),(545,'FERL0007',46,0.00000,0.00000),(546,'FERL0012',46,0.00000,0.00000),(547,'FERS0001',46,0.00000,0.00000),(600,'FERS0002',50,0.00000,0.00000),(601,'FERS0009',50,45.00000,0.00000),(602,'FERS0008',50,54.00000,0.00000),(603,'FERS0010',50,45.00000,0.00000),(604,'FERS0028',50,54.00000,0.00000),(605,'FERS0004',50,545.00000,0.00000),(606,'FERL0001',50,454.00000,0.00000),(607,'FERS0003',50,0.00000,0.00000),(608,'FERS0029',50,87.00000,0.00000),(609,'FERS0019',50,8.00000,0.00000),(610,'FERL0002',50,5.00000,0.00000),(611,'FERS0040',50,21.00000,0.00000),(612,'FERS0015',50,0.00000,0.00000),(613,'FERS0036',50,0.00000,0.00000),(614,'FERL0010',50,0.00000,0.00000),(615,'FERS0007',50,0.00000,0.00000),(616,'FERS0034',50,0.00000,0.00000),(617,'FERS0031',50,0.00000,0.00000),(618,'FERS0039',50,0.00000,0.00000),(619,'FERS0014',50,0.00000,0.00000),(620,'FERS0032',50,0.00000,0.00000),(621,'FERS0030',50,0.00000,0.00000),(622,'FERL0007',50,0.00000,0.00000),(623,'FERS0038',50,0.00000,0.00000),(624,'FERL0012',50,0.00000,0.00000),(625,'FERS0001',50,0.00000,0.00000),(626,'FERS0002',51,54.00000,0.00000),(627,'FERS0009',51,125.00000,0.00000),(628,'FERS0008',51,631.00000,0.00000),(629,'FERS0010',51,68.00000,0.00000),(630,'FERS0028',51,78.00000,0.00000),(631,'FERS0004',51,4512.00000,0.00000),(632,'FERL0001',51,69.00000,0.00000),(633,'FERS0003',51,63.00000,0.00000),(634,'FERS0029',51,6.00000,0.00000),(635,'FERS0019',51,96.00000,0.00000),(636,'FERL0002',51,3.00000,0.00000),(637,'FERS0040',51,0.00000,0.00000),(638,'FERS0015',51,0.00000,0.00000),(639,'FERS0036',51,0.00000,0.00000),(640,'FERL0010',51,0.00000,0.00000),(641,'FERS0007',51,0.00000,0.00000),(642,'FERS0034',51,0.00000,0.00000),(643,'FERS0031',51,0.00000,0.00000),(644,'FERS0039',51,0.00000,0.00000),(645,'FERS0014',51,0.00000,0.00000),(646,'FERS0032',51,0.00000,0.00000),(647,'FERS0030',51,0.00000,0.00000),(648,'FERL0007',51,0.00000,0.00000),(649,'FERS0038',51,0.00000,0.00000),(650,'FERL0012',51,0.00000,0.00000),(651,'FERS0001',51,0.00000,0.00000);

INSERT INTO `pedidos` (`id_pedido`,`status`,`id_cm`,`fecha`) VALUES (23,'EntregaP',1,'2020-09-21'),(24,'EntregaP',1,'2020-09-20'),(26,'EntregaP',1,'2020-09-22'),(27,'EntregaP',1,'2020-09-23'),(30,'EntregaP',2,'2020-09-24'),(31,'EntregaP',1,'2020-09-24'),(32,'EntregaP',1,'2020-09-30'),(33,'EntregaP',7,'2020-10-05'),(35,'EntregaP',8,'2020-10-05'),(36,'EntregaP',1,'2020-10-05'),(37,'EntregaP',1,'2020-10-01'),(38,'Revision',8,'2020-10-06'),(39,'Revision',5,'2020-10-06'),(46,'EntregaP',1,'2020-10-02'),(50,'Revision',8,'2020-10-08'),(51,'Revision',1,'2020-10-08');

INSERT INTO `productos` (`id_producto`,`producto`,`tipo`,`unidad`) VALUES ('FERL0001','Acido Nitrico al 55%','Liquido','Lt'),('FERL0002','Acido Sulfurico al 98%','Liquido','Lt'),('FERL0007','Fitosal Raiz','Liquido','Lt'),('FERL0010','Acido Fosforico Ambar al 85%','Liquido','Lt'),('FERL0012','Bonosoil','Liquido','Lt'),('FERS0001','Amonitro','Solido','Kg'),('FERS0002','Nitrato de Calcio','Solido','Kg'),('FERS0003','Nitrato de Magnesio','Solido','Kg'),('FERS0004','MKP','Solido','Kg'),('FERS0007','Quelsel Hidroponia','Solido','Kg'),('FERS0008','Sulfato de Magnesio','Solido','Kg'),('FERS0009','Sulfato de Potasio','Solido','Kg'),('FERS0010','Nitrato de Potasio','Solido','Kg'),('FERS0014','Newquel Ca B','Solido','Kg'),('FERS0015','Actives Reforzado','Solido','Pza'),('FERS0019','Quelsel mix+TI','Solido','Kg'),('FERS0028','Cloruro de Potasio','Solido','Kg'),('FERS0029','Cloruro de Calcio','Solido','Kg'),('FERS0030','Newquel Zinc 14%','Solido','Kg'),('FERS0031','Solubor','Solido','Kg'),('FERS0032','Newquel (Mn 12%)','Solido','Kg'),('FERS0034','Newquel Fe 13.2%','Solido','Kg'),('FERS0036','Fosfatomonoamonico','Solido','Kg'),('FERS0038','Quelsel Mg 6%','Solido','Kg'),('FERS0039','Hipoclorito de calcio granulado 65%','Solido','Kg'),('FERS0040','Tradecorp Ca','Solido','Kg');

INSERT INTO `traspasos` (`id_traspasos`,`id_cm`,`id_cm2`,`fecha`,`status`) VALUES (20,4,6,'2020-10-02','Validado'),(21,8,1,'2020-10-03','Validado'),(22,6,1,'2020-10-03','Validado'),(29,2,1,'2020-10-05','Validado');

INSERT INTO `traspasos_producto` (`id_tp`,`status`,`id_producto`,`id_traspasos`,`valor`) VALUES (12,'Validado','FERS0002',20,123.000),(13,'Validado','FERS0008',20,423.000),(14,'Validado','FERS0010',20,657.000),(15,'Validado','FERS0028',20,45.000),(16,'Validado','FERS0002',21,23.000),(17,'Validado','FERS0009',21,325.000),(18,'Validado','FERS0008',21,54.000),(19,'Validado','FERS0010',21,67.000),(20,'Validado','FERS0038',21,123.000),(21,'Validado','FERS0002',22,45.000),(22,'Validado','FERS0004',22,456.000),(23,'Validado','FERS0010',22,68.000),(56,'Validado','FERS0002',29,123.000),(57,'Validado','FERS0010',29,54.000),(58,'Validado','FERS0008',29,345.000),(59,'Validado','FERL0001',29,546.000);

INSERT INTO `user_cms` (`id_user`,`id_cm`) VALUES (1,1),(2,1),(3,1),(1,2),(2,2),(1,3),(2,3),(1,4),(2,4),(1,5),(2,5),(1,6),(2,6),(1,7),(2,7),(1,8),(3,8);

INSERT INTO `usuarios` (`id_user`,`nombre`,`user`,`pass`,`rol`) VALUES (1,'horticola cimarron','Hcimarron',X'b5389f05ba48b8a8a9e6af04aa20a6ac','admin'),(2,'Alamacen','almacen',X'4572593c96000617f56cd3225bca333f','admin'),(3,'Cuarnto de maquinas 1','usercm1',X'247ee929097b618dccbc9786ca52ac4e','user');

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
