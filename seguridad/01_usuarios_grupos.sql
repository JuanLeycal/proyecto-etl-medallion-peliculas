
-- Proyecto: ETL Medallion de películas
-- Objetivo: documentar la administración de usuarios y grupos.
--
-- IMPORTANTE:
-- La creación de usuarios y grupos de la organización depende
-- de los permisos administrativos y de la configuración del workspace.
-- No ejecutar instrucciones con identidades ficticias.

-- 1. Consultar los grupos disponibles en Unity Catalog.
SHOW GROUPS;

-- 2. Consultar los privilegios concedidos sobre el esquema del proyecto.
SHOW GRANTS ON SCHEMA workspace.retail_analytics;

-- 3. Consultar los privilegios de la tabla final de películas.
SHOW GRANTS ON TABLE workspace.retail_analytics.gold_movies;

-- 4. Consultar los privilegios de la tabla final de géneros.
SHOW GRANTS ON TABLE workspace.retail_analytics.gold_genres;
