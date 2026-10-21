# Evidencias de componentes del proyecto

## 1. Objetivo

Registrar las evidencias de los servicios, herramientas y componentes utilizados para implementar el proyecto ETL Medallion de películas.

## 2. Componentes utilizados

| Componente | Función en el proyecto | Evidencia por recopilar |
|---|---|---|
| Amazon S3 | Almacenamiento de los CSV de origen | Captura del bucket y la carpeta `raw/` |
| AWS IAM | Control de acceso desde Databricks | Captura de la configuración del rol, ocultando información sensible |
| Databricks y Unity Catalog | Ejecución del ETL y administración de tablas | Capturas de las tablas Bronze, Silver y Gold |
| GitHub | Control de versiones del proyecto | Enlace al repositorio |
| GitHub Actions | Despliegue y ejecución del ETL | Captura del workflow de producción exitoso |
| PySpark y Delta Lake | Transformación y almacenamiento de datos | Capturas de resultados de las ejecuciones |

## 3. Enlaces del proyecto

- Repositorio: https://github.com/JuanLeycal/proyecto-medallion-ventas
- Dataset de origen: https://www.kaggle.com/datasets/hassanelfattmi/which-movie-should-i-watch-today/data

## 4. Certificaciones externas

No se declaran certificaciones profesionales externas en este documento. Si se dispone de certificados relevantes, se pueden incorporar sus enlaces o archivos verificables.

## 5. Consideraciones

Las evidencias deben corresponder a configuraciones y ejecuciones reales. No se deben publicar tokens, contraseñas, claves secretas ni otros datos sensibles.
