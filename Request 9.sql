# 9 Which channel helped to bring more gross sales in the fiscal year 2021 and the percentage of contribution?

WITH cte AS 
(
 SELECT channel, 
 ROUND(SUM(gross_price*sold_quantity)/1000000,2) AS gross_sales_mln
 FROM dim_customer AS c
 JOIN fact_sales_monthly AS sm
 ON c.customer_code = sm.customer_code
 JOIN fact_gross_price AS gp
 ON sm.product_code = gp.product_code
 WHERE sm.fiscal_year = '2021'
 GROUP BY channel
)

 SELECT channel,
 CONCAT(gross_sales_mln, ' M $') AS gross_sales_mln,
 CONCAT(ROUND(gross_sales_mln/total*100,2),'%') AS contribution_percentage
 FROM
 (
  (SELECT SUM(gross_sales_mln) AS total FROM cte) AS a,
  (SELECT * FROM cte) AS b
)
 ORDER BY contribution_percentage DESC;
