# 6 Generate a report which contains the top 5 customers who received an average high pre_invoice_discount_pct for the fiscal year 2021 and in the Indian market.

SELECT c.customer_code, c.customer, 
CONCAT(ROUND(AVG(pre_invoice_discount_pct)*100,2),'%') AS average_discount_percentage
FROM dim_customer AS c
JOIN fact_pre_invoice_deductions AS pid
ON C.CUSTOMER_CODE = pid.customer_code
WHERE fiscal_year = '2021' AND market = 'India'
GROUP BY customer_code, customer
ORDER BY AVG(pre_invoice_discount_pct) DESC
LIMIT 5;