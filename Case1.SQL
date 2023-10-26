-- Extract revenue per productName : 

with selection_screen AS (
SELECT p.ProductName AS ProductName,
sum(s.REVENUE) AS revenue,
date_trunc('month', s.ORDERDATE) AS order_month
FROM Subscriptions s 
JOIN Products p 
ON s.ProductID = p.ProductID 
WHERE s.ORDERDATE BETWEEN '2022-01-01' AND '2022-12-31'
GROUP BY order_month, ProductName)

SELECT  ProductName,
MIN(revenue) AS min_rev,
MAX(revenue) AS max_rev,
AVG(revenue) AS avg_rev,
stddev(REVENUE) AS STD_DEV_REV
FROM 
selection_screen
GROUP BY ProductName ; 
