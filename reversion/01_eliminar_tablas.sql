
-- Proyecto: ETL Medallion de películas
-- Objetivo: eliminar las tablas Delta creadas por el ETL.
--
-- ADVERTENCIA:
-- Este script elimina las tablas del proyecto.
-- Ejecutar únicamente cuando se desee revertir el ETL.

-- Capa Gold
DROP TABLE IF EXISTS workspace.retail_analytics.gold_genres;
DROP TABLE IF EXISTS workspace.retail_analytics.gold_movies;

-- Capa Silver
DROP TABLE IF EXISTS workspace.retail_analytics.silver_posters;
DROP TABLE IF EXISTS workspace.retail_analytics.silver_movies;

-- Capa Bronze
DROP TABLE IF EXISTS workspace.retail_analytics.bronze_poster_paths;
DROP TABLE IF EXISTS workspace.retail_analytics.bronze_film_details;
DROP TABLE IF EXISTS workspace.retail_analytics.bronze_movies;
