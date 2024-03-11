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
