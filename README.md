# SQL-Retail-Sales-Analysis

# 🛍️ Retail Sales Analysis using SQL

## 📌 Project Overview
This project analyzes retail sales data to understand customer behavior,
sales performance, and operational trends using SQL.

## 🛠 Tools Used
- SQL Server
- T-SQL
- CSV Dataset

## 📂 Dataset
The dataset contains transaction-level retail sales data including:
- Customer demographics
- Product categories
- Sales amount
- Time and date of purchase

## 🧱 Database Design
- Staging table used to handle raw CSV data (all VARCHAR)
- Final table created with proper data types
- Data cleaned using NULL checks and deletions

## 🔍 Key SQL Concepts Used
- BULK INSERT
- Data type conversion (TRY_CAST, TRY_CONVERT)
- CTEs
- Window Functions (RANK)
- Aggregations & Group By
- Case Statements

## 📊 Business Questions Answered
- Total sales by category
- Best-selling month per year
- Top 5 customers by sales
- Customer distribution by age group
- Sales distribution by time shift (Morning/Afternoon/Evening)

## 📈 Key Insights
- Clothing and Beauty categories generate the highest revenue
- Afternoon shift records the maximum number of orders
- Customers aged 28–48 contribute the most sales

## 📁 Project Structure
Refer to the `/sql` folder for step-by-step SQL scripts.

## 🔗 Author
Ayushi Sharma
