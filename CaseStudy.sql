/* 1. Create an agent commission table which includes the following columns.
Agent Code
Agent First Name and Last Name
Working Area(City)
Commission
Mobile No. */
CREATE DATABASE new_db;
USE new_db;
CREATE TABLE agent_commission
(agent_code int PRIMARY KEY,
F_name varchar(50),
L_name varchar(50),
city varchar (30),
commission DECIMAL(10,2),
mobile_no CHAR(10)
);
/* 2. Create a table of customer details which includes the following columns.
Customer ID
Customer Name
Customer City
Agent code
Order Date.   */
CREATE TABLE customer_details (
customer_id int PRIMARY KEY,
c_name varchar(50),
c_city varchar(30),
agent_code int,
order_date date
);

-- 3. Insert records in both tables.
INSERT INTO agent_commission
VALUES(1, 'Manthan', 'Koli', 'Delhi', 12000, '9898454545'),
(2, 'Virat', 'Dixit', 'Jaipur', 12150, '9696123240'),
(3, 'Akshay', 'Deshmukh', 'Mumbai', 1500, '8787987810'),
(4, 'Sanket', 'Kumar', 'Chandigarh', 120, '8789878980'),
(5, 'Gaurav', 'Desai', 'Chennai', 13020, '9698989560'),
(6, 'Sai', 'Jain', 'Shimla', 65650, '7875747971');

INSERT INTO customer_details VALUES
(101, 'Nick Rimando', 'New York', 2, '2009-01-13'),
(102, 'Brad Davis', 'New York', 1, '2010-03-05'),
(103, 'Graham Zusi', 'California', 5, '2010-07-20'),
(104, 'Julian Green', 'London', 8, '2010-04-10'),
(105, 'Fabian Johnson', 'Paris', 9, '2010-08-28'),
(106, 'Geoff Cameron', 'Berlin', 5, '2010-05-15');

ALTER TABLE customer_details
ADD CONSTRAINT fk_cust_detail FOREIGN KEY (agent_code) REFERENCES agent_commission(agent_code);

-- 4. Display the output where the city is Delhi from the Agent Commission table.
SELECT * FROM agent_commission WHERE city = 'Delhi';

-- 5. Display output where the commission of the agent is greater than 15000.
SELECT * FROM agent_commission WHERE commission > 15000;

-- 6. Give the output columns where the city is Mumbai.
SELECT * FROM agent_commission WHERE city = 'Mumbai';

-- 7. Display the output by a specified agent code 4.
SELECT * FROM agent_commission WHERE agent_code = 4;

-- 8. Show the output by ordering the First name in the agent commission table.
SELECT * FROM agent_commission ORDER BY F_name;

-- 9. Display the limited number of rows in output using LIMIT.
SELECT * FROM agent_commission LIMIT 3;

-- 10. Count and show the number of cities in the agent commission table.
SELECT city, COUNT(*) FROM agent_commission GROUP BY city;

-- 11. Show the agent details of who is getting a minimum commission.
-- SELECT * FROM agent_commission ORDER BY commission ASC LIMIT 1;

-- SELECT MIN(commission) FROM agent_commission;
SELECT agent_code, F_name, commission FROM agent_commission
WHERE commission = (
	SELECT MIN(commission) FROM agent_commission
);

-- 12. Display the total amount of commission by using SUM.
SELECT SUM(commission) FROM agent_commission;

-- 13. Show the average commission of agents.
SELECT AVG(commission) FROM agent_commission;

-- 14. Group the rows by city and count the agent code in the agent commission table.
SELECT city, COUNT(agent_code) FROM agent_commission GROUP BY city;

-- 15. Convert mobile no into Integer from agent commission table using CAST function.
SELECT agent_code, CAST('2023-12-12' AS DATE) FROM agent_commission;   -- in mysql cast is used to cast string value into date columns only

/* 16. Display the Output where the order date is greater than 2010-01-01 from the 
customer details table.    */
SELECT * FROM customer_details WHERE order_date > '2010-01-01';

-- 17. Concat the First name and Last name of the agent commission table.
SELECT CONCAT(F_name,' ', L_name) FROM agent_commission;

/* 18. Create a histogram of the commission column by creating a bin and ordering the 
output by agent code.     */
SELECT agent_code, ROUND(commission,-1) AS bucket, COUNT(*) AS count,
RPAD('',COUNT(*),'*') AS bar
FROM agent_commission
GROUP BY agent_code, bucket
ORDER BY agent_code, bucket;

-- 19. Replace the city Chandigarh with Haryana in the agent commission table. 

UPDATE agent_commission
SET city = 'Chandigarh'
WHERE city = 'Haryana';
SELECT * FROM agent_commission;

-- SELECT regexp_replace(city, 'Chandigarh', 'Haryana') FROM agent_commission;

