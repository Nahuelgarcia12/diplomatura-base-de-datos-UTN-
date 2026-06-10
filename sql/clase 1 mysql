/*
--------------------------------------------------------------------------------
    MÓDULO 2 - UNIDAD 1: Repaso Teórico
--------------------------------------------------------------------------------

1. Creación de una base de datos (Schema):
   - Un "schema" es el contenedor de nuestras tablas y otros objetos de la BD.
   - En MySQL, se suele usar CREATE DATABASE para esto. Luego, seleccionamos
     esa base de datos con USE <nombreBD> para trabajar en ella.

2. Creación de tablas:
   - Definimos las columnas y sus tipos de datos.
   - Podemos configurar:
       * PRIMARY KEY (PK): para indicar la clave primaria (columna o columnas 
         que identifican de forma única a cada registro).
       * NOT NULL (NN): no permite valores nulos en esa columna.
       * AUTO_INCREMENT (AI): el valor numérico de la columna se incrementa
         automáticamente en cada inserción. 
       * UNIQUE (UQ): obliga a que los valores de la columna sean únicos.
   
3. Inserción de datos:
   - Usamos el comando INSERT para registrar filas en las tablas.

4. JOIN:
   - Unimos filas de dos (o más) tablas basándonos en columnas comunes.
   - El más común es el “INNER JOIN”, que retorna sólo las coincidencias 
     entre ambas tablas, usando la condición de unión (generalmente una 
     columna clave foránea que hace referencia a la PK de la otra tabla).

5. Creación de índices:
   - Un índice mejora la velocidad de las consultas sobre determinadas 
     columnas (búsquedas, filtros, etc.).
   - Sin embargo, cada índice extra también conlleva trabajo adicional 
     al hacer operaciones de INSERT, UPDATE o DELETE.

6. Procedimientos almacenados (Stored Procedures):
   - Son rutinas guardadas en la BD que encapsulan un bloque de instrucciones SQL.
   - Pueden recibir parámetros de entrada y salida.
   - Ayudan a la reutilización de código y a concentrar la lógica en el servidor.

En este script usaremos todos estos conceptos para reforzar tu práctica.
--------------------------------------------------------------------------------
*/

/*
--------------------------------------------------------------------------------
    1. CREACIÓN DE LA BASE DE DATOS
--------------------------------------------------------------------------------

    MySQL:
        CREATE DATABASE IF NOT EXISTS modulo2unidad1;
        USE modulo2unidad1;

    SQL Server (T-SQL):
        CREATE DATABASE modulo2unidad1;
        GO
        USE modulo2unidad1;
        GO
        
    Notas:
      - En MySQL, generalmente verificamos IF NOT EXISTS para no lanzar error 
        si ya existe la BD. En SQL Server, no es tan común IF NOT EXISTS al crear
        la base de datos, aunque existen métodos para chequearlo manualmente.
      - Para separar lotes (batches) en T-SQL, se usa la palabra clave GO
        (no es parte del lenguaje T-SQL en sí, sino del cliente SQLCMD o SSMS).
*/

CREATE DATABASE IF NOT EXISTS modulo2unidad1;
USE modulo2unidad1;

/*
--------------------------------------------------------------------------------
    2. CREACIÓN DE TABLAS
--------------------------------------------------------------------------------

    MySQL vs. SQL Server:
      - La sintaxis de CREATE TABLE es muy similar. 
      - Ambos motores usan PRIMARY KEY, FOREIGN KEY, etc.
      - Diferencias menores:
          * Los tipos de datos: por ejemplo, en SQL Server existe 
            VARCHAR(n), NVARCHAR(n), INT, etc., pero para enteros 
            es común usar INT, BIGINT, etc. en ambos sistemas.
          * En MySQL, las columnas AUTO_INCREMENT se definen así; 
            en SQL Server, se define con IDENTITY(1,1).

    Ejemplo en SQL Server (equivalente):
      CREATE TABLE cursos (
          idCurso INT IDENTITY(1,1) PRIMARY KEY,
          dsCurso VARCHAR(50) NOT NULL
      );

      CREATE TABLE cursadas (
          idCursada INT IDENTITY(1,1) PRIMARY KEY,
          idCurso INT NOT NULL,
          fechaInicio DATE,
          fechaFin DATE,
          CONSTRAINT fk_curso FOREIGN KEY (idCurso) 
          --Si quieres inscribirte a un curso (cursadas), primero el curso debe existir (cursos).
          -- se utilizan para garantizar la validez y la integridad referencial de los datos dentro de una base de datos
              REFERENCES cursos(idCurso)
      );
*/

