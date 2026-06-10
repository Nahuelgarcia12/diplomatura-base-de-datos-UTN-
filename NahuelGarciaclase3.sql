?--Unidad 3: Objetos de las bases de datos


-- Para crear la base de datos "ESTADOS", puedes ejecutar la siguiente consulta SQL:
CREATE DATABASE ESTADOS;
-- Una vez creada la base de datos, cambia el contexto a la base de datos "ESTADOS" con la siguiente consulta:
USE ESTADOS;

CREATE TABLE Escuelas (
    id INT PRIMARY KEY IDENTITY,
    jurisdiccion NVARCHAR(50) NOT NULL,
    cue_anexo NVARCHAR(50) NOT NULL,
    nombre NVARCHAR(255) NOT NULL,
    sector NVARCHAR(50) NOT NULL,
    ambito NVARCHAR(50) NOT NULL,
    domicilio NVARCHAR(255) NOT NULL,
    codigo_postal NVARCHAR(10),
    codigo_area NVARCHAR(10),
    telefono NVARCHAR(20),
    fecha_alta DATE NOT NULL,
    cantidad_alumnos INT NOT NULL,
    asignacion_parcial DECIMAL(12, 2) NOT NULL,
    asignacion_final DECIMAL(12, 2) NOT NULL,
    promedio_nota_alumnos INT
);

