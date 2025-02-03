/* Advanced SQL Data Analysis - Assignment
4. Select all the hero races with an average weight of over 150 and an average height of over 100. */

SELECT Race
FROM heroes_information
GROUP BY Race
HAVING AVG(Weight) > 150 AND AVG(Height) >100;