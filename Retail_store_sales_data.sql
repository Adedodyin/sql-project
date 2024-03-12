/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (10) [transaction_id]
      ,[customer_id]
      ,[payment_method]
      ,[total_amount]
      ,[payment_date]
      ,[items_purchased]
      ,[quantity]
      ,[unit_price]
      ,[discount_amount]
      ,[store_location]
  FROM [Case Study].[dbo].[retail_store]

/* To find the total revenue generated from all transactions? */
  SELECT SUM(unit_price * quantity) AS revenue 
  FROM retail_store;

/* To find the different payment methods used by customers */
SELECT DISTINCT payment_method AS different_payment_method
FROM retail_store;

SELECT COUNT(customer_id), payment_method 
FROM retail_store 
GROUP BY payment_method;

/* To find the average amount spent per transaction */
SELECT AVG(total_amount) AS average_amount_per_transaction
FROM retail_store;

/* To find the distribution of dates over time */
SELECT payment_date, AVG(total_amount) AS average_amount
FROM retail_store
GROUP BY payment_date
ORDER BY payment_date ASC;

SELECT MIN(payment_date) AS earliest_date, 
MAX(payment_date) AS latest_date
FROM retail_store;
