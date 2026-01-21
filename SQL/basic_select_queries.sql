-- ================================
-- BASIC SQL SELECT PRACTICE
-- Table: world
-- Dataset: world table (SQLZOO-style)
-- ================================

-- Show all columns for all countries
SELECT *
FROM world;

-- Show country name and population
SELECT name, population
FROM world;

-- Countries with population greater than 50 million
SELECT name, population
FROM world
WHERE population > 50000000;

-- Countries in Europe
SELECT name
FROM world
WHERE continent = 'Europe';

-- Countries in Asia with population more than 100 million
SELECT name, population
FROM world
WHERE continent = 'Asia'
AND population > 100000000;

-- Order countries by population (highest first)
SELECT name, population
FROM world
ORDER BY population DESC;

-- Top 10 most populated countries
SELECT name, population
FROM world
ORDER BY population DESC
LIMIT 10;

-- Countries with area greater than 1 million sq km
SELECT name, area
FROM world
WHERE area > 1000000;

-- Countries ordered alphabetically
SELECT name
FROM world
ORDER BY name ASC;

-- Show unique continents
SELECT DISTINCT continent
FROM world;
