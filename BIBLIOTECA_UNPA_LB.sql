create database BIBLIOTECA_UNPA;
use BIBLIOTECA_UNPA;
-- FECHA DE MODIFICACION: 2019-09-06

CREATE TABLE Carrera (
Id_Carrera			VARCHAR(100) PRIMARY KEY,
Carrera    			VARCHAR(100)
);

CREATE TABLE Semestre (
Id_Semestre			VARCHAR(100) PRIMARY KEY,
Semestre    		INT
);

CREATE TABLE Empleado (
Id_Empleado      	VARCHAR(100)  PRIMARY KEY, 
Nombre           	VARCHAR(100) , 
AP_Paterno       	VARCHAR(100) , 
AP_Materno       	VARCHAR(100) , 
Contrasena       	VARCHAR(100) ,
Fecha_de_inicio  	DATE,
Tipo				INT
);


CREATE TABLE Fechas (
FDMDelReporte 					DATE, 
FDMDeAlumnoAvanzarDeSemestre 	DATE,
TotaldeModificaciones 							INT,
Id_Empleado 									VARCHAR(100)	NOT NULL,
FOREIGN KEY (Id_Empleado) REFERENCES Empleado(Id_Empleado) ON UPDATE 
CASCADE ON DELETE CASCADE
);

CREATE TABLE dia_inhabil (
Fecha		      	DATE, 
/* se agregar la llave primaria de Registro_hora_id y se hace la union con Regitro_hora*/
Id_Empleado 		VARCHAR(100)	NOT NULL,
FOREIGN KEY (Id_Empleado) REFERENCES Empleado(Id_Empleado) ON UPDATE 
CASCADE ON DELETE CASCADE
);

CREATE TABLE Configuracion_de_hora(
/* se agregar la llave primaria de Registro_hora_id y se hace la union con Regitro_hora*/
Id_Conf_De_Horas			VARCHAR(100) 	PRIMARY KEY ,
/* se agregar la llave primaria de Registro_hora_id y se hace la union con Regitro_hora*/
Id_Empleado 		VARCHAR(100)	NOT NULL,
FOREIGN KEY (Id_Empleado) REFERENCES Empleado(Id_Empleado) ON UPDATE 
CASCADE ON DELETE CASCADE,
T_H_Por_Semestre		INT	
);

CREATE TABLE Alumno (
Matricula  		VARCHAR(8)  	NOT NULL PRIMARY KEY , 
Nombre			VARCHAR(100) 	NOT NULL, 
AP_Paterno		VARCHAR(100) 	NOT NULL, 
AP_Materno		VARCHAR(100) 	NOT NULL,
Imagen			VARCHAR(100)			  ,
/* se agregar la llave primaria  y se hace la union con la tabla*/
Id_Carrera 		VARCHAR(100) 		NOT NULL,
FOREIGN KEY (Id_Carrera) REFERENCES Carrera(Id_Carrera) ON UPDATE 
CASCADE ON DELETE CASCADE ,
Id_Semestre 	VARCHAR(100) 		NOT NULL,
FOREIGN KEY (Id_Semestre) REFERENCES Semestre(Id_Semestre) ON UPDATE 
CASCADE ON DELETE CASCADE,
Id_Conf_De_Horas 	VARCHAR(100) 		NOT NULL,
FOREIGN KEY (Id_Conf_De_Horas) REFERENCES Configuracion_de_hora(Id_Conf_De_Horas) ON UPDATE 
CASCADE ON DELETE CASCADE
);



CREATE TABLE Detalle_del_registro_de_hora(
Matricula  									VARCHAR(8) ,
Fecha 										DATE, 
Semana 										INT ,
Hora_de_entrada 							DATETIME     , 
Hora_de_salida 								DATETIME     ,
Total_de_horas 								INT		,
Status_alumno								INT,
/* se agregar la llave primaria de Registro_hora_id y se hace la union con Regitro_hora*/
FOREIGN KEY (Matricula) REFERENCES Alumno(Matricula) ON UPDATE 
CASCADE ON DELETE CASCADE
);


INSERT INTO Empleado VALUES ('Biblioteca_UNPA_LB','Alfredo','Cruz'      ,'Perez'  ,MD5('r00tadmin'),'2019-07-01',0);
INSERT INTO Empleado VALUES ('USER01'            ,'Genaro' ,'San Martin','Ortegon',MD5('r00tadmin'),curdate(),1);

-- UPDATE empleado SET Fecha_de_inicio ='2019-07-01'  WHERE Tipo = 0 ;

INSERT INTO Carrera VALUES ('C001','Computacion');
INSERT INTO Carrera VALUES ('C002','Mecatronica');
INSERT INTO Carrera VALUES ('C003','Diseno'		);
INSERT INTO Carrera VALUES ('C004','Agricola'	);
INSERT INTO Carrera VALUES ('C005','Zootecnia'	);
INSERT INTO Carrera VALUES ('C006','Acuicultura');
INSERT INTO Carrera VALUES ('C007','Matematicas');



INSERT INTO Semestre VALUES ('S001', 1) ;
INSERT INTO Semestre VALUES ('S002', 2);
INSERT INTO Semestre VALUES ('S003', 3);
INSERT INTO Semestre VALUES ('S004', 4);
INSERT INTO Semestre VALUES ('S005', 5);
INSERT INTO Semestre VALUES ('S006', 6);
INSERT INTO Semestre VALUES ('S007', 7);
INSERT INTO Semestre VALUES ('S008', 8);
INSERT INTO Semestre VALUES ('S009', 9);
INSERT INTO Semestre VALUES ('S010', 10);



INSERT INTO Configuracion_de_hora VALUES ('C001S001','Biblioteca_UNPA_LB',4);
INSERT INTO Configuracion_de_hora VALUES ('C001S002','Biblioteca_UNPA_LB',4);
INSERT INTO Configuracion_de_hora VALUES ('C001S003','Biblioteca_UNPA_LB',4);
INSERT INTO Configuracion_de_hora VALUES ('C001S004','Biblioteca_UNPA_LB',4);
INSERT INTO Configuracion_de_hora VALUES ('C001S005','Biblioteca_UNPA_LB',4);
INSERT INTO Configuracion_de_hora VALUES ('C001S006','Biblioteca_UNPA_LB',4);
INSERT INTO Configuracion_de_hora VALUES ('C001S007','Biblioteca_UNPA_LB',4);
INSERT INTO Configuracion_de_hora VALUES ('C001S008','Biblioteca_UNPA_LB',4);
INSERT INTO Configuracion_de_hora VALUES ('C001S009','Biblioteca_UNPA_LB',5);
INSERT INTO Configuracion_de_hora VALUES ('C001S010','Biblioteca_UNPA_LB',5);

INSERT INTO Configuracion_de_hora VALUES ('C002S001','Biblioteca_UNPA_LB',4);
INSERT INTO Configuracion_de_hora VALUES ('C002S002','Biblioteca_UNPA_LB',4);
INSERT INTO Configuracion_de_hora VALUES ('C002S003','Biblioteca_UNPA_LB',4);
INSERT INTO Configuracion_de_hora VALUES ('C002S004','Biblioteca_UNPA_LB',4);
INSERT INTO Configuracion_de_hora VALUES ('C002S005','Biblioteca_UNPA_LB',4);
INSERT INTO Configuracion_de_hora VALUES ('C002S006','Biblioteca_UNPA_LB',4);
INSERT INTO Configuracion_de_hora VALUES ('C002S007','Biblioteca_UNPA_LB',4);
INSERT INTO Configuracion_de_hora VALUES ('C002S008','Biblioteca_UNPA_LB',4);
INSERT INTO Configuracion_de_hora VALUES ('C002S009','Biblioteca_UNPA_LB',5);
INSERT INTO Configuracion_de_hora VALUES ('C002S010','Biblioteca_UNPA_LB',5);

INSERT INTO Configuracion_de_hora VALUES ('C003S001','Biblioteca_UNPA_LB',4);
INSERT INTO Configuracion_de_hora VALUES ('C003S002','Biblioteca_UNPA_LB',4);
INSERT INTO Configuracion_de_hora VALUES ('C003S003','Biblioteca_UNPA_LB',4);
INSERT INTO Configuracion_de_hora VALUES ('C003S004','Biblioteca_UNPA_LB',4);
INSERT INTO Configuracion_de_hora VALUES ('C003S005','Biblioteca_UNPA_LB',4);
INSERT INTO Configuracion_de_hora VALUES ('C003S006','Biblioteca_UNPA_LB',4);
INSERT INTO Configuracion_de_hora VALUES ('C003S007','Biblioteca_UNPA_LB',4);
INSERT INTO Configuracion_de_hora VALUES ('C003S008','Biblioteca_UNPA_LB',4);
INSERT INTO Configuracion_de_hora VALUES ('C003S009','Biblioteca_UNPA_LB',5);
INSERT INTO Configuracion_de_hora VALUES ('C003S010','Biblioteca_UNPA_LB',5);

