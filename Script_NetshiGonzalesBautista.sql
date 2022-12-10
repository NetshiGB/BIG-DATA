-- CREADO POR NETSHI GONZALES BAUTISTA
--CREAMOS EL ESQUEMA
CREATE SCHEMA FLOTA_VH AUTHORIZATION UCOHVCGC;

--A FLOTA DE VEHÍCULOS DE EMPRESA, CONTROLANDO LOS
--MODELOS DE LOS COCHES, LAS MARCAS Y EL GRUPO EMPRESARIAL DE LA MARCA
-- DE LOS COCHES TAMBIÉN NECESITAMOS SABER EL COLOR DEL COCHE, SU MATRÍCULA, EL NÚMERO TOTAL
--DE KILÓMETROS QUE TIENE, LA COMPAÑÍA ASEGURADORA ( MAPFRE, MMT, AXA ETC), EL NÚMERO DE
--PÓLIZA, FECHA DE COMPRA ETC.
--A DEMÁS QUEREMOS CONTROLAR DE CADA COCHE LAS REVISIONES QUE SE HA PASADO AL COCHE
--SABIENDO LOS KMS QUE TENÍA EN EL MOMENTO DE LA REVISIÓN, LA FECHA DE LA REVISIÓN Y EL
--IMPORTE DE LA REVISIÓN.

-- CREAMOS LA SERIE CON SU PK Y CONTROL DE NULOS
-- CREAMOS LA SERIE CON SU PK Y CONTROL DE NULOS
-- CREAMOS LA SERIE CON SU PK Y CONTROL DE NULOS
-- TABLA GRUPO EMPRESARIAL
CREATE TABLE FLOTA_VH.GRUPOEMP(
	IDGRUPO SERIAL PRIMARY KEY,-- AUTONUMERICO
	NOMBRE_GRUPO VARCHAR(200) NOT NULL
);
-- TABLA MARCA DE COCHES
CREATE TABLE FLOTA_VH.MARCA(
	IDMARCA SERIAL PRIMARY KEY, -- PK
	NOMBRE VARCHAR(200) NOT null,
	idgrupo integer -- FK
);

-- CREAMOS LA FK DE LA TABLA
ALTER TABLE FLOTA_VH.MARCA 
ADD CONSTRAINT MARCA_FK FOREIGN KEY (IDGRUPO) 
REFERENCES FLOTA_VH.GRUPOEMP (IDGRUPO);--ON DELETE cascade

-- CREAMOS LA TABLA COCHES(MODELOS)
CREATE TABLE FLOTA_VH.COCHES(
	IDMATRICULA VARCHAR(7) NOT NULL, -- PK
	MODELO VARCHAR(200) NOT NULL, -- YARIS, CIVIC, C5....
	IDMARCA INTEGER NOT NULL, -- FK
	KM INTEGER NOT NULL DEFAULT 0,
	FECHA_COMPRA DATE,
	FECHA_BAJA DATE,
	COLOR VARCHAR(20) NOT NULL,
	CONSTRAINT COCHES_PK PRIMARY KEY (IDMATRICULA)
);

-- CREAMOS LA FK DE LA TABLA
ALTER TABLE FLOTA_VH.COCHES 
ADD CONSTRAINT COCHES2_FK FOREIGN KEY (IDMARCA) 
REFERENCES FLOTA_VH.MARCA (IDMARCA);--ON DELETE CASCADE

-- TABLA CURRENCY
CREATE TABLE FLOTA_VH.CURRENCY(
	IDCURRENCY SERIAL primary KEY, -- PK
	NOMBRE	VARCHAR(3)
);

-- TABLA REVISION
CREATE TABLE FLOTA_VH.REVISION(
	IDREVISION SERIAL PRIMARY KEY, -- PK
	IDMATRICULA VARCHAR(7) NOT NULL, -- FK
	KM_REV INTEGER NOT NULL DEFAULT 0,
	FECHA_REV DATE,
	IMNPORTE_REV INTEGER,
	IDCURRENCY INTEGER -- FK
);

-- CREAMOS LA FK DE LA TABLA
ALTER TABLE FLOTA_VH.REVISION 
ADD CONSTRAINT REVISION1_FK FOREIGN KEY (IDCURRENCY) 
REFERENCES FLOTA_VH.CURRENCY (IDCURRENCY);--ON DELETE CASCADE


