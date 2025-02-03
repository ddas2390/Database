/* SQL Master - Assignment - Debolina Das
In this assignment, you’ll prove that you are a SQL master.
1) Start by querying all of the data from heroes_information if the Race has an average 
weight of over 400.
2) Create a temporary table for this result called bigs
3) Select all columns and rows from that temporary table.
4) Write a new query that creates a view that selects the data if the publisher is 
Marvel Comics and if their height is above the average height.
    Bring that view up.
5) Now add an index to the heroes_information table on the name and Race columns.
6) Finally, create a stored procedure that selects all the data from heroes_information 
if they are from DC. Call it all_dc_rows. */
-- 1)
SELECT Race, AVG(Weight) FROM heroes_information
GROUP BY Race HAVING AVG(Weight)>400;
-- 2)
CREATE TEMPORARY TABLE bigs
SELECT Race, AVG(Weight) FROM heroes_information
GROUP BY Race HAVING AVG(Weight)>400;
-- 3)
SELECT * FROM bigs;
-- 4)
CREATE VIEW tall_marvel_heroes AS
SELECT * FROM heroes_information
WHERE Publisher = 'Marvel Comics' AND 
Height > 
(SELECT AVG(Height) FROM heroes_information);

SELECT * FROM tall_marvel_heroes;

-- 5)
CREATE INDEX index_name_race ON heroes_information(name, Race);
SHOW INDEXES FROM heroes_information;

-- 6)
DELIMITER $$;
CREATE PROCEDURE all_dc_rows()
BEGIN
	SELECT * FROM heroes_information 
    WHERE Publisher LIKE '%DC%';
END $$;

CALL all_dc_rows();