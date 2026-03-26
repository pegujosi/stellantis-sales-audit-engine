--Query shows all repetitive transactions
SELECT id_transaccion, COUNT(*) AS repeticiones
FROM fact_ventas
GROUP BY id_transaccion
HAVING COUNT(*) >1
ORDER BY id_transaccion;

--Query shows total vs duplicates
SELECT COUNT(id_transaccion) AS conteo_total,
COUNT(DISTINCT id_transaccion) AS filas_unicas
FROM fact_ventas;

--Query counts total duplicate transactions
SELECT COUNT(id_transaccion) - COUNT(DISTINCT id_transaccion) AS repetidos
FROM fact_ventas;

--General view
SELECT *
FROM fact_ventas;