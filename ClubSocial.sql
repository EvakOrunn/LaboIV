-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.5.34


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema clubsocial
--

CREATE DATABASE IF NOT EXISTS clubsocial;
USE clubsocial;

--
-- Temporary table structure for view `view_pagosporafiliadomasculinos`
--
DROP TABLE IF EXISTS `view_pagosporafiliadomasculinos`;
DROP VIEW IF EXISTS `view_pagosporafiliadomasculinos`;
CREATE TABLE `view_pagosporafiliadomasculinos` (
  `afiapellido` varchar(45),
  `afiNombre` varchar(45),
  `afiDNI` char(8),
  `PagoFechayHora` datetime,
  `serviId` int(11)
);

--
-- Temporary table structure for view `view_preciodeserivicioscontratados`
--
DROP TABLE IF EXISTS `view_preciodeserivicioscontratados`;
DROP VIEW IF EXISTS `view_preciodeserivicioscontratados`;
CREATE TABLE `view_preciodeserivicioscontratados` (
  `afiApellido` varchar(45),
  `afiNombre` varchar(45),
  `afiDNI` char(8),
  `serviPrecio` decimal(10,2)
);

--
-- Temporary table structure for view `view_servicioscontratadosporafiliadosmasculinos`
--
DROP TABLE IF EXISTS `view_servicioscontratadosporafiliadosmasculinos`;
DROP VIEW IF EXISTS `view_servicioscontratadosporafiliadosmasculinos`;
CREATE TABLE `view_servicioscontratadosporafiliadosmasculinos` (
  `afiApellido` varchar(45),
  `afiNombre` varchar(45),
  `afiDNI` char(8),
  `pagoFechayHora` datetime,
  `serviDescripcion` varchar(45)
);

--
-- Temporary table structure for view `view_totalpreciodeservicioscontratados`
--
DROP TABLE IF EXISTS `view_totalpreciodeservicioscontratados`;
DROP VIEW IF EXISTS `view_totalpreciodeservicioscontratados`;
CREATE TABLE `view_totalpreciodeservicioscontratados` (
  `afiApellido` varchar(45),
  `afiNombre` varchar(45),
  `afiDNI` char(8),
  `sum(serviPrecio)` decimal(32,2)
);

--
-- Temporary table structure for view `view_totalrecaudadoporservicio`
--
DROP TABLE IF EXISTS `view_totalrecaudadoporservicio`;
DROP VIEW IF EXISTS `view_totalrecaudadoporservicio`;
CREATE TABLE `view_totalrecaudadoporservicio` (
  `serviDescripcion` varchar(45),
  `total` decimal(32,2)
);

--
-- Definition of table `afiliados`
--

DROP TABLE IF EXISTS `afiliados`;
CREATE TABLE `afiliados` (
  `afiId` int(11) NOT NULL AUTO_INCREMENT,
  `afiApellido` varchar(45) DEFAULT NULL,
  `afiNombre` varchar(45) DEFAULT NULL,
  `afiDomicilio` varchar(45) DEFAULT NULL,
  `afiDNI` char(8) NOT NULL,
  `afiFechaInscripcion` date DEFAULT NULL,
  `afiFechaNac` date DEFAULT NULL,
  `afiSexo` char(1) DEFAULT NULL,
  PRIMARY KEY (`afiId`),
  UNIQUE KEY `afiDNI_UNIQUE` (`afiDNI`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `afiliados`
--

/*!40000 ALTER TABLE `afiliados` DISABLE KEYS */;
INSERT INTO `afiliados` (`afiId`,`afiApellido`,`afiNombre`,`afiDomicilio`,`afiDNI`,`afiFechaInscripcion`,`afiFechaNac`,`afiSexo`) VALUES 
 (1,'Ramirez','Leonardo','Belgrano 1550','33456987','2000-10-05','1975-07-23','M'),
 (2,'Alvarez','Romina','Salta 18','22345219','2005-08-01','1980-03-15','F'),
 (3,'Vega','Carlos','Buenos Aires','23976060','2000-10-05','1974-04-23','M'),
 (4,'Perez','Juan','Catamarca 21','28978060','2000-10-05','1975-04-23','M'),
 (5,'Moyano','Maria','Mitre 14','37456765','2004-10-09','2001-03-04','F');
/*!40000 ALTER TABLE `afiliados` ENABLE KEYS */;


--
-- Definition of table `pagos`
--

DROP TABLE IF EXISTS `pagos`;
CREATE TABLE `pagos` (
  `pagoId` int(11) NOT NULL AUTO_INCREMENT,
  `pagoFechayHora` datetime DEFAULT NULL,
  `afiId` int(11) DEFAULT NULL,
  `serviId` int(11) DEFAULT NULL,
  PRIMARY KEY (`pagoId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pagos`
--

/*!40000 ALTER TABLE `pagos` DISABLE KEYS */;
INSERT INTO `pagos` (`pagoId`,`pagoFechayHora`,`afiId`,`serviId`) VALUES 
 (1,'2017-01-10 09:00:00',1,2),
 (2,'2017-01-10 07:55:00',2,1),
 (3,'2017-01-17 11:23:00',2,3),
 (4,'2017-01-25 19:24:00',1,1),
 (5,'2020-10-23 14:54:00',1,4),
 (6,'2020-11-06 00:00:00',3,2);
/*!40000 ALTER TABLE `pagos` ENABLE KEYS */;


--
-- Definition of table `servicios`
--

DROP TABLE IF EXISTS `servicios`;
CREATE TABLE `servicios` (
  `serviId` int(11) NOT NULL AUTO_INCREMENT,
  `serviDescripcion` varchar(45) DEFAULT NULL,
  `serviPrecio` decimal(10,2) DEFAULT '0.00',
  `serviTipo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`serviId`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `servicios`
--

/*!40000 ALTER TABLE `servicios` DISABLE KEYS */;
INSERT INTO `servicios` (`serviId`,`serviDescripcion`,`serviPrecio`,`serviTipo`) VALUES 
 (1,'Cuota Social','500.00','Administracion'),
 (2,'Quincho x dia','100.00','Esparcimiento'),
 (3,'Cancha de futbol','50.00','Deporte'),
 (4,'Gimnasio x dia','20.00','Deporte'),
 (5,'Gimnasio x 1 mes','350.00','Deporte'),
 (6,'Sal├│n de Fiestas','2500.00','Esparcimiento'),
 (7,'Inscripcion','4000.00','Administracion'),
 (8,'Bar','121.23','Deporte'),
 (9,'Fiesta','2000.00','Esparcimiento'),
 (10,'Cancha de Tenis','300.00','Deportes'),
 (11,'Cancha de Tenis','300.00','Deportes');
/*!40000 ALTER TABLE `servicios` ENABLE KEYS */;


--
-- Definition of procedure `SPInsertarServicios`
--

DROP PROCEDURE IF EXISTS `SPInsertarServicios`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`%` PROCEDURE `SPInsertarServicios`(IN Descripcion VARCHAR(45), Precio DECIMAL(10,2), Tipo VARCHAR(45))
begin
Insert into servicios(serviDescripcion, serviPrecio, serviTipo)
values (Descripcion, Precio, Tipo);
END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `spTraerAfiliados`
--

DROP PROCEDURE IF EXISTS `spTraerAfiliados`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`%` PROCEDURE `spTraerAfiliados`()
begin
select * from afiliados where afisexo = 'M';
end $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `SP_ActualizarServicio`
--

DROP PROCEDURE IF EXISTS `SP_ActualizarServicio`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`%` PROCEDURE `SP_ActualizarServicio`(in tipoSer varchar(45), out cantSer int)
begin
select count(*) into cantSer from servicios where serviTipo = tipoSer;
end $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `SP_servicioInsertar`
--

DROP PROCEDURE IF EXISTS `SP_servicioInsertar`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`%` PROCEDURE `SP_servicioInsertar`(in Descri varchar(45), in Precio decimal(10,2), in Tipo varchar(45), out SerId int)
begin
insert into Servicios(serviDescripcion, serviPrecio, serviTipo)
values (Descri, Precio, Tipo);
Select last_insert_id() into SerId;
end $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `SP_ServiciosTraer`
--

DROP PROCEDURE IF EXISTS `SP_ServiciosTraer`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`%` PROCEDURE `SP_ServiciosTraer`()
begin
Select * from servicios;
end $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `SP_ServiciosTraerporTipo`
--

DROP PROCEDURE IF EXISTS `SP_ServiciosTraerporTipo`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`%` PROCEDURE `SP_ServiciosTraerporTipo`(in Tipo varchar(45))
begin
Select ServiDescripcion, ServiPrecio from Servicios where serviTipo = Tipo;
end $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of view `view_pagosporafiliadomasculinos`
--

DROP TABLE IF EXISTS `view_pagosporafiliadomasculinos`;
DROP VIEW IF EXISTS `view_pagosporafiliadomasculinos`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `view_pagosporafiliadomasculinos` AS select `a`.`afiApellido` AS `afiapellido`,`a`.`afiNombre` AS `afiNombre`,`a`.`afiDNI` AS `afiDNI`,`p`.`pagoFechayHora` AS `PagoFechayHora`,`p`.`serviId` AS `serviId` from (`pagos` `p` join `afiliados` `a` on((`a`.`afiId` = `p`.`afiId`))) where (`a`.`afiSexo` = 'M');

--
-- Definition of view `view_preciodeserivicioscontratados`
--

DROP TABLE IF EXISTS `view_preciodeserivicioscontratados`;
DROP VIEW IF EXISTS `view_preciodeserivicioscontratados`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `view_preciodeserivicioscontratados` AS select `a`.`afiApellido` AS `afiApellido`,`a`.`afiNombre` AS `afiNombre`,`a`.`afiDNI` AS `afiDNI`,`s`.`serviPrecio` AS `serviPrecio` from ((`pagos` `p` join `afiliados` `a` on((`p`.`afiId` = `a`.`afiId`))) join `servicios` `s` on((`s`.`serviId` = `p`.`serviId`)));

--
-- Definition of view `view_servicioscontratadosporafiliadosmasculinos`
--

DROP TABLE IF EXISTS `view_servicioscontratadosporafiliadosmasculinos`;
DROP VIEW IF EXISTS `view_servicioscontratadosporafiliadosmasculinos`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `view_servicioscontratadosporafiliadosmasculinos` AS select `a`.`afiApellido` AS `afiApellido`,`a`.`afiNombre` AS `afiNombre`,`a`.`afiDNI` AS `afiDNI`,`p`.`pagoFechayHora` AS `pagoFechayHora`,`s`.`serviDescripcion` AS `serviDescripcion` from ((`pagos` `p` join `afiliados` `a` on((`p`.`afiId` = `a`.`afiId`))) join `servicios` `s` on((`s`.`serviId` = `p`.`serviId`))) where (`a`.`afiSexo` = 'M');

--
-- Definition of view `view_totalpreciodeservicioscontratados`
--

DROP TABLE IF EXISTS `view_totalpreciodeservicioscontratados`;
DROP VIEW IF EXISTS `view_totalpreciodeservicioscontratados`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `view_totalpreciodeservicioscontratados` AS select `a`.`afiApellido` AS `afiApellido`,`a`.`afiNombre` AS `afiNombre`,`a`.`afiDNI` AS `afiDNI`,sum(`s`.`serviPrecio`) AS `sum(serviPrecio)` from ((`pagos` `p` join `afiliados` `a` on((`p`.`afiId` = `a`.`afiId`))) join `servicios` `s` on((`s`.`serviId` = `p`.`serviId`))) group by `p`.`afiId`;

--
-- Definition of view `view_totalrecaudadoporservicio`
--

DROP TABLE IF EXISTS `view_totalrecaudadoporservicio`;
DROP VIEW IF EXISTS `view_totalrecaudadoporservicio`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `view_totalrecaudadoporservicio` AS select `s`.`serviDescripcion` AS `serviDescripcion`,sum(`s`.`serviPrecio`) AS `total` from ((`servicios` `s` join `pagos` `p` on((`s`.`serviId` = `p`.`serviId`))) join `afiliados` `a` on((`p`.`afiId` = `a`.`afiId`))) group by `s`.`serviId`;



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
