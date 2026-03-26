/*
============================================================================
AUTHOR:       JSPG
DATE:         2025-01-22
DESCRIPTION: VIEW FOR WEEKEND SALES.
PROCESS:     1. Paste sales table and calendar table.
             2. Sums sales done only on weekends.
             3. Groups by year and month.
============================================================================
*/
CREATE OR REPLACE VIEW ventas_fs AS

WITH ventas AS(
SELECT f.fecha,f.unidades,c.anio,c.mes,c.nombre_mes,c.es_fin_semana
FROM fact_ventas f
JOIN dim_calendario c
ON f.fecha = c.fecha
)
SELECT anio,mes,nombre_mes,
SUM(unidades) FILTER(WHERE es_fin_semana=1) AS ventas_fs
FROM ventas
GROUP BY anio,mes,nombre_mes
ORDER BY anio,mes;