INSERT INTO Escuelas (jurisdiccion, cue_anexo, nombre, sector, ambito, domicilio, codigo_postal, codigo_area, telefono, fecha_alta, cantidad_alumnos, asignacion_parcial, asignacion_final, promedio_nota_alumnos)
VALUES 
('Buenos Aires', '60529300', 'INSTITUTO CULTURAL SAN MARTIN', 'Privado', 'Urbano', 'SAN MARTIN  443', '1884', '11', '4244-3431', '1995-03-15', 3589, 71780.00, 71780.00, 8),
('San Juan', '900029600', 'CENTRO POLIVALENTE DE ARTE - SAN JUAN', 'Estatal', 'Urbano', 'MITRE 315 (N)', '5400', '264', '4295887/4283006', '1995-03-10', 2813, 56260.00, 56260.00, 7),
('Salta', '760159800', 'ESCUELA Nº 452', 'Estatal', 'Rural', 'CAMPO LA BANDA S/N', 'A4440', NULL, NULL, '1995-02-28', 1953, 39060.00, 42966.00, 5),
('Chubut', '260109900', 'ESCUELA N° 773', 'Estatal', 'Rural', 'P. GALANA', 'U9121', NULL, NULL, '1995-02-20', 3148, 62960.00, 69256.00, 4),
('Santa Cruz', '780034200', 'ESCUELA Nº 24', 'Estatal', 'Urbano', 'ALMIRANTE BROWN 1546', '9400', NULL, NULL, '1995-02-12', 4275, 85500.00, 94050.00, 10),
('Chaco', '220013600', 'ESC. DE EDUC. SEC. ORIENTADA DEL B° SANTA MONICA', 'Estatal', 'Urbano', 'YAPEYU 745 B° SANTA MONICA', '3500', NULL, NULL, '1995-02-05', 3781, 75620.00, 75620.00, 9),
('Corrientes', '100024000', 'ESCUELA PRIMARIA PROVINCIAL N°5', 'Estatal', 'Urbano', 'RIO JAURISTE  C/ LAS PALMERAS S/Nº', '3400', NULL, NULL, '1995-01-28', 2496, 49920.00, 49920.00, 6),
('Entre Ríos', '840141400', 'C.E.P.A. Nº 1', 'Estatal', 'Urbano', 'BVAR. ROCA 149', '2820', '3442', '4330002', '1995-01-20', 2984, 59680.00, 59680.00, 6),
('Neuquén', '580015400', 'ESCUELA DE EDUCACION TECNICA N° 2', 'Estatal', 'Urbano', 'BUENOS AIRES 215', '8300', '299', '4356700', '1995-01-12', 4165, 83300.00, 83300.00, 9),
('San Luis', '200038500', 'ESCUELA N° 2 - JORGE MARIO RIVERO', 'Estatal', 'Rural', 'VILLA MERCEDES -  LUJAN -', '5730', NULL, NULL, '1995-01-03', 3320, 66400.00, 73040.00, 8),
('La Pampa', '420058500', 'ESCUELA N° 39 - LUIS VALERIO DE LA FLORIDA', 'Estatal', 'Rural', 'LA FLORIDA', '6261', NULL, NULL, '1994-12-27', 3814, 76280.00, 83908.00, 7),
('Rio Negro', '340014200', 'C.E.P.T. Nº 30 - VALLE INFERIOR', 'Estatal', 'Rural', 'LAMADRID 1850', '8520', NULL, NULL, '1994-12-20', 2732, 54640.00, 60004.00, 7),
('Jujuy', '600016300', 'INSTITUTO SAN ANTONIO DE PADUA', 'Privado', 'Urbano', 'AVDA.  SANTANA', '4600', '3888', '4246477', '1994-12-13', 3745, 74900.00, 74900.00, 8),
('Tierra del Fuego', '940012100', 'ESCUELA Nº 28', 'Estatal', 'Rural', 'MARTIN FOUGUET  1540', '9410', NULL, NULL, '1994-12-05', 2961, 59220.00, 65142.00, 9),
('Córdoba', '140037600', 'ESCUELA PROVINCIAL DE EDUCACIÓN TÉCNICA - LAS VARILLAS', 'Estatal', 'Urbano', 'RIVADAVIA  1499', '5940', NULL, NULL, '1994-11-28', 2198, 43960.00, 43960.00, 6),
('Santiago del Estero', '860064500', 'ESCUELA SECUNDARIA Nº 21', 'Estatal', 'Urbano', 'AVENIDA  2', '4200', NULL, NULL, '1994-11-20', 3275, 65500.00, 72050.00, 5),
('Mendoza', '340073200', 'ESCUELA Nº 4-109 "JOSÉ E. SEGURA"', 'Estatal', 'Urbano', 'CALLE PUBLICA', '5525', NULL, NULL, '1994-11-12', 3816, 76320.00, 83952.00, 8),
('Formosa', '340048400', 'ESCUELA DE EDUCACIÓN TÉCNICA Nº 5', 'Estatal', 'Urbano', 'AVENIDA  25 DE MAYO  1255', '3600', '370', '4224285', '1994-11-05', 4472, 89440.00, 89440.00, 10),
('Santa Fe', '820059400', 'ESCUELA PROVINCIAL N° 7 - "ALICIA M. DE JUSTO"', 'Estatal', 'Urbano', 'AVDA.   SAN MARTÍN  S/N', '2400', '3464', '4720929', '1994-10-28', 2841, 56820.00, 56820.00, 5),
('Tucumán', '900049400', 'ESCUELA PRIMARIA - RAMÓN YORVI', 'Estatal', 'Urbano', 'RUTA NAC. 34 KM.  15', '4148', '381', '4608820', '1994-10-20', 3529, 70580.00, 77638.00, 6),
('San Juan', '900065300', 'ESCUELA Nº 448', 'Estatal', 'Rural', 'EL ENCON  UÑAC - DEPARTAMENTO DE MANTAGASTA', '5425', NULL, NULL, '1994-10-12', 2850, 57000.00, 62700.00, 9),
('Salta', '760133100', 'ESCUELA SECUNDARIA Nº 5077', 'Estatal', 'Urbano', 'BOULEVARD GALVEZ  Nº 2650  Bº PUERTO ARGENTINO', '4400', NULL, NULL, '1994-10-05', 4975, 99500.00, 109450.00, 7),
('Chubut', '260121400', 'ESCUELA Nº 77', 'Estatal', 'Rural', 'LAPRIDA', '9211', NULL, NULL, '1994-09-28', 3362, 67240.00, 73964.00, 10),
('Santa Cruz', '780034400', 'ESCUELA Nº 21', 'Estatal', 'Urbano', 'ROCA 545', '9400', NULL, NULL, '1994-09-20', 4125, 82500.00, 90750.00, 8),
('Chaco', '220026100', 'ESCUELA PRIMARIA N° 611', 'Estatal', 'Urbano', 'AVENIDA  28  2340', '3500', NULL, NULL, '1994-09-12', 3582, 71640.00, 71640.00, 5),
('Corrientes', '100016600', 'ESCUELA PROVINCIAL N°7', 'Estatal', 'Rural', 'CAMPO SECO', '3460', NULL, NULL, '1994-09-05', 2197, 43940.00, 48334.00, 6),
('Entre Ríos', '840142800', 'ESCUELA N° 86', 'Estatal', 'Rural', 'LAPACHITO', '3281', NULL, NULL, '1994-08-28', 3378, 67560.00, 74316.00, 4),
('Neuquén', '580033000', 'ESCUELA DE EDUCACION TECNICA N° 10', 'Estatal', 'Urbano', 'BELGRANO 900', '8300', '299', '4362630', '1994-08-20', 4521, 90420.00, 99462.00, 8),
('San Luis', '200032800', 'ESCUELA N° 27 - PABLO NOGUES', 'Estatal', 'Rural', 'B° EL RINCON S/N', '5881', NULL, NULL, '1994-08-12', 3230, 64600.00, 71060.00, 7),
('La Pampa', '420031200', 'ESCUELA N° 74 - JOSE HERNANDEZ', 'Estatal', 'Rural', 'CARRO QUEMADO', '6321', NULL, NULL, '1994-08-05', 4863, 97260.00, 106986.00, 6);

