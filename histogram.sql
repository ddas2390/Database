USE hero;
SELECT ROUND(Weight, -1) AS bucket, COUNT(*) AS count,
RPAD('', COUNT(*), '*') AS BAR
FROM heroes_information
GROUP BY bucket
ORDER BY bucket;
