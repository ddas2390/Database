SELECT name FROM hero_battles
WHERE outcome = 'Won'
UNION
SELECT name FROM heroes_information
WHERE `Eye color` = "red"
ORDER BY name;