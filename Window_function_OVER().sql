-- Window function OVER() performs specific calculation like sum, avg, count on a set of rows called windows
-- SELECT SUM(num_enemies) FROM hero_battles;
SELECT date, name, num_enemies, num_enemies*100/SUM(num_enemies) OVER(PARTITION BY name) AS pct_enemies_per_hero
FROM hero_battles;