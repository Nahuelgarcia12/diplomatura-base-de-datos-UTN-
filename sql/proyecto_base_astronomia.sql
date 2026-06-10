------------------------------------------------------------
-- CREACIÓN DE LA BASE DE DATOS Y USO DE LA MISMA
------------------------------------------------------------
CREATE DATABASE BaseAstronomia;
GO
USE BaseAstronomia;
GO

------------------------------------------------------------
-- CREACIÓN DE TABLAS
------------------------------------------------------------

-- Tabla de dimensión: CuerposCelestes
-- Objetivo: Almacenar información sobre los cuerpos celestes (nombre, tipo y distancia en años luz)
CREATE TABLE CuerposCelestes (
    ID_Cuerpo INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(100),
    Tipo NVARCHAR(50),
    Distancia FLOAT  -- Distancia en años luz
);
GO

-- Tabla de dimensión: Observatorios
-- Objetivo: Almacenar información sobre los observatorios (nombre, ubicación y país)
CREATE TABLE Observatorios (
    ID_Observatorio INT IDENTITY(1,1) PRIMARY KEY,
    NombreObservatorio NVARCHAR(100),
    Ubicacion NVARCHAR(100),
    Pais NVARCHAR(50)
);
GO

-- Tabla de hechos: Observaciones
-- Objetivo: Registrar las observaciones realizadas, relacionando cuerpos celestes y observatorios
CREATE TABLE Observaciones (
    ID_Observacion INT IDENTITY(1,1) PRIMARY KEY,
    ID_Cuerpo INT,
    ID_Observatorio INT,
    FechaObservacion DATETIME,
    Brillo FLOAT,
    CONSTRAINT FK_Observaciones_Cuerpos FOREIGN KEY (ID_Cuerpo) REFERENCES CuerposCelestes(ID_Cuerpo),
    CONSTRAINT FK_Observaciones_Observatorios FOREIGN KEY (ID_Observatorio) REFERENCES Observatorios(ID_Observatorio)
);
GO

------------------------------------------------------------
-- INSERCIÓN DE REGISTROS (10 EN CADA TABLA)
------------------------------------------------------------

-- Insertar registros en CuerposCelestes
INSERT INTO CuerposCelestes (Nombre, Tipo, Distancia)
VALUES
('Sol', 'Estrella', 0),
('Alpha Centauri', 'Sistema Estelar', 4.37),
('Sirius', 'Estrella', 8.6),
('Betelgeuse', 'Estrella', 642.5),
('Andrómeda', 'Galaxia', 2537000),
('Vía Láctea', 'Galaxia', 0),
('Júpiter', 'Planeta', 0.000082),
('Saturno', 'Planeta', 0.00015),
('Orion', 'Nebulosa', 1344),
('Vega', 'Estrella', 25);
GO

-- Insertar registros en Observatorios
INSERT INTO Observatorios (NombreObservatorio, Ubicacion, Pais)
VALUES
('Hubble', 'Órbita Terrestre', 'EE.UU.'),
('Arecibo', 'Arecibo, Puerto Rico', 'EE.UU.'),
('Very Large Telescope', 'Desierto de Atacama', 'Chile'),
('Keck', 'Mauna Kea', 'EE.UU.'),
('Palomar', 'California', 'EE.UU.'),
('La Silla', 'Desierto de Atacama', 'Chile'),
('Gemini', 'Hawái', 'EE.UU.'),
('Subaru', 'Hawái', 'EE.UU.'),
('Siding Spring', 'Nueva Gales del Sur', 'Australia'),
('ESO', 'Garching', 'Alemania');
GO

-- Insertar registros en Observaciones
INSERT INTO Observaciones (ID_Cuerpo, ID_Observatorio, FechaObservacion, Brillo)
VALUES
(1, 1, '2023-01-10', 1000),
(2, 2, '2023-02-15', 800),
(3, 3, '2023-03-20', 1200),
(4, 4, '2023-04-25', 950),
(5, 5, '2023-05-30', 700),
(6, 6, '2023-06-05', 1100),
(7, 7, '2023-07-10', 1300),
(8, 8, '2023-08-15', 900),
(9, 9, '2023-09-20', 850),
(10, 10, '2023-10-25', 1150);
GO

------------------------------------------------------------
-- CONSULTA BÁSICA CON INNER JOIN
------------------------------------------------------------
-- Objetivo:
-- La consulta une la tabla de hechos "Observaciones" con las tablas de dimensiones "CuerposCelestes" y "Observatorios"
-- para mostrar los detalles de cada observación, incluyendo el nombre del cuerpo celeste,
-- el nombre del observatorio, la fecha de la observación y el brillo medido.



SELECT NombreObservatorio as 'Nombre del Observatorio',Nombre AS 'Cuerpo Celeste' , FechaObservacion as 'Fecha de Observación', Brillo 
FROM Observaciones AS O 
inner join CuerposCelestes on O.ID_Cuerpo= CuerposCelestes.ID_Cuerpo
inner join Observatorios as OBS on  O.ID_Observatorio= OBS.ID_Observatorio
order by FechaObservacion desc


------------------------------------------------------------
-- CONSULTA CON MEDIDA CALCULADA
------------------------------------------------------------
-- Objetivo:
-- Calcular el brillo promedio observado para cada cuerpo celeste, agrupando por su ID,
-- trabajando solo con la tabla de hechos "Observaciones".


SELECT ID_Cuerpo, AVG(Brillo) AS 'Promedio de brillo'
FROM Observaciones 
GROUP BY ID_Cuerpo
order by [Promedio de brillo]



------------------------------------------------------------
-- PROCEDIMIENTOS ALMACENADOS 
------------------------------------------------------------
-- Objetivo:
-- Mostrar todas las observaciones asociadas a un cuerpo celeste específico,
-- recibiendo como parámetro el ID del cuerpo.

-- ejemplo de uso 


-- Segundo ejercicio 
-- Objetivo:
-- Insertar una nueva observación en la tabla Observaciones,
-- recibiendo los datos necesarios como parámetros.

-- Probar 

-- 
-- Mostrar la observación recién agregada mediante un selct




--CREACIÓN DEL SP
GO

CREATE PROCEDURE sp_ObservacionesPorCuerpo 

    @ID_Cuerpo INT

AS

BEGIN

    SELECT *

    FROM Observaciones

    WHERE ID_Cuerpo = @ID_Cuerpo;

END;

GO

-- EJEMPLO DE USO

EXEC sp_ObservacionesPorCuerpo 1




--EJ 2


GO

CREATE PROCEDURE sp_InsertarObservación

    @ID_Cuerpo INT, @ID_Observatorio INT, @FechaObservacion DATETIME, @Brillo FLOAT


AS

BEGIN

    INSERT INTO Observaciones (ID_Cuerpo,ID_Observatorio, FechaObservacion, Brillo) VALUES (@ID_Cuerpo,@ID_Observatorio,@FechaObservacion,@Brillo)

END;

GO



--- EJEMPLO DE USO

EXEC sp_InsertarObservación 1, 2, '2024-01-15', 1050

SELECT * FROM Observaciones WHERE FechaObservacion = '2024-01-15'











