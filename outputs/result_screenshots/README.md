### 📊 How many sales we have?
![Total Number of Sales](https://raw.githubusercontent.com/ayushisharma8/SQL-Retail-Sales-Analysis/main/outputs/result_screenshots/Total%20Number%20of%20Sales.png)

### 📊 How many customer we have?
![Total Customers](https://raw.githubusercontent.com/ayushisharma8/SQL-Retail-Sales-Analysis/b82581ce3c6a9c4cda5843f50bdf4a2381c8db4b/outputs/result_screenshots/Total%20Customers.png)


### 📊 How many categories we have?
![Distinct categories](https://raw.githubusercontent.com/ayushisharma8/SQL-Retail-Sales-Analysis/fdc40d123401538f1c93deb6e5e735d61c600ed0/outputs/result_screenshots/Distinct%20categories.png)


### Data Analysis & Business Key Problems

### 📊 Retrieve all columns with sales done on '2022-11-05'
![Sales on 05 November 2022](https://raw.githubusercontent.com/ayushisharma8/SQL-Retail-Sales-Analysis/ae4a67f4e206a852700591abf5a93b95e4c6d97d/outputs/result_screenshots/Sales%20done%20on%202022-11-05.png)


### Retrieve all transactions where the category is **'Clothing'** and the quantity sold is more than 1 in the month of **Nov-2022**.

### 📊 Clothing Category Sales (Quantity > 1, Nov 2022)
![Clothing quantity sold more than 1 for Nov 2022](https://raw.githubusercontent.com/ayushisharma8/SQL-Retail-Sales-Analysis/8b050eb1156566472edd4c646ba49d4bc4436d7d/outputs/result_screenshots/Category%20Clothing%20and%20quantity%20sold%20more%20than%201%20for%20Nov%202022.png)

### 📊 Calculate the total sales (**total_sale**) for each category.
![Total Sales for each category](https://raw.githubusercontent.com/ayushisharma8/SQL-Retail-Sales-Analysis/c5ea4987cb8c7ba64983fa46bf2d43a5cffd9e52/outputs/result_screenshots/Total%20Sales%20for%20each%20category.png)


### 📊 Find the average age of customers who purchased items from the **'Beauty'** category.
![Average age of customers who purchased beauty products](https://raw.githubusercontent.com/ayushisharma8/SQL-Retail-Sales-Analysis/c9c3532f0518caa62e59d2f127ead53a5afb81c6/outputs/result_screenshots/Avg%20age%20of%20customers%20purchased%20beauty%20products.png)


### 📊 Find all transactions where the **total_sale** is greater than 1000.
![Total Sales greater than 1000](https://raw.githubusercontent.com/ayushisharma8/SQL-Retail-Sales-Analysis/e18793fa1fd0e47010f89610df1db6d995c04225/outputs/result_screenshots/Total%20Sales%20greater%20than%201000.png)


### 📊 Find the total number of transactions (**transaction_id**) made by each gender in each category.
![Total transactions by each gender in each category](https://raw.githubusercontent.com/ayushisharma8/SQL-Retail-Sales-Analysis/990841595645e646fe578fe55d16edb62c0c0f2b/outputs/result_screenshots/Total%20transaction%20by%20each%20gender%20in%20each%20category.png)


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





