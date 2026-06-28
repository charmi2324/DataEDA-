-- Which 5 Products generate the highest revenue?
   SELECT TOP 5
   p.product_name,
   p.subcategory,
   SUM(f.sales_amount) AS highest_revenue
   FROM dbo.fact_sales f
   LEFT JOIN dbo.dim_products p
   ON p.product_key = f.product_key
   GROUP BY P.subcategory,p.product_name
   ORDER BY highest_revenue DESC

-- highest revenue by window function
   SELECT
   * FROM(
       SELECT
       p.product_name,
       p.subcategory,
       SUM(f.sales_amount) AS highest_revenue,
       ROW_NUMBER() OVER(ORDER BY SUM(f.sales_amount) DESC) As Rank_products
       FROM dbo.fact_sales f
       LEFT JOIN dbo.dim_products p
       ON p.product_key = f.product_key
       GROUP BY P.subcategory,p.product_name
   )t WHERE Rank_products <= 5
   

-- What are the 5 worst-performing products in terms of sales?
    SELECT TOP 5
   p.product_name,
   p.subcategory,
   SUM(f.sales_amount) AS highest_revenue
   FROM dbo.fact_sales f
   LEFT JOIN dbo.dim_products p
   ON p.product_key = f.product_key
   GROUP BY P.product_name,p.subcategory
   ORDER BY highest_revenue ASC

-- Find the top 10 customers who have generated the highest revenue
   SELECT TOP 10
   c.customer_key,
   c.first_name,
   c.last_name,
   SUM(f.sales_amount) AS total_revenue
   FROM dbo.fact_sales f
   LEFT JOIN dbo.dim_customers c
   ON c.customer_key = f.customer_key
   GROUP BY 
   c.customer_key,
   c.first_name,
   c.last_name
   ORDER BY total_revenue DESC

-- the 3 fewest order placed by customer
   SELECT TOP 3
   c.customer_key,
   c.first_name,
   c.last_name,
   COUNT(DISTINCT f.order_number) AS total_orders
   FROM dbo.fact_sales f
   LEFT JOIN dbo.dim_customers c
   ON c.customer_key = f.customer_key
   GROUP BY 
   c.customer_key,
   c.first_name,
   c.last_name
   ORDER BY total_orders 
   