-- CREAMOS LA FK DE LA TABLA
ALTER TABLE FLOTA_VH.REVISION 
ADD CONSTRAINT REVISION2_FK FOREIGN KEY (IDMATRICULA) 
REFERENCES FLOTA_VH.COCHES (IDMATRICULA); --ON DELETE CASCADE

-- TABLA ASEGURADORA
CREATE TABLE FLOTA_VH.ASEGURADORA(
	IDASEGURADORA INTEGER NOT NULL, -- PK
	NOMBRE VARCHAR(200) NOT NULL,
	CONSTRAINT ASEGURADORA_PK PRIMARY KEY (IDASEGURADORA)
);

-- TABLA POLIZA
CREATE TABLE FLOTA_VH.POLIZA(
	IDPOLIZA SERIAL PRIMARY KEY, -- PK
	FECHA_INI DATE,
	FECHA_FIN DATE,
	IDASEGURADORA INTEGER , -- FK
	NOMBRE VARCHAR(200) NOT NULL,
	IDMATRICULA VARCHAR(7) NOT NULL,  -- FK
	NUM_POLIZA VARCHAR(20) NOT NULL,
	IMPORTE INTEGER,
	FECHA_SEGURO DATE
);

-- CREAMOS LA FK DE LA TABLA
ALTER TABLE FLOTA_VH.POLIZA 
ADD CONSTRAINT POLIZA1_FK FOREIGN KEY (IDASEGURADORA) 
REFERENCES FLOTA_VH.ASEGURADORA (IDASEGURADORA); --ON DELETE CASCADE

-- CREAMOS LA FK DE LA TABLA
ALTER TABLE FLOTA_VH.POLIZA 
ADD CONSTRAINT POLIZA2_FK FOREIGN KEY (IDMATRICULA) 
REFERENCES FLOTA_VH.COCHES (IDMATRICULA); --ON DELETE CASCADE


INSERT INTO FLOTA_VH.GRUPOEMP
(NOMBRE_GRUPO)
VALUES('HONDA');
INSERT INTO FLOTA_VH.GRUPOEMP
(NOMBRE_GRUPO)
VALUES('BMW GROUP');
INSERT INTO FLOTA_VH.GRUPOEMP
(NOMBRE_GRUPO)
VALUES('PSA'); --3
INSERT INTO FLOTA_VH.GRUPOEMP
(NOMBRE_GRUPO)
VALUES('MERCEDES');
INSERT INTO FLOTA_VH.GRUPOEMP
(NOMBRE_GRUPO)
VALUES('RENAULT NISSAN'); -- 5
INSERT INTO FLOTA_VH.GRUPOEMP
(NOMBRE_GRUPO)
VALUES('TOYOTA');  --6
INSERT INTO FLOTA_VH.GRUPOEMP
(NOMBRE_GRUPO)
VALUES('VAN');
INSERT INTO FLOTA_VH.GRUPOEMP
(NOMBRE_GRUPO)
VALUES('FORD'); -- 8


COMMIT;

INSERT INTO FLOTA_VH.MARCA
(NOMBRE,IDGRUPO)
VALUES('HONDA',1);
INSERT INTO FLOTA_VH.MARCA
(NOMBRE,IDGRUPO)
VALUES('BMW',2);
INSERT INTO FLOTA_VH.MARCA
(NOMBRE,IDGRUPO)
VALUES('CITROEN',3);
INSERT INTO FLOTA_VH.MARCA
(NOMBRE,IDGRUPO)
VALUES('PEUGEOT',3);
INSERT INTO FLOTA_VH.MARCA
(NOMBRE,IDGRUPO)
VALUES('OPEL',3); -- 5
INSERT INTO FLOTA_VH.MARCA
(NOMBRE,IDGRUPO)
VALUES('MERCEDES',4);
INSERT INTO FLOTA_VH.MARCA
(NOMBRE,IDGRUPO)
VALUES('RENAULT',5);
INSERT INTO FLOTA_VH.MARCA
(NOMBRE,IDGRUPO)
VALUES('TOYOTA',6);
INSERT INTO FLOTA_VH.MARCA
(NOMBRE,IDGRUPO)
VALUES('AUDI',7);
INSERT INTO FLOTA_VH.MARCA
(NOMBRE,IDGRUPO)
VALUES('VOLKSWAGEN',7);
INSERT INTO FLOTA_VH.MARCA
(NOMBRE,IDGRUPO)
VALUES('SEAT',7);
INSERT INTO FLOTA_VH.MARCA
(NOMBRE,IDGRUPO)
VALUES('FORD',8);

