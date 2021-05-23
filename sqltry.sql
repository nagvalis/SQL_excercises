-- Try pulling all the data from the accounts table, and all the data from the orders table.

-- Try pulling standard_qty, gloss_qty, and poster_qty from the orders table, and the website and 
-- the primary_poc from the accounts table.


	 SELECT accounts.*, orders.* FROM accounts JOIN orders ON accounts.id = orders.account_id;

     SELECT orders.standard_qty, orders.gloss_qty, orders.poster_qty, accounts.website, accounts.primary_poc 
     FROM accounts JOIN orders ON orders.account_id = accounts.id;



-- w3 List the number of customers in each country, ordered by the country with the most customers first.
SELECT COUNT(CustomerID), Country FROM Customers GROUP BY Country ORDER BY COUNT(CustomerID) DESC;

-- Provide a table for all web_events associated with account name of Walmart.
--  There should be three columns. Be sure to include the primary_poc, time of
--   the event, and the channel for each event. Additionally, you might choose
--    to add a fourth column to assure only Walmart events were chosen.

SELECT * FROM web_events JOIN accounts ON web_events.account_id = accounts.id
 WHERE accounts.name = 'Walmart';


--  Provide a table that provides the region for each sales_rep along with their 
--  associated accounts. Your final table should include three columns: the region
--   name, the sales rep name, and the account name. Sort the accounts alphabetically
--    (A-Z) according to account name.
SELECT sales_reps.name, accounts.name, region.name FROM sales_reps JOIN accounts
 ON sales_reps.id = accounts.sales_rep_id JOIN region ON sales_reps.region_id = region.id ORDER BY accounts.name;


-- Provide the name for each region for every order, as well as the account
--  name and the unit price they paid (total_amt_usd/total) for the order.
--   Your final table should have 3 columns: region name, account name, and 
--   unit price. A few accounts have 0 for total, so I divided by (total + 0.01) 
--   to assure not dividing by zero.




-- Now, select the 2 tables with a join so that you can see each person's name 
-- next to their hobby.
SELECT persons.name, hobbies.name FROM hobbies LEFT JOIN 
persons ON hobbies.person_id = persons.id;
-- Now, add an additional query that shows only the name and 
-- hobbies of 'Bobby McBobbyFace', using JOIN combined with WHERE.
SELECT persons.name, hobbies.name FROM hobbies LEFT JOIN persons 
ON hobbies.person_id = persons.id WHERE persons.name = 'Bobby McBobbyFace';


-- We've created a database for customers and their orders. Not all of the customers
--  have made orders, however. Come up with a query that lists the name and email of
--   every customer followed by the item and price of orders they've made. Use a LEFT
--    OUTER JOIN so that a customer is listed even if they've made no orders, and don't
--     add any ORDER BY.

CREATE TABLE customers (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT,
    email TEXT);
    
INSERT INTO customers (name, email) VALUES ("Doctor Who", "doctorwho@timelords.com");
INSERT INTO customers (name, email) VALUES ("Harry Potter", "harry@potter.com");
INSERT INTO customers (name, email) VALUES ("Captain Awesome", "captain@awesome.com");

CREATE TABLE orders (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    customer_id INTEGER,
    item TEXT,
    price REAL);

INSERT INTO orders (customer_id, item, price)
    VALUES (1, "Sonic Screwdriver", 1000.00);
INSERT INTO orders (customer_id, item, price)
    VALUES (2, "High Quality Broomstick", 40.00);
INSERT INTO orders (customer_id, item, price)
    VALUES (1, "TARDIS", 1000000.00);

SELECT customers.name, customers.email, orders.item, orders.price 
FROM customers LEFT OUTER JOIN orders ON orders.customer_id = customers.id;

-- Now, create another query that will result in one row per each customer, with
--  their name, email, and total amount of money they've spent on orders. Sort the rows
--   according to the total money spent, from the most spent to the least spent.
-- (Tip: You should always GROUP BY on the column that is most likely to be unique in a row.)
SELECT customers.name, customers.email, SUM(orders.price) AS total_sum
 FROM customers LEFT OUTER JOIN orders ON orders.customer_id = customers.id
  GROUP BY customers.id ORDER BY orders.price DESC;
  




-- We've created a table with all the 'Harry Potter' movies, with a sequel_id column that matches the id of the 
-- sequel for each movie. Issue a SELECT that will show the title of each movie next to its sequel's title (or
--  NULL if it doesn't have a sequel).

SELECT movies.title, sequels.title AS sequel_title FROM movies LEFT OUTER JOIN movies sequels
 ON sequels.id = movies.sequel_id;