Select * from Escuelas

-- Consulta para mostrar todas las escuelas de una provincia específica:
SELECT * FROM Escuelas WHERE jurisdiccion = 'Buenos Aires';
-- Consulta para mostrar todas las escuelas de un ambito específico:
SELECT * FROM Escuelas WHERE ambito = 'Urbano';

--Consulta para mostrar las escuelas que tienen un promedio de nota de alumnos superior o igual a 8:
SELECT * FROM Escuelas WHERE Promedio_nota_alumnos >= 8;
--Consulta para mostrar las escuelas que tienen un promedio de nota de alumnos superior o igual a 4 y menor o igual que 7:
select * from Escuelas where promedio_nota_alumnos >= 4 and  promedio_nota_alumnos <= 7;

-- Consulta para mostrar las escuelas de una provincia ordenadas por cantidad de alumnos de forma descendente:

SELECT * FROM Escuelas WHERE jurisdiccion = 'Mendoza' ORDER BY cantidad_alumnos DESC;
-- Consulta para mostrar las escuelas de un ambito ordenadas por cantidad de alumnos de forma ascendente:
select * from Escuelas where ambito = 'Rural' order by cantidad_alumnos;

--1. Tablas
--Teoría breve:
--Tablas: Es el objeto fundamental en una base de datos que sirve para almacenar información organizada en filas (registros) y columnas (campos).
--Comandos principales:
--CREATE TABLE: crea una nueva tabla.
--ALTER TABLE: modifica una tabla existente.
--DROP TABLE: elimina una tabla.
--TRUNCATE TABLE: elimina todos los registros sin eliminar la estructura.

--Ejercicios:
--a) Crear una tabla nueva "Docentes":

-- Creando una tabla llamada Docentes
CREATE TABLE Docentes (
    id INT PRIMARY KEY IDENTITY,
    nombre NVARCHAR(50) NOT NULL,
    apellido NVARCHAR(50) NOT NULL,
    dni NVARCHAR(10) UNIQUE NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    materia NVARCHAR(50) NOT NULL
);

-- Insertando registros en la tabla Docentes
INSERT INTO Docentes (nombre, apellido, dni, fecha_nacimiento, materia)
VALUES 
('Carlos', 'Pérez', '30456789', '1980-05-14', 'Matemática'),
('María', 'González', '27895634', '1975-07-22', 'Historia'),
('Ana', 'Martínez', '31567845', '1988-11-03', 'Biología');

-- Mostrando registros insertados
SELECT * FROM Docentes;

INSERT INTO Docentes (nombre, apellido, dni, fecha_nacimiento, materia)
VALUES
('Jorge', 'López', '28654321', '1981-02-19', 'Física'),
('Laura', 'Mendez', '32987456', '1991-09-30', 'Lengua'),
('Sofía', 'Ruiz', '34785912', '1995-06-11', 'Matemática'),
('Miguel', 'Torres', '29874563', '1983-01-27', 'Historia'),
('Pedro', 'Castro', '31258974', '1987-10-08', 'Biología');

-- Mostrando registros insertados
SELECT * FROM Docentes;

/*Eliminar registros con DELETE
Si queremos eliminar ciertos registros específicos, utilizamos el comando DELETE.
Ejemplo: eliminar solo al docente cuyo nombre es "Carlos" :*/

