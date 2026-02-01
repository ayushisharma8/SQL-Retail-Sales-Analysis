--Data Cleaning

--Total Count of Rows
SELECT 
	COUNT(*) 
FROM retail_sales

--How many null values 
SELECT *
FROM retail_sales
WHERE transactions_id IS NULL

SELECT *
FROM retail_sales
WHERE sale_date IS NULL

SELECT *
FROM retail_sales
WHERE sale_time IS NULL

SELECT *
FROM retail_sales
WHERE customer_id IS NULL

SELECT *
FROM retail_sales
WHERE gender IS NULL

SELECT Count(*)
FROM retail_sales
WHERE age IS NULL

SELECT Count(*)
FROM retail_sales
WHERE age IS NULL

SELECT Count(*) AS Null_Category
FROM retail_sales
WHERE category IS NULL

SELECT Count(*) AS Null_Quantity
FROM retail_sales
WHERE quantiy IS NULL

SELECT Count(*) AS Null_Price_per_unit
FROM retail_sales
WHERE price_per_unit IS NULL

SELECT Count(*) As Null_Cogs
FROM retail_sales
WHERE cogs IS NULL

SELECT Count(*) AS Null_Total_sales
FROM retail_sales
WHERE total_sale IS NULL


--Or other way to find null values:


SELECT 
    SUM(CASE WHEN transactions_id IS NULL THEN 1 ELSE 0 END) AS Null_Transactions_ID,
    SUM(CASE WHEN sale_date IS NULL THEN 1 ELSE 0 END) AS Null_Sale_Date,
    SUM(CASE WHEN sale_time IS NULL THEN 1 ELSE 0 END) AS Null_Sale_Time,
    SUM(CASE WHEN customer_id IS NULL THEN 1 ELSE 0 END) AS Null_Customer_ID,
    SUM(CASE WHEN gender IS NULL THEN 1 ELSE 0 END) AS Null_Gender,
    SUM(CASE WHEN age IS NULL THEN 1 ELSE 0 END) AS Null_Age,
    SUM(CASE WHEN category IS NULL THEN 1 ELSE 0 END) AS Null_Category,
    SUM(CASE WHEN quantiy IS NULL THEN 1 ELSE 0 END) AS Null_Quantity,
    SUM(CASE WHEN price_per_unit IS NULL THEN 1 ELSE 0 END) AS Null_Price_Per_Unit,
    SUM(CASE WHEN cogs IS NULL THEN 1 ELSE 0 END) AS Null_Cogs,
    SUM(CASE WHEN total_sale IS NULL THEN 1 ELSE 0 END) AS Null_Total_Sales
FROM retail_sales;


--or

SELECT * FROM retail_sales
WHERE transactions_id IS NULL
or sale_date IS NULL
or sale_date IS NULL
or customer_id IS NULL
or gender IS NULL
or age IS NULL
or category IS NULL
or quantiy IS NULL
or price_per_unit IS NULL
or cogs IS NULL
or total_sale IS NULL

--Delete all the null values
DELETE FROM retail_sales
WHERE 
transactions_id IS NULL
or sale_date IS NULL
or sale_date IS NULL
or customer_id IS NULL
or gender IS NULL
or age IS NULL
or category IS NULL
or quantiy IS NULL
or price_per_unit IS NULL
or cogs IS NULL
or total_sale IS NULL;

select * from retail_sales
