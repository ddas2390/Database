-- Use CASE when want to add a new column to a table based on an existing column
USE hero;
SELECT `Eye color`,
CASE
WHEN `Eye color` IN ('blue', 'brown', 'black', 'green') THEN "Normal"
WHEN `Eye color` IN ('red', 'orange', 'yellow', 'purple') THEN "Scary"
ELSE "Other"
END AS eye_color_cat
FROM heroes_information;