-- Eliminando registro específico (docente Carlos)
DELETE FROM Docentes WHERE nombre = 'Carlos';

-- Mostrando registros modificados
SELECT * FROM Docentes;

--Elimino los registros especifico(materia lengua)
Delete from Docentes where materia ='Lengua';

-- Mostrando registros modificados
SELECT * FROM Docentes;

/*Vaciar todos los registros con TRUNCATE
Si necesitas vaciar completamente una tabla, utiliza TRUNCATE TABLE.

Características de TRUNCATE:

Elimina todos los registros de la tabla.
No permite condiciones (WHERE).
Es más rápido y eficiente que DELETE.
Reinicia el contador del campo IDENTITY*/

-- Eliminando TODOS los registros con TRUNCATE
TRUNCATE TABLE Docentes;

-- Mostrando registros insertados
SELECT * FROM Docentes;


--Eliminar toda la tabla con DROP
--Si deseas eliminar completamente la estructura de la tabla (datos y esquema), utilizas DROP TABLE:

-- Eliminando completamente la tabla Docentes
DROP TABLE Docentes; /* se nos va para siempre de la base de datos atento con ello jeje*/

/*
Diferencias entre DELETE, TRUNCATE y DROP:

| Característica                   | DELETE                     | TRUNCATE                 | DROP                          |
|----------------------------------|----------------------------|--------------------------|-------------------------------|
| ¿Qué hace?                       | Elimina registros          | Elimina todos los registros| Elimina tabla completa        |
| Permite condiciones (WHERE)?     | ? Sí                      | ? No                     | ? No                         |
| Velocidad                        | Más lento (fila x fila)    | Muy rápido (todo junto)  | Muy rápido                    |
| Espacio Liberado                 | No inmediatamente          | Sí inmediatamente        | Sí inmediatamente             |
| Reinicia campo IDENTITY          | No                         | Sí                       | N/A (elimina estructura)      |
| Posibilidad recuperación fácil   | Sí (con transacciones)     | Difícil                  | Muy difícil (requiere backups)|
*/

/*Ejercicio 2: Índices
Teoría:
Los índices se utilizan para acelerar las búsquedas en una tabla. Existen dos tipos básicos:

Clustered Index: Organiza físicamente los datos de la tabla según la clave de índice (generalmente la clave primaria).
Nonclustered Index: Crea una estructura separada que apunta a los datos de la tabla.

Ejercicio 2: Crear un índice no agrupado en la columna "nombre" de "Escuelas"*/

-- Se crea un índice no agrupado para acelerar las búsquedas por el campo "nombre"
CREATE NONCLUSTERED INDEX idx_nombre_escuelas
ON Escuelas(nombre);

-- Se crea un índice no agrupado para acelerar las búsquedas por el campo "jurisdiccion"
CREATE NONCLUSTERED INDEX idx_jurisdiccion
ON Escuelas(jurisdiccion);
-- se hace una consulta de prueba
select * from Escuelas where jurisdiccion='Salta';

/*Explicación:
Este índice crea una estructura separada que contiene los valores de la columna "nombre" 
y punteros a las filas reales en la tabla. Es útil para búsquedas específicas sin alterar el orden físico de los datos.*/

/* si bien escuelas ya tiene su indice agrupado, considerar que:*/

-- Creación de una tabla de prueba sin clave primaria definida

CREATE TABLE Prueba_Clustered (
    codigo INT,
    descripcion NVARCHAR(100)
);

-- Verificamos 

-- Consulta para listar los índices creados en la tabla "Escuelas"
SELECT name, type_desc
FROM sys.indexes
WHERE object_id = OBJECT_ID('Escuelas');

select * from Escuelas;

-- Activa la medición de estadísticas de E/S y tiempo
SET STATISTICS IO ON;
SET STATISTICS TIME ON;
GO

-- consulta indice no agrupado
SELECT *
FROM Escuelas
WHERE nombre = 'INSTITUTO CULTURAL SAN MARTIN';

SELECT *
FROM Escuelas
WHERE id = 3;  -- Ejemplo: busca la escuela con id = 3

-- desactivar estadisticas SET STATISTICS IO OFF;
SET STATISTICS TIME OFF;
GO

