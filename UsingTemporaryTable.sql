-- Use Temporary Table instead of a subquery
SELECT * FROM heroes_information WHERE
`Eye color` IN (SELECT * FROM eye_color_table);