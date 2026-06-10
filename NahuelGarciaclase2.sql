-- Para crear la base de datos "ESTADOS", puedes ejecutar la siguiente consulta SQL:
CREATE DATABASE ESTADOS_2;

-- Una vez creada la base de datos, cambia el contexto a la base de datos "ESTADOS" con la siguiente consulta:

USE ESTADOS_2;

--Ahora, crearemos la tabla "PAIS" con los campos especificados (ID_Pais y Nombre_Pais) utilizando la siguiente consulta
-- Esta consulta crea una tabla llamada "PAIS" con dos columnas: "ID_Pais" (clave primaria) y "Nombre_Pais".
CREATE TABLE PAIS (
    ID_Pais INT PRIMARY KEY,
    Nombre_Pais VARCHAR(100) NOT NULL
);


-- Ahora, para cargar los datos proporcionados en la tabla de países, puedes ejecutar las siguientes consultas de inserción:

INSERT INTO PAIS (ID_Pais, Nombre_Pais) VALUES (1, 'Argentina');
INSERT INTO PAIS (ID_Pais, Nombre_Pais) VALUES (2, 'Uruguay');
INSERT INTO PAIS (ID_Pais, Nombre_Pais) VALUES (3, 'Inglaterra');
INSERT INTO PAIS (ID_Pais, Nombre_Pais) VALUES (4, 'Londres');
INSERT INTO PAIS (ID_Pais, Nombre_Pais) VALUES (5, 'Cardiff');
INSERT INTO PAIS (ID_Pais, Nombre_Pais) VALUES (6, 'Reino Unido');
INSERT INTO PAIS (ID_Pais, Nombre_Pais) VALUES (7, 'Estados Unidos');


SELECT * FROM PAIS;
/*decidi borrar la tabla pais*/
DROP TABLE  PAIS;
/* creo una nueva tabla pais que tiene una llave primaria el id con un contador automatico(identity),el nombre del pais y continente*/
CREATE TABLE PAIS_1(
ID_Pais INT IDENTITY(1,1) PRIMARY KEY,
    Nombre_Pais VARCHAR(100) NOT NULL UNIQUE,
    Continente VARCHAR(50) NOT NULL
);

/*agrego valores a la tabla*/
INSERT INTO PAIS_1(Nombre_Pais,Continente) VALUES
('Argentina', 'América'),
('Uruguay', 'América'),
('Reino Unido', 'Europa'),
('Estados Unidos', 'América') ,
 ('Japon', 'Asia');

 /*muestro la tabla*/
SELECT * FROM PAIS_1;
/*Borro un registro*/
DELETE FROM PAIS_1
WHERE Nombre_Pais = 'uruguay';
/*muestro tabla actual*/
SELECT* FROM PAIS_1;

-- creaamos la tabla de ciudades
CREATE TABLE CIUDADES (
    [2020_Rank] INT NOT NULL,
    [Ciudad] VARCHAR(255) NOT NULL,
    [Estado] VARCHAR(255) NOT NULL,
    [id_CiudadEstado] INT NOT NULL,
    [2020 Censo] INT NOT NULL,
    [2010 Censo] INT NOT NULL,
    [Variacion] VARCHAR(50) NOT NULL,
    [id_Estado] INT NOT NULL,
    [Area] VARCHAR(50) NOT NULL,
    [Densidad_Poblacional] VARCHAR(50) NOT NULL,
    [Ubicacion] VARCHAR(50) NOT NULL
);

-- insertamos registros manuales 

