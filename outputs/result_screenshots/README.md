### 📊 How many sales we have?
[outputs/result_screenshots/Total Number of Sales.png
](https://github.com/ayushisharma8/SQL-Retail-Sales-Analysis/blob/1af7f2da5d4185c2a2ad66217a78527db88b47aa/outputs/result_screenshots/Total%20Number%20of%20Sales.png)
--How many customer we have?
SELECT COUNT(DISTINCT(customer_id)) AS Total_Customers
FROM retail_sales

--How many categories we have?
SELECT DISTINCT(category) As Total_Category
FROM retail_sales

--Data Analysis & Business Key Problems
--Retrieve all columns with sales done on '2022-11-05'
SELECT * FROM retail_sales
WHERE sale_date = '2022-11-05'

--To check the data types
EXEC sp_help 'retail_sales'; 


-- Retrieve all transactions where the category is **'Clothing'** and the quantity sold is more than 1 in the month of **Nov-2022**.

SELECT * FROM retail_sales
WHERE category = 'Clothing' and quantiy >1 and sale_date between '2022-11-01' and '2022-11-30'


-- Calculate the total sales (**total_sale**) for each category.
SELECT category As Category, Sum(total_sale) As Net_Sale, COUNT(total_sale) As Total_Orders
FROM retail_sales
GROUP BY category


-- Find the average age of customers who purchased items from the **'Beauty'** category.
SELECT AVG(age) As Average_age_of_customer_who_purchased_Beauty_Products
FROM retail_sales
WHERE category = 'Beauty'

-- Find all transactions where the **total_sale** is greater than 1000.
SELECT * FROM retail_sales
WHERE total_sale > 1000

-- Find the total number of transactions (**transaction_id**) made by each gender in each category.
SELECT  gender AS Gender, category AS Category, COUNT(*) As Total_number_of_transactions
FROM retail_sales
GROUP BY gender, category

-- Calculate the average sale for each month. Find out the best-selling month in each year.
-- Average Sale for Each Month
SELECT YEAR(sale_date) AS Year , 
DATENAME(MONTH,sale_date) AS Month, 
AVG(total_sale) AS AVG_Sales
FROM retail_sales
GROUP BY YEAR(sale_date),
DATENAME(MONTH,sale_date)

-- Best-Selling Month in Each Year

WITH MonthlySales AS
(
SELECT  YEAR(sale_date) AS Year, 
		DATENAME(MONTH,sale_date) AS Month, 
		Round(AVG(total_sale),0) AS AVG_Sales
FROM retail_sales
GROUP BY YEAR(sale_date),
		 DATENAME(MONTH,sale_date)
)
SELECT Year,
	Month,
	AVG_Sales,
	Rank
FROM
(
SELECT *,
		RANK() OVER (PARTITION BY Year ORDER BY AVG_Sales DESC) AS Rank
FROM MonthlySales) AS ranked
WHERE Rank = 1;


-- Find the **top 5 customers** based on the highest **total sales**.
SELECT TOP 5 customer_id, SUM(total_sale) AS Net_sale
FROM retail_sales
Group BY customer_id
ORDER BY SUM(total_sale) DESC

-- Find the number of **unique customers** who purchased items from each category.
SELECT category, COUNT(DISTINCT(customer_id)) AS No_Of_Unique_Customers
FROM retail_sales
GROUP BY category	

-- Create each **shift** and number of orders (**Example: Morning <=12, Afternoon Between 12 & 17, Evening >17**).

SELECT 
CASE 
	WHEN sale_time < '12:00:00' THEN 'Morning' 
	WHEN sale_time >= '12:00:00' AND sale_time < '17:00:00' THEN 'Afternoon' ELSE
	'Evening'
	END As Shift,
	 COUNT(*) AS Number_of_Orders
FROM retail_sales
GROUP BY 
CASE 
	WHEN sale_time < '12:00:00' THEN 'Morning' 
	WHEN sale_time >= '12:00:00' AND sale_time < '17:00:00' THEN 'Afternoon' ELSE
	'Evening'
	END


-- Create each shift and number of orders accrding to age (Age > 18 and < 28 younge age, Age > 28 and 48 middle age and above 48 old age
SELECT
CASE
	WHEN age >= 18 AND age < 28 THEN '18 - 28'
	WHEN age >= 28 AND age < 48 THEN '28 - 48'
	ELSE '48 - 64'
END AS Age_Group,

	COUNT(*) AS Number_of_Orders
	FROM retail_sales
	GROUP BY 
	
CASE
	WHEN age >= 18 AND age < 28 THEN '18 - 28'
	WHEN age >= 28 AND age < 48 THEN '28 - 48'
ELSE '48 - 64'
END
order by COUNT(*) desc


-- Find Top 5 quantity ordered of which category and which customer
WITH RankedOrders AS 
(SELECT category,
		customer_id, 
		COUNT(quantiy) AS Total_Quantity_Ordered,
		RANK() OVER (PARTITION BY category ORDER BY COUNT(quantiy) DESC) AS rank
FROM retail_sales
GROUP BY category,
	customer_id)
SELECT category,
		customer_id,
		Total_Quantity_Ordered,
		rank
FROM RankedOrders
WHERE rank<=5
ORDER BY 
		category,
		Total_Quantity_Ordered DESC





