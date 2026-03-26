/*
============================================================================
AUTOR:       JSPG
FECHA:       2025-01-22
DESCRIPCIÓN: Vista para el reporte de ventas de fin de semana.
PROCESO:     1. Junta las tablas de ventas con la tabla de calendario.
             2. Suma las ventas realizadas únicamente en fin de semana.
             3. Agrupa por anio y mes
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
