/* Practicing Fundamental SQL Aggregation Functions - Assignment - Debolina Das
In this assignment, you’ll be practicing fundamental SQL aggregation functions. 
1) Start by returning all rows and columns from the hero_battles data table.
2) Now, return the number of rows in the data set.
3) Write a query to select the column name’s max and min. Hint: use MIN() and MAX().
4) Write a query to select both the sum and the average of the column num_enemies
5) Now take that query of the sum and average of enemies, and group it by the column name
6) Lastly, take the query we’ve been building and ORDER by the average.*/

USE hero;
SELECT * FROM hero_battles;
SELECT COUNT(*) FROM hero_battles;
SELECT MAX(name), MIN(name) FROM hero_battles;
SELECT SUM(num_enemies), AVG(num_enemies) FROM hero_battles;
SELECT name, SUM(num_enemies), AVG(num_enemies) FROM hero_battles
GROUP BY name;
SELECT name, SUM(num_enemies), AVG(num_enemies) FROM hero_battles
GROUP BY name
ORDER BY AVG(num_enemies);