CREATE TABLE IF NOT EXISTS cursos (
    idCurso INT AUTO_INCREMENT PRIMARY KEY,
    dsCurso VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS cursadas (
    idCursada INT AUTO_INCREMENT PRIMARY KEY,
    idCurso INT NOT NULL,
    fechaInicio DATE,
    fechaFin DATE,
    CONSTRAINT fk_curso
        FOREIGN KEY (idCurso)
        REFERENCES cursos(idCurso)
);

/*
--------------------------------------------------------------------------------
    3. INSERCIÓN DE DATOS
--------------------------------------------------------------------------------

    La sintaxis INSERT es bastante parecida en ambos motores.

    MySQL:
      INSERT INTO cursos (dsCurso) VALUES ('SQL Básico');

    SQL Server:
      INSERT INTO cursos (dsCurso) VALUES ('SQL Básico');

    No hay gran diferencia, salvo que en T-SQL podríamos usar 
    las sentencias con la palabra clave GO para separar lotes 
    después de varias inserciones.

*/

INSERT INTO cursos (dsCurso) VALUES ('SQL Básico');
INSERT INTO cursos (dsCurso) VALUES ('SQL Avanzado');
INSERT INTO cursos (dsCurso) VALUES ('Programación en Python');
/*INGRESO DE UN CURSO NUEVO*/
INSERT INTO cursos (dsCurso) VALUES ('Programación en java');


INSERT INTO cursadas (idCurso, fechaInicio, fechaFin) VALUES (1, '2025-04-01', '2025-06-01');
INSERT INTO cursadas (idCurso, fechaInicio, fechaFin) VALUES (1, '2025-09-01', '2025-11-01');
INSERT INTO cursadas (idCurso, fechaInicio, fechaFin) VALUES (2, '2025-05-01', '2025-07-01');
INSERT INTO cursadas (idCurso, fechaInicio, fechaFin) VALUES (2, '2025-10-01', '2025-12-01');
INSERT INTO cursadas (idCurso, fechaInicio, fechaFin) VALUES (3, '2025-07-15', '2025-09-15');
/*INGRESO DE UN CURSO NUEVO*/
INSERT INTO cursadas (idCurso, fechaInicio, fechaFin) VALUES (4, '2025-07-15', '2025-09-15');

--------------------------------------------------------------------------------
    4. CONSULTAS DE VERIFICACIÓN
--------------------------------------------------------------------------------

    Verificar el contenido de las tablas:
      - MySQL vs. SQL Server: 
         SELECT * FROM <tabla> 
      - Igual en ambos.

*/

SELECT * FROM cursos;
SELECT * FROM cursadas;

/*
--------------------------------------------------------------------------------
    5. USO DE JOIN
--------------------------------------------------------------------------------

    - Tanto en MySQL como en SQL Server la sintaxis de JOIN es esencialmente 
      la misma (INNER JOIN, LEFT JOIN, RIGHT JOIN, etc.).
    - La diferencia es que en SQL Server se acostumbra a usar el esquema (schema) 
      dbo por defecto, por ejemplo: SELECT * FROM dbo.cursos. 
      En MySQL, por defecto todo va en el "schema" que es la base de datos actual.
      
INNER JOIN devuelve únicamente las filas que tienen coincidencia

LEFT JOIN devuelve todas las filas de la tabla izquierda,
aunque no exista una coincidencia en la tabla derecha.
Cuando no hay relación, los campos de la tabla derecha
se muestran con valores NULL.

RIGHT JOIN devuelve todas las filas de la tabla derecha,
aunque no exista una coincidencia en la tabla izquierda.
 Cuando no hay relación, los campos de la tabla izquierda
 se muestran con valores NULL

*/

SELECT c.idCurso, c.dsCurso, cu.idCursada, cu.fechaInicio, cu.fechaFin
FROM cursos c
INNER JOIN cursadas cu ON c.idCurso = cu.idCurso;

SELECT c.dsCurso, COUNT(*) AS cantidad_cursadas
FROM cursos c
INNER JOIN cursadas cu ON c.idCurso = cu.idCurso
GROUP BY c.dsCurso;

/*muestra cuando inicio la ultimna cursada de cada curso*/
SELECT 
    c.idCurso,
    c.dsCurso,
    MAX(cu.fechaInicio) AS ultimaCursada
FROM cursos c
LEFT JOIN cursadas cu 
    ON c.idCurso = cu.idCurso
GROUP BY c.idCurso, c.dsCurso;


/*
--------------------------------------------------------------------------------
    6. CREACIÓN DE UN ÍNDICE / TAREA!!!
--------------------------------------------------------------------------------

    - La sintaxis de CREATE INDEX es muy similar.
    - En MySQL: CREATE INDEX idx_name ON tabla(columna);
    - En SQL Server: CREATE INDEX idx_name ON schema.tabla(columna);

    - También en SQL Server es posible usar la palabra clave CLUSTERED o 
      NONCLUSTERED (no disponible en MySQL de la misma manera).
      
      En MySQL , el índice clustered es la PRIMARY KEY,
      mientras que los demás índices (INDEX, UNIQUE) son no clustered

*/

/*
+---------------------------+-------------------------------+----------------------------------------------+
| Característica            | MySQL (InnoDB)                | SQL Server                                   |
+---------------------------+-------------------------------+----------------------------------------------+
| Índice Clustered          | Solo en PRIMARY KEY           | Se puede definir manualmente con CLUSTERED   |
| Índice Non-clustered      | INDEX, UNIQUE                 | Se define con NONCLUSTERED                   |
| Cantidad por tabla        | 1 solo clustered              | 1 clustered, varios non-clustered            |
+---------------------------+-------------------------------+----------------------------------------------+
*/


CREATE INDEX idx_cursadas_fechaInicio 
ON cursadas(fechaInicio);


/* creacion de un indice nuevo*/
CREATE  INDEX IX_cursadas_idCurso
ON cursadas (idCurso);

/*
--------------------------------------------------------------------------------
    7. CREACIÓN DE PROCEDIMIENTO ALMACENADO
--------------------------------------------------------------------------------

    Aquí es donde vemos más diferencia:
      - En MySQL usamos DELIMITER para cambiar el delimitador de sentencias, 
        de modo que el bloque del procedimiento quede agrupado.
      - En SQL Server se usa "CREATE PROCEDURE" con la sintaxis 
        CREATE PROCEDURE nombre
        (
            @param1 tipo,
            @param2 tipo OUTPUT
        )
        AS
        BEGIN
            -- cuerpo
        END
        GO

    - Ejemplo en SQL Server:
        CREATE PROCEDURE sp_cursadasPorCurso
            @p_idCurso INT
        AS
        BEGIN
            SELECT c.dsCurso, cu.idCursada, cu.fechaInicio, cu.fechaFin
            FROM cursos c
            INNER JOIN cursadas cu ON c.idCurso = cu.idCurso
            WHERE c.idCurso = @p_idCurso;
        END;
        GO
    
    - Fíjate que:
       1) No se necesita DELIMITER.
       2) Los parámetros se definen con @.
       3) Se cierra con END y luego GO (para finalizar el lote).

*/

DELIMITER $$
CREATE PROCEDURE sp_cursadasPorCurso(
    IN p_idCurso INT
)
BEGIN
    SELECT c.dsCurso, cu.idCursada, cu.fechaInicio, cu.fechaFin
    FROM cursos c
    INNER JOIN cursadas cu ON c.idCurso = cu.idCurso
    WHERE c.idCurso = p_idCurso;
END $$
DELIMITER ;
/*ejemplo similar*/
DELIMITER $$
CREATE PROCEDURE sp_cursadasPorFecha(
    IN p_fechaInicio DATE,
    IN p_fechaFin DATE
)
BEGIN
    SELECT 
        c.dsCurso,
        cu.idCursada,
        cu.fechaInicio,
        cu.fechaFin
    FROM cursos c
    INNER JOIN cursadas cu 
        ON c.idCurso = cu.idCurso
    WHERE cu.fechaInicio BETWEEN p_fechaInicio AND p_fechaFin;
END $$
DELIMITER ;
/*llama al procedimiento*/
CALL sp_cursadasPorCurso(3);
CALL sp_cursadasPorFecha('2025-01-01', '2025-6-30');


/*  Su función es recibir el identificador del curso que se desea consultar. Dentro 
del procedimiento, este valor se utiliza en la cláusula WHERE para filtrar las filas correspondientes en la consulta*/
-- Llamada (en MySQL)
CALL sp_cursadasPorCurso(2); -- aca solicito el id que me interesa

-- En SQL Server sería:
-- EXEC sp_cursadasPorCurso 1;


-- DER

-- 1. Creación de la base de datos (schema) "incame"
CREATE DATABASE IF NOT EXISTS incame;
USE incame;

-- 2. Creación de la tabla principal: "cursos"
CREATE TABLE IF NOT EXISTS cursos (
    idCurso INT AUTO_INCREMENT PRIMARY KEY,
    dsCurso VARCHAR(50) NOT NULL
);

-- 3. Creación de la tabla dependiente: "cursadas"
CREATE TABLE IF NOT EXISTS cursadas (
    idCursada INT AUTO_INCREMENT PRIMARY KEY,
    idCurso INT NOT NULL,
    fechaInicio DATE,
    fechaFin DATE,
    CONSTRAINT fk_curso
        FOREIGN KEY (idCurso)
        REFERENCES cursos(idCurso)
);


-- REVISAR DE MANERA COMPLEMENTARIA EL ASISTENTE DE MYSQL
/* creacion de tabla con asistente
1)Abrir MySQL 
2)Conectarse al servidor MySQL
3)Seleccionar el schema (doble clic para activarlo)
4)Click derecho sobre Tables
5)Elegir Create Table…
6)En la pestaña Columns, agregar las columnas (nombre y tipo)
7)Marcar PK, NN, AI según corresponda
8)Presionar Apply
9)Revisar el SQL generado automáticamente
10)Presionar Apply nuevamente para confirmar
11)Cerrar el editor de la tabla */
