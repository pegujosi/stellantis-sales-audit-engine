--query shows null quantity on sales column
SELECT COUNT(*) AS nulos
FROM fact_ventas
WHERE venta_bruta IS NULL;

--query shows null quantity per column (no primary key)
SELECT
COUNT(*) FILTER (WHERE fecha IS NULL) AS nulos_fecha,
COUNT(*) FILTER (WHERE unidades IS NULL) AS nulos_unidades,
COUNT(*) FILTER (WHERE venta_bruta IS NULL) AS nulos_venta
FROM fact_ventas;

--query shows total null quantity per column 
SELECT COUNT(*) - COUNT(*) FILTER (WHERE venta_bruta IS NOT NULL) AS nulos
FROM fact_ventas;

--query shows total null quantity on sales column
SELECT COUNT(*) - COUNT(venta_bruta) AS nulos
FROM fact_ventas;

--sales table general view
SELECT *
FROM fact_ventas
LIMIT 10;