INSERT INTO Configuracion_de_hora VALUES ('C004S001','Biblioteca_UNPA_LB',4);
INSERT INTO Configuracion_de_hora VALUES ('C004S002','Biblioteca_UNPA_LB',4);
INSERT INTO Configuracion_de_hora VALUES ('C004S003','Biblioteca_UNPA_LB',4);
INSERT INTO Configuracion_de_hora VALUES ('C004S004','Biblioteca_UNPA_LB',4);
INSERT INTO Configuracion_de_hora VALUES ('C004S005','Biblioteca_UNPA_LB',4);
INSERT INTO Configuracion_de_hora VALUES ('C004S006','Biblioteca_UNPA_LB',4);
INSERT INTO Configuracion_de_hora VALUES ('C004S007','Biblioteca_UNPA_LB',4);
INSERT INTO Configuracion_de_hora VALUES ('C004S008','Biblioteca_UNPA_LB',4);
INSERT INTO Configuracion_de_hora VALUES ('C004S009','Biblioteca_UNPA_LB',5);
INSERT INTO Configuracion_de_hora VALUES ('C004S010','Biblioteca_UNPA_LB',5);

INSERT INTO Configuracion_de_hora VALUES ('C005S001','Biblioteca_UNPA_LB',5);
INSERT INTO Configuracion_de_hora VALUES ('C005S002','Biblioteca_UNPA_LB',5);
INSERT INTO Configuracion_de_hora VALUES ('C005S003','Biblioteca_UNPA_LB',4);
INSERT INTO Configuracion_de_hora VALUES ('C005S004','Biblioteca_UNPA_LB',4);
INSERT INTO Configuracion_de_hora VALUES ('C005S005','Biblioteca_UNPA_LB',4);
INSERT INTO Configuracion_de_hora VALUES ('C005S006','Biblioteca_UNPA_LB',4);
INSERT INTO Configuracion_de_hora VALUES ('C005S007','Biblioteca_UNPA_LB',4);
INSERT INTO Configuracion_de_hora VALUES ('C005S008','Biblioteca_UNPA_LB',4);
INSERT INTO Configuracion_de_hora VALUES ('C005S009','Biblioteca_UNPA_LB',5);
INSERT INTO Configuracion_de_hora VALUES ('C005S010','Biblioteca_UNPA_LB',5);

INSERT INTO Configuracion_de_hora VALUES ('C006S001','Biblioteca_UNPA_LB',4);
INSERT INTO Configuracion_de_hora VALUES ('C006S002','Biblioteca_UNPA_LB',4);
INSERT INTO Configuracion_de_hora VALUES ('C006S003','Biblioteca_UNPA_LB',3);
INSERT INTO Configuracion_de_hora VALUES ('C006S004','Biblioteca_UNPA_LB',3);
INSERT INTO Configuracion_de_hora VALUES ('C006S005','Biblioteca_UNPA_LB',3);
INSERT INTO Configuracion_de_hora VALUES ('C006S006','Biblioteca_UNPA_LB',3);
INSERT INTO Configuracion_de_hora VALUES ('C006S007','Biblioteca_UNPA_LB',3);
INSERT INTO Configuracion_de_hora VALUES ('C006S008','Biblioteca_UNPA_LB',3);
INSERT INTO Configuracion_de_hora VALUES ('C006S009','Biblioteca_UNPA_LB',5);
INSERT INTO Configuracion_de_hora VALUES ('C006S010','Biblioteca_UNPA_LB',5);

INSERT INTO Configuracion_de_hora VALUES ('C007S001','Biblioteca_UNPA_LB',3);
INSERT INTO Configuracion_de_hora VALUES ('C007S002','Biblioteca_UNPA_LB',3);
INSERT INTO Configuracion_de_hora VALUES ('C007S003','Biblioteca_UNPA_LB',3);
INSERT INTO Configuracion_de_hora VALUES ('C007S004','Biblioteca_UNPA_LB',3);
INSERT INTO Configuracion_de_hora VALUES ('C007S005','Biblioteca_UNPA_LB',3);
INSERT INTO Configuracion_de_hora VALUES ('C007S006','Biblioteca_UNPA_LB',3);
INSERT INTO Configuracion_de_hora VALUES ('C007S007','Biblioteca_UNPA_LB',3);
INSERT INTO Configuracion_de_hora VALUES ('C007S008','Biblioteca_UNPA_LB',3);
INSERT INTO Configuracion_de_hora VALUES ('C007S009','Biblioteca_UNPA_LB',5);
INSERT INTO Configuracion_de_hora VALUES ('C007S010','Biblioteca_UNPA_LB',5);

INSERT INTO fechas VALUES('2019-07-01','2019-01-01',0,'Biblioteca_UNPA_LB');
-- UPDATE empleado SET Fecha_de_inicio = '2019-09-30' WHERE Tipo = 0 ;
/*
INSERT INTO Alumno VALUES ('13010030','Isrrael'      ,'Gil'       ,'Paredez','img/tmp/034.png','C001','S001','C001S001');
INSERT INTO Alumno VALUES ('13010031','Humberto'     ,'Filio'     ,'Garcia' ,'img/tmp/038.png','C002','S002','C002S002');
INSERT INTO Alumno VALUES ('13010032','Genaro'       ,'San Martin','Ortegon','img/tmp/042.png','C003','S003','C003S003');
INSERT INTO Alumno VALUES ('13010033','Jose de jesus','Murcia'    ,'Pulido' ,'img/tmp/045.png','C004','S004','C004S004');
INSERT INTO Alumno VALUES ('13010034','Osiris'       ,'Scarlet'   ,'Pitalua','img/tmp/051.png','C005','S005','C005S005');
INSERT INTO Alumno VALUES ('13010035','Marisol'      ,'Cruz'      ,'Torres' ,'img/tmp/054.png','C006','S006','C006S006');
INSERT INTO Alumno VALUES ('13010036','Omar'         ,'Ulises'    ,'Luna'   ,'img/tmp/214.png','C007','S007','C007S007');
*/



-- select week('2019-07-01',1); -- semana (27)
 -- UPDATE fechas SET FDMDelReporte='2019-07-01';




-- ******************************************************************** PROCESOS ALMACENADOS LOGIN********************************************************************
DROP PROCEDURE IF EXISTS login_usuario;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `login_usuario`(IN nom VARCHAR(100),IN passw VARCHAR(100))
BEGIN
	SET @CONTRA=(MD5(passw));
	IF(STRCMP((SELECT E.Id_Empleado FROM empleado AS E WHERE Id_Empleado=nom),nom)=0 AND STRCMP((SELECT E.Contrasena FROM empleado AS E WHERE Id_Empleado=nom),@CONTRA)=0  AND  STRCMP((SELECT E.Tipo FROM empleado AS E WHERE Id_Empleado=nom ),0)=0 )THEN
		SELECT 0;
	ELSE
		IF(STRCMP((SELECT E.Id_Empleado FROM empleado AS E WHERE Id_Empleado=nom),nom)=0 AND STRCMP((SELECT E.Contrasena FROM empleado AS E WHERE Id_Empleado=nom),@CONTRA)=0  AND  STRCMP((SELECT E.Tipo FROM empleado AS E WHERE Id_Empleado=nom ),1)=0 )THEN
			SELECT 1;
        ELSE
			SELECT 2;
        END IF;
	END IF;   	
