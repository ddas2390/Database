/* Advanced SQL Data Analysis - Assignment
2. Create a new query to provide a list of the heaviest super heroes, with the heaviest being #1. */

SELECT name, Weight, RANK() OVER(ORDER BY Weight DESC) AS heaviest_rank
FROM heroes_information;