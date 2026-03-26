--Query shows outliers on sales
--upper limit 4,800,000
--lower limit 340,000
SELECT 
COUNT(*) FILTER (WHERE venta_bruta >= 4800000) AS outliers_altos,
COUNT(*) FILTER (WHERE venta_bruta <= 340000) AS outliers_bajo,
COUNT(*) FILTER (WHERE venta_bruta <= 0) AS outliers_negativos
FROM fact_ventas;