END;$$
DELIMITER ;
-- ******************************************************************** PROCESOS ALMACENADOS ALUMNOS********************************************************************
-- 1 (Alumno_Actualizar)  
DROP PROCEDURE IF EXISTS Alumno_Actualizar;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Alumno_Actualizar`(in MAT varchar(8) ,IN NOM VARCHAR(100), IN APPATER VARCHAR(100),IN APMATER VARCHAR(100),IN SEM VARCHAR(20),IN CAR VARCHAR(20),IN icdh VARCHAR(20))
BEGIN
	SET @FechaInicio=(SELECT E.Fecha_de_inicio FROM empleado AS E  WHERE Tipo=0); 
	SET @HE=(Horas_Hechas(MAT,@FechaInicio , CURDATE()));
    IF (@HE = 0) THEN
		-- NO TENGO HORAS
		UPDATE Alumno SET Nombre=NOM,AP_Paterno=APPATER,AP_Materno=APMATER ,Id_Carrera=CAR,Id_Semestre=SEM,Id_Conf_De_Horas=icdh  WHERE Matricula=MAT;
		SELECT 1;
    ELSE
		-- TENGO HORAS
		SELECT 0;
    END IF;
	
END;$$
DELIMITER ;




-- 2 (Alumno_Actualizar_Imagen)
DROP PROCEDURE IF EXISTS Alumno_Actualizar_Imagen;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Alumno_Actualizar_Imagen`(in MAT varchar(8), IN IMG VARCHAR(100) )
BEGIN
	UPDATE Alumno SET Imagen=IMG  WHERE Matricula=MAT;
    SELECT 1;
END;$$
DELIMITER ;


-- 3 (Alumno_Agregar) 
DROP PROCEDURE IF EXISTS Alumno_Agregar;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Alumno_Agregar`(in MATR varchar(8) ,IN NOM VARCHAR(100), IN APPATER VARCHAR(100),IN APMATER VARCHAR(100),IN SEM VARCHAR(20),IN CAR VARCHAR(20), IN IMG VARCHAR(100),IN ICDH VARCHAR(20) )
BEGIN
	IF  NOT EXISTS(SELECT A.Matricula FROM alumno as A where A.Matricula=MATR )then
		INSERT INTO Alumno VALUES (MATR,NOM,APPATER,APMATER,IMG,CAR,SEM,ICDH);
SELECT 1;
	ELSE
		SELECT 0;
	END IF;
end;$$
DELIMITER ;


-- 4 (Alumno_Avanzar_De_Semestre) 
DROP procedure IF EXISTS `Alumno_Avanzar_De_Semestre`;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Alumno_Avanzar_De_Semestre`()
BEGIN
	DELETE FROM alumno  WHERE Id_Semestre = 'S010' ; 
	UPDATE fechas SET FDMDeAlumnoAvanzarDeSemestre=curdate();
	
    UPDATE alumno
	SET Id_Semestre =
		(
			CASE 
				SUBSTRING(Id_Semestre, 4, 4) 
				WHEN '1' THEN 'S002'
				WHEN '2' THEN 'S003'
				WHEN '3' THEN 'S004'
				WHEN '4' THEN 'S005'
				WHEN '5' THEN 'S006'
				WHEN '6' THEN 'S007'
				WHEN '7' THEN 'S008'
                WHEN '8' THEN 'S009'
				WHEN '9' THEN 'S010'
			END
		)
	WHERE 
	Matricula 	IS NOT NULL;
    
    
    UPDATE alumno
	SET Id_Conf_De_Horas =
		(
			CASE 
				SUBSTRING(Id_Conf_De_Horas, 8, 8) 
				WHEN '1' THEN CONCAT(SUBSTRING(Id_Conf_De_Horas, 1, 7) , '2')
				WHEN '2' THEN CONCAT(SUBSTRING(Id_Conf_De_Horas, 1, 7) , '3')
				WHEN '3' THEN CONCAT(SUBSTRING(Id_Conf_De_Horas, 1, 7) , '4')
				WHEN '4' THEN CONCAT(SUBSTRING(Id_Conf_De_Horas, 1, 7) , '5')
				WHEN '5' THEN CONCAT(SUBSTRING(Id_Conf_De_Horas, 1, 7) , '6')
				WHEN '6' THEN CONCAT(SUBSTRING(Id_Conf_De_Horas, 1, 7) , '7')
				WHEN '7' THEN CONCAT(SUBSTRING(Id_Conf_De_Horas, 1, 7) , '8')
                WHEN '8' THEN CONCAT(SUBSTRING(Id_Conf_De_Horas, 1, 7) , '9')
                WHEN '9' THEN CONCAT(SUBSTRING(Id_Conf_De_Horas, 1, 6) , '10')
			END
		)
	WHERE 
	Matricula 	IS NOT NULL;
	
    SELECT 1;
END;$$ 
DELIMITER ;

call Alumno_Avanzar_De_Semestre();

-- 5 (Alumno_Configuracion_De_Hora_Computacion)
DROP PROCEDURE IF EXISTS Alumno_Configuracion_De_Hora;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `Alumno_Configuracion_De_Hora`(IN carrera INT)
BEGIN
	
	SELECT CDH.Id_Conf_De_Horas,CDH.T_H_Por_Semestre FROM configuracion_de_hora AS CDH where Id_Conf_De_Horas=( CONCAT('C00', carrera,'S001')) || 
																		Id_Conf_De_Horas=( CONCAT('C00', carrera,'S002')) || 
																		Id_Conf_De_Horas=( CONCAT('C00', carrera,'S003')) || 
                                                                        Id_Conf_De_Horas=( CONCAT('C00', carrera,'S004')) || 
                                                                        Id_Conf_De_Horas=( CONCAT('C00', carrera,'S005')) || 
                                                                        Id_Conf_De_Horas=( CONCAT('C00', carrera,'S006')) || 
                                                                        Id_Conf_De_Horas=( CONCAT('C00', carrera,'S007')) || 
                                                                        Id_Conf_De_Horas=( CONCAT('C00', carrera,'S008')) || 
                                                                        Id_Conf_De_Horas=( CONCAT('C00', carrera,'S009')) || 
                                                                        Id_Conf_De_Horas=( CONCAT('C00', carrera,'S010'));
END;//
DELIMITER ;


call Alumno_Configuracion_De_Hora(7);

-- 6 (Alumno_Configuracion_De_Hora_Actualizar)
DROP PROCEDURE IF EXISTS Alumno_Configuracion_De_Hora_Actualizar;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `Alumno_Configuracion_De_Hora_Actualizar`(IN semestre1 INT,IN semestre2 INT,IN semestre3 INT,IN semestre4 INT,IN semestre5 INT,IN semestre6 INT,IN semestre7 INT,IN semestre8 INT,IN semestre9 INT,IN semestre10 INT
																					, IN IdSem1 Varchar(20), IN IdSem2 Varchar(20), IN IdSem3 Varchar(20), IN IdSem4 Varchar(20), IN IdSem5 Varchar(20), IN IdSem6 Varchar(20), IN IdSem7 Varchar(20), IN IdSem8 Varchar(20), IN IdSem9 Varchar(20), IN IdSem10 Varchar(20))
BEGIN
	SET @FechaInicio=(SELECT E.Fecha_de_inicio FROM empleado AS E  WHERE Tipo=0); 
	SET @SumaHE =(SELECT  SUM((select Horas_Hechas(A.Matricula,@FechaInicio , CURDATE())) )  FROM Alumno AS A);
	IF (@SumaHE = 0) THEN
		UPDATE configuracion_de_hora SET T_H_Por_Semestre=semestre1  WHERE Id_Conf_De_Horas=IdSem1;
		UPDATE configuracion_de_hora SET T_H_Por_Semestre=semestre2  WHERE Id_Conf_De_Horas=IdSem2;
		UPDATE configuracion_de_hora SET T_H_Por_Semestre=semestre3  WHERE Id_Conf_De_Horas=IdSem3;
		UPDATE configuracion_de_hora SET T_H_Por_Semestre=semestre4  WHERE Id_Conf_De_Horas=IdSem4;
		UPDATE configuracion_de_hora SET T_H_Por_Semestre=semestre5  WHERE Id_Conf_De_Horas=IdSem5;
		UPDATE configuracion_de_hora SET T_H_Por_Semestre=semestre6  WHERE Id_Conf_De_Horas=IdSem6;
		UPDATE configuracion_de_hora SET T_H_Por_Semestre=semestre7  WHERE Id_Conf_De_Horas=IdSem7;
		UPDATE configuracion_de_hora SET T_H_Por_Semestre=semestre8  WHERE Id_Conf_De_Horas=IdSem8;
        UPDATE configuracion_de_hora SET T_H_Por_Semestre=semestre9  WHERE Id_Conf_De_Horas=IdSem9;
		UPDATE configuracion_de_hora SET T_H_Por_Semestre=semestre10  WHERE Id_Conf_De_Horas=IdSem10;
        select 0;
    ELSE 
		Select -1;
    END IF;
END;//
DELIMITER ;





