SELECT 
    CAST(YEAR(d.d_date) AS VARCHAR(4)) 
    + '-' +
    RIGHT('0' + CAST(MONTH(d.d_date) AS VARCHAR(2)), 2)  AS anio_mes,
    
    SUM(s.ss_quantity * s.ss_list_price)                  AS total_ventas
FROM store_sales AS s
INNER JOIN date_dim AS d
        ON s.ss_sold_date_sk = d.d_date_sk
WHERE NOT (YEAR(d.d_date) = 2005 AND MONTH(d.d_date) = 12)
GROUP BY 
    YEAR(d.d_date),
    MONTH(d.d_date)
ORDER BY 
    YEAR(d.d_date),
    MONTH(d.d_date);
