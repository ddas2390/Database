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