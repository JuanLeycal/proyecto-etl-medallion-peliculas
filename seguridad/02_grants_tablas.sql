
-- Proyecto: ETL Medallion de películas
-- Objetivo: ejemplo de permisos de lectura para un grupo analítico.
-- IMPORTANTE: reemplazar el grupo por uno existente antes de ejecutar.

-- Permitir que el grupo use el catálogo y el esquema.
GRANT USE CATALOG ON CATALOG workspace TO `grupo_analitica`;

GRANT USE SCHEMA ON SCHEMA workspace.retail_analytics
TO `grupo_analitica`;

-- Permitir lectura de las tablas finales Gold.
GRANT SELECT ON TABLE workspace.retail_analytics.gold_movies
TO `grupo_analitica`;

GRANT SELECT ON TABLE workspace.retail_analytics.gold_genres
TO `grupo_analitica`;
