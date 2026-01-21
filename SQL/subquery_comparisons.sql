-- =========================================
-- File: subquery_comparisons.sql
-- Description: Subqueries and comparison logic
-- =========================================

-- Countries with population greater than the average population
SELECT name, population
FROM world
WHERE population > (
    SELECT AVG(population)
    FROM world
);

-- Countries in continents containing either Argentina or Australia
SELECT name, continent
FROM world
WHERE continent IN (
    SELECT continent
    FROM world
    WHERE name IN ('Argentina', 'Australia')
);

-- Countries with GDP higher than Germany
SELECT name, gdp
FROM world
WHERE gdp > (
    SELECT gdp
    FROM world
    WHERE name = 'Germany'
);

-- European countries with population greater than Germany
SELECT name, population
FROM world
WHERE continent = 'Europe'
AND population > (
    SELECT population
    FROM world
    WHERE name = 'Germany'
);