COMMIT;



-- INSERTAMOS LOS DATOS
INSERT INTO flota_vh.coches
(idmatricula, modelo, idmarca, km, fecha_compra, fecha_baja, color)
VALUES('0001AAA', 'CIVIC', 1, 23000, '2022-05-05', '2022-10-10', 'ROJO');
INSERT INTO flota_vh.coches
(idmatricula, modelo, idmarca,  km, fecha_compra, fecha_baja, color)
VALUES('0021ABA', 'ARONA', 5, 23400, '2022-08-02', NULL, 'AZUL');
INSERT INTO flota_vh.coches
(idmatricula, modelo, idmarca,  km, fecha_compra, fecha_baja, color)
VALUES('3221BGC', 'ACCORD', 1, 12300, '2022-09-01', NULL, 'VERDE');
INSERT INTO flota_vh.coches
(idmatricula, modelo, idmarca,  km, fecha_compra, fecha_baja, color)
VALUES('6752DEF', 'I8', 2, 34567, '2022-12-03', NULL, 'NEGRO');
INSERT INTO flota_vh.coches
(idmatricula, modelo, idmarca,  km, fecha_compra, fecha_baja, color)
VALUES('2341ASD', 'CLS 300', 6, 23300, '2022-09-08', NULL, 'ROJO');
INSERT INTO flota_vh.coches
(idmatricula, modelo, idmarca,  km, fecha_compra, fecha_baja, color)
VALUES('3456CED', 'CLIO', 7, 23050, '2022-08-07', NULL, 'BLANCO');
INSERT INTO flota_vh.coches
(idmatricula, modelo, idmarca,  km, fecha_compra, fecha_baja, color)
VALUES('5643FPR', 'C5', 3, 213800, '2004-03-02', NULL, 'AMARILLO');
INSERT INTO flota_vh.coches
(idmatricula, modelo, idmarca,  km, fecha_compra, fecha_baja, color)
VALUES('7815ABD', 'YARIS', 8, 222300, '2005-04-02', NULL, 'ROJO');
INSERT INTO flota_vh.coches
(idmatricula, modelo, idmarca,  km, fecha_compra, fecha_baja, color)
VALUES('9899BRR', 'A7', 9, 24300, '2022-06-01', NULL, 'NEGRO');
INSERT INTO flota_vh.coches
(idmatricula, modelo, idmarca,  km, fecha_compra, fecha_baja, color)
VALUES('0987BRT', 'LEON', 11, 33060, '2022-07-01', NULL, 'BLANCO');
INSERT INTO flota_vh.coches
(idmatricula, modelo, idmarca,  km, fecha_compra, fecha_baja, color)
VALUES('9876CDE', 'MONDEO', 12, 21000, '2022-10-10', NULL, 'GRIS');


COMMIT;

INSERT INTO flota_vh.aseguradora
(idaseguradora, nombre)
VALUES(1, 'ALLIANZ');
INSERT INTO flota_vh.aseguradora
(idaseguradora, nombre)
VALUES(2, 'MAPFRE');
INSERT INTO flota_vh.aseguradora
(idaseguradora, nombre)
VALUES(3, 'LINEA DIRECTA');
INSERT INTO flota_vh.aseguradora
(idaseguradora, nombre)
VALUES(4, 'AXA');
INSERT INTO flota_vh.aseguradora
(idaseguradora, nombre)
VALUES(5, 'RACC');
INSERT INTO flota_vh.aseguradora
(idaseguradora, nombre)
VALUES(6, 'GENERALI');
INSERT INTO flota_vh.aseguradora
(idaseguradora, nombre)
VALUES(7, 'REALE');
INSERT INTO flota_vh.aseguradora
(idaseguradora, nombre)
VALUES(8, 'ZURICH');
INSERT INTO flota_vh.aseguradora
(idaseguradora, nombre)
VALUES(9, 'REGAL');
INSERT INTO flota_vh.aseguradora
(idaseguradora, nombre)
VALUES(10, 'RACE');

commit;