/*
| Característica                   | Índice Agrupado (Clustered)                                                                              | Índice No Agrupado (Nonclustered)                                                                              |
|----------------------------------|----------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------|
| ¿Qué hace?                       | Organiza físicamente los datos de la tabla según la columna definida (usualmente la clave primaria).      | Crea una estructura separada con los valores indexados y punteros a las filas.                                 |
| Cantidad permitida               | Solo puede haber uno por tabla.                                                                           | Se pueden crear múltiples índices en la misma tabla.                                                           |
| Aplicación ideal                 | Excelente para búsquedas por rangos y para ordenar físicamente la tabla.                                  | Ideal para acelerar consultas específicas sobre columnas que no forman parte de la clave primaria.             |
| Uso típico                       | Se asigna normalmente al PRIMARY KEY, definiendo el orden físico de los datos.                             | Se usa en columnas consultadas con frecuencia para mejorar el rendimiento.                                     |
| Convivencia                      | Es único y define el orden físico de la tabla.                                                            | Puede coexistir con otros índices no agrupados sin afectar el orden físico.                                    |
*/



--- INVESTIGAR DE QUE TRATA UNA VISTA!! APLICAR UN EJEMPLO!!!
/*Una vista en SQL es una estructura lógica que actúa como una tabla virtual formada a partir
de una consulta almacenada. No contiene datos propios, sino que muestra información tomada de
una o varias tablas reales cada vez que se consulta. Su principal propósito es simplificar 
el acceso a los datos, ocultar información sensible y presentar solo aquello que un usuario necesita ver
 sin darle acceso directo a las tablas originales. De esta manera, una vista puede funcionar 
 como un filtro de seguridad y una herramienta para mantener consultas más ordenadas, claras y reutilizables.*/

 --creo una viista de la tabla escuela ocultado telefono,asignacion final y cantidad de alumnos
 CREATE VIEW Vista_Escuelas_Publica AS
SELECT nombre, jurisdiccion, sector, ambito
FROM Escuelas;

--muestro la vista creada
SELECT * FROM Vista_Escuelas_Publica;

/*Procedimientos Almacenados (Stored Procedures) / TAREA INVESTIGAR UN SP CON ARGUMENTO
Explicación Teórica:
Un Stored Procedure (SP) con argumento es un procedimiento almacenado en la base de datos que puede recibir
valores desde el exterior para ejecutar una acción específica. Es como una función preprogramada que acepta
uno o más parámetros, permitiendo reutilizar el mismo código para diferentes valores sin tener que escribir
la consulta cada vez. Estos argumentos sirven para filtrar datos, insertar información, modificar registros
o realizar cálculos según lo que el usuario envíe. Gracias a los argumentos, un SP se vuelve flexible,
dinámico y más seguro, ya que evita escribir consultas manuales y reduce el riesgo de errores o inyecciones SQL.




Un procedimiento almacenado (stored procedure) es un conjunto de sentencias SQL que se guardan en la base para que puedan 
ejecutarse cuando queramos con un simple comando.
Muy útiles para automatizar tareas o para centralizar lógica del lado de la base de datos.
CREATE PROCEDURE: crea un procedimiento.
ALTER PROCEDURE: lo modifica.
DROP PROCEDURE: lo elimina*/


-- Creación del procedimiento
CREATE PROCEDURE ListarEscuelasPrivadas
AS
BEGIN
    SELECT * 
    FROM Escuelas
    WHERE Sector = 'Privado';
END;
GO

-- Aquí puedes probarlo
EXEC ListarEscuelasPrivadas;
GO


--  ejemplo similar  de la Creación del procedimiento 
CREATE PROCEDURE ListarEscuelasSalta
AS
BEGIN
    SELECT * 
    FROM Escuelas
    WHERE jurisdiccion = 'Salta';
END;
GO

-- Aquí puedes probarlo
EXEC ListarEscuelasSalta;
GO



-- Y si después quieres eliminarlo:
DROP PROCEDURE ListarEscuelasPrivadas;
GO

