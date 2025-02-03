-- Having clause to filter data based on Group by i.e. aggregation of rows
SELECT Race, AVG(Weight) FROM heroes_information
GROUP BY Race
HAVING AVG(Weight) < 100
ORDER BY AVG(Weight) DESC;