-- 1. How many of the sales reps have more than 5 accounts that they manage?
SELECT s.name, COUNT(*) amount FROM sales_reps s JOIN accounts a ON s.id = a.sales_rep_id  GROUP BY s.name HAVING COUNT(*)  > 5;

-- 2. How many accounts have more than 20 orders?
SELECT a.name, COUNT(*) amount FROM accounts a JOIN orders o ON o.account_id = a.id  GROUP BY a.name HAVING COUNT(*)  > 20;

-- 3. Which account has the most orders?
SELECT a.name, COUNT(*) max FROM accounts a JOIN orders o ON o.account_id = a.id  GROUP BY a.name ORDER BY COUNT(*) DESC LIMIT 1;

-- 4. Which accounts spent more than 30,000 usd total across all orders?
SELECT a.name, SUM(o.total_amt_usd) spent FROM accounts a JOIN orders o ON o.account_id = a.id  GROUP BY a.name HAVING SUM(o.total_amt_usd) > 30000 ORDER BY spent;

-- 5. Which accounts spent less than 1,000 usd total across all orders?
SELECT a.name, SUM(o.total_amt_usd) spent FROM accounts a JOIN orders o ON o.account_id = a.id  GROUP BY a.name HAVING SUM(o.total_amt_usd) < 1000 ORDER BY spent;

-- 6. Which account has spent the most with us?
SELECT a.name, SUM(o.total_amt_usd) spent FROM accounts a JOIN orders o ON o.account_id = a.id  GROUP BY a.name ORDER BY spent DESC LIMIT 1;

-- 7. Which account has spent the least with us?
SELECT a.name, SUM(o.total_amt_usd) spent FROM accounts a JOIN orders o ON o.account_id = a.id  GROUP BY a.name ORDER BY spent LIMIT 1;

-- 8. Which accounts used facebook as a channel to contact customers more than 6 times?
SELECT a.name, COUNT(w.id) FROM accounts a JOIN web_events w ON w.account_id = a.id GROUP BY a.name, w.channel  HAVING COUNT(w.id) > 6 AND w.channel = 'facebook';

-- 9. Which account used facebook most as a channel?
SELECT a.name, COUNT(w.id) FROM accounts a JOIN web_events w ON w.account_id = a.id GROUP BY a.name, w.channel  HAVING COUNT(w.id) > 6 AND w.channel = 'facebook' ORDER BY count DESC LIMIT 1;
