
# Reversión del ETL Medallion

## 1. Objetivo

Documentar los procedimientos de reversión de las tablas lógicas y la identificación de los recursos físicos utilizados por el ETL Medallion de películas.

## 2. Archivos incluidos

### `01_eliminar_tablas.sql`

Elimina las tablas Delta creadas por el proyecto en el catálogo `workspace` y el esquema `retail_analytics`.

Las tablas eliminadas son:

**Gold**
- `gold_movies`
- `gold_genres`

**Silver**
- `silver_movies`
- `silver_posters`

**Bronze**
- `bronze_movies`
- `bronze_film_details`
- `bronze_poster_paths`

Este script es destructivo y solo debe ejecutarse cuando se desee eliminar las tablas del proyecto.

### `02_reversion_aws.py`

Identifica el bucket S3 y los archivos CSV de origen utilizados por el ETL.

El script no elimina archivos ni recursos físicos. La eliminación de datos en S3 debe realizarse de forma manual y controlada.

## 3. Procedimiento de reversión

1. Detener cualquier ejecución activa del ETL.
2. Confirmar que las tablas pertenecen exclusivamente a este proyecto.
3. Respaldar los datos si fuera necesario.
4. Ejecutar `01_eliminar_tablas.sql` desde un notebook SQL de Databricks únicamente si se requiere eliminar las tablas.
5. Ejecutar `02_reversion_aws.py` para identificar los recursos físicos de origen.
6. Verificar el estado final del catálogo y del almacenamiento.

## 4. Consideraciones

- No ejecutar la reversión como parte de una ejecución normal del ETL.
- No eliminar el esquema completo, ya que puede contener tablas de otros proyectos.
- Los archivos originales de S3 se conservan para permitir nuevas ejecuciones.
- La eliminación física de archivos requiere una decisión explícita y una verificación adicional.

## 5. Resultado esperado

Disponer de un procedimiento documentado para retirar las tablas del ETL sin afectar los datos de origen ni otros proyectos del entorno.
