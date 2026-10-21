# Dashboard analítico de películas

## 1. Objetivo

Presentar visualmente los resultados del ETL Medallion de películas mediante gráficos generados en un notebook de Databricks a partir de las tablas finales de la capa Gold.

## 2. Herramientas utilizadas

- **Databricks:** ejecución del notebook y acceso a las tablas Delta.
- **PySpark:** consulta y preparación de los datos.
- **Pandas:** conversión de los resultados agregados para su visualización.
- **Matplotlib:** generación de gráficos.
- **GitHub:** almacenamiento del notebook y las imágenes generadas.

## 3. Fuente de datos

Las visualizaciones utilizan las siguientes tablas del catálogo `workspace` y esquema `retail_analytics`:

- `gold_movies`: información de películas, puntuaciones, años de estreno, presupuesto y recaudación.
- `gold_genres`: información agregada por género cinematográfico, incluyendo cantidad de películas, puntuación promedio y votos acumulados.

## 4. Visualizaciones

### 4.1. Cantidad de películas por género

Representa la cantidad de películas asociadas a cada género. Permite identificar los géneros con mayor presencia en el conjunto de datos.

Archivo: `peliculas_por_genero.png`

### 4.2. Puntuación promedio por género

Compara las puntuaciones promedio de los géneros disponibles para identificar diferencias en las valoraciones.

Archivo: `puntuacion_por_genero.png`

### 4.3. Presupuesto frente a recaudación

Representa la relación entre el presupuesto y la recaudación de las películas que cuentan con valores válidos para ambas variables. Cada punto corresponde a una película.

Archivo: `presupuesto_vs_recaudacion.png`

## 5. Notebook de visualización

El notebook `04_dashboard_analitica.ipynb` contiene el código utilizado para consultar las tablas Gold, preparar los datos y generar los gráficos.

Para reproducir las visualizaciones:

1. Acceder al workspace de Databricks.
2. Verificar que el ETL haya generado las tablas Gold.
3. Abrir y ejecutar las celdas del notebook.
4. Exportar los gráficos generados a formato PNG.
5. Guardar las imágenes resultantes en esta carpeta.

## 6. Estructura de archivos

- `04_dashboard_analitica.ipynb`: código de las visualizaciones.
- `cantidad_peliculas_genero.png`: gráfico de cantidad de películas por género.
- `puntuacion_promedio_genero.png`: gráfico de puntuación promedio por género.
- `presupuesto_vs_recaudacion.png`: gráfico financiero.

## 7. Consideraciones

- Los gráficos dependen de la disponibilidad de las tablas Gold.
- El análisis financiero excluye películas sin presupuesto o recaudación válidos.
- Los géneros de una película pueden solaparse; por ello, la suma de películas por género puede ser superior al total de películas únicas.
- Las imágenes representan los datos disponibles en el momento en que se generaron. Si se actualizan las tablas Gold, se deben volver a ejecutar las visualizaciones.