-- 7 (Alumno_Consultar) +
DROP PROCEDURE IF EXISTS Alumno_Consultar;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `Alumno_Consultar`(matric varchar(8))
BEGIN
	SET @FechaInicio=(SELECT E.Fecha_de_inicio FROM empleado AS E WHERE Tipo=0); 
	SELECT A.Matricula ,A.Nombre ,A.AP_Paterno ,A.AP_Materno,S.Semestre,C.Carrera,A.Imagen ,(select Horas_Hechas(matric,@FechaInicio , CURDATE())) as 'HE' ,(select Horas_Adeudadas(matric, CURDATE())) as 'HA' FROM Alumno AS A INNER JOIN Carrera AS C ON C.Id_Carrera =A.Id_Carrera  INNER JOIN Semestre AS S ON S.Id_Semestre=A.Id_Semestre WHERE A.Matricula =matric ;
END;//
DELIMITER ;



-- 8 (Alumno_Consultas) +
DROP PROCEDURE IF EXISTS Alumno_Consultas;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `Alumno_Consultas`()
BEGIN
	SET @FechaInicio=(SELECT E.Fecha_de_inicio FROM empleado AS E  WHERE Tipo=0); 
	SELECT A.Matricula ,A.Nombre ,A.AP_Paterno ,A.AP_Materno,S.Semestre,C.Carrera,A.Imagen ,(select Horas_Hechas(A.Matricula,@FechaInicio , CURDATE())) as 'HE' ,(select Horas_Adeudadas(A.Matricula, CURDATE())) as 'HA' FROM Alumno AS A INNER JOIN Carrera AS C ON C.Id_Carrera =A.Id_Carrera  INNER JOIN Semestre AS S ON S.Id_Semestre=A.Id_Semestre order by Carrera ,Semestre , AP_Paterno,AP_Materno,Nombre;
END;//
DELIMITER ;



-- 9 (Alumno_Eliminar) +
DROP PROCEDURE IF EXISTS Alumno_Eliminar;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `Alumno_Eliminar`(in MAT varchar(8))
BEGIN
	DELETE FROM Alumno WHERE Matricula=MAT; 
	SELECT 1;
END;//
DELIMITER ;


-- 10 (Alumno_Eliminar_Registro) +
DROP PROCEDURE IF EXISTS Alumno_Eliminar_Registro;
DELIMITER $$
CREATE PROCEDURE `Alumno_Eliminar_Registro` (in matric varchar(8))
BEGIN
	IF EXISTS(SELECT * FROM detalle_del_registro_de_hora AS DRH WHERE DRH.Matricula=matric and Status_alumno=0 )THEN
		DELETE FROM detalle_del_registro_de_hora WHERE Matricula=matric AND Status_alumno=0;
        SELECT 1;
    ELSE 
		SELECT 0;
    END IF;
END;$$
DELIMITER ;


-- 11 (Alumno_Generar_Reporte) 
DROP PROCEDURE IF EXISTS Alumno_Generar_Reporte;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Alumno_Generar_Reporte`(IN FechaFin DATE , IN FechaInicio DATE)
BEGIN
	-- -1 la fecha de cierre es menor que la de inicio
	-- 0 Aun no llegas ah esa fecha de cierre de horas
    -- 1 Fecha de cierre no es Viernes
    -- 2 La fecha de Inicio de reporte es menor que la de Fecha de Fin de reporte , debe de tener una diferencia de una semana al menos
    -- 3 La Fecha de inicio no es lunes
    -- Se regresa en reporte correctamente si no es nunguna de las anteriores
    
	 IF FechaFin <= curdate() then
        SET @dia=((SELECT CONCAT(ELT(WEEKDAY(FechaFin) + 1, 'Lunes', 'Martes', 'Miercoles', 'Juevez', 'Viernes', 'Sabado', 'Domingo')) ));
		IF(STRCMP(@dia ,('Viernes') ) = 0 ) THEN
		
			IF(week(FechaInicio,1) > WEEK(FechaFin,1) ) THEN
				 SET @dia2=((SELECT CONCAT(ELT(WEEKDAY(FechaInicio) + 1, 'Lunes', 'Martes', 'Miercoles', 'Juevez', 'Viernes', 'Sabado', 'Domingo')) ));
                 IF(STRCMP(@dia2 ,('Lunes') ) = 0 ) THEN

					SET @FechaInicio=(SELECT E.Fecha_de_inicio FROM empleado AS E  WHERE Tipo=0); 
                    
					SELECT A.Matricula ,A.Nombre ,A.AP_Paterno ,A.AP_Materno,S.Semestre,C.Carrera,A.Imagen ,(select Horas_Hechas(A.Matricula,@FechaInicio , FechaFin)) as 'HE' ,(select Horas_Adeudadas(A.Matricula, FechaFin)) as 'HA' FROM Alumno AS A INNER JOIN Carrera AS C ON C.Id_Carrera =A.Id_Carrera  INNER JOIN Semestre AS S ON S.Id_Semestre=A.Id_Semestre order by Carrera ,Semestre , AP_Paterno,AP_Materno,Nombre;

					UPDATE fechas SET FDMDelReporte=FechaFin;
					
					UPDATE empleado SET Fecha_de_inicio = FechaInicio WHERE Tipo = 0 ;
					DELETE FROM detalle_del_registro_de_hora WHERE  Status_alumno=0;
                    
                 ELSE
					-- select 'Fecha no es lunes';
					select  3 as 'Matricula' , 3 as 'AP_Paterno' , 3 as 'AP_Materno' , 3 as 'Nombre' , 3 as 'Carrera' , 3 as 'Semestre' , 3 as 'HE' , 3 as 'HA' ; 
                 END IF;
	
			ELSE
				-- select '';
				select  2 as 'Matricula' , 2 as 'AP_Paterno' , 2 as 'AP_Materno' , 2 as 'Nombre' , 2 as 'Carrera' , 2 as 'Semestre' , 2 as 'HE' , 2 as 'HA' ; 
			END IF;
			
		ELSE   
			select 1 as 'Matricula' , 1 as 'AP_Paterno' , 1 as 'AP_Materno' , 1 as 'Nombre' , 1 as 'Carrera' , 1 as 'Semestre' , 1 as 'HE' , 1 as 'HA' ;
		END IF;
	ELSE  
		select  0 as 'Matricula' , 0 as 'AP_Paterno' , 0 as 'AP_Materno' , 0 as 'Nombre' , 0 as 'Carrera' , 0 as 'Semestre' , 0 as 'HE' , 0 as 'HA' ; 
	end if;
END;$$
DELIMITER ;



-- 12 (Alumno_Generar_Reporte_Cambio_De_Fecha) +
DROP PROCEDURE IF EXISTS Alumno_Generar_Reporte_Cambio_De_Fecha;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Alumno_Generar_Reporte_Cambio_De_Fecha`(IN Tipo int)
BEGIN
	IF Tipo=1 THEN 
		SELECT F.FDMDelReporte as 'Salida' FROM fechas as F;
    ELSE
		SELECT F.FDMDeAlumnoAvanzarDeSemestre as 'Salida' FROM fechas as F;
    END IF;
END;$$
DELIMITER ;

-- ******************************************************************** PROCESOS ALMACENADOS REGISTROS DE HORAS********************************************************************
-- 1 (Registro_De_Hora_Consultas) +
DROP procedure IF EXISTS `Registro_De_Hora_Consultas`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `Registro_De_Hora_Consultas`()
BEGIN
	SELECT DRH.Matricula,(SELECT  CONCAT(A.Nombre,' ', A.AP_Paterno,' ',A.AP_Materno) FROM alumno AS A WHERE  Matricula=DRH.Matricula ) AS 'NOMBRES'  ,DRH.Fecha ,DRH.Semana ,DATE_FORMAT(DRH.Hora_de_entrada, "%H:%i:%S") AS 'H_Entrada' ,DATE_FORMAT(DRH.Hora_de_salida, "%H:%i:%S")  AS 'H_Salida' ,DRH.Total_de_horas ,DRH.Status_alumno FROM detalle_del_registro_de_hora AS DRH WHERE Status_alumno=0;
END;//
DELIMITER ;



