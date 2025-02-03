-- Subquery is a query inside a query
USE hero;
SELECT * FROM heroes_information
WHERE `Eye color` IN(
SELECT `Eye color` FROM heroes_information GROUP BY `Eye color` HAVING AVG(Weight) > 100
);