-- 20. Create the sample table Orders with columns OrderID, OrderNumber, and PersonID.
CREATE TABLE Orders (
OrderID INTEGER, 
OrderNumber INTEGER, 
PersonID INTEGER
);

-- 21. Assign Primary Key and Foreign key.
ALTER TABLE Orders
ADD PRIMARY KEY (OrderID);

ALTER TABLE Orders
ADD CONSTRAINT fk_PersonID
FOREIGN KEY (PersonID) REFERENCES customer_details(customer_id);

-- 22. Perform left join operation on Agent commission and Customer details table.
SELECT * FROM agent_commission AS ac
LEFT JOIN customer_details AS cd
ON ac.agent_code = cd.agent_code;

-- 23. Perform Right join and Inner join operations on Agent commission and Customer details table.
SELECT * FROM agent_commission AS ac
RIGHT JOIN customer_details AS cd
ON ac.agent_code = cd.agent_code;

SELECT * FROM agent_commission AS ac
INNER JOIN customer_details AS cd
ON ac.agent_code = cd.agent_code;

-- Full Outer Join is Union Join
SELECT * FROM agent_commission AS ac
RIGHT JOIN customer_details AS cd
ON ac.agent_code = cd.agent_code
UNION
SELECT * FROM agent_commission AS ac
LEFT JOIN customer_details AS cd
ON ac.agent_code = cd.agent_code;

-- 24) Perform Union clause on Agent commission and Customer details table.
SELECT agent_code, F_name, L_name, city, commission, mobile_no, NULL AS customer_id, NULL AS c_name, NULL AS c_city, NULL AS order_date
FROM agent_commission
UNION
SELECT agent_code, NULL AS F_name, NULL AS L_name, NULL AS city, NULL AS commission, NULL AS mobile_no, customer_id, c_name, c_city, order_date
FROM customer_details;

/* 25. Use the CASE function to show the details of agents with a commission greater than 
12000 and agent code 1 from the agent commission table.       */
SELECT agent_code, 
CASE
WHEN commission>12000 AND agent_code=1 THEN 'person_of_interest'
ELSE 'other agent'
END AS 'Commission Status'
FROM agent_commission;

-- 26. Display the output of the commission which has the count 1.
SELECT commission FROM agent_commission
GROUP BY commission
HAVING COUNT(*) = 1;

/* 27. Perform the window function using OVER, PARTITION BY and ROW_NUMBER on the agent 
commission table.     */
SELECT *, ROW_NUMBER() OVER(PARTITION BY city ORDER BY commission)    -- ROW_NUMBER() assigns a unique sequential integer to each row within the partition.
FROM agent_commission;  

select city, rank() over(partition by city order by commission)
from agent_commission;

/* 28. Generate a unique rank for each row in a table based on the specified value.
Find out Matching String 
Find out the match of the beginning of the string.
Match zero or one instance of the strings preceding.
Matches any of the patterns.   */
SELECT *, RANK() OVER(ORDER BY commission DESC)        -- Generate a unique rank for each row in a table based on the specified value
FROM agent_commission;
SELECT * FROM agent_commission WHERE F_name REGEXP 'Akshay';     -- Find out Matching String 
SELECT * FROM agent_commission  WHERE F_name REGEXP '^A.';   -- Find out the match of the beginning of the string.
SELECT * FROM agent_commission  WHERE F_name REGEXP '^A..h';   -- has A and h in between in the string.
SELECT * FROM agent_commission  WHERE F_name REGEXP '^A.s';   -- has A and s in between in the string.
SELECT * FROM agent_commission  WHERE F_name REGEXP '^A.*y$';   -- has A in begining y at end; $ for end, ^ for beginining, dot . for num of characters, * for n number of characters in between.
SELECT * FROM agent_commission WHERE L_name LIKE 'D%';   -- Match zero or one instance of the strings preceding.
SELECT * FROM agent_commission WHERE city LIKE '%im%' OR city LIKE '%el%';  -- Matches any of the patterns. 

/* 29. Create a temporary table sales sum with columns product_name, total_sales, avg_unit_price and   
total_units_sold and insert values into it.     */
CREATE TEMPORARY TABLE sales_sum (
	product_name VARCHAR(50), 
    total_sales FLOAT, 
    avg_unit_price FLOAT,  
	total_units_sold INTEGER
);
INSERT INTO sales_sum
VALUES
('Table', 7500, 500, 15),
('Chair', 3300, 110, 30),
('Bed', 15000, 500, 30),
('Matress', 18000, 300, 60);

-- 30. Show the details of the agent commission whose city is Delhi using VIEW.
CREATE VIEW agent_commission_details AS
SELECT * FROM agent_commission WHERE city = 'Delhi';

-- 31. Create an index from the agent commission table using the city and First name.
CREATE fulltext index text_index
ON agent_commission(city, F_name);

SHOW INDEX FROM agent_commission;





