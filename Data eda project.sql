-- Explore all objects in the Databse 
   SELECT * FROM INFORMATION_SCHEMA.TABLES

-- Expore all Columns in the Database
   SELECT * FROM INFORMATION_SCHEMA.COLUMNS
   WHERE TABLE_NAME = 'dim_customers'