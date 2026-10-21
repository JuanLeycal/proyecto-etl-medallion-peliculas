# Seguridad y permisos

## 1. Objetivo

Documentar la revisión de identidades y los permisos de acceso a las tablas del proyecto ETL Medallion de películas en Databricks.

## 2. Alcance

Esta carpeta contiene scripts para consultar los grupos disponibles y revisar los privilegios asociados al catálogo, esquema y tablas del proyecto.

## 3. Archivos incluidos

### `01_usuarios_grupos.sql`

Contiene consultas para:
- Revisar los grupos visibles en el entorno.
- Consultar los privilegios del esquema `workspace.retail_analytics`.
- Consultar los privilegios de las tablas finales `gold_movies` y `gold_genres`.

### `02_grants_tablas.sql`

Contiene instrucciones `GRANT` de ejemplo para conceder acceso de lectura al grupo analítico sobre las tablas Gold.

**Importante:** el nombre `grupo_analitica` es provisional. Antes de ejecutar estas instrucciones, se debe confirmar la existencia del grupo y verificar que se cuente con los privilegios necesarios.

## 4. Modelo de acceso

El acceso a los datos se organiza mediante los privilegios de Unity Catalog:

- `USE CATALOG`: permite utilizar el catálogo.
- `USE SCHEMA`: permite utilizar el esquema.
- `SELECT`: permite consultar las tablas autorizadas.

Se recomienda conceder únicamente los privilegios necesarios para cada función.

## 5. Revisión realizada

Se ejecutaron manualmente consultas de diagnóstico desde el notebook temporal `revision_seguridad`:

- `SHOW GROUPS`: mostró los grupos `users` y `admins`.
- `SHOW GRANTS ON CATALOG workspace`: no devolvió filas.
- `SHOW GRANTS ON SCHEMA workspace.retail_analytics`: no devolvió filas.
- `SHOW GRANTS ON TABLE` para `gold_movies` y `gold_genres`: no devolvió filas.

Estos resultados reflejan las concesiones mostradas por las consultas y no permiten concluir, por sí solos, que no existan permisos efectivos.

**Los archivos SQL de esta carpeta no se han ejecutado. No se han modificado ni concedido permisos como parte de esta revisión.**

## 6. Consideraciones de seguridad

- No utilizar nombres de grupos ficticios en una ejecución real.
- No guardar contraseñas, tokens ni secretos en los scripts.
- La administración de identidades puede requerir permisos adicionales.
- Verificar los privilegios después de cualquier cambio.
- No ejecutar instrucciones `GRANT` hasta confirmar el principal destinatario y la autorización correspondiente.

## 7. Resultado

La documentación de seguridad está preparada y la revisión inicial de permisos está documentada. La asignación efectiva de permisos a un grupo analítico queda pendiente de validar una identidad real y los privilegios necesarios.
