-----------------------------------------------------------------------------------------
-- 1) EXPLICACIÓN TEÓRICA DE LA UNIDAD 4
--
-- En esta unidad se abordan varios aspectos fundamentales de la estructura interna de 
-- las bases de datos, centrándonos en:
--   • Log de transacciones: 
--       Archivo donde se registran todas las operaciones que se ejecutan (INSERT, UPDATE, 
--       DELETE, etc.). Permite recuperar la base a un estado consistente en caso de fallos y 
--       también revertir (ROLLBACK) o confirmar (COMMIT) cambios dentro de transacciones.
--
--   • Dispositivos:
--       Se refiere principalmente a los archivos físicos donde se almacena la base de datos:
--         - Archivos de datos (extensión .mdf y .ndf), divididos en archivos primarios (PRIMARY) 
--           y secundarios (SECONDARY).
--         - Archivos de log (extensión .ldf), que guardan las transacciones para recuperación.
--
--   • Problemas de crecimiento:
--       Ocurren cuando la base de datos excede el espacio asignado o crece sin control, 
--       causando errores o bajo rendimiento. Se pueden configurar límites y FILEGROWTH 
--       (crecimiento automático) en MB o porcentajes. Una mala configuración de crecimiento 
--       puede provocar fragmentaciones o pausas largas.
--
--   • Páginas: 
--       Unidad mínima de almacenamiento en SQL Server (8 KB cada una). Los registros residen 
--       físicamente en estas páginas. Si muchos usuarios actualizan la misma página (hotspot), 
--       se generan bloqueos (locks) y potenciales problemas de rendimiento.
--
--   • Mantenimiento de las bases de datos:
--       Conjunto de tareas periódicas, como backups (para recuperar datos en caso de fallos), 
--       shrink (para liberar espacio sobrante, aunque no siempre es recomendado en producción) 
--       y regeneración/reorganización de índices (para mejorar tiempos de consulta).
--
-- A continuación, se presentan ejemplos de todos estos conceptos en una base de datos sencilla:
-----------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------
-- EJERCICIO: Creación de la base "Biblioteca" y demostración de:
--   1) Log de transacciones (2 ejemplos)
--   2) Dispositivos (2 ejemplos)
--   3) Problemas de crecimiento (2 ejemplos)
--   4) Páginas (se comentará su impacto en 2 ejemplos)
--   5) Mantenimiento de la base (2 ejemplos)
-----------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------
-- LIMPIEZA INICIAL (por si ya existe una base llamada Biblioteca)
-----------------------------------------------------------------------------------------
IF DB_ID('Biblioteca') IS NOT NULL
BEGIN
    DROP DATABASE Biblioteca;
END;
GO

-----------------------------------------------------------------------------------------
-- 2) DISPOSITIVOS (EJEMPLO 1): Creación de una BD especificando archivo primario y log
-----------------------------------------------------------------------------------------
-- Nota: Ajusta la ruta de 'FILENAME' a una carpeta donde tengas permisos de lectura/escritura
--       o, si prefieres, crea la base sin especificar rutas (Ejemplo 2 más adelante).

CREATE DATABASE Biblioteca
ON PRIMARY
(
    NAME = N'Biblioteca_Datos',
    FILENAME = N'D:\diplomatura base de datos\Biblioteca_Datos.mdf',
    SIZE = 5MB,
    MAXSIZE = 100MB,
    FILEGROWTH = 5MB
)
LOG ON 
(
    NAME = N'Biblioteca_Log',
    FILENAME = N'D:\diplomatura base de datos\Biblioteca_Log.idf',
    SIZE = 2MB,
    MAXSIZE = 50MB,
    FILEGROWTH = 2MB
);
GO


USE Biblioteca;
GO

-----------------------------------------------------------------------------------------
-- 2) DISPOSITIVOS (EJEMPLO 2): Alterar la base para agregar un archivo de datos secundario
-----------------------------------------------------------------------------------------
-- Si deseamos agregar más dispositivos (archivos secundarios), podemos usar ALTER DATABASE.
-- Esto ayuda a distribuir los datos en distintos discos o aumentar espacio.

ALTER DATABASE Biblioteca
ADD FILE
(
    NAME = N'Biblioteca_Datos2',
    FILENAME = N'D:\diplomatura base de datos\Biblioteca_Datos2.ndf',
    SIZE = 5MB,
    MAXSIZE = 50MB,
    FILEGROWTH = 5MB
);
GO

-----------------------------------------------------------------------------------------
-- CREACIÓN DE UNA TABLA SENCILLA: "Libros"
-----------------------------------------------------------------------------------------
CREATE TABLE Libros (
    LibroID INT IDENTITY(1,1) PRIMARY KEY,-- valor autoincremental (1,1)
    Titulo VARCHAR(100) NOT NULL,
    Autor VARCHAR(50) NOT NULL
);
GO

