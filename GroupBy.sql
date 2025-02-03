USE hero;
SELECT Race, AVG(Weight) AS avg_weight FROM heroes_information
GROUP BY Race
ORDER BY avg_weight DESC;