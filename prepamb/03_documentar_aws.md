
# Preparación del ambiente AWS y Databricks

## 1. Objetivo

Documentar los recursos de AWS y Databricks utilizados por el proyecto ETL Medallion de películas.

## 2. Almacenamiento de datos

Los archivos de origen se almacenan en un bucket privado de Amazon S3.

- **Bucket:** `proyecto-medallion-ventas-jleyvac-2026`
- **Región AWS:** `us-east-1`
- **Ruta de datos de origen:** `s3://proyecto-medallion-ventas-jleyvac-2026/raw/`
- **Archivos:** `Movies.csv`, `FilmDetails.csv` y `PosterPath.csv`
- **Acceso público:** bloqueado
- **Cifrado:** SSE-S3

Los archivos CSV se utilizan como fuente para la ingesta de la capa Bronze.

## 3. Acceso desde Databricks

Databricks accede al almacenamiento mediante un rol de AWS IAM asociado a una credencial de Unity Catalog.

La External Location configurada en Unity Catalog es:

- **Nombre:** `loc_medallion_ventas`
- **Ruta:** `s3://proyecto-medallion-ventas-jleyvac-2026/`
- **Credencial:** rol IAM configurado en Databricks.

Este mecanismo permite administrar el acceso al almacenamiento sin incluir claves de AWS directamente en los notebooks.

## 4. Catálogo y esquema de datos

Las tablas Delta del proyecto se almacenan en:

- **Catálogo:** `workspace`
- **Esquema:** `retail_analytics`

### Tablas Bronze

- `bronze_movies`
- `bronze_film_details`
- `bronze_poster_paths`

### Tablas Silver

- `silver_movies`
- `silver_posters`

### Tablas Gold

- `gold_movies`
- `gold_genres`

## 5. Flujo de datos

1. Los archivos CSV se leen desde Amazon S3.
2. Bronze conserva los datos ingeridos en tablas Delta.
3. Silver limpia y transforma los datos y combina la información de películas.
4. Gold genera tablas analíticas para películas y géneros.
5. Las tablas Gold quedan disponibles para su consumo desde herramientas de visualización.

## 6. Despliegue y ejecución

El proyecto utiliza GitHub Actions y Databricks Asset Bundles para validar, desplegar y ejecutar los notebooks.

El workflow de producción se denomina `Deploy and Run Production` y permite iniciar manualmente la ejecución del ETL.

## 7. Seguridad

- El bucket S3 mantiene bloqueado el acceso público.
- El acceso desde Databricks se gestiona mediante IAM y Unity Catalog.
- No se almacenan tokens, claves secretas ni credenciales en este documento.
- Los permisos deben concederse siguiendo el principio de mínimo privilegio.

## 8. Consideraciones

La preparación del ambiente requiere que el bucket, los archivos, el rol IAM, la credencial de Unity Catalog y la External Location estén configurados antes de ejecutar la ingesta.