-----------------------------------------------------------------------------------------
-- 1) LOG DE TRANSACCIONES (EJEMPLO 1): Insert y ROLLBACK
-----------------------------------------------------------------------------------------
-- Mostramos cómo usar BEGIN TRAN, ROLLBACK para deshacer cambios.

BEGIN TRAN InsercionConRollback;
    INSERT INTO Libros (Titulo, Autor) VALUES ('1984', 'George Orwell');
    INSERT INTO Libros (Titulo, Autor) VALUES ('El Quijote', 'Miguel de Cervantes');

    -- Verificamos los registros en la tabla
    SELECT 'Antes de ROLLBACK' AS Etapa, * FROM Libros;
    
    -- Usamos ROLLBACK, así los cambios se deshacen
ROLLBACK TRAN InsercionConRollback;

-- Verificamos que, efectivamente, no hay registros permanentes
SELECT 'Después de ROLLBACK' AS Etapa, * FROM Libros;

-----------------------------------------------------------------------------------------
-- 1) LOG DE TRANSACCIONES (EJEMPLO 2): Insert y COMMIT
-----------------------------------------------------------------------------------------
-- Ahora confirmamos los cambios con COMMIT.

BEGIN TRAN InsercionConCommit;
    INSERT INTO Libros (Titulo, Autor) VALUES ('Cien Años de Soledad', 'Gabriel García Márquez');
    INSERT INTO Libros (Titulo, Autor) VALUES ('La Metamorfosis', 'Franz Kafka');

    SELECT 'Antes de COMMIT' AS Etapa, * FROM Libros;
COMMIT TRAN InsercionConCommit;

-- Los datos ahora sí quedan guardados de forma permanente
SELECT 'Después de COMMIT' AS Etapa, * FROM Libros;
--ejemplo similar
BEGIN TRAN insercionconcommit2;
INSERT INTO Libros (Titulo,Autor) values ('El Principito', 'Antoine de Saint-Exupéry');

SELECT 'antes de COMMIT' AS Etapa, * FROM Libros;
COMMIT TRAN insercionconcommit2;
SELECT 'Después de COMMIT' AS Etapa, * FROM Libros;

-----------------------------------------------------------------------------------------
-- 3) PROBLEMAS DE CRECIMIENTO (EJEMPLO 1): Inserción masiva simulando llenado de la base
-----------------------------------------------------------------------------------------
-- Un loop que inserta muchos registros y puede disparar crecimiento del archivo.

BEGIN TRAN Masiva;
    DECLARE @i INT = 1;
    WHILE (@i <= 1000)
    BEGIN
        INSERT INTO Libros (Titulo, Autor)
        VALUES 
        (
            'Libro ' + CAST(@i AS VARCHAR(10)), -- combina y convierte caracteres y números 
            'Autor ' + CAST(@i AS VARCHAR(10))
        );
        SET @i = @i + 1;
    END;
COMMIT TRAN Masiva;

-- Verificamos cantidad de registros en la tabla:
SELECT COUNT(*) AS CantidadLibros FROM Libros;

select * from libros

-----------------------------------------------------------------------------------------
-- 3) PROBLEMAS DE CRECIMIENTO (EJEMPLO 2): Configurar y mostrar propiedades de crecimiento
-----------------------------------------------------------------------------------------
-- Podemos usar sys.database_files para ver cómo están configurados los archivos (size, maxsize, growth).
-- Con esto comprendemos mejor dónde podrían ocurrir problemas de espacio si no se configura bien.

SELECT 
    name AS NombreArchivo,
    physical_name AS RutaFisica,
    size AS PaginasAsignadas,
    max_size AS PaginasMax,
    growth AS Crecimiento,
    FILE_ID 
FROM sys.database_files;

-- Nota: size, max_size, growth se miden en páginas de 8KB. 
--       Por ejemplo, size=640 equivale a 640*8KB = 5120KB (5MB aprox).

-----------------------------------------------------------------------------------------
-- 4) PÁGINAS (EJEMPLO 1): Comentario sobre bloqueos (hotspot) si muchos INSERT apuntan a la misma página (INVESTGAR Y POTENCIAR ESTE PUNTO)
-----------------------------------------------------------------------------------------
-- Realmente ver las páginas requiere comandos avanzados (DBCC PAGE), pero aquí ejemplificamos 
-- cómo múltiples INSERT secuenciales podrían concentrarse en páginas contiguas, causando bloqueos.
-- Se logra a través de un INSERT en serie (similar al loop previo). Mencionamos este ejemplo 
-- como parte de la teoría. /TAREA/

