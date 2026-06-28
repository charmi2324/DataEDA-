-- Find The Date of first and Last order.
-- How Many Years of Sales are Available also find out months and days


SELECT 
MIN(order_date) first_Order_date,
MAX(order_date) last_order_date,
DATEDIFF(year ,MIN(order_date),MAX(order_date)) AS order_range_year,
DATEDIFF(month ,MIN(order_date),MAX(order_date)) AS order_range_month,
DATEDIFF(day ,MIN(order_date),MAX(order_date)) AS order_range_day
FROM dbo.fact_sales


-- Find youngest and Oldest customer
SELECT 
MIN(birthdate) AS oldest_birthdate,
DATEDIFF(year, MIN(birthdate), GETDATE()) AS oldest_age,
MAX(birthdate) AS youngest_birthdate,
DATEDIFF(year, MAX(birthdate), GETDATE()) AS youngest_age
FROM dbo.dim_customers