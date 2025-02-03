-- Temporary table only lives in the duration of one sql session
CREATE TEMPORARY TABLE eye_colors
SELECT `Eye color` FROM heroes_information GROUP BY `Eye color` HAVING AVG(Weight)>100;