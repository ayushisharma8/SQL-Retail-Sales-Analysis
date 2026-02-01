--Step1: Create a Staging Table (This table will store raw data (all as VARCHAR) without worrying about data type mismatches).
CREATE TABLE retail_sales_staging (
    transactions_id   VARCHAR(50),
    sale_date         VARCHAR(50),
    sale_time         VARCHAR(50),
    customer_id       VARCHAR(50),
    gender            VARCHAR(50),
    age               VARCHAR(50),
    category          VARCHAR(50),
    quantiy           VARCHAR(50),
    price_per_unit    VARCHAR(50),
    cogs              VARCHAR(50),
    total_sale        VARCHAR(50)
);

--Created a table which will allow all column save as varchar (Let's check with select query)
SELECT * FROM retail_sales_staging

--Step2: Import CSV into the Staging Table (Use BULK INSERT (or Import Wizard) without worrying about data types:)
BULK INSERT retail_sales_staging
FROM "C:\Users\sharm\Downloads\Retail Sales Analysis.csv"
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2,
    CODEPAGE = '65001' -- Ensures UTF-8 compatibility
);

--Table is filled with data but the data type is string for all columns
SELECT * FROM retail_sales_staging