INSERT INTO CIUDADES ([2020_Rank], Ciudad, Estado, id_CiudadEstado, [2020 Censo], [2010 Censo], Variacion, id_Estado, Area, Densidad_Poblacional, Ubicacion)
VALUES
(228, 'Abilene', 'Texas', 711, 125182, 117063, '6.94%', 41, '276.4 km2', '453/km2', '32.45°N 99.73°W'),
(136, 'Akron', 'Ohio', 619, 190469, 199110, '-4.34%', 34, '160.3 km2', '1,188/km2', '41.08°N 81.52°W'),
(32, 'Albuquerque', 'New Mexico', 515, 564559, 545852, '3.43%', 30, '485.1 km2', '1,164/km2', '35.10°N 106.64°W'),
(163, 'Alexandria[m]', 'Virginia', 646, 159467, 139966, '13.93%', 43, '38.6 km2', '4,132/km2', '38.82°N 77.08°W'),
(306, 'Allen', 'Texas', 789, 104627, 84246, '24.19%', 41, '68.4 km2', '1,530/km2', '33.09°N 96.66°W'),
(225, 'Allentown', 'Pennsylvania', 708, 125845, 118032, '6.62%', 37, '45.6 km2', '2,760/km2', '40.59°N 75.47°W'),
(121, 'Amarillo', 'Texas', 604, 200393, 190695, '5.09%', 41, '265.0 km2', '756/km2', '35.19°N 101.83°W'),
(56, 'Anaheim', 'California', 539, 346824, 336265, '3.14%', 5, '130.3 km2', '2,662/km2', '33.85°N 117.76°W'),
(72, 'Anchorage[q]', 'Alaska', 555, 291247, 291826, '-0.20%', 2, '4,420.6 km2', '66/km2', '61.17°N 149.28°W'),
(231, 'Ann Arbor', 'Michigan', 714, 123851, 113934, '8.70%', 21, '73.0 km2', '1,696/km2', '42.27°N 83.73°W'),
(254, 'Antioch', 'California', 737, 115291, 102372, '12.62%', 5, '75.6 km2', '1,524/km2', '37.97°N 121.79°W'),
(50, 'Arlington', 'Texas', 533, 394266, 365438, '7.89%', 41, '248.4 km2', '1,587/km2', '32.70°N 97.12°W'),
(229, 'Arvada', 'Colorado', 712, 124402, 106433, '16.88%', 6, '100.8 km2', '1,235/km2', '39.83°N 105.15°W'),
(218, 'Athens[y]', 'Georgia', 701, 127315, 115452, '10.28%', 10, '301.2 km2', '423/km2', '33.94°N 83.37°W'),
(38, 'Atlanta', 'Georgia', 521, 498715, 420003, '18.74%', 10, '350.4 km2', '1,423/km2', '33.76°N 84.42°W'),
(116, 'Augusta[v]', 'Georgia', 599, 202081, 195844, '3.18%', 10, '783.0 km2', '258/km2', '33.36°N 82.07°W'),
(51, 'Aurora', 'Colorado', 534, 386261, 325078, '18.82%', 6, '414.7 km2', '932/km2', '39.68°N 104.68°W'),
(144, 'Aurora', 'Illinois', 627, 180542, 197899, '-8.77%', 13, '116.5 km2', '1,549/km2', '41.76°N 88.29°W'),
(11, 'Austin', 'Texas', 494, 961855, 790390, '21.69%', 41, '828.5 km2', '1,161/km2', '30.30°N 97.75°W'),
(48, 'Bakersfield', 'California', 531, 403455, 347483, '16.11%', 5, '388.0 km2', '1,040/km2', '35.32°N 119.01°W');

-- Select básico: Esta consulta selecciona todos los datos de la tabla CIUDADES.
SELECT * FROM CIUDADES;

-- where
SELECT * FROM CIUDADES
WHERE Estado = 'Texas';
/*prubo otro select*/
SELECT *FROM CIUDADES
WHERE Estado='Georgia';
--Consulta con WHERE y ordenamiento: Esta consulta selecciona todas las ciudades con una población mayor 
--a 200,000 en el año 2020, ordenadas por la población descendente.

SELECT * FROM CIUDADES WHERE [2020 Censo] > 200000 ORDER BY [2020 Censo] DESC;
--ejemplo similar
--Consulta con WHERE y ordenamiento: Esta consulta selecciona todas las ciudades con una población menor 
--a 200,000 en el año 2020, ordenadas por la población ascendente.
SELECT* FROM CIUDADES WHERE  [2020 Censo] < 200000 ORDER BY [2020 Censo] ASC;

