# 5 . Get the products that have the highest and lowest manufacturing costs.

SELECT dp.product_code, dp.product, manufacturing_cost
FROM dim_product AS dp
JOIN fact_manufacturing_cost AS mc
ON dp.product_code = mc.product_code
WHERE manufacturing_cost = ( SELECT MAX(manufacturing_cost) AS manufacturing_cost FROM fact_manufacturing_cost) OR
	  manufacturing_cost = ( SELECT MIN(manufacturing_cost) AS manufacturing_cost FROM fact_manufacturing_cost)
ORDER BY manufacturing_cost DESC;