-- --------------------------------------------------------------------

CREATE TABLE persons (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    fullname TEXT,
    age INTEGER);
    
INSERT INTO persons (fullname, age) VALUES ("Bobby McBobbyFace", "12");
INSERT INTO persons (fullname, age) VALUES ("Lucy BoBucie", "25");
INSERT INTO persons (fullname, age) VALUES ("Banana FoFanna", "14");
INSERT INTO persons (fullname, age) VALUES ("Shish Kabob", "20");
INSERT INTO persons (fullname, age) VALUES ("Fluffy Sparkles", "8");

CREATE table hobbies (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    person_id INTEGER,
    name TEXT);
    
INSERT INTO hobbies (person_id, name) VALUES (1, "drawing");
INSERT INTO hobbies (person_id, name) VALUES (1, "coding");
INSERT INTO hobbies (person_id, name) VALUES (2, "dancing");
INSERT INTO hobbies (person_id, name) VALUES (2, "coding");
INSERT INTO hobbies (person_id, name) VALUES (3, "skating");
INSERT INTO hobbies (person_id, name) VALUES (3, "rowing");
INSERT INTO hobbies (person_id, name) VALUES (3, "drawing");
INSERT INTO hobbies (person_id, name) VALUES (4, "coding");
INSERT INTO hobbies (person_id, name) VALUES (4, "dilly-dallying");
INSERT INTO hobbies (person_id, name) VALUES (4, "meowing");

CREATE table friends (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    person1_id INTEGER,
    person2_id INTEGER);

INSERT INTO friends (person1_id, person2_id)
    VALUES (1, 4);
INSERT INTO friends (person1_id, person2_id)
    VALUES (2, 3);
    

-- We've created a database for a friend networking site, with a table storing data on each person, a 
-- table on each person's hobbies, and a table of friend connections between the people. In this first step,
--  use a JOIN to display a table showing people's names with their hobbies.

SELECT persons.fullname, hobbies.name FROM persons JOIN hobbies ON persons.id = hobbies.person_id;

-- Now, use another SELECT with a JOIN to show the names of each pair of friends, based on the data in
--  the friends table.

SELECT persons.fullname, friendies.fullname FROM friends JOIN persons ON persons.id = friends.person1_id
 JOIN persons friendies ON friendies.id = friends.person2_id;



-- 1.Find the total amount of poster_qty paper ordered in the orders table.
SELECT sum(orders.poster_qty) FROM orders;
-- 2.Find the total amount of standard_qty paper ordered in the orders table.
SELECT sum(orders.standard_qty) FROM orders;
-- 3.Find the total dollar amount of sales using the total_amt_usd in the orders table.
SELECT sum(orders.total_amt_usd) FROM orders;
-- 4.Find the total amount spent on standard_amt_usd and gloss_amt_usd paper for each order in the orders table. This should give a dollar amount for each order in the table.
SELECT standard_amt_usd + gloss_amt_usd FROM orders;
-- 5.Find the standard_amt_usd per unit of standard_qty paper. Your solution should use both an aggregation and a mathematical operator.
SELECT SUM(orders.standard_amt_usd)/ SUM(orders.standard_qty) FROM orders;

-- Questions: MIN, MAX, & AVERAGE

-- 1.When was the earliest order ever placed? You only need to return the date.
SELECT MIN(occurred_at) FROM orders;
-- 2.Try performing the same query as in question 1 without using an aggregation function.
SELECT occurred_at FROM orders ORDER BY occurred_at LIMIT 1;
-- 3.When did the most recent (latest) web_event occur?
SELECT MAX(occurred_at) FROM web_events;
-- 4.Try to perform the result of the previous query without using an aggregation function.
SELECT occurred_at FROM web_events ORDER BY occurred_at DESC LIMIT 1;
-- 5.Find the mean (AVERAGE) amount spent per order on each paper type, as well as the mean amount of each paper type purchased 
--per order. Your final answer should have 6 values - one for each paper type for the average number of sales, as well as the
-- average amount.
SELECT AVG(poster_amt_usd) as posterprice, AVG(poster_qty) posterqty, AVG(standard_amt_usd) standardprice,
AVG(standard_qty) standardqty, AVG(gloss_amt_usd) glossprice, AVG(gloss_qty) glossqty FROM orders;

-- Questions: GROUP BY