/*Cuando muchas conexiones insertan datos al mismo tiempo, todas intentan escribir en la misma parte final
de la tabla. Esto genera un “hotspot”, porque varias sesiones compiten por usar las mismas páginas. 
Como resultado, SQL Server hace que unas conexiones esperen a otras, produciendo demoras y bloqueos.
Este ejemplo muestra cómo muchos INSERT pueden concentrarse en las mismas páginas aunque no las veamos directamente.*/

-- EJEMPLO: Insertar un lote más grande.
BEGIN TRAN HotspotExample;
    DECLARE @j INT = 1;
    WHILE (@j <= 500)
    BEGIN
        INSERT INTO Libros (Titulo, Autor)
        VALUES ('Hotspot ' + CAST(@j AS VARCHAR(10)), 'Autor Hotspot');
        SET @j = @j + 1;
    END;
COMMIT TRAN HotspotExample;

--codigo potenciado:
BEGIN TRAN HotspotExample;
    DECLARE @j INT = 1;
    WHILE (@j <= 500)
    BEGIN
        INSERT INTO Libros (Titulo, Autor)
        VALUES ('Hotspot ' + CAST(@j AS VARCHAR(10)), 'Autor Hotspot');

        WAITFOR DELAY '00:00:00.050'; -- Hace más visible la contención
        SET @j = @j + 1;
    END;
COMMIT TRAN HotspotExample;
--Esto muestra páginas bloqueada
SELECT * 
FROM sys.dm_tran_locks
WHERE resource_type = 'PAGE';


-- Comentario: Si 100 conexiones hicieran esto simultáneamente, se producirían contenciones 
-- en las mismas páginas. Así se ejemplifica la problemática de “páginas”.
-----------------------------------------------------------------------------------------
-- 4) PÁGINAS (EJEMPLO 2): Fill Factor e índices
-----------------------------------------------------------------------------------------
-- Fill Factor define cuánto espacio libre dejar en cada página para futuras inserciones, 
-- reduciendo hotspots. Un índice con fill factor 80% deja un 20% de espacio libre por página.

CREATE INDEX IX_Libros_Titulo
ON Libros (Titulo)
WITH (FILLFACTOR = 80);
--ejemplos similar
CREATE INDEX IX_Libros_autor
ON Libros (autor)
WITH (FILLFACTOR = 90);

-- Verificamos que se creó el índice (no mostrará fill factor fácilmente, pero ya se aplicó).
EXEC sp_helpindex 'Libros';


-- Este fill factor previene, en parte, la fragmentación rápida si hay muchas inserciones.

-----------------------------------------------------------------------------------------
-- 5) MANTENIMIENTO DE LAS BASES (EJEMPLO 1): Backup completo
-----------------------------------------------------------------------------------------
-- Realizamos un backup de la base de datos en una ruta local. 
-- Ajusta la ruta donde tengas permisos. 
-- WITH INIT para sobrescribir si existía un archivo previo.
IF @@TRANCOUNT > 0
    ROLLBACK;
BACKUP DATABASE Biblioteca
TO DISK = 'D:\diplomatura base de datos\Biblioteca_Full.bak'
WITH INIT;
GO


-----------------------------------------------------------------------------------------
-- 5) MANTENIMIENTO DE LAS BASES (EJEMPLO 2): Shrink y reorganización de índices
-----------------------------------------------------------------------------------------
--  A veces, tras un borrado masivo, la base queda con espacio libre. "Shrink" puede recuperar 
--  espacio, aunque puede fragmentar índices. Después, reorganizamos índices.

DBCC SHRINKDATABASE (Biblioteca);
GO
-- El mensaje indica que SQL Server no encontró espacio libre para reducir.
/*NO es recomendable hacerlo frecuentemente, porque puede fragmentar los datos y afectar el rendimiento.
Solo úsalo si has eliminado muchos datos y necesitas recuperar espacio en disco.*/

ALTER INDEX ALL ON Libros
REORGANIZE;
GO

-- También podemos actualizar estadísticas para mejorar planes de ejecución
UPDATE STATISTICS Libros;
GO

-----------------------------------------------------------------------------------------
-- VERIFICAMOS EL ESTADO FINAL
-----------------------------------------------------------------------------------------
SELECT TOP 20 * 
FROM Libros
ORDER BY LibroID DESC;
GO

-----------------------------------------------------------------------------------------
-- RESUMEN:
-- - Se demostró la creación de la BD especificando dispositivos (archivos),
-- - Se probaron transacciones (COMMIT y ROLLBACK),
-- - Se ilustraron problemas de crecimiento con inserciones masivas,
-- - Se explicó el rol de las páginas (hotspots y fill factor),
-- - Se realizaron tareas de mantenimiento (backup, shrink, reorganizar índices).
-----------------------------------------------------------------------------------------
