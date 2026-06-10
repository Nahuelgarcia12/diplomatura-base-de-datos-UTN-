
# 📚 Diplomatura Base de Datos - UTN

Repositorio personal con ejercicios, prácticas y desafíos desarrollados durante la Diplomatura de Base de Datos de la UTN.

## 👨‍💻 Autor

**Nahuel García**

Estudiante de Ingeniería en Informática.

## 🛠 Tecnologías

- SQL
- MySQL
- SQL Server
- MySQL Workbench

## 📂 Contenido

### 📖 Clase 1 - Fundamentos SQL

- Creación de bases de datos
- Creación de tablas
- Restricciones
- Índices
- Procedimientos almacenados
- Consultas JOIN

### 📖 Clase 2 - Manipulación de Datos

- CRUD
- Integridad referencial
- Relaciones entre tablas
- Carga de datos

### 📖 Clase 3 - Objetos de Base de Datos

- Diseño de estructuras complejas
- Consultas sobre conjuntos de datos
- Administración de información

### 📖 Clase 4 - Administración de Bases de Datos

- Logs de transacciones
- Backups
- Recuperación
- Crecimiento de archivos
- Mantenimiento

### 🗺️ Modelado

Modelo Entidad-Relación desarrollado con MySQL Workbench.

Archivo:

`DER_icame.mwb`

---

# 🚀 Desafío Integrador: BaseAstronomia

Proyecto desarrollado utilizando SQL Server aplicando conceptos de modelado dimensional.

## Objetivo

Diseñar una base de datos para registrar observaciones astronómicas realizadas por distintos observatorios sobre diversos cuerpos celestes.

## Estructura

### Tabla de Dimensión: CuerposCelestes

Almacena:

- Nombre
- Tipo
- Distancia en años luz

### Tabla de Dimensión: Observatorios

Almacena:

- Nombre del observatorio
- Ubicación
- País

### Tabla de Hechos: Observaciones

Registra:

- Cuerpo observado
- Observatorio
- Fecha de observación
- Brillo registrado

## Funcionalidades implementadas

✅ Creación de base de datos

✅ Creación de tablas relacionales

✅ Carga de datos de ejemplo

✅ Consultas con INNER JOIN

✅ Medidas calculadas mediante AVG()

✅ Procedimientos almacenados

### Procedimientos almacenados

#### sp_ObservacionesPorCuerpo

Permite consultar todas las observaciones asociadas a un cuerpo celeste específico.

#### sp_InsertarObservación

Permite registrar nuevas observaciones mediante parámetros.

## Conceptos aplicados

- Modelado relacional
- Modelo estrella (Star Schema)
- Integridad referencial
- Consultas analíticas
- Procedimientos almacenados
- SQL Server