-- 1.Which account (by name) placed the earliest order? Your solution should have the account name and the date of the order.
SELECT accounts.name, orders.occurred_at FROM accounts JOIN orders ON accounts.id = orders.account_id
GROUP BY orders.occurred_at, accounts.name LIMIT 1;
-- 2.Find the total sales in usd for each account. You should include two columns - the total sales for each company's orders in usd and the company name.
SELECT accounts.name, SUM(orders.total_amt_usd) FROM accounts JOIN orders ON accounts.id = orders.account_id
GROUP BY accounts.name;
-- 3.Via what channel did the most recent (latest) web_event occur, which account was associated with this web_event? Your query should return only three values - the date, channel, and account name.
SELECT web_events.occurred_at, web_events.channel, accounts.name FROM web_events JOIN accounts ON accounts.id = web_events.account_id
ORDER BY web_events.occurred_at DESC LIMIT 1;
-- 4.Find the total number of times each type of channel from the web_events was used. Your final table should have two columns - the channel and the number of times the channel was used.
SELECT w.channel, COUNT(b.channel) AS count FROM web_events w JOIN web_events b ON w.id = b.id GROUP BY w.channel;
-- 5.Who was the primary contact associated with the earliest web_event?
SELECT accounts.primary_poc FROM accounts JOIN web_events ON accounts.id = web_events.account_id
ORDER BY web_events.occurred_at LIMIT 1;
-- 6.What was the smallest order placed by each account in terms of total usd. Provide only two columns - the account name and the total usd. Order from smallest dollar amounts to largest.
SELECT accounts.name, MIN(orders.total_amt_usd) minimum FROM accounts JOIN orders ON accounts.id = orders.account_id
GROUP BY accounts.name ORDER BY minimum;
-- 7.Find the number of sales reps in each region. Your final table should have two columns - the region and the number of sales_reps. Order from fewest reps to most reps.
SELECT r.name, COUNT(s.name) number FROM region r JOIN sales_reps s ON r.id = s.region_id GROUP BY r.name;



-- Questions: GROUP BY Part II

-- 1. For each account, determine the average amount of each type of paper they purchased across their orders. Your result should have four columns - one for the account name and one for the average quantity purchased for each of the paper types for each account.
SELECT a.name, AVG(o.standard_qty) standard, AVG(o.gloss_qty) gloss, AVG(o.poster_qty) poster
FROM accounts a JOIN orders o ON a.id = o.account_id GROUP BY a.name;

-- 2. For each account, determine the average amount spent per order on each paper type. Your result should have four columns - one for the account name and one for the average amount spent on each paper type.
SELECT a.name, AVG(o.standard_amt_usd) standard, AVG(o.gloss_amt_usd) gloss, AVG(o.poster_amt_usd) poster
FROM accounts a JOIN orders o ON a.id = o.account_id GROUP BY a.name;

-- 3. Determine the number of times a particular channel was used in the web_events table for each sales rep. Your final table should have three columns - the name of the sales rep, the channel, and the number of occurrences. Order your table with the highest number of occurrences first.
SELECT s.name, w.channel chn, COUNT(w.occurred_at) occ FROM web_events w JOIN accounts ON w.account_id = accounts.id
JOIN sales_reps s ON accounts.sales_rep_id = s.id GROUP BY s.name, chn ORDER BY occ DESC;

-- 4. Determine the number of times a particular channel was used in the web_events table for each region. Your final table should have three columns - the region name, the channel, and the number of occurrences. Order your table with the highest number of occurrences first.
SELECT r.name, w.channel chn, COUNT(w.occurred_at) occ FROM web_events w JOIN accounts ON w.account_id = accounts.id 
JOIN sales_reps s ON accounts.sales_rep_id = s.id JOIN region r ON r.id = s.region_id GROUP BY chn, r.name ORDER BY occ DESC;



-- Questions: DISTINCT
-- 1. Use DISTINCT to test if there are any accounts associated with more than one region.
SELECT DISTINCT a.name FROM accounts a JOIN sales_reps s ON a.sales_rep_id = s.id JOIN region r ON s.region_id = r.id;

-- 2. Have any sales reps worked on more than one account?
SELECT DISTINCT s.name FROM sales_reps s JOIN accounts a ON s.id = a.sales_rep_id WHERE a.id > 1;


-- Questions: HAVING

-- 1. How many of the sales reps have more than 5 accounts that they manage?


-- 2. How many accounts have more than 20 orders?


-- 3. Which account has the most orders?


-- 4. Which accounts spent more than 30,000 usd total across all orders?


-- 5. Which accounts spent less than 1,000 usd total across all orders?


-- 6. Which account has spent the most with us?


-- 7. Which account has spent the least with us?


-- 8. Which accounts used facebook as a channel to contact customers more than 6 times?


-- 9. Which account used facebook most as a channel?


-- 10. Which channel was most frequently used by most accounts?
