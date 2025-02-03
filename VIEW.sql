-- View is a named saved query
CREATE VIEW eye_color_view AS
SELECT `Eye color` FROM heroes_information GROUP BY `Eye color` HAVING AVG(Weight)>100; 
-- SELECT * FROM eye_color_view;