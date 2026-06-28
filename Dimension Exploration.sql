-- Explore All Categories "The Major Divisions"
SELECT DISTINCT category , subcategory, product_name FROM dbo.dim_products
ORDER BY 1,2,3

--Explore All countries our customers coe from.
SELECT DISTINCT country FROM dbo.dim_customers