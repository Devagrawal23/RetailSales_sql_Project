select * from Retail_sales;
select count(*) from Retail_sales;

--    DATA CLEANING (find NUll in dataset)
select * from Retail_sales
    where age is null
	or
	age is null
	or
	category is null
	or
	quantiy is null
	or
	price_per_unit is null
	or
    cogs is null
	or
	total_sale is null;


--delete null records 

delete from Retail_sales
	 where age is null
	or
	age is null
	or
	category is null
	or
	quantiy is null
	or
	price_per_unit is null
	or
    cogs is null
	or
	total_sale is null;

--check if still there any null values
select * from Retail_sales
    where age is null
	or
	age is null
	or
	category is null
	or
	quantiy is null
	or
	price_per_unit is null
	or
    cogs is null
	or
	total_sale is null;

	select count(*) from Retail_sales;


-- DATA EXPLORATION 

--1. how many sales we have?

select count(*) as total_sales from Retail_sales;

--2 how many custumers we have?

select count(customer_id) as total_customers from Retail_sales;

--which product category we have ? 

select distinct category from Retail_sales;  --we use distinct to find unique values

--how many product category we have ? 
select count(distinct category) from Retail_sales;


--DATA ANALYSIS
-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05

select * from Retail_sales where sale_date = '2022-11-05';

---- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022

select * from Retail_sales where category = 'Clothing' AND quantiy >= 4 AND sale_date  between '2022-11-01' AND '2022-11-30';

---- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.

select category, sum(total_sale) as total_sales   from Retail_sales group by category;

---- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.

select ROUND (AVG(age),2) as AVG_Age from Retail_sales where category = 'Beauty';   --we use ROUND(2) for after decimal number

---- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.

select * from Retail_sales where total_sale > '1000' ;

---- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.

select  gender,category ,count(*) as total_transaction from Retail_sales group by gender,category;

---- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year

select EXTRACT(year from sale_date) as year,
       EXTRACT(month from sale_date) as month , 
	   AVG(total_sale) as avg_sale from Retail_sales
	   GROUP BY 1,2
	   ORDER BY 1,3 DESC;
	 
	   

---- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 

select customer_id , total_sale as highest_total_sale from Retail_sales order by total_sale DESC  limit 5;  -- we use ORDER BY to sort values from rows

---- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.


select category, count(distinct customer_id) from Retail_sales group by category;

--cast study 
---- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)

select *,
  case
  when extract(hour from sale_time) <= 12 then 'morning'       --extract is used to create column called hour
  when extract(hour from sale_time)  Between 12 AND 17 then 'Afternoon'
  else 'Evening'
  END as shift
  
from Retail_sales;


--End of the project

