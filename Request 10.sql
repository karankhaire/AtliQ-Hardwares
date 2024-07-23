# 10 Get the Top 3 products in each division that have a high total_sold_quantity in the fiscal_year 2021?

WITH top_products_sold AS 
(
 SELECT a.division, a.product_code, a.product, 
 SUM(b.sold_quantity) AS total_sold_quantity
 FROM dim_product AS a
 JOIN fact_sales_monthly AS b
 ON a.product_code = b.product_code
 WHERE fiscal_year = '2021'
 GROUP BY a.division, a.product_code, a.product
 ORDER BY total_sold_quantity DESC
),

top_sold_by_division AS
(
 SELECT division, product_code, product, total_sold_quantity, 
 DENSE_RANK () OVER (PARTITION BY division ORDER BY total_sold_quantity DESC) AS rank_order
 FROM top_products_sold
)
SELECT * FROM top_sold_by_division
WHERE rank_order <= 3;