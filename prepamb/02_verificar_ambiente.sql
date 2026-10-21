
-- Proyecto: ETL Medallion de películas
-- Objetivo: verificar el catálogo, esquema y tablas del ETL.

-- 1. Verificar el catálogo y el esquema de trabajo.
SHOW CATALOGS;

SHOW SCHEMAS IN workspace;

-- 2. Verificar las tablas registradas en el esquema.
SHOW TABLES IN workspace.retail_analytics;

-- 3. Verificar las tablas finales de Gold.
SELECT
    'gold_movies' AS tabla,
    COUNT(*) AS cantidad_registros
FROM workspace.retail_analytics.gold_movies

UNION ALL

SELECT
    'gold_genres' AS tabla,
    COUNT(*) AS cantidad_registros
FROM workspace.retail_analytics.gold_genres;
