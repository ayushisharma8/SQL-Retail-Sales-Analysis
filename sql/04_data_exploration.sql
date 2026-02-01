--Data Exploration
--How many sales we have?
SELECT COUNT(*) AS Total_number_of_Sales
FROM retail_sales

--How many customer we have?
SELECT COUNT(DISTINCT(customer_id)) AS Total_Customers
FROM retail_sales

--How many categories we have?
SELECT DISTINCT(category) As Total_Category
FROM retail_sales
