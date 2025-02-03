/* Advanced SQL Data Analysis - Assignment
In this assignment, you’ll practice the topics you covered in Module 9, including 
CASE, HAVING, window functions, text analysis, and ranking. 
1. Create a query to select all columns from heroes_information but to add a new column called human. 
Have that column be a 1 if their race is Human and 0 if not. 
 */
SELECT *, 
CASE
WHEN Race = "Human" THEN 1
ELSE 0
END AS human
FROM heroes_information;
/* Advanced SQL Data Analysis - Assignment
2. Create a new query to provide a list of the heaviest super heroes, with the heaviest being #1. */

SELECT name, Weight, RANK() OVER(ORDER BY Weight DESC) AS heaviest_rank
FROM heroes_information;
/* Advanced SQL Data Analysis - Assignment
3. Give a frequency table with each letter of the alphabet and how many superheroes’ 
names start with that letter.   */

SELECT LEFT(name,1) AS first_letter, COUNT(*) AS count
FROM heroes_information
GROUP BY first_letter
ORDER BY first_letter;
/* Advanced SQL Data Analysis - Assignment
4. Select all the hero races with an average weight of over 150 and an average height of over 100. */
SELECT Race
FROM heroes_information
GROUP BY Race
HAVING AVG(Weight) > 150 AND AVG(Height) >100;