# 4 Which segment had the most increase in unique products in 2021 vs 2020? The final output contains these fields, segment product_count_2020 product_count_2021

WITH cte AS 
(
 SELECT 
   a.segment AS segment,
    COUNT(distinct
         (CASE WHEN fiscal_year = '2020' THEN a.product_code END)) AS product_count_2020,
	COUNT(DISTINCT
		 (CASE WHEN fiscal_year = '2021' THEN a.product_code END)) AS product_count_2021
  FROM dim_product AS a
  JOIN fact_sales_monthly AS b
  ON a.product_code = b.product_code
  GROUP BY a.segment
)
SELECT segment, product_count_2020, product_count_2021, (product_count_2021 - product_count_2020) AS product_count_difference
FROM cte
ORDER BY product_count_difference DESC;