-- 2 (Registro_De_Hora_Consultas_Alumno) +
DROP procedure IF EXISTS `Registro_De_Hora_Consultas_Alumno`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `Registro_De_Hora_Consultas_Alumno`(matric varchar(18))
BEGIN
	SELECT DRH.Matricula,(SELECT A.Imagen FROM alumno AS A WHERE  Matricula=matric) AS 'Imagen' , (SELECT  CONCAT(A.Nombre,' ', A.AP_Paterno,' ',A.AP_Materno) FROM alumno AS A WHERE  Matricula=matric ) AS 'NOMBRES',DRH.Fecha ,DRH.Semana ,DATE_FORMAT(DRH.Hora_de_entrada, "%H:%i:%s") as 'H_entrada' ,DATE_FORMAT(DRH.Hora_de_salida, "%H:%i:%s") as 'H_salida' ,DRH.Total_de_horas ,DRH.Status_alumno FROM biblioteca_unpa.detalle_del_registro_de_hora AS DRH where DRH.Matricula=matric AND Status_alumno=0;
END;//
DELIMITER ;



-- 3 (Registro_de_Horas) + 
DROP PROCEDURE IF EXISTS Registro_de_Horas;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Registro_de_Horas`( matric varchar(8))
BEGIN
-- 0 (EL ALUMN@ NO EXISTE)
-- 1 (EL ALUMN@ NO DEBE HORAS)
-- 2 (EL ALUMN@ SI DEBE HORAS ESTA SALIENDO NO ACOMPLETA LA HORA
-- 3 (EL ALUMN@ SI DEBE HORAS ESTA SALIENDO SI ACOMPLETA Y VA ACORDE CON LA SEMANA pero hizo mas   horas de las que debia)
-- 4 (EL ALUMN@ SI DEBE HORASESTA SALIENDO SI ACOMPLETA Y  VA ACORDE CON LA SEMANA pero hizo menos horas de las que debia)
-- 5 (EL ALUMN@ SI DEBE HORAS ESTA SALIENDO SI ACOMPLETA Y VA EN DESACORDE CON LA SEMANA pero hizo menos horas de las que debia)  
-- 6 (EL ALUMN@ SI DEBE HORAS ESTA SALIENDO SI ACOMPLETA Y VA EN DESACORDE CON LA SEMANA pero hizo mas   horas de las que debia)
-- 7 (ALUMN@ ESTA ENTRANDO)
	SET @hora=(select NOW());
    
	SET @T_Horas_Por_Semestre=(SELECT CH.T_H_Por_Semestre FROM Alumno AS A   INNER JOIN configuracion_de_hora AS CH ON CH.Id_Conf_De_Horas=A.Id_Conf_De_Horas  WHERE A.Matricula=matric);
    
    SET @Semana_de_inicio=  week((SELECT E.Fecha_de_inicio FROM empleado AS E  WHERE Tipo=0),1);
    
	if (Existe_Alumno(matric) = 1) THEN
		-- existe el alumno
        IF(Debe_Horas(matric) = 1)THEN
			-- EL ALUMNOS SI DEBE HORAS
			IF (Esta_Entrando(matric) = 1 )THEN
				-- EL ALUMNOS ESTA ENTRANDO
                
                INSERT INTO detalle_del_registro_de_hora  VALUES (matric, CURDATE(),NULL,@hora,NULL,NULL,0);
                SELECT 7;
			ELSE -- Esta_Entrando
            
				-- EL ALUMNOS ESTA SALIENDO
				IF (Hizo_Al_Menos_Una_Hora(matric,@hora) = 1)THEN
					--  HIZO UNA HORA AL MENOS
                    SET @H_Entrada=(SELECT DRH.Hora_de_entrada FROM detalle_del_registro_de_hora AS DRH WHERE  Matricula=matric AND Status_alumno=0);
                    SET @T_Horas_Realizadas_Por_El_Alumno=(SELECT Total_De_Horas(matric,@hora));
-- ************************************************************************************************************************************************************************************************************************************                    
                    IF (Debe_Horas_Atrasadas(matric) = 1)THEN
						-- EL ALUMN@ VA EN DESACORDE CON LA SEMANA
                        SET @Semana_Que_Debe= (SELECT Semana_Actual(matric));
                        SET @T_Horas_De_La_Semana_Que_Debe=(SELECT SUM(Total_de_horas) FROM detalle_del_registro_de_hora AS DRB WHERE DRB.Matricula=matric AND DRB.Semana=@Semana_Que_Debe );
                        IF (@T_Horas_De_La_Semana_Que_Debe IS NULL )THEN
							SET @T_Horas_De_La_Semana_Que_Debe=0;
						END IF;
                        -- aqui(4) SI
						SET @T_Horas_Faltantes=(@T_Horas_Por_Semestre)-(@T_Horas_De_La_Semana_Que_Debe);
						
                        IF (@T_Horas_Realizadas_Por_El_Alumno <= @T_Horas_Faltantes  )THEN
						 	update detalle_del_registro_de_hora SET Semana=@Semana_Que_Debe,Hora_de_salida=NOW(),Total_de_horas=(@T_Horas_Realizadas_Por_El_Alumno),Status_alumno=1  WHERE Matricula=matric AND Status_alumno =0;
							SELECT 6;
						ELSE
                        
							update detalle_del_registro_de_hora SET Semana=@Semana_Que_Debe,Hora_de_salida=NOW(),Total_de_horas=(@T_Horas_Faltantes  ),Status_alumno=1  WHERE Matricula=matric AND Status_alumno =0;
                            
							SET @Horas_Restantes=(@T_Horas_Realizadas_Por_El_Alumno)-(@T_Horas_Faltantes);
							SET @Semana_Que_Debe=@Semana_Que_Debe+1; 
							SET @Semana_Actual=WEEK(CURDATE(),1);
                            
							WHILE ( @Horas_Restantes > 0 ) DO
                            
								IF (@Semana_Que_Debe <= @Semana_Actual)THEN
                                
									IF (@Horas_Restantes >= @T_Horas_Por_Semestre )THEN 
											
									INSERT INTO detalle_del_registro_de_hora  VALUES (matric, CURDATE(), @Semana_Que_Debe,@H_Entrada,now(),@T_Horas_Por_Semestre,1);
									SET @Semana_Que_Debe=@Semana_Que_Debe+1;
										
										SET @Horas_Restantes=@Horas_Restantes -@T_Horas_Por_Semestre;
									ELSE
										
										INSERT INTO detalle_del_registro_de_hora  VALUES (matric, CURDATE(), @Semana_Que_Debe,@H_Entrada,now(),@Horas_Restantes,1);
										SET @Horas_Restantes=0;
									END IF;
								ELSE
									SET @Horas_Restantes=0;
								END IF;
                            
							END WHILE;
                            
							SELECT 5;
						END IF;
-- ************************************************************************************************************************************************************************************************************************************
					ELSE
						-- ALUMN@ VA A CORDE CON LA SEMANA
						SET @T_Horas_De_La_Semana_Actual=(SELECT SUM(Total_de_horas) FROM detalle_del_registro_de_hora AS DRB WHERE DRB.Matricula=matric AND DRB.Semana=week(curdate(),1) );
						IF (@T_Horas_De_La_Semana_Actual IS NULL )THEN
							SET @T_Horas_De_La_Semana_Actual=0;
						END IF;
							-- aqui(4) SI
						SET @T_Horas_Faltantes=(@T_Horas_Por_Semestre)-(@T_Horas_De_La_Semana_Actual);
                        
						IF (@T_Horas_Realizadas_Por_El_Alumno <= @T_Horas_Faltantes  )THEN
							update detalle_del_registro_de_hora SET Semana=WEEK(CURDATE(),1),Hora_de_salida=NOW(),Total_de_horas=(@T_Horas_Realizadas_Por_El_Alumno),Status_alumno=1  WHERE Matricula=matric AND Status_alumno =0;
							SELECT 4;
						ELSE
							update detalle_del_registro_de_hora SET Semana=WEEK(CURDATE(),1),Hora_de_salida=NOW(),Total_de_horas=(@T_Horas_Faltantes  ),Status_alumno=1  WHERE Matricula=matric AND Status_alumno =0;
							SELECT 3;
						END IF; 
                        
                        
						 -- SELECT 'ALUMN@ VA A CORDE CON LA SEMANA';
					END IF;	
 -- ************************************************************************************************************************************************************************************************************************************
                ELSE-- Hizo_Al_Menos_Una_Hora
					-- NO ACOMPLETA LA HORA 
					SELECT 2;
				END IF;-- Hizo_Al_Menos_Una_Hora
            END IF;-- Esta_Entrando   
        ELSE -- Debe_Horas
			-- EL ALUMNO NO DEBE HORAS
            SELECT 1;
        END IF; -- Debe_Horas
	ELSE -- Existe_Alumno
		-- NO EXISTE EL ALMUN@
		SELECT 0; 
	END IF; -- Existe_Alumno

END$$
DELIMITER ;



-- 4 (Registro_de_Horas_A_Planta_Alta)
DROP PROCEDURE IF EXISTS Registro_de_Horas_A_Planta_Alta;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Registro_de_Horas_A_Planta_Alta`( matric varchar(8))
BEGIN
-- 0 (EL ALUMN@ NO EXISTE)
-- 1 (EL ALUMN@ NO DEBE HORAS)
-- 2 (EL ALUMN@ SI DEBE HORAS ESTA SALIENDO NO ACOMPLETA LA HORA
-- 3 (EL ALUMN@ SI DEBE HORAS ESTA SALIENDO SI ACOMPLETA Y VA ACORDE CON LA SEMANA pero hizo mas   horas de las que debia)
-- 4 (EL ALUMN@ SI DEBE HORASESTA SALIENDO SI ACOMPLETA Y  VA ACORDE CON LA SEMANA pero hizo menos horas de las que debia)
-- 5 (EL ALUMN@ SI DEBE HORAS ESTA SALIENDO SI ACOMPLETA Y VA EN DESACORDE CON LA SEMANA pero hizo menos horas de las que debia)  
-- 6 (EL ALUMN@ SI DEBE HORAS ESTA SALIENDO SI ACOMPLETA Y VA EN DESACORDE CON LA SEMANA pero hizo mas   horas de las que debia)
-- 7 (ALUMN@ ESTA ENTRANDO)
	
	SET @hora=(select NOW());
	
    SET @T_Horas_Por_Semestre=(SELECT CH.T_H_Por_Semestre FROM Alumno AS A   INNER JOIN configuracion_de_hora AS CH ON CH.Id_Conf_De_Horas=A.Id_Conf_De_Horas  WHERE A.Matricula=matric);
    
    SET @Semana_de_inicio=  week((SELECT E.Fecha_de_inicio FROM empleado AS E  WHERE Tipo=0),1);
    
	if (Existe_Alumno(matric) = 1) THEN
		-- existe el alumno
        IF(Debe_Horas(matric) = 1)THEN
			-- EL ALUMNOS SI DEBE HORAS
			IF (Esta_Entrando(matric) = 1 )THEN
				-- EL ALUMNOS ESTA ENTRANDO
                
                INSERT INTO detalle_del_registro_de_hora  VALUES (matric, CURDATE(),NULL,@hora,NULL,NULL,0);
                SELECT 7;
			ELSE -- Esta_Entrando
            
				-- EL ALUMNOS ESTA SALIENDO
				IF (Hizo_Al_Menos_Una_Hora(matric,@hora) = 1)THEN
					--  HIZO UNA HORA AL MENOS
                    SET @H_Entrada=(SELECT DRH.Hora_de_entrada FROM detalle_del_registro_de_hora AS DRH WHERE  Matricula=matric AND Status_alumno=0);
                    SET @T_Horas_Realizadas_Por_El_Alumno=1;
-- ************************************************************************************************************************************************************************************************************************************                    
                    IF (Debe_Horas_Atrasadas(matric) = 1)THEN
						-- EL ALUMN@ VA EN DESACORDE CON LA SEMANA
                        SET @Semana_Que_Debe= (SELECT Semana_Actual(matric));
                        SET @T_Horas_De_La_Semana_Que_Debe=(SELECT SUM(Total_de_horas) FROM detalle_del_registro_de_hora AS DRB WHERE DRB.Matricula=matric AND DRB.Semana=@Semana_Que_Debe );
                        IF (@T_Horas_De_La_Semana_Que_Debe IS NULL )THEN
							SET @T_Horas_De_La_Semana_Que_Debe=0;
						END IF;
                        -- aqui(4) SI
						SET @T_Horas_Faltantes=(@T_Horas_Por_Semestre)-(@T_Horas_De_La_Semana_Que_Debe);
						
                        IF (@T_Horas_Realizadas_Por_El_Alumno <= @T_Horas_Faltantes  )THEN
						 	update detalle_del_registro_de_hora SET Semana=@Semana_Que_Debe,Hora_de_salida=NOW(),Total_de_horas=(@T_Horas_Realizadas_Por_El_Alumno),Status_alumno=1  WHERE Matricula=matric AND Status_alumno =0;
							SELECT 6;
						ELSE
                        
							update detalle_del_registro_de_hora SET Semana=@Semana_Que_Debe,Hora_de_salida=NOW(),Total_de_horas=(@T_Horas_Faltantes  ),Status_alumno=1  WHERE Matricula=matric AND Status_alumno =0;
                            
							SET @Horas_Restantes=(@T_Horas_Realizadas_Por_El_Alumno)-(@T_Horas_Faltantes);
							SET @Semana_Que_Debe=@Semana_Que_Debe+1; 
							SET @Semana_Actual=WEEK(CURDATE(),1);
                            
							WHILE ( @Horas_Restantes > 0 ) DO
                            
								IF (@Semana_Que_Debe <= @Semana_Actual)THEN
                                
									IF (@Horas_Restantes >= @T_Horas_Por_Semestre )THEN 
											
									INSERT INTO detalle_del_registro_de_hora  VALUES (matric, CURDATE(), @Semana_Que_Debe,@H_Entrada,now(),@T_Horas_Por_Semestre,1);
									SET @Semana_Que_Debe=@Semana_Que_Debe+1;
										
										SET @Horas_Restantes=@Horas_Restantes -@T_Horas_Por_Semestre;
									ELSE
										
										INSERT INTO detalle_del_registro_de_hora  VALUES (matric, CURDATE(), @Semana_Que_Debe,@H_Entrada,now(),@Horas_Restantes,1);
										SET @Horas_Restantes=0;
									END IF;
								ELSE
									SET @Horas_Restantes=0;
								END IF;
                            
							END WHILE;
                            
							SELECT 5;
						END IF;
-- ************************************************************************************************************************************************************************************************************************************
					ELSE
						-- ALUMN@ VA A CORDE CON LA SEMANA
						SET @T_Horas_De_La_Semana_Actual=(SELECT SUM(Total_de_horas) FROM detalle_del_registro_de_hora AS DRB WHERE DRB.Matricula=matric AND DRB.Semana=week(curdate(),1) );
						IF (@T_Horas_De_La_Semana_Actual IS NULL )THEN
							SET @T_Horas_De_La_Semana_Actual=0;
						END IF;
							-- aqui(4) SI
						SET @T_Horas_Faltantes=(@T_Horas_Por_Semestre)-(@T_Horas_De_La_Semana_Actual);
                        
						IF (@T_Horas_Realizadas_Por_El_Alumno <= @T_Horas_Faltantes  )THEN
							update detalle_del_registro_de_hora SET Semana=WEEK(CURDATE(),1),Hora_de_salida=NOW(),Total_de_horas=1,Status_alumno=1  WHERE Matricula=matric AND Status_alumno =0;
							SELECT 4;
						ELSE
							update detalle_del_registro_de_hora SET Semana=WEEK(CURDATE(),1),Hora_de_salida=NOW(),Total_de_horas=1,Status_alumno=1  WHERE Matricula=matric AND Status_alumno =0;
							SELECT 3;
						END IF; 
                        
                        
						 -- SELECT 'ALUMN@ VA A CORDE CON LA SEMANA';
					END IF;	
 -- ************************************************************************************************************************************************************************************************************************************
                ELSE-- Hizo_Al_Menos_Una_Hora
					-- NO ACOMPLETA LA HORA 
					SELECT 2;
				END IF;-- Hizo_Al_Menos_Una_Hora
            END IF;-- Esta_Entrando   
        ELSE -- Debe_Horas
			-- EL ALUMNO NO DEBE HORAS
            SELECT 1;
        END IF; -- Debe_Horas
	ELSE -- Existe_Alumno
		-- NO EXISTE EL ALMUN@
		SELECT 0; 
	END IF; -- Existe_Alumno

END;$$
DELIMITER ;



-- 5 (Registro_de_Horas_A_Planta_Forzosas)
DROP PROCEDURE IF EXISTS Registro_de_Horas_Forzosas;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Registro_de_Horas_Forzosas`( matric varchar(8),IN HORAS INT)
BEGIN
-- 0 (EL ALUMN@ NO EXISTE)
-- 1 (EL ALUMN@ NO DEBE HORAS)
-- 3 (EL ALUMN@ SI DEBE HORAS ESTA SALIENDO SI ACOMPLETA Y VA ACORDE CON LA SEMANA pero hizo mas   horas de las que debia)
-- 4 (EL ALUMN@ SI DEBE HORASESTA SALIENDO SI ACOMPLETA Y  VA ACORDE CON LA SEMANA pero hizo menos horas de las que debia)
-- 5 (EL ALUMN@ SI DEBE HORAS ESTA SALIENDO SI ACOMPLETA Y VA EN DESACORDE CON LA SEMANA pero hizo menos horas de las que debia)  
-- 6 (EL ALUMN@ SI DEBE HORAS ESTA SALIENDO SI ACOMPLETA Y VA EN DESACORDE CON LA SEMANA pero hizo mas   horas de las que debia)
	SET @hora=(select NOW());
    
	SET @T_Horas_Por_Semestre=(SELECT CH.T_H_Por_Semestre FROM Alumno AS A   INNER JOIN configuracion_de_hora AS CH ON CH.Id_Conf_De_Horas=A.Id_Conf_De_Horas  WHERE A.Matricula=matric);

    SET @Semana_de_inicio=  week((SELECT E.Fecha_de_inicio FROM empleado AS E  WHERE Tipo=0),1);
    
	IF (Existe_Alumno(matric) = 1) THEN
		-- existe el alumno
        IF(Debe_Horas(matric) = 1)THEN
			-- EL ALUMNOS SI DEBE HORAS
			IF (Esta_Entrando(matric) = 1 )THEN
				-- EL ALUMNOS ESTA ENTRANDO
                
                INSERT INTO detalle_del_registro_de_hora  VALUES (matric, CURDATE(),NULL,@hora,NULL,NULL,0);
                
                SET @H_Entrada=(SELECT DRH.Hora_de_entrada FROM detalle_del_registro_de_hora AS DRH WHERE  Matricula=matric AND Status_alumno=0);
				SET @T_Horas_Realizadas_Por_El_Alumno=HORAS;
-- ************************************************************************************************************************************************************************************************************************************                    
                    IF (Debe_Horas_Atrasadas(matric) = 1)THEN
						-- EL ALUMN@ VA EN DESACORDE CON LA SEMANA
                        SET @Semana_Que_Debe= (SELECT Semana_Actual(matric));
                        SET @T_Horas_De_La_Semana_Que_Debe=(SELECT SUM(Total_de_horas) FROM detalle_del_registro_de_hora AS DRB WHERE DRB.Matricula=matric AND DRB.Semana=@Semana_Que_Debe );
                        IF (@T_Horas_De_La_Semana_Que_Debe IS NULL )THEN
							SET @T_Horas_De_La_Semana_Que_Debe=0;
						END IF;
                        -- aqui(4) SI
						SET @T_Horas_Faltantes=(@T_Horas_Por_Semestre)-(@T_Horas_De_La_Semana_Que_Debe);
						
                        IF (@T_Horas_Realizadas_Por_El_Alumno <= @T_Horas_Faltantes  )THEN
						 	update detalle_del_registro_de_hora SET Semana=@Semana_Que_Debe,Hora_de_salida=NOW(),Total_de_horas=(@T_Horas_Realizadas_Por_El_Alumno),Status_alumno=1  WHERE Matricula=matric AND Status_alumno =0;
							SELECT 6;
						ELSE
                        
							update detalle_del_registro_de_hora SET Semana=@Semana_Que_Debe,Hora_de_salida=NOW(),Total_de_horas=(@T_Horas_Faltantes  ),Status_alumno=1  WHERE Matricula=matric AND Status_alumno =0;
                            
							SET @Horas_Restantes=(@T_Horas_Realizadas_Por_El_Alumno)-(@T_Horas_Faltantes);
							SET @Semana_Que_Debe=@Semana_Que_Debe+1; 
							SET @Semana_Actual=WEEK(CURDATE(),1);
                            
							WHILE ( @Horas_Restantes > 0 ) DO
                            
								IF (@Semana_Que_Debe <= @Semana_Actual)THEN
                                
									IF (@Horas_Restantes >= @T_Horas_Por_Semestre )THEN 
											
									INSERT INTO detalle_del_registro_de_hora  VALUES (matric, CURDATE(), @Semana_Que_Debe,@H_Entrada,now(),@T_Horas_Por_Semestre,1);
									SET @Semana_Que_Debe=@Semana_Que_Debe+1;
										
										SET @Horas_Restantes=@Horas_Restantes -@T_Horas_Por_Semestre;
									ELSE
										
										INSERT INTO detalle_del_registro_de_hora  VALUES (matric, CURDATE(), @Semana_Que_Debe,@H_Entrada,now(),@Horas_Restantes,1);
										SET @Horas_Restantes=0;
									END IF;
								ELSE
									SET @Horas_Restantes=0;
								END IF;
                            
							END WHILE;
                            
							SELECT 5;
						END IF;
-- ************************************************************************************************************************************************************************************************************************************
					ELSE
						-- ALUMN@ VA A CORDE CON LA SEMANA
						SET @T_Horas_De_La_Semana_Actual=(SELECT SUM(Total_de_horas) FROM detalle_del_registro_de_hora AS DRB WHERE DRB.Matricula=matric AND DRB.Semana=week(curdate(),1) );
						IF (@T_Horas_De_La_Semana_Actual IS NULL )THEN
							SET @T_Horas_De_La_Semana_Actual=0;
						END IF;
							-- aqui(4) SI
						SET @T_Horas_Faltantes=(@T_Horas_Por_Semestre)-(@T_Horas_De_La_Semana_Actual);
                        
						IF (@T_Horas_Realizadas_Por_El_Alumno <= @T_Horas_Faltantes  )THEN
							update detalle_del_registro_de_hora SET Semana=WEEK(CURDATE(),1),Hora_de_salida=NOW(),Total_de_horas=(@T_Horas_Realizadas_Por_El_Alumno),Status_alumno=1  WHERE Matricula=matric AND Status_alumno =0;
							SELECT 4;
						ELSE
							update detalle_del_registro_de_hora SET Semana=WEEK(CURDATE(),1),Hora_de_salida=NOW(),Total_de_horas=(@T_Horas_Faltantes  ),Status_alumno=1  WHERE Matricula=matric AND Status_alumno =0;
							SELECT 3;
						END IF; 
                        
                        
						 -- SELECT 'ALUMN@ VA A CORDE CON LA SEMANA';
					END IF;	
			
           
			END IF;-- Esta_Entrando   
        ELSE -- Debe_Horas
			-- EL ALUMNO NO DEBE HORAS
            SELECT 1;
        END IF; -- Debe_Horas
	ELSE -- Existe_Alumno
		-- NO EXISTE EL ALMUN@
		SELECT 0; 
	END IF; -- Existe_Alumno

END;$$
DELIMITER ;

call Registro_de_Horas_Forzosas('18080111',7);


-- ******************************************************************** FUNCIONES PARA EL PROCESO ALMACENADO ********************************************************************
-- 1 (Debe_Horas) 
DROP FUNCTION IF EXISTS Debe_Horas;
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `Debe_Horas`( matric varchar(8)) RETURNS int(11)
    DETERMINISTIC
BEGIN
	SET @Semana_de_inicio=  week((SELECT E.Fecha_de_inicio FROM empleado AS E  WHERE Tipo=0),1);
	SET @total_de_horas=(SELECT SUM(Total_de_horas) FROM detalle_del_registro_de_hora AS DRH WHERE DRH.Matricula=matric AND DRH.Semana >=  @Semana_de_inicio AND DRH.Semana <= week(curdate(),1) );
    SET @T_Horas_Por_Semestre=(SELECT CH.T_H_Por_Semestre FROM Alumno AS A   INNER JOIN configuracion_de_hora AS CH ON CH.Id_Conf_De_Horas=A.Id_Conf_De_Horas  WHERE A.Matricula=matric);

	IF (@total_de_horas IS NULL )THEN
		SET @total_de_horas=0;
	END IF;
    
	
	SET @semana_actual=week(curdate(),1);
	SET @total_de_horas_actual= ( (@semana_actual-@Semana_de_inicio)+1)*(@T_Horas_Por_Semestre);
	IF ((@total_de_horas_actual-@total_de_horas) = 0 )THEN
		RETURN 0;
	ELSE
		RETURN 1;
	END IF;
END;//
DELIMITER ;



-- 2 (Debe_Horas_Atrasadas) 
DROP FUNCTION IF EXISTS Debe_Horas_Atrasadas;
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `Debe_Horas_Atrasadas`(matric varchar(8)) RETURNS int(12)
    DETERMINISTIC
BEGIN
	SET @Semana_Inicio =  week((SELECT E.Fecha_de_inicio FROM empleado AS E  WHERE Tipo=0),1);
	SET @Semana_Actual=week(curdate(),1);
    SET @T_Horas_Por_Semestre=(SELECT CH.T_H_Por_Semestre FROM Alumno AS A   INNER JOIN configuracion_de_hora AS CH ON CH.Id_Conf_De_Horas=A.Id_Conf_De_Horas  WHERE A.Matricula=matric);

	
	SET @Entro=0;

		while @Semana_Inicio<@Semana_Actual do
		
			SET @SUMA=(SELECT SUM(Total_de_horas) FROM detalle_del_registro_de_hora AS DRH WHERE DRH.Matricula=matric AND DRH.Semana=@Semana_Inicio);
			IF (@SUMA IS NULL )THEN
				SET @SUMA=0;
			END IF;
        
        
			IF (@SUMA < @T_Horas_Por_Semestre )THEN
				RETURN 1;
				-- SET @x=1;
			END IF;
			SET @Entro=@Entro+1;
			set @Semana_Inicio=@Semana_Inicio+1;
		end while;

	RETURN 0;
END;//
DELIMITER ;

-- 3 (Esta_Entrando) +
DROP FUNCTION IF EXISTS Esta_Entrando;
DELIMITER //
	CREATE DEFINER=`root`@`localhost` FUNCTION `Esta_Entrando`( matri varchar(8)) RETURNS int(11)
    DETERMINISTIC
BEGIN
	SET @DEBE=(SELECT COUNT(*) FROM detalle_del_registro_de_hora AS DRB WHERE DRB.Matricula=matri AND DRB.Status_alumno=0);
	IF (@DEBE = 0 )THEN
		RETURN 1;
	ELSE
		RETURN 0;
	END IF;
END;//
DELIMITER ;

-- 4 (Existe_Alumno) +
DROP FUNCTION IF EXISTS Existe_Alumno;
DELIMITER //
	CREATE DEFINER=`root`@`localhost` FUNCTION `Existe_Alumno`( matric varchar(8)) RETURNS int(11)
    DETERMINISTIC
BEGIN
	IF EXISTS(SELECT A.Matricula FROM alumno as A where A.Matricula=matric )then
		RETURN 1;
	else
		RETURN 0;
	end IF;
END;//
DELIMITER ;


-- 5 (Hizo_Al_Menos_Una_Hora) +
DROP FUNCTION IF EXISTS Hizo_Al_Menos_Una_Hora;
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `Hizo_Al_Menos_Una_Hora`(matri varchar(8),hora varchar(20)) RETURNS int(11)
    DETERMINISTIC
BEGIN
	SET @Hora_Entrada=(SELECT DRH.Hora_de_entrada FROM detalle_del_registro_de_hora AS DRH WHERE DRH.Matricula=matri AND DRH.Status_alumno=0);
	
	SET @AUX=(SELECT TIMESTAMPDIFF(MINUTE, @Hora_Entrada, hora) );
	IF (@AUX >= 45 )THEN
		RETURN  1;
	ELSE
		RETURN  0;
	END IF;
END;//
DELIMITER ;


-- 6 (Horas_Adeudadas) 
DROP FUNCTION IF EXISTS Horas_Adeudadas;
DELIMITER //
	CREATE DEFINER=`root`@`localhost` FUNCTION `Horas_Adeudadas`(Matri varchar(8), FechaFin DATE) RETURNS int(11)
    DETERMINISTIC
BEGIN
	SET @Semana_Inicio =  week((SELECT E.Fecha_de_inicio FROM empleado AS E  WHERE Tipo=0),1);
	SET @Semana_Actual=week(FechaFin,1);
	-- SET @T_Horas_Por_Semestre=(SELECT CH.T_H_Por_Semestre FROM Alumno AS A INNER JOIN Semestre AS S ON S.Id_Semestre =A.Id_Semestre  INNER JOIN configuracion_de_hora AS CH ON CH.Id_Semestre=S.Id_Semestre  WHERE A.Matricula =Matri);
	SET @T_Horas_Por_Semestre=(SELECT CH.T_H_Por_Semestre FROM Alumno AS A   INNER JOIN configuracion_de_hora AS CH ON CH.Id_Conf_De_Horas=A.Id_Conf_De_Horas  WHERE A.Matricula=Matri);
	SET @Total_de_Horas=(@Semana_Actual-@Semana_Inicio+1)*(@T_Horas_Por_Semestre);

	SET @Horas_Hechas_Por_El_Alumno=(SELECT SUM(DRH.Total_de_horas)  FROM detalle_del_registro_de_hora AS DRH Where DRH.Semana >= @Semana_Inicio AND DRH.Semana <= @Semana_Actual AND DRH.Matricula=Matri );
	
    IF(@Horas_Hechas_Por_El_Alumno IS NULL)THEN
		SET @Horas_Hechas_Por_El_Alumno=0;
    END IF;

	SET @Total=(@Total_de_Horas -@Horas_Hechas_Por_El_Alumno );

	RETURN  @Total;
END;//
DELIMITER ;


-- 7 (Horas_Hechas ) 
DROP FUNCTION IF EXISTS Horas_Hechas;
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `Horas_Hechas`(Matri varchar(8) , FechaInicio DATE ,FechaFin DATE) RETURNS int(11)
    DETERMINISTIC
BEGIN
	
	-- SET @T_Horas=(SELECT SUM(DRH.Total_de_horas) AS 'suma' FROM biblioteca_unpa.detalle_del_registro_de_hora AS DRH WHERE DRH.Matricula=Matri);
    SET @T_Horas=(SELECT SUM(DRH.Total_de_horas) FROM detalle_del_registro_de_hora AS DRH Where DRH.Semana >=  week (FechaInicio,1) AND DRH.Semana <= week(FechaFin,1) AND DRH.Matricula=Matri );
	
    IF(@T_Horas IS NULL)THEN
		SET @T_Horas=0;
    END IF;
    -- SELECT @T_Horas AS 'HORA';
	RETURN @T_Horas ;
END;//
DELIMITER ;






-- 8 (Semana_Actual) 
DROP FUNCTION IF EXISTS Semana_Actual;
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `Semana_Actual`( matric varchar(18)) RETURNS int(11)
    DETERMINISTIC
BEGIN
	set @Semana_Inicio =  week((SELECT E.Fecha_de_inicio FROM empleado AS E  WHERE Tipo=0),1);
    SET @Semana_Actual=week(curdate(),1);
    SET @T_Horas_Por_Semestre=(SELECT CH.T_H_Por_Semestre FROM Alumno AS A   INNER JOIN configuracion_de_hora AS CH ON CH.Id_Conf_De_Horas=A.Id_Conf_De_Horas  WHERE A.Matricula=matric);

    
   while @Semana_Inicio<@Semana_Actual do
      SET @total_de_horas=(SELECT SUM(Total_de_horas) FROM detalle_del_registro_de_hora AS DRH WHERE DRH.Matricula=matric AND DRH.Semana=@Semana_Inicio ) ;
      
      IF (@total_de_horas IS NULL )THEN
		SET @total_de_horas=0;
	  END IF;
      
      
      IF (@total_de_horas < @T_Horas_Por_Semestre )THEN
		-- RETURN Semana_Inicio;
        SET @Semana =@Semana_Inicio;
        SET @Semana_Inicio=@Semana_Actual;
      ELSE  
		set @Semana_Inicio=@Semana_Inicio+1;
	  END IF;
      
      
    end while;
    
	RETURN @Semana;
END;//
DELIMITER ;


-- 9 (Total_De_Horas) 
DROP FUNCTION IF EXISTS Total_De_Horas;
DELIMITER $$
	CREATE DEFINER=`root`@`localhost` FUNCTION `Total_De_Horas`(matri varchar(8),hora varchar(20)) RETURNS int(11)
    DETERMINISTIC
BEGIN
	SET @Hora_Entrada=(SELECT DRH.Hora_de_entrada FROM detalle_del_registro_de_hora AS DRH WHERE DRH.Matricula=matri AND DRH.Status_alumno=0);
	
	SET @AUX=(SELECT TIMESTAMPDIFF(MINUTE, @Hora_Entrada, hora));
    
    SET @TH=((@AUX - @AUX%45)/45);
    
    IF(matri = '18080075' || matri = '18080019' || matri = '18080070' || matri = '18080002' || matri = '18110024'   || matri = '17020024' || matri = '16100067' )THEN
		SET @TH=@TH*2;
    END IF;
	RETURN @TH;
END ; $$
DELIMITER ;