alter table ciudades
add columna_ficticia varchar(100);
--modifico la tabla y agrego una nueva columna o campo
alter table ciudades
add  codigopostal varchar(10);
--actualizo valores nulos en la columna codigo postal
update CIUDADES set codigopostal ='tc012' where Ciudad = 'Abilene';
update CIUDADES set codigopostal ='oh142' where Ciudad = 'Akron';
--borro las columnas agregadas
ALTER TABLE CIUDADES
DROP COLUMN Columna_Ficticia;

alter table ciudades
drop column codigopostal;

Select AVG ([2020 Censo]) as promediopoblacion from CIUDADES;
/*cast convierte de un tipo de dato a otro en este caso de texto a numero(decimal) y 
replace cambia el valor porcentaje por algo nulo*/
SELECT AVG(CAST(REPLACE(Variacion, '%', '') AS DECIMAL)) AS PromedioVariacion FROM CIUDADES;

/* ejemplo similar
Convierte el dato del área a número eliminando la unidad 'km2' y las comas */
SELECT AVG(CAST(REPLACE(REPLACE(Area, ' km2', ''), ',', '') AS DECIMAL(18,2))) AS PromedioArea
FROM CIUDADES;


select top 1 ciudad,densidad_poblacional from CIUDADES;
select top 3 ciudad,densidad_poblacional from CIUDADES 
order by Densidad_Poblacional;
-- ejemplo similar
select top 3 ciudad,area from CIUDADES order by area;

--Consulta combinada con WHERE y MAX: Esta consulta muestra 
--la ciudad con la mayor población en el estado de California.
select * from CIUDADES where Estado ='california'AND [2020 Censo] = (SELECT MAX([2020 Censo]) FROM CIUDADES WHERE Estado = 'California');
--ejemplo similar
select * from CIUDADES where Estado ='Georgia'AND [2020 Censo] = (SELECT MAX([2020 Censo]) FROM CIUDADES WHERE Estado = 'Georgia'); 

select * from CIUDADES;

SELECT *
FROM CIUDADES
WHERE [2020 Censo] BETWEEN 100000 AND 200000;
--ejemplo similar
SELECT *
FROM CIUDADES
WHERE [2010 Censo] BETWEEN 1000 AND 100000;

select Estado,count (*) as repeticiones
From CIUDADES
group by Estado
ORDER BY repeticiones desc;
-- EJEMPLO SIMILAR
select Continente,count (*) as repeticiones
From PAIS_1
group by Continente
ORDER BY repeticiones desc;


-- TAREA / EXPLICAR QUE OCURRE EN ESTO Y MODIFICAR 
SELECT Estado,
    SUM([2020 Censo]) AS Total_2020,
    SUM([2010 Censo]) AS Total_2010,
    (SUM([2020 Censo]) - SUM([2010 Censo])) AS Diferencia_Poblacion
FROM CIUDADES
GROUP BY Estado
ORDER BY Diferencia_Poblacion DESC;
/*La consulta suma las poblaciones de todas las ciudades por estado en ambos censos,
calcula la diferencia entre 2020 y 2010, y ordena los estados según cuál creció  más.*/

/*La Primera Forma Normal (1FN) establece que una tabla debe almacenar sus datos de manera atómica, es decir, cada campo debe contener un solo valor y no listas, valores repetidos o múltiples elementos dentro de una misma celda. Su propósito es evitar redundancias básicas y facilitar la lectura y procesamiento de los datos*/

/*Segunda Forma Normal (2FN), que exige que no existan dependencias parciales, lo que significa que ninguna columna que no sea parte de la clave primaria debe depender solo de una parte de ella. Esta regla se aplica únicamente cuando la clave primaria está compuesta por más de un campo; si un atributo depende de uno solo de ellos, debe separarse en otra tabla para evitar inconsistencias y duplicación de información.*/

/*la Tercera Forma Normal (3FN) indica que una tabla no debe contener dependencias transitivas, lo que ocurre cuando un campo no clave depende de otro campo que tampoco forma parte de la clave primaria. En otras palabras, cada atributo debe depender directamente y únicamente de la clave primaria, no de otros atributos.*/