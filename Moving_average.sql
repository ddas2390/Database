-- Moving averages
USE hero;
SELECT date, num_enemies,
AVG(num_enemies) OVER(ORDER BY date ROWS BETWEEN 5 PRECEDING AND CURRENT ROW) AS moving_avg
FROM hero_battles;
