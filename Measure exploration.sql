-- Find the Total Sales
   SELECT
   SUM(sales_amount) AS total_sales
   FROM dbo.fact_sales

-- Find How Many Items are Sold
   SELECT 
   SUM(quantity) AS total_quantity
   FROM dbo.fact_sales

-- Find the Averaging Selling Price
   SELECT 
   AVG(price) AS Avg_price
   FROM dbo.fact_sales

-- Find the Total numbers of Orders
   SELECT 
   COUNT(order_number) AS total_orders,
   COUNT(DISTINCT order_number) AS Distinct_total_orders
   FROM dbo.fact_sales  

-- Find the Total numbers of Products
   SELECT 
   COUNT(product_name) AS total_products,
   COUNT(DISTINCT product_name) AS Distinct_total_products
   FROM dbo.dim_products

-- Find the Total numbers of Customers
   SELECT 
   COUNT(customer_key) AS total_customers,
   FROM dbo.dim_customers

-- Find the Total numbers of Customers that has placed an Orders
   SELECT 
   COUNT(DISTINCT customer_key) AS total_customers
   FROM dbo.fact_sales

-- Generate a Report that Show all key Metrics of the Business
      SELECT 'Total Sales' AS measure_name, SUM(sales_amount) AS measure FROM dbo.fact_sales
      UNION ALL
      SELECT 'Total Quantity' AS measure_name,SUM(quantity) AS measure FROM dbo.fact_sales
      UNION ALL
      SELECT 'AVG price'AS measure_name,AVG(price) AS measure FROM dbo.fact_sales
      UNION ALL
      SELECT 'Total Order' AS measure_name, COUNT(DISTINCT order_number) AS measure FROM dbo.fact_sales
      UNION ALL
      SELECT 'Total Nr. Products' AS measure_name, COUNT(product_name) AS measure FROM dbo.dim_products
      UNION ALL
      SELECT 'Total Nr. Customers' AS measure_name, COUNT(customer_key) AS measure FROM dbo.dim_customers
      