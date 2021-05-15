-- Try pulling all the data from the accounts table, and all the data from the orders table.

-- Try pulling standard_qty, gloss_qty, and poster_qty from the orders table, and the website and 
-- the primary_poc from the accounts table.


	 SELECT accounts.*, orders.* FROM accounts JOIN orders ON accounts.id = orders.account_id;

     SELECT orders.standard_qty, orders.gloss_qty, orders.poster_qty, accounts.website, accounts.primary_poc 
     FROM accounts JOIN orders ON orders.account_id = accounts.id;


-- Provide a table for all web_events associated with account name of Walmart. There should be three columns. 
-- Be sure to include the primary_poc, time of the event, and the channel for each event. Additionally, you might 
-- choose to add a fourth column to assure only Walmart events were chosen.




-- w3 List the number of customers in each country, ordered by the country with the most customers first.
SELECT COUNT(CustomerID), Country FROM Customers GROUP BY Country ORDER BY COUNT(CustomerID) DESC;

-- Provide a table for all web_events associated with account name of Walmart.
--  There should be three columns. Be sure to include the primary_poc, time of
--   the event, and the channel for each event. Additionally, you might choose
--    to add a fourth column to assure only Walmart events were chosen.

SELECT accounts.primary_poc, web_events.occurred_at, web_events.channel FROM web_events
 JOIN accounts ON web_events.account_id = accounts.id  WHERE accounts.name = 'Walmart';



--  Provide a table that provides the region for each sales_rep along with their 
--  associated accounts. Your final table should include three columns: the region
--   name, the sales rep name, and the account name. Sort the accounts alphabetically
--    (A-Z) according to account name.



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

