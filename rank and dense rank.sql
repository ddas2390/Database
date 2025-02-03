-- Rank and dense_rank

/* SELECT DATE(date), name, num_enemies, RANK() OVER(PARTITION BY name ORDER BY num_enemies DESC) AS tough_battle_rank
FROM hero_battles;
*/
SELECT DATE(date), name, num_enemies, DENSE_RANK() OVER(PARTITION BY name ORDER BY num_enemies DESC) AS tough_battle_rank
FROM hero_battles;