/*
+-----------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------+
|                    ASPECTO                          |                                                    FUNCIÓN                                                                                                                                       |                                          PROCEDIMIENTO ALMACENADO                                                                                                 |
+-----------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Devolución de Valores                               |  • Siempre devuelve un valor (escalar o tabla).                                                                                                                                                |  • Puede o no devolver valores.                                                                                                                                  |
|                                                     |  • Ejemplo: int, decimal o "table-valued function".                                                                                                                                           |  • Retorna conjuntos de resultados (SELECT) o valores en parámetros OUTPUT. No es obligatorio devolver algo.                                                    |
+-----------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Uso en Sentencias SQL                               |  • Se puede invocar dentro de SELECT, WHERE, ORDER BY, etc.                                                                                                                                    |  • No se puede llamar directamente desde una sentencia SELECT.                                                                                                  |
|                                                     |  • Ejemplo: SELECT dbo.MiFuncion(Columna) FROM Tabla.                                                                                                                                         |  • Se ejecuta mediante EXEC y no se puede anidar en otras consultas en forma directa.                                                                          |
+-----------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Acciones Permitidas                                 |  • Más restringida: no puede modificar datos (INSERT, UPDATE, DELETE).                                                                                                                         |  • Permite realizar INSERT, UPDATE, DELETE, manejar transacciones, cursores, lógica compleja.                                                                    |
|                                                     |  • Generalmente no permite el uso de transacciones dentro de su código.                                                                                                                        |  • Puede también ejecutar sentencias DDL (dependiendo de los permisos del usuario).                                                                             |
+-----------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Forma de Ejecución                                  |  • Se llama como una función de programación:                                                                                                                                                  |  • Se ejecuta con EXEC o EXECUTE, en un bloque independiente.                                                                                                   |
|                                                     |    SELECT dbo.MiFuncion(Argumento).                                                                                                                                                            |                                                                                                                                                                   |
+-----------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------+
*/
-- Creando la función que devuelve el total de alumnos
-- según la jurisdicción pasada como parámetro
/*
  CREATE FUNCTION:
  - Crea una función llamada 'TotalAlumnosPorJurisdiccion'.
  - Recibe un parámetro @jurisdiccion de tipo NVARCHAR(50).
  - El prefijo '@' en @jurisdiccion indica que se trata de una variable/ parámetro
    de T-SQL (en este caso, el parámetro que recibe la función).
  - Esta función retornará un dato de tipo INT (entero).
*/

CREATE FUNCTION TotalAlumnosPorJurisdiccion(@jurisdiccion NVARCHAR(50))
RETURNS INT
AS
BEGIN
    /*
      DECLARE @total INT:
      - Se declara una variable local llamada @total (de tipo INT) para almacenar
        la suma de los alumnos de las escuelas que coincidan con la jurisdicción
        que se pasa como parámetro a la función.
    */
    DECLARE @total INT;

    /*
      SELECT @total = SUM(cantidad_alumnos) FROM Escuelas WHERE jurisdiccion = @jurisdiccion;
      - Aquí asignamos a la variable @total la suma de la columna 'cantidad_alumnos'
        de todas las filas en la tabla 'Escuelas' cuya jurisdicción sea igual al
        valor recibido en @jurisdiccion.
      - El prefijo '@' en @total y @jurisdiccion indica que son variable Transact-SQL
    */
    SELECT @total = SUM(cantidad_alumnos)
    FROM Escuelas
    WHERE jurisdiccion = @jurisdiccion;

    /*
      RETURN @total:
      - Terminamos la función devolviendo el valor que se haya
        almacenado en la variable local @total.
    */
    RETURN @total;
END;
GO

/*
  SELECT dbo.TotalAlumnosPorJurisdiccion('Buenos Aires') AS AlumnosBuenosAires;
  - Aquí estamos usando la función recién creada para obtener la cantidad total 
    de alumnos en la jurisdicción 'Buenos Aires'.
  - dbo. es el esquema por defecto, pero si nuestro usuario por defecto es dbo, 
    podríamos llamarla simplemente como TotalAlumnosPorJurisdiccion('Buenos Aires').
  - Se muestra el resultado bajo el alias 'AlumnosBuenosAires'.
*/
SELECT dbo.TotalAlumnosPorJurisdiccion('Mendoza') AS AlumnosBuenosAires;
GO

/* Cursores / TAREA A EXPONER EN CLASE 12 (ultima clase) - un ejercicio básico
y otro ejercicio de TRIGGERS 
Teoría:
Los cursores permiten recorrer fila por fila el conjunto de resultados de una consulta. Aunque su uso puede afectar el rendimiento, 
son útiles cuando se necesita procesar individualmente cada registro.