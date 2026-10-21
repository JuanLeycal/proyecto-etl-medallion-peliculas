
# Seguridad y permisos

## 1. Objetivo

Documentar la gestión de identidades y los permisos de acceso a las tablas del proyecto ETL Medallion de películas en Databricks.

## 2. Alcance

Los scripts de esta carpeta permiten consultar los grupos disponibles y revisar los privilegios asociados al esquema y las tablas del proyecto.

## 3. Archivos incluidos

### `01_usuarios_grupos.sql`

Contiene consultas para:
- Revisar los grupos visibles en el entorno.
- Consultar los privilegios del esquema `workspace.retail_analytics`.
- Consultar los privilegios de las tablas finales `gold_movies` y `gold_genres`.

### `02_grants_tablas.sql`

Contiene instrucciones `GRANT` para conceder acceso de lectura al grupo analítico sobre las tablas Gold.

Antes de ejecutarlo, se debe sustituir el nombre provisional del grupo por uno real y verificar que el usuario tenga permisos para conceder privilegios.

## 4. Modelo de acceso

El acceso a los datos se organiza mediante los privilegios de Unity Catalog:

- `USE CATALOG`: permite utilizar el catálogo.
- `USE SCHEMA`: permite utilizar el esquema.
- `SELECT`: permite consultar las tablas autorizadas.

Se recomienda conceder únicamente los privilegios necesarios para cada función.

## 5. Ejecución

1. Abrir un notebook SQL en Databricks.
2. Seleccionar el catálogo y esquema correspondientes.
3. Ejecutar las consultas de `01_usuarios_grupos.sql` para inspeccionar el estado actual.
4. Verificar los grupos y privilegios existentes.
5. Adaptar `02_grants_tablas.sql` a un grupo real y ejecutarlo únicamente si se cuenta con los permisos necesarios.

## 6. Consideraciones de seguridad

- No utilizar nombres de grupos ficticios en una ejecución real.
- No guardar contraseñas, tokens ni secretos en los scripts.
- La creación y administración de identidades puede requerir permisos administrativos fuera de SQL.
- Verificar los privilegios efectivos después de cualquier cambio.

## 7. Resultado esperado

Contar con una documentación reproducible de los permisos de acceso a las tablas analíticas del proyecto.