INSERT INTO flota_vh.poliza
(fecha_ini, fecha_fin, idaseguradora, nombre, idmatricula, num_poliza, importe, fecha_seguro)
VALUES('2022-03-03', '2023-03-03', 1, 'TODO RIESGO', '0021ABA', '25678', 1255, '2022-03-03');
INSERT INTO flota_vh.poliza
(fecha_ini, fecha_fin, idaseguradora, nombre, idmatricula, num_poliza, importe, fecha_seguro)
VALUES('2022-01-01', '2023-01-01', 1, 'BASICO', '3221BGC', '12339', 120, '2022-01-01');
INSERT INTO flota_vh.poliza
(fecha_ini, fecha_fin, idaseguradora, nombre, idmatricula, num_poliza, importe, fecha_seguro)
VALUES('2022-10-10', '2023-10-10', 3, 'BASICO', '6752DEF', '76777', 134, '2022-10-10');
INSERT INTO flota_vh.poliza
(fecha_ini, fecha_fin, idaseguradora, nombre, idmatricula, num_poliza, importe, fecha_seguro)
VALUES('2022-02-02', '2023-02-02', 4, 'TODO RIESGO', '2341ASD', '98765', 674, '2022-02-02');
INSERT INTO flota_vh.poliza
(fecha_ini, fecha_fin, idaseguradora, nombre, idmatricula, num_poliza, importe, fecha_seguro)
VALUES('2022-05-05', '2023-05-05', 2, 'TODO RIESGO', '3456CED', '23453', 566, '2022-05-05');
INSERT INTO flota_vh.poliza
(fecha_ini, fecha_fin, idaseguradora, nombre, idmatricula, num_poliza, importe, fecha_seguro)
VALUES('2022-03-03', '2023-03-03', 1, 'TODO RIESGO', '5643FPR', '925678', 1895, '2022-03-03');
INSERT INTO flota_vh.poliza
(fecha_ini, fecha_fin, idaseguradora, nombre, idmatricula, num_poliza, importe, fecha_seguro)
VALUES('2022-01-01', '2023-01-01', 1, 'BASICO', '7815ABD', '123399', 220, '2022-01-01');
INSERT INTO flota_vh.poliza
(fecha_ini, fecha_fin, idaseguradora, nombre, idmatricula, num_poliza, importe, fecha_seguro)
VALUES('2022-10-10', '2023-10-10', 3, 'BASICO', '9899BRR', '767877', 334, '2022-10-10');
INSERT INTO flota_vh.poliza
(fecha_ini, fecha_fin, idaseguradora, nombre, idmatricula, num_poliza, importe, fecha_seguro)
VALUES('2022-02-02', '2023-02-02', 4, 'TODO RIESGO', '0987BRT', '968765', 688, '2022-02-02');
INSERT INTO flota_vh.poliza
(fecha_ini, fecha_fin, idaseguradora, nombre, idmatricula, num_poliza, importe, fecha_seguro)
VALUES('2022-05-05', '2023-05-05', 2, 'TODO RIESGO', '9876CDE', '237453', 666, '2022-05-05');


COMMIT;


COMMIT;

INSERT INTO flota_vh.CURRENCY
(NOMBRE)
VALUES( 'EUR' );
INSERT INTO flota_vh.CURRENCY
(NOMBRE)
VALUES( 'USD');
INSERT INTO flota_vh.CURRENCY
(NOMBRE)
VALUES( 'MXN');
INSERT INTO flota_vh.CURRENCY
( NOMBRE)
VALUES( 'YEN');
INSERT INTO flota_vh.CURRENCY
( NOMBRE)
VALUES( 'GBP');

COMMIT;

INSERT INTO flota_vh.revision
(idmatricula, km_rev , fecha_rev, imnporte_rev,IDCURRENCY)
VALUES( '3221BGC', 17000,  '2022-06-06', 175,1);

INSERT INTO flota_vh.revision
(idmatricula, km_rev, fecha_rev, imnporte_rev,IDCURRENCY)
VALUES( '3221BGC', 23000,  '2022-08-08', 125,2);

INSERT INTO flota_vh.revision
(idmatricula, km_rev, fecha_rev, imnporte_rev,IDCURRENCY)
VALUES( '2341ASD', 13000,  '2022-06-06', 85,3);

INSERT INTO flota_vh.revision
(idmatricula, km_rev, fecha_rev, imnporte_rev,IDCURRENCY)
VALUES( '7815ABD', 100000,  '2022-01-01', 75,1);

INSERT INTO flota_vh.revision
(idmatricula, km_rev, fecha_rev, imnporte_rev,IDCURRENCY)
VALUES( '0001AAA', 19000,  '2022-03-03', 95,1);

COMMIT;
