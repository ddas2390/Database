/* Advanced SQL Data Analysis - Assignment
3. Give a frequency table with each letter of the alphabet and how many superheroes’ 
names start with that letter.   */

SELECT LEFT(name,1) AS first_letter, COUNT(*) AS count
FROM heroes_information
GROUP BY first_letter
ORDER BY first_letter;