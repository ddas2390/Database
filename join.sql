USE hero;
SELECT * FROM heroes_information
JOIN hero_battles ON
heroes_information.name = hero_battles.name;
