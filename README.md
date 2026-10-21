# Proyecto ETL Medallion de Películas

## 1. Descripción del proyecto

Este proyecto implementa un proceso ETL utilizando la arquitectura Medallion en Databricks, con Amazon S3 como almacenamiento de los archivos fuente y GitHub Actions para el despliegue y la ejecución del pipeline.

El objetivo es transformar datos de películas en tablas analíticas que permitan explorar géneros cinematográficos, puntuaciones, votos, presupuestos y recaudación.

## 2. Arquitectura

El flujo general del proyecto es:

```text
Dataset de películas (CSV)
          |
          v
      Amazon S3
          |
          v
   Databricks / PySpark
          |
          v
        BRONZE
  Ingesta de datos fuente
          |
          v
         SILVER
 Limpieza y transformación
          |
          v
          GOLD
  Tablas analíticas finales
          |
          v
 Notebook de visualización
          |
          v
     Gráficos PNG
```

El acceso desde Databricks a Amazon S3 se configura mediante AWS IAM y Unity Catalog External Locations.

## 3. Tecnologías utilizadas

- **Amazon S3:** almacenamiento de los CSV de origen.
- **AWS IAM:** gestión de identidad y acceso al almacenamiento.
- **Databricks:** ejecución de notebooks y administración de datos.
- **PySpark:** ingesta y transformación de datos.
- **Delta Lake:** almacenamiento de las tablas procesadas.
- **Unity Catalog:** administración del catálogo, esquema y acceso a los datos.
- **GitHub:** control de versiones y repositorio del proyecto.
- **GitHub Actions:** automatización del despliegue y la ejecución.
- **Matplotlib y Pandas:** generación de visualizaciones analíticas.

## 4. Fuente de datos

Se utiliza el dataset público [Which Movie Should I Watch Today?](https://www.kaggle.com/datasets/hassanelfattmi/which-movie-should-i-watch-today/data), publicado en Kaggle.

Los tres archivos seleccionados son:

- `Movies.csv`: información general, géneros, puntuaciones y fechas de estreno.
- `FilmDetails.csv`: director, reparto, presupuesto y recaudación.
- `PosterPath.csv`: rutas de pósteres y fondos de películas.

Los archivos se almacenan en el bucket privado de Amazon S3 y también se documentan en la carpeta `datasets/`.

## 5. Arquitectura Medallion

Las tablas se almacenan en el catálogo `workspace` y esquema `retail_analytics`.

### Bronze

Ingesta de los tres archivos CSV en tablas Delta:

- `bronze_movies`
- `bronze_film_details`
- `bronze_poster_paths`

### Silver

Limpieza, estandarización de campos, tratamiento de valores faltantes e integración de información:

- `silver_movies`
- `silver_posters`

### Gold

Generación de tablas finales para análisis:

- `gold_movies`: información integrada de películas, puntuaciones y métricas financieras.
- `gold_genres`: métricas agregadas por género cinematográfico.

## 6. Resultados de validación

En una ejecución validada del proyecto se obtuvieron los siguientes resultados:

| Indicador | Resultado |
|---|---:|
| Registros de `gold_movies` | 9,718 |
| IDs distintos en `gold_movies` | 9,718 |
| Títulos nulos | 0 |
| Puntuaciones nulas | 0 |
| Registros de `gold_genres` | 19 |

Algunos presupuestos y valores de recaudación no están disponibles en el dataset original. Estos valores se conservan como nulos cuando no es posible determinar su valor.

## 7. Despliegue y CI/CD

El proyecto utiliza GitHub Actions y Databricks Asset Bundles para validar y desplegar los notebooks y ejecutar el ETL.

El repositorio contiene el workflow de despliegue y un workflow manual de producción denominado `Deploy and Run Production`.

El pipeline ejecuta las tareas en orden:

1. `bronze_ingesta`
2. `silver_transformacion`
3. `gold_analitica`

La ejecución exitosa del workflow se documenta en la carpeta `evidencias/`.

## 8. Dashboard analítico

La carpeta `dashboard/` contiene el notebook `04_dashboard_analitica.ipynb` y las visualizaciones exportadas a PNG.

Los gráficos permiten analizar:

- Cantidad de películas por género.
- Puntuación promedio por género.
- Relación entre presupuesto y recaudación.

Las visualizaciones se generan a partir de las tablas Gold en Databricks.

## 9. Estructura del repositorio

```text
proyecto-medallion-ventas/
├── .github/
│   └── workflows/
├── datasets/
├── dashboard/
├── proceso/
├── PrepAmb/
├── seguridad/
├── reversion/
├── certificaciones/
├── evidencias/
└── README.md
```

### Descripción de carpetas

| Carpeta | Propósito |
|---|---|
| `datasets/` | Archivos fuente y documentación de los datos. |
| `dashboard/` | Notebook de visualización, gráficos y documentación. |
| `proceso/` | Notebooks de ingesta, transformación y análisis. |
| `PrepAmb/` | Scripts y documentación para preparar el ambiente. |
| `seguridad/` | Consultas de privilegios y scripts de permisos. |
| `reversion/` | Scripts para eliminar las tablas del proyecto y documentar recursos físicos. |
| `certificaciones/` | Índice de evidencias de componentes y enlaces relevantes. |
| `evidencias/` | Capturas de configuración y ejecución del proyecto. |
| `.github/workflows/` | Workflows de GitHub Actions. |

## 10. Ejecución del proyecto

Para reproducir el proceso:

1. Configurar los recursos de AWS y el acceso desde Databricks mediante Unity Catalog.
2. Verificar la disponibilidad de los CSV en la ruta de origen de Amazon S3.
3. Preparar el catálogo y esquema necesarios.
4. Desplegar el bundle de Databricks mediante GitHub Actions.
5. Ejecutar el workflow de producción.
6. Comprobar las tablas Gold.
7. Ejecutar el notebook de visualización y exportar los gráficos.

La ejecución requiere permisos adecuados en AWS, Unity Catalog y Databricks.

## 11. Seguridad

- El bucket S3 se configura como privado y con acceso público bloqueado.
- El acceso a S3 se gestiona mediante IAM y Unity Catalog.
- No se deben almacenar tokens, contraseñas ni claves secretas en el repositorio.
- Los permisos sobre las tablas deben seguir el principio de mínimo privilegio.
- Los scripts de reversión no deben ejecutarse durante una ejecución normal del ETL.

## 12. Evidencias

La carpeta `evidencias/` contiene las capturas utilizadas para demostrar la configuración de los recursos, las ejecuciones del pipeline, la validación de resultados y las visualizaciones.

La carpeta `certificaciones/` contiene un índice de los componentes implementados y sus evidencias.

## 13. Autoría y repositorio

Repositorio: [proyecto-medallion-ventas](https://github.com/JuanLeycal/proyecto-medallion-ventas)

Dataset de origen: [Which Movie Should I Watch Today?](https://www.kaggle.com/datasets/hassanelfattmi/which-movie-should-i-watch-today/data)
