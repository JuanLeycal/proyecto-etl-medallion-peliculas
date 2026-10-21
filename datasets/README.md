# Datasets del proyecto Medallion de películas

## 1. Objetivo

Documentar los archivos fuente utilizados en el proyecto ETL Medallion de películas, su procedencia y su función dentro del procesamiento de datos.

## 2. Fuente de datos

El proyecto utiliza el dataset público **Which Movie Should I Watch Today?**, publicado en Kaggle.

Fuente: https://www.kaggle.com/datasets/hassanelfattmi/which-movie-should-i-watch-today/data

Se seleccionaron tres archivos CSV para construir el proceso de ingesta, transformación y análisis.

## 3. Archivos incluidos

### `Movies.csv`

Contiene información general de las películas.

Principales campos:
- `id`: identificador de la película.
- `title`: título.
- `genres`: géneros asociados.
- `language`: idioma.
- `user_score`: puntuación de usuarios.
- `runtime_hour` y `runtime_min`: duración.
- `release_date`: fecha de estreno.
- `vote_count`: cantidad de votos.

### `FilmDetails.csv`

Contiene información complementaria sobre las películas.

Principales campos:
- `id`: identificador utilizado para relacionar los datos.
- `director`: director.
- `top_billed`: reparto principal.
- `budget_usd`: presupuesto en dólares.
- `revenue_usd`: recaudación en dólares.

### `PosterPath.csv`

Contiene las rutas asociadas a los recursos gráficos de las películas.

Principales campos:
- `id`: identificador de la película.
- `poster_path`: ruta del póster.
- `backdrop_path`: ruta de la imagen de fondo.

## 4. Almacenamiento

Los archivos fuente se encuentran almacenados en Amazon S3, dentro del bucket privado del proyecto:

- Bucket: `proyecto-medallion-ventas-jleyvac-2026`
- Región: `us-east-1`
- Ruta: `s3://proyecto-medallion-ventas-jleyvac-2026/raw/`

Los archivos también se incluyen en esta carpeta del repositorio para facilitar la revisión y reproducibilidad del proyecto, sujeto a las condiciones de redistribución de la fuente original.

## 5. Flu