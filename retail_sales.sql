create database retail_sales;
SELECT 
    COUNT(*)
FROM
    `sql - retail sales analysis_utf`;
show tables

select * from  `sql - retail sales analysis_utf`
where `transactions_id` is null;
 
update `sql - retail sales analysis_utf`
set `i>>?transactions_id` = transaction_id;

UPDATE `sql - retail sales analysis_utf`
SET `ï»¿transactions_id` = `transaction_id`;

SELECT * FROM `sql - retail sales analysis_utf`
WHERE `transactions_id` IS NULL;


SHOW COLUMNS FROM `sql - retail sales analysis_utf`;
-- Data Cleaning-- 
select * from  `sql - retail sales analysis_utf`
where sale_time is null
or
gender is null
or 
category is null
or 
quantiy is null
or 
cogs is null
or 
total_sale is null;

delete  from `sql - retail sales analysis_utf`
where sale_time is null
or
gender is null
or 
category is null
or 
quantiy is null
or 
cogs is null
or 
total_sale is null;

-- Data Exploration

select  count(*) as total_sales from `sql - retail sales analysis_utf` ;
select count(distinct(customer_id)) as total_cust from `sql - retail sales analysis_utf` 
select distinct(category) from `sql - retail sales analysis_utf` 

-- Data Analysis

-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05
 SELECT 
    *
FROM
    `sql - retail sales analysis_utf`
WHERE
    sale_date = '2022-11-05';
 
 
  -- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 10 in the month of Nov-2022-- 
 SELECT 
    *
FROM
    `sql - retail sales analysis_utf`
WHERE
    category = 'clothing'
        AND DATE_FORMAT(sale_date, 'yyyy-mm') = '2022-11'
        AND quantiy >= 4
        
        
-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
SELECT 
    category,gender, count(*)
    SUM(total_sale) AS net_sales,
    COUNT(*) AS total_order
FROM
    `sql - retail sales analysis_utf`
GROUP BY 1

 -- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
 SELECT 
    ROUND(AVG(age), 2)
FROM
    `sql - retail sales analysis_utf`
WHERE
    category = 'beauty'
    
--  Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
  SELECT 
    *
FROM
    `sql - retail sales analysis_utf`
WHERE
    total_sale > 1000

-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category
 SELECT 
    category, gender, COUNT(*) AS total_sales
FROM
    `sql - retail sales analysis_utf`
GROUP BY category , gender
ORDER BY 1

-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year

    SELECT * 
FROM (
  SELECT 
    YEAR(sale_date) AS year, 
    MONTH(sale_date) AS month, 
    AVG(total_sale) AS avg_sale, 
    RANK() OVER (PARTITION BY YEAR(sale_date) order by avg(total_sale)desc) as rank_value
    from `sql - retail sales analysis_utf`
  GROUP BY YEAR(sale_date), MONTH(sale_date)
) AS t1 
WHERE rank_value = 1;

--  Q.8 Write a SQL query to find the top 5 customers based on the highest total sales  
SELECT 
    customer_id, SUM(total_sale) AS total_sales
FROM
    `sql - retail sales analysis_utf`
GROUP BY customer_id
ORDER BY total_sales DESC
LIMIT 5;

-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category. 
  SELECT 
    category, COUNT(DISTINCT (customer_id))
FROM
    `sql - retail sales analysis_utf`
GROUP BY 1


-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)
with hour_shift
as
(select * ,
	case 
		when hour(sale_time) < 12 then 'morning'
        when hour(sale_time) between 12 and 17 then 'Afternon'
        else 'Evening'
        end as shift
        from `sql - retail sales analysis_utf`)
select shift,count(*) as total_orders
from hour_shift
group by shift        

		
-- My Analysis & Findings
-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05
-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 10 in the month of Nov-2022
-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year
-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 
-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.
-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)


    
    


