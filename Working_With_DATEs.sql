-- 1. Find the sales in terms of total dollars for all orders in each year, ordered from greatest to least. Do you notice any trends in the yearly sales totals?
SELECT DATE_PART('year', o.occurred_at) AS time, SUM(o.total_amt_usd) total
FROM orders o 
GROUP BY 1 ORDER BY 2 DESC;
-- 2017 and 2013 sales were much lower compared to all the other years
-- 2. Which month did Parch & Posey have the greatest sales in terms of total dollars? Are all months evenly represented by the dataset?
SELECT DATE_PART('month', o.occurred_at) AS time,  SUM(o.total_amt_usd)
FROM accounts a JOIN orders o ON o.account_id = a.id
GROUP BY 1 ORDER BY 2 DESC;

-- 3. Which year did Parch & Posey have the greatest sales in terms of total number of orders? Are all years evenly represented by the dataset?
SELECT DATE_PART('year', o.occurred_at) AS time,  COUNT(o.id) orders
FROM accounts a JOIN orders o ON o.account_id = a.id 
GROUP BY 1 ORDER BY 2 DESC;

-- 4. Which month did Parch & Posey have the greatest sales in terms of total number of orders? Are all months evenly represented by the dataset?
SELECT DATE_PART('month', o.occurred_at) AS time,  COUNT(o.id) orders
FROM accounts a JOIN orders o ON o.account_id = a.id 
GROUP BY 1 ORDER BY 2 DESC;

-- 5. In which month of which year did Walmart spend the most on gloss paper in terms of dollars?
SELECT DATE_TRUNC('month', o.occurred_at) AS time, a.name, SUM(o.gloss_amt_usd) 
FROM accounts a JOIN orders o ON o.account_id = a.id 
GROUP BY 1, 2 HAVING a.name = 'Walmart' ORDER BY sum DESC LIMIT 1;