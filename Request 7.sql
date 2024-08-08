#7 Get the complete report of the Gross sales amount for the customer “Atliq Exclusive” for each month.

SELECT
MONTH(date) AS month_,
YEAR(date) AS year_,
ROUND(SUM(gross_price*sold_quantity)/1000000,2) AS Gross_sales_Amount
FROM fact_sales_monthly AS a
JOIN fact_gross_price AS b
ON a.product_code = b.product_code
GROUP BY month_name, year_;
