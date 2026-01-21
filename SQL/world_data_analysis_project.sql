-- =====================================================
-- Project: World Data Analysis
-- Author: Arpit Agrawal
-- Description: SQL analysis on world country data
-- Dataset: world table
-- =====================================================

-- BUSINESS QUESTION 1:
-- List all countries with population greater than 100 million
-- ANSWER 
SELECT name, population
FROM world
WHERE population > 100000000
ORDER BY population DESC;

-- BUSINESS QUESTION 2:
-- Find the total population by continent
-- ANSWER
SELECT continent, SUM(population) AS Total_Population
FROM world
GROUP BY continent
ORDER BY Total_Population DDESC;

-- BUSINESS QUESTION 3:
-- Identify the top 5 most populated countries
-- ANSWER
SELECT name, population
FROM world
ORDER BY population DESC
LIMIT 5;

-- BUSINESS QUESTION 4:
-- Find countries whose population is above the world average
--ANSWER
SELECT name, population
FROM world
WHERE population > (
          SELECT AVG(population)
          FROM world
)
ORDER BY population DESC;

-- BUSINESS QUESTION 5:
-- List continents having more than 10 countries
-- ANSWER
SELECT continent, COUNT(name) AS country_count
FROM world
GROUP BY continent
HAVING COUNT(name) > 10
ORDER BY country_count DESC;
