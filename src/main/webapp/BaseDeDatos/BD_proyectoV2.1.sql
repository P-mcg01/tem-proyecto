-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         5.7.33 - MySQL Community Server (GPL)
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para bd_tienda
DROP DATABASE IF EXISTS `bd_tienda`;
CREATE DATABASE IF NOT EXISTS `bd_tienda` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `bd_tienda`;

-- Volcando estructura para tabla bd_tienda.categoria
DROP TABLE IF EXISTS `categoria`;
CREATE TABLE IF NOT EXISTS `categoria` (
  `categoria_id` int(11) NOT NULL AUTO_INCREMENT,
  `categoria` varchar(50) NOT NULL,
  PRIMARY KEY (`categoria_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla bd_tienda.categoria: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` (`categoria_id`, `categoria`) VALUES
	(1, 'Sombreros'),
	(2, 'Chaquetas'),
	(3, 'Camisetas'),
	(4, 'Pantalones'),
	(5, 'Vestidos'),
	(6, 'Zapatos');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;

-- Volcando estructura para tabla bd_tienda.cliente
DROP TABLE IF EXISTS `cliente`;
CREATE TABLE IF NOT EXISTS `cliente` (
  `ci_cliente` int(15) NOT NULL,
  `nombre_cliente` varchar(60) NOT NULL,
  `apellidos_cliente` varchar(60) NOT NULL,
  `celular` int(15) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  PRIMARY KEY (`ci_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla bd_tienda.cliente: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` (`ci_cliente`, `nombre_cliente`, `apellidos_cliente`, `celular`, `id_cliente`) VALUES
	(12381209, 'Pepe', 'Huanca', 688192, 12381209),
	(113028233, 'Goni', 'Ssanxhez', 28301749, 113028233),
	(134315131, 'Pepito', 'Gonzales', 35226264, 134315131);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;

-- Volcando estructura para tabla bd_tienda.marca
DROP TABLE IF EXISTS `marca`;
CREATE TABLE IF NOT EXISTS `marca` (
  `marca_id` int(11) NOT NULL AUTO_INCREMENT,
  `marca` varchar(50) NOT NULL,
  PRIMARY KEY (`marca_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla bd_tienda.marca: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `marca` DISABLE KEYS */;
INSERT INTO `marca` (`marca_id`, `marca`) VALUES
	(1, 'Nike'),
	(2, 'Puma'),
	(3, 'Adidas'),
	(4, 'Reebok'),
	(5, 'Converse'),
	(6, 'Columbia'),
	(7, 'Asics'),
	(8, 'Under Armor');
/*!40000 ALTER TABLE `marca` ENABLE KEYS */;

-- Volcando estructura para tabla bd_tienda.orden
DROP TABLE IF EXISTS `orden`;
CREATE TABLE IF NOT EXISTS `orden` (
  `orden_id` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad` int(11) DEFAULT NULL,
  `total` double(10,2) DEFAULT NULL,
  `descuento` double(10,2) DEFAULT NULL,
  `fecha_orden` date DEFAULT NULL,
  `producto_id` int(11) DEFAULT NULL,
  `id_venta` int(11) DEFAULT NULL,
  PRIMARY KEY (`orden_id`),
  KEY `producto_id` (`producto_id`),
  KEY `orden_ifbk_2` (`id_venta`),
  CONSTRAINT `orden_ibfk_1` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`producto_id`),
  CONSTRAINT `orden_ifbk_2` FOREIGN KEY (`id_venta`) REFERENCES `venta` (`id_venta`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla bd_tienda.orden: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `orden` DISABLE KEYS */;
INSERT INTO `orden` (`orden_id`, `cantidad`, `total`, `descuento`, `fecha_orden`, `producto_id`, `id_venta`) VALUES
	(1, 20, 30.00, 0.00, '2022-11-24', 2, 3);
/*!40000 ALTER TABLE `orden` ENABLE KEYS */;

-- Volcando estructura para tabla bd_tienda.producto
DROP TABLE IF EXISTS `producto`;
CREATE TABLE IF NOT EXISTS `producto` (
  `producto_id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_prod` varchar(80) NOT NULL,
  `precio` double(10,2) NOT NULL,
  `stock_id` int(11) DEFAULT NULL,
  `marca_id` int(11) DEFAULT NULL,
  `categoria_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`producto_id`),
  KEY `stock_id` (`stock_id`),
  KEY `marca_id` (`marca_id`),
  KEY `categoria_id` (`categoria_id`),
  CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`stock_id`) REFERENCES `stock` (`stock_id`),
  CONSTRAINT `producto_ibfk_2` FOREIGN KEY (`marca_id`) REFERENCES `marca` (`marca_id`),
  CONSTRAINT `producto_ibfk_3` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`categoria_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla bd_tienda.producto: ~30 rows (aproximadamente)
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` (`producto_id`, `nombre_prod`, `precio`, `stock_id`, `marca_id`, `categoria_id`) VALUES
	(1, 'ADIDAS GORRA AC BB', 230.00, 1, 3, 1),
	(2, 'ADIDAS GORRA BASEB CLASS TRE', 300.00, 1, 3, 1),
	(3, 'COLUMBIA Gorra Bora Bora', 270.00, 1, 6, 1),
	(4, 'PUMA GORRA ARCHIVE LOGO BB', 120.00, 1, 2, 1),
	(5, 'RBK GORRA TE LOGO', 170.00, 1, 4, 1),
	(6, 'ADIDAS RUNR JACKET W', 462.00, 1, 3, 2),
	(7, 'PUMA SUDADERA W CONCEPT', 400.00, 1, 2, 2),
	(8, 'PUMA CHAQUETA ESS PADDED', 500.00, 1, 2, 2),
	(9, 'UA CHAQUETA WOVEN TRACK', 455.00, 1, 8, 2),
	(10, 'COLUMBIA CHAQUETA ASCENDER', 1000.00, 1, 6, 2),
	(11, 'FIRWOOD CAMP TEE', 250.00, 1, 6, 3),
	(12, 'ADIDAS POLERA ADI RUNNER', 400.00, 1, 3, 3),
	(13, 'PUMA POLERA W CONCEPT TANK', 200.00, 1, 2, 3),
	(14, 'Adidas Camiseta Alemania 2022', 800.00, 1, 3, 3),
	(15, 'Adidas Camiseta Argentina 2022', 900.00, 1, 3, 3),
	(16, 'NIKE PANTALON DRY ACDMY', 280.00, 1, 1, 4),
	(17, 'UA PANTALON RCK TERRY', 400.00, 1, 8, 4),
	(18, 'OUTDOOR ELEMENTS STRETCH PANT', 700.00, 1, 6, 4),
	(19, 'EMBROIDERED CHEVRON PANT', 400.00, 1, 5, 4),
	(20, 'RBK PANTALON PIPING PACK JOGGER', 350.00, 1, 4, 4),
	(21, 'Vestido Miss Selfridge', 4699.00, 1, 7, 5),
	(22, 'Vestido corto Bardot', 399.00, 1, 6, 5),
	(23, 'Vestido negro de tirantes de ASYOU', 389.00, 1, 8, 5),
	(24, 'Vestido corto rosa Femme Luxe', 469.00, 1, 6, 5),
	(25, 'First Distraction The Label', 1900.00, 1, 4, 5),
	(26, 'Adidas Zap Predator Edge', 550.00, 1, 3, 6),
	(27, 'Nike Zap Sb Chron', 700.00, 1, 1, 6),
	(28, 'Nike Zap Zoom Blazer Low Pro', 750.00, 1, 1, 6),
	(29, 'Rbk Zap Classic Leather', 750.00, 1, 4, 6),
	(30, 'CONVERSE Zap Chuck 70 Plus', 800.00, 1, 5, 6);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;

-- Volcando estructura para tabla bd_tienda.stock
DROP TABLE IF EXISTS `stock`;
CREATE TABLE IF NOT EXISTS `stock` (
  `stock_id` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad` int(11) NOT NULL,
  PRIMARY KEY (`stock_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla bd_tienda.stock: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
INSERT INTO `stock` (`stock_id`, `cantidad`) VALUES
	(1, 9);
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;

-- Volcando estructura para tabla bd_tienda.tienda
DROP TABLE IF EXISTS `tienda`;
CREATE TABLE IF NOT EXISTS `tienda` (
  `id_tienda` int(11) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `ciudad` varchar(50) NOT NULL,
  `telefono` int(15) NOT NULL,
  PRIMARY KEY (`id_tienda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla bd_tienda.tienda: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `tienda` DISABLE KEYS */;
INSERT INTO `tienda` (`id_tienda`, `direccion`, `ciudad`, `telefono`) VALUES
	(1001, 'Av. Juan Pablo II', 'El Alto', 22337766),
	(1002, 'Av. Sucre B', 'El Alto', 22559900),
	(1003, 'Av. Pando', 'Pando', 73020),
	(49964, 'Av. Santa Fe', 'Cochabamba', 221840);
/*!40000 ALTER TABLE `tienda` ENABLE KEYS */;

-- Volcando estructura para tabla bd_tienda.usuarios
DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(50) DEFAULT NULL,
  `apellidos` varchar(100) DEFAULT NULL,
  `correo` varchar(50) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla bd_tienda.usuarios: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` (`id`, `nombres`, `apellidos`, `correo`, `password`) VALUES
	(1, 'admin', 'admin', 'admin@gmail.com', '21232f297a57a5a743894a0e4a801fc3'),
	(2, 'grupo', 'tem', 'gt@gamil.com', '12345');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;

-- Volcando estructura para tabla bd_tienda.vendedor
DROP TABLE IF EXISTS `vendedor`;
CREATE TABLE IF NOT EXISTS `vendedor` (
  `ci_vendedor` int(15) NOT NULL,
  `nombre_vendedor` varchar(50) NOT NULL,
  `apellido_paterno` varchar(50) NOT NULL,
  `apellido_materno` varchar(50) NOT NULL,
  `celular` int(15) NOT NULL,
  `id_tienda` int(11) DEFAULT NULL,
  `id` int(11) DEFAULT NULL,
  PRIMARY KEY (`ci_vendedor`),
  KEY `id_tienda` (`id_tienda`),
  CONSTRAINT `vendedor_ibfk_1` FOREIGN KEY (`id_tienda`) REFERENCES `tienda` (`id_tienda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla bd_tienda.vendedor: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `vendedor` DISABLE KEYS */;
INSERT INTO `vendedor` (`ci_vendedor`, `nombre_vendedor`, `apellido_paterno`, `apellido_materno`, `celular`, `id_tienda`, `id`) VALUES
	(440183, 'Pedro', 'Domingo', 'Suarez', 76539026, 1001, 12),
	(1283213, 'Hugo', 'Salinas', 'Aguado', 78592057, 1002, 2),
	(15326232, 'Raul', 'Alejandro', 'Magno', 74890235, 1003, 90216467);
/*!40000 ALTER TABLE `vendedor` ENABLE KEYS */;

-- Volcando estructura para tabla bd_tienda.venta
DROP TABLE IF EXISTS `venta`;
CREATE TABLE IF NOT EXISTS `venta` (
  `id_venta` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_venta` date NOT NULL,
  `tienda_id` int(11) DEFAULT NULL,
  `ci_vendedor` int(11) DEFAULT NULL,
  `ci_cliente` int(11) DEFAULT NULL,
  `orden_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_venta`),
  KEY `tienda_id` (`tienda_id`),
  KEY `ci_vendedor` (`ci_vendedor`),
  KEY `ci_cliente` (`ci_cliente`),
  KEY `venta_ibfk_4` (`orden_id`),
  CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`tienda_id`) REFERENCES `tienda` (`id_tienda`),
  CONSTRAINT `venta_ibfk_2` FOREIGN KEY (`ci_vendedor`) REFERENCES `vendedor` (`ci_vendedor`),
  CONSTRAINT `venta_ibfk_3` FOREIGN KEY (`ci_cliente`) REFERENCES `cliente` (`ci_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla bd_tienda.venta: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
INSERT INTO `venta` (`id_venta`, `fecha_venta`, `tienda_id`, `ci_vendedor`, `ci_cliente`, `orden_id`) VALUES
	(3, '2022-11-24', 1002, 440183, 12381209, NULL),
	(4, '2022-11-26', 1002, 440183, 113028233, NULL);
/*!40000 ALTER TABLE `venta` ENABLE KEYS */;

-- Volcando estructura para disparador bd_tienda.cliente_insert_Id
DROP TRIGGER IF EXISTS `cliente_insert_Id`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER `cliente_insert_Id` BEFORE INSERT ON `cliente` FOR EACH ROW SET NEW.id_cliente = CONCAT(NEW.ci_cliente, '/' , NEW.celular)//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Volcando estructura para disparador bd_tienda.concatId
DROP TRIGGER IF EXISTS `concatId`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER `concatId` BEFORE INSERT ON `vendedor` FOR EACH ROW SET NEW.id = CONCAT(NEW.ci_vendedor+NEW.celular)//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Volcando estructura para disparador bd_tienda.id_tienda
DROP TRIGGER IF EXISTS `id_tienda`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER `id_tienda` BEFORE INSERT ON `tienda` FOR EACH ROW SET NEW.id_tienda =NEW.telefono/444//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
