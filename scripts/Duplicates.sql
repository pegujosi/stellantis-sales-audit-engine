--MUESTRA TODAS LAS TRANSACCIONES REPETIDAS
SELECT id_transaccion, COUNT(*) AS repeticiones
FROM fact_ventas
GROUP BY id_transaccion
HAVING COUNT(*) >1
ORDER BY id_transaccion;

--MUESTRA EL CONTEO DE TOTALES VS CONTEO DE TOTALES REPETIDOS
SELECT COUNT(id_transaccion) AS conteo_total,
COUNT(DISTINCT id_transaccion) AS filas_unicas
FROM fact_ventas;

--MUESTRA LA CANTIDAD TOTAL DE TRANSACCIONES REPETIDAS 
SELECT COUNT(id_transaccion) - COUNT(DISTINCT id_transaccion) AS repetidos
FROM fact_ventas;

--MUESTRA LA TABLA
SELECT *
FROM fact_ventas;