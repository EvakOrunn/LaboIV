-- mysqldump  Ver 8.0.30-0ubuntu0.20.04.2 for Linux on x86_64 (Ubuntu)
--
-- Host: localhost	Database: almacen
--

--
-- Current Database: 'almacen'
--

--
-- Creamos la base de datos 'almacen' en caso de que no exista
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `almacen` /*!40100 DEFAULT CHARACTER SET utf8 */;

--
-- Seleccuionamos la base de datos para trabajar con ella
--

USE `almacen`;

--
-- Creamos la tabla 'almacenes' en caso de que no exista, caso contrario se eliminara para volver a estructurar
--

DROP TABLE IF EXISTS `Almacenes`;

--
-- Estructura de la tabla 'Almacenes'
--

CREATE TABLE `Almacenes`(
	almCodigo INT(11) AUTO_INCREMENT,
	almLugar VARCHAR(100) NOT NULL,
	almCapacidad INT(11) DEFAULT 0,
	almFechaAlta DATE NOT NULL,
	PRIMARY KEY (almCodigo)
);

--
-- Creamos la tabla 'cajas' en caso de que no exista, caso contratio se eliminara para volver a estructurar
--

DROP TABLE IF EXISTS `Cajas`;

--
-- Estructura de la tabla 'Cajas'
--

CREATE TABLE `Cajas`(
	cajNumReferencia CHAR(5),
	cajContenido VARCHAR(100),
	cajValor DECIMAL(15,2) DEFAULT 100,
	almacen INT(11),
	PRIMARY KEY (cajNumReferencia)
);

--
-- Creamos la tabla 'Clientes' en caso de que no exista, caso contrario se eliminara para volver a estructurar
--

DROP TABLE IF EXISTS Clientes;

--
-- Estructura de la tabla 'Clientes'
--

CREATE TABLE `Clientes`(
	cliCodigo INT(11) AUTO_INCREMENT,
	cliDNI VARCHAR(8),
	cliNombre CHAR(40) NOT NULL,
	cliFecNac DATE NOT NULL,
	cliDomicilio VARCHAR(50),
	cliProvincia VARCHAR(50),
	cliTelefono VARCHAR(32),
	cliCodigoPostal INT(11),
	cliFechaAlta DATE NOT NULL,
	PRIMARY KEY (cliCodigo),
	UNIQUE KEY cliDNi_UNIQUE (cliDNI)
);

--
-- Se insertan datos en la tabla 'Clientes' para el desarrollo de las actividades 
--

INSERT INTO Clientes VALUES (0, '41720940', 'Cruz Luis Roberto', '1999-02-26', 'B.750 Viviendas', 'Santiago del Estero', '3855990104', 4200, '2020-12-02');
INSERT INTO Clientes VALUES (0, '42267120', 'Miranda Chiervo Milagro Rita', '1999-09-2', 'B.Villa del Carmen 450 Viv.', 'Santiago del Estero', '3856821186', 4200, '2020-04-12');
INSERT INTO Clientes VALUES (0, '45212011', 'Moreno Alexyo Martin', '2002-06-30', 'B.Catolica', 'Buenos Aires', '3856922312', 2320, '2020-11-15');
INSERT INTO Clientes VALUES (0, '42182884', 'Cruz Juan Pablo Javier', '2004-10-04', 'B.750 Viviendas', 'Santiago del Estero', '3856783011', 4200, '2020-02-11');
INSERT INTO Clientes VALUES (0, '41982993', 'Contreras Juliana Micaela', '2009-01-04', 'B.Albarados', 'Buenos Aires', '3855693332', 2320, '2021-01-04');
INSERT INTO Clientes VALUES (0, '39182293', 'Westvern Sofia Paula', '1999-09-27', 'B.25 de Mayo', 'Tucuman', '3855839126', 1222, '2020-08-12');
INSERT INTO Clientes VALUES (0, '40122023', 'Gomez Rita Sofia', '1998-02-12', 'B.Ejercito Argentino', 'Santigo del Estero', '3855912492', 4200, '2020-05-11');
INSERT INTO Clientes VALUES (0, '24189810', 'Leiva Sonia Viviana', '1970-09-1', 'B.750 Viviendas', 'Santiago del Estero', '3854858941', 4200, '2020-04-22');
INSERT INTO Clientes VALUES (0, '36199203', 'Matorra Sebastian Marcos', '1982-11-22', 'B.La Pierdad', 'Catamarca', '3856293433', 1200, '2020-04-12');
INSERT INTO Clientes VALUES (0, '27830012', 'Salvatierra Jose Maria', '1974-05-21', 'B.Palomar', 'Catamarca', '3856776893', 1200, '2020-12-11');

--
-- Creamos la tabla 'Factura' en caso de que no existas, de lo contrario se eliminara para volver a estructurar
--

DROP TABLE IF EXISTS Factura;

--
-- Estructura de la tabla 'Factura'
--

CREATE TABLE Factura(
	facPtoVenta INT(11) NOT NULL,
	facNroFactura INT(11) NOT NULL AUTO_INCREMENT,
	cliCodigo INT(11) NOT NULL,
	facNombre VARCHAR(40) NOT NULL,
	facDomicilio VARCHAR(50) NOT NULL,
	facFechaYHora DATETIME NOT NULL,
	facCUIT CHAR(12) NOT NULL,
	facCondicionVenta TINYINT NOT NULL,
	facIVA DECIMAL(12,2) NOT NULL,
	PRIMARY KEY (facPtoVenta, facNroFactura)
);

--
-- Creamos la tabla 'FacturaDetalle' en caso de que no exista, de lo contrario se eliminara para volver a estructurar
--

DROP TABLE IF EXISTS FacturaDetalle;

--
-- Estructura de la tabla 'FacturaDetalle'
--


