-- Stored Procedures: series of saved sql queries 
/*
DELIMITER $$;                        
CREATE PROCEDURE sp_all_rows_hero_battles_filter_name(hero_name VARCHAR(100))
BEGIN
	SELECT * FROM hero_battles WHERE name = hero_name;
END $$;
*/
-- Find all the stored procedures
-- SELECT * FROM information_schema.routines;
-- CALL sp_all_rows_hero_battles();
 CALL sp_all_rows_hero_battles_filter_name('Batman');