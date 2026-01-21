-- =========================================
-- File: aggregate_queries.sql
-- Description: SQL aggregate functions practice
-- =========================================

-- Total population of the world
SELECT SUM(population) AS total_world_population
FROM world;

-- Average population by continent
SELECT continent, AVG(population) AS avg_population
FROM world
GROUP BY continent;

-- Number of countries in each continent
SELECT continent, COUNT(name) AS country_count
FROM world
GROUP BY continent;

-- Maximum population by continent
SELECT continent, MAX(population) AS max_population
FROM world
GROUP BY continent;

-- Continents having more than 10 countries
SELECT continent, COUNT(name) AS country_count
FROM world
GROUP BY continent
HAVING COUNT(name) > 10;
