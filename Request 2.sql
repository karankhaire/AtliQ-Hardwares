# 2 What is the percentage of unique product increase in 2021 vs. 2020?

WITH cte1 AS
(
SELECT COUNT(DISTINCT product_code) AS unique_products_2020
FROM fact_sales_monthly
WHERE fiscal_year = '2020'
),

cte2 AS 
(
SELECT COUNT(DISTINCT product_code) AS unique_products_2021
FROM fact_sales_monthly
WHERE fiscal_year = '2021'
)
SELECT unique_products_2020,unique_products_2021, ROUND((unique_products_2021 - unique_products_2020) * 100 / unique_products_2020,2) AS percentage_change
FROM cte1, cte2;


# Alernate solution
SELECT X.A AS unique_product_2020, Y.B AS unique_products_2021, ROUND((B-A)*100/A, 2) AS percentage_chg
FROM
     (
      (SELECT COUNT(DISTINCT(product_code)) AS A FROM fact_sales_monthly
      WHERE fiscal_year = 2020) X,
      (SELECT COUNT(DISTINCT(product_code)) AS B FROM fact_sales_monthly
      WHERE fiscal_year = 2021) Y 
	 );