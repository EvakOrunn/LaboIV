--
-- Autor: Luis Roberto Cruz
-- Database: Almacen 
--

-- Listamos las bases de datos existentes

SHOW DATABASES;

-- Creamos la base de datos Almacen

CREATE DATABASE Almacen;

-- Seleccionamos la base de datos Almacen para trabajar con ella

USE Almacen;

-- Creamos la table Almacenes

CREATE TABLE Almacenes (
	almCodigo INT AUTO_INCREMENT,
	almLugar VARCHAR(100) NOT NULL,
	almCapacidad INT DEFAULT 0,
	almFechaAlta DATE NOT NULL,
	PRIMARY KEY(almCodigo)
);

-- Creamos la tabla Cajas

CREATE TABLE Cajas (
	cajNumReferencia CHAR(5),
	cajContenido VARCHAR(100),
	cajValor DECIMAL(15,2) DEFAULT 100,
	Almacen INT,
	PRIMARY KEY(cajNumReferencia)
);

--Creamos la tabla Clientes

CREATE TABLE Clientes (
	cliCodigo INT AUTO_INCREMENT,
	cliDNI VARCHAR(8),
	cliNombre CHAR(40) NOT NULL,
	cliFecNac DATE NOT NULL,
	cliDomicilio VARCHAR(50),
	cliProvincia VARCHAR(50),
	cliTelefono VARCHAR(32),
	cliCodigoPostal INT,
	cliFechaAlta DATE NOT NULL,
	PRIMARY KEY(cliCodigo),
	UNIQUE KEY(cliDNI)
);

-- Creamos la tabla Factura

CREATE TABLE Factura (
	facPtoVenta VARCHAR(5),
	facNroFactura INT,
	cliCodigo INT NOT NULL,
	facNombre VARCHAR(40),
	facDomicilio VARCHAR(50) NOT NULL,
	facFechaYHora TIMESTAMP NOT NULL,
	facCUIT INT NOT NULL,
	facCondicionVenta SMALLINT,
	facIVA DECIMAL(15,2),
	PRIMARY KEY(facPtoVenta, facNroFactura),
	UNIQUE KEY(facCUIT)
);

-- Creamos la tabla FacturaDetalle

CREATE TABLE FacturaDetalle(
	facNroVenta VARCHAR NOT NULL,
	facDetLinea SMALLINT DEFAULT 0,
	facDetCantidad INT NOT NULL,
	facDetDetalle VARCHAR(50),
	facDetPrecUnitario DECIMAL(12,5),
	PRIMARY KEY(facNroVenta)
);

-- Listamos las tablas de la base de datos Almacen

SHOW TABLES;

-- Se insertan datos dentro de la tabla Cliente para trabajar posteriormente con dichos datos

--

-- Se insertan datos dentro de la tabla Clientes para trabjar posterirormente con los datos

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

-- Se insertan datos en la tabla Almacenes 

INSERT INTO Almacenes VALUES (0,'Av. Madre de Ciudades 3559 - Santiago del Estero', 1500,'2013-03-30'), (0, 'Av. Rivadavia 16714 - Buenos Aires', 2455, '2014-06-05'), (0, 'Suipacha 1250 - Tucuman', 2015, '2014-03-30'), (0, 'Lavalle 3040 - Santiago del Estero', 1456, '2014-07-26'), (0, 'Diego de Rojas 620 - Catamarca', 469, '2015-02-23');

-- Se insertan datos en la tabla Cajas

INSERT INTO Cajas VALUES ('SE001', 'Libros', 355.78, 1), ('TC001', 'Vajilla', 2456.66, 3), ('SE002', 'Cartucheras', 1557.00, 1), ('CA001', 'Expedientes 2012', 300.00, 5);
INSERT INTO Cajas VALUES ('SE003', 'Cartulinas', 152.00, 1), ('SE004', 'Calculadoras', 24310.44, 4), ('TC001', 'Cuadernillos', 210.30, 3), ('CA002', 'Billeteras', 2800.00, 3);
INSERT INTO Cajas VALUES ('TC002', 'Teclado', 2100.50, 4), ('TC003', 'Memoria RAM', 7698.90, 2), ('CA002', 'Mochila Mod', 3400.00, 2), ('SE005', 'Cargadores 19w', 1800.40, 2);
INSERT INTO Cajas VALUES ('ZZ001', 'Anteojos de Sol', 4510.30, 2), ('HA002', 'SSD 240GB', 6290.00, 5);

-- Obtenemos todos los almacenes dento de la tabla

SELECT * FROM Almacenes;

-- Se mostraran todos los campos de la tabla Clientes

DESCRIBE Clientes;

-- Listamos el codigo, dni y nombre de la tabla cliente por ordenado ascendientemente por el nombre

SELECT cliCodigo AS 'Codigo de Cliente', cliDNI AS DNI, cliNombre AS 'Apellido y Nombre' FROM Clientes ORDER BY cliNombre;

-- Listamos los campos de codigo, dni, nombre del cliente de la tabla cliente en orden desendiente por el nombre del cliente

SELECT cliCodigo, cliDNI, cliNombre FROM Clientes ORDER BY cliNombre DESC;

-- Listamos los registros de la tabla Almacenes por fecha de alta en orden descendiente y por lugar descendiente

SELECT * FROM Almacenes ORDER BY almFechaAlta DESC, almLugar DESC;

-- Listamos las proviencias en la que se encuentran los almacenes

SELECT SUBSTRING(almLugar, LOCATE('-', almLugar) + 2) FROM Almacenes;

-- Concatenamos las 


