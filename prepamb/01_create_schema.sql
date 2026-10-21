
-- Proyecto: ETL Medallion de películas
-- Ambiente: Databricks
-- Objetivo: asegurar que exista el esquema de trabajo.

CREATE SCHEMA IF NOT EXISTS workspace.retail_analytics
COMMENT 'Esquema del proyecto Medallion de análisis de películas';

-- Verificar el esquema creado o existente.
SHOW SCHEMAS IN workspace;
