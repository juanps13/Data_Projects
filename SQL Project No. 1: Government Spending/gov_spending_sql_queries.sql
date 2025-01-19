-- 1. Select top 10 results
SELECT *
FROM gov_spend
LIMIT 10;

-- 2. Check the number of countries data we have for each year
SELECT year, COUNT(DISTINCT code) AS countries
FROM gov_spend
GROUP BY year
ORDER BY year DESC;

-- 3. Top 10 countries with more government spending in 2010
SELECT Entity AS country_name, gov_expenditure
FROM gov_spend
WHERE year = 2010
ORDER BY gov_expenditure DESC
LIMIT 10;

-- 4. Top 10 countries with less average government spending after 2000
SELECT entity AS country_name, AVG(gov_expenditure) AS avg_expenditure
FROM gov_spend
WHERE year >= 2000
GROUP BY entity
ORDER BY AVG(gov_expenditure) ASC
LIMIT 10;

-- 5. Top 10 countries with more average government spending between 1990 and 2000
SELECT entity AS country_name, AVG(gov_expenditure) AS avg_expenditure
FROM gov_spend
WHERE year BETWEEN 1990 AND 2000
GROUP BY entity
ORDER BY AVG(gov_expenditure) DESC
LIMIT 10;