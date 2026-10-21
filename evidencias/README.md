# Evidencias de ejecución del proyecto

## 1. Objetivo

Organizar las capturas que demuestran la configuración de los recursos, la ejecución del ETL Medallion y los resultados generados.

## 2. Evidencias requeridas

| Código | Evidencia | Qué debe demostrar |
|---|---|---|
| E01 | Bucket S3 | Existencia del bucket y archivos fuente en `raw/` |
| E02 | External Location | Configuración de acceso de Databricks a S3 |
| E03 | Ejecución Bronze | Lectura de los tres CSV y escritura de las tablas Bronze |
| E04 | Ejecución Silver | Limpieza, transformación e integración de los datos |
| E05 | Ejecución Gold | Generación de las tablas analíticas |
| E06 | Validación de resultados | Conteos y controles de calidad de las tablas Gold |
| E07 | GitHub Actions | Ejecución exitosa de `Deploy and Run Production` |
| E08 | Dashboard | Gráficos exportados desde el notebook de visualización |

## 3. Organización de archivos

Guardar las capturas en esta carpeta usando nombres descriptivos:

- `E01_s3_raw.png`
- `E02_external_location.png`
- `E03_bronze.png`
- `E04_silver.png`
- `E05_gold.png`
- `E06_validacion_gold.png`
- `E07_github_actions_produccion.png`
- `E08_dashboard.png`

## 4. Criterios para las capturas

- Mostrar el contexto suficiente para identificar la herramienta o recurso.
- Mantener visibles los estados y resultados relevantes.
- Evitar información sensible, tokens y credenciales.
- Utilizar capturas de ejecuciones reales.

## 5. Estado

Esta carpeta sirve como índice de las evidencias que se recopilarán durante la validación final del proyecto.
