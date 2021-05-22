--   1.Provide a table that provides the region for each sales_rep along with their 
--   associated accounts. This time only for the Midwest region. Your final table 
--   should include three columns: the region name, the sales rep name, and the account 
--   name. Sort the accounts alphabetically (A-Z) according to account name.
SELECT region.name RegionName, sales_reps.name SalesRepName, accounts.name AccountsName 
FROM region JOIN sales_reps ON region.id = sales_reps.region_id JOIN accounts 
ON sales_reps.id = accounts.sales_rep_id WHERE region.name = 'Midwest' ORDER BY accounts.name;

-- 2.Provide a table that provides the region for each sales_rep along with their associated accounts. This time
--  only for accounts where the sales rep has a first name starting with S and in the Midwest region. Your final
--   table should include three columns: the region name, the sales rep name, and the account name. Sort the accounts 
--   alphabetically (A-Z) according to account name.
SELECT region.name region_name, sales_reps.name sales_reps_name, accounts.name accounts_name
FROM region JOIN sales_reps ON region.id = sales_reps.region_id JOIN accounts 
ON sales_reps.id = accounts.sales_rep_id WHERE sales_reps.name LIKE 'S%' 
AND region.name = 'Midwest' ORDER BY accounts.name;

-- 3.Provide a table that provides the region for each sales_rep along with their associated 
-- accounts. This time only for accounts where the sales rep has a last name starting with K
--  and in the Midwest region. Your final table should include three columns: the region name, 
--  the sales rep name, and the account name. Sort the accounts alphabetically (A-Z) according to account name.
SELECT region.name region_name, sales_reps.name sales_reps_name, accounts.name accounts_name
FROM region JOIN sales_reps ON region.id = sales_reps.region_id JOIN accounts 
ON sales_reps.id = accounts.sales_rep_id WHERE sales_reps.name LIKE '% K%' 
AND region.name = 'Midwest' ORDER BY accounts.name;

-- 4.Provide the name for each region for every order, as well as the account name and the unit 
-- price they paid (total_amt_usd/total) for the order. However, you should only provide the results 
-- if the standard order quantity exceeds 100. Your final table should have 3 columns: region name,
--  account name, and unit price. In order to avoid a division by zero error, adding .01 to the denominator
--   here is helpful total_amt_usd/(total+0.01).
SELECT  accounts.name accname, orders.total_amt_usd/(orders.total + 0.01) untprice, region.name
FROM accounts JOIN orders ON accounts.id = orders.account_id JOIN sales_reps ON accounts.sales_rep_id = sales_reps.id
JOIN region ON sales_reps.region_id = region.id WHERE orders.standard_qty > 100;
-- 5.Provide the name for each region for every order, as well as the account name and the unit price they paid 
-- (total_amt_usd/total) for the order. However, you should only provide the results if the standard order quantity 
-- exceeds 100 and the poster order quantity exceeds 50. Your final table should have 3 columns: region name, account
--  name, and unit price. Sort for the smallest unit price first. In order to avoid a division by zero error, 
--  adding .01 to the denominator here is helpful (total_amt_usd/(total+0.01).
SELECT  accounts.name accname, orders.total_amt_usd/(orders.total + 0.01) untprice, region.name
FROM accounts JOIN orders ON accounts.id = orders.account_id JOIN sales_reps ON accounts.sales_rep_id = sales_reps.id
JOIN region ON sales_reps.region_id = region.id WHERE orders.standard_qty > 100 AND orders.poster_qty > 50 ORDER BY untprice;

-- 6.Provide the name for each region for every order, as well as the account name and the unit price they paid
--  (total_amt_usd/total) for the order. However, you should only provide the results if the standard order quantity 
--  exceeds 100 and the poster order quantity exceeds 50. Your final table should have 3 columns: region name, account 
--  name, and unit price. Sort for the largest unit price first. In order to avoid a division by zero error,
--   adding .01 to the denominator here is helpful (total_amt_usd/(total+0.01).
SELECT  accounts.name accname, orders.total_amt_usd/(orders.total + 0.01) untprice, region.name
FROM accounts JOIN orders ON accounts.id = orders.account_id JOIN sales_reps ON accounts.sales_rep_id = sales_reps.id
JOIN region ON sales_reps.region_id = region.id WHERE orders.standard_qty > 100 AND orders.poster_qty > 50 ORDER BY untprice DESC;

-- 7.What are the different channels used by account id 1001? Your final table should have only 2 columns: account name 
-- and the different channels. You can try SELECT DISTINCT to narrow down the results to only the unique values.
SELECT accounts.name, web_events.channel FROM accounts JOIN web_events ON web_events.account_id = accounts.id WHERE accounts.id = 1001;

-- 8.Find all the orders that occurred in 2015. Your final table should have 4 columns: occurred_at, account name, order
--  total, and order total_amt_usd.
SELECT orders.occurred_at, accounts.name, orders.total, orders.total_amt_usd FROM orders JOIN accounts
ON accounts.id = orders.account_id WHERE orders.occurred_at BETWEEN '2014-12-31' AND '2015-12-12' ORDER BY occurred_at DESC, accounts.name; 
--last two just for making it nice to read