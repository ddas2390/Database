-- Regular Expression to find specific search pattern such as phone number from large text
-- SELECT DISTINCT station_number from hero_battles;
/*
SELECT station_number, regexp_replace(station_number, '[^0-9]', '')
FROM hero_battles;   */
/*
SELECT station_number, LEFT(RIGHT(regexp_replace(station_number, '[^0-9]', ''), 10), 3) AS area_code 
FROM hero_battles;     */
SELECT LEFT(RIGHT(regexp_replace(station_number, '[^0-9]', ''),10),3) AS area_code, COUNT(*)
FROM hero_battles
GROUP BY area_code;  


SELECT * FROM hero_battles
WHERE name REGEXP '^A.*';