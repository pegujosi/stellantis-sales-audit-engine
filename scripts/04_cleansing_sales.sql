/*
==================================================================================
AUTOR:       JSPG
FECHA:       2025-01-22
DESCRIPCIÓN: Vista limpia de tabla de ventas para reporte.
PROCESO:     1. Elimina duplicados.
             2. Pega dos tablas para calcular el promedio por marca.
             3. Imputa nulos con el promedio de la marca.
			 4. Genera la vista sin duplicados y sin nulos.
==================================================================================
*/
DROP VIEW IF EXISTS fact_ventas_cl;

CREATE OR REPLACE VIEW fact_ventas_cl AS
WITH
--Create a discriminant for duplicates
duplicados AS(                                                                          
	SELECT *,
	ROW_NUMBER() OVER(PARTITION BY id_transaccion ORDER BY id_transaccion) AS discriminante
	FROM fact_ventas
),
--Join tables including duplicates and brand, then aply filter without duplicates 
nonulos AS(
	SELECT f.*, v.modelo, v.marca
	FROM dim_vehiculos v
	JOIN duplicados f
	ON v.id_vehiculo = f.id_vehiculo 
	WHERE discriminante = 1 
),
--Calculates average per brand
nulosavg AS(
	SELECT *,
	ROUND(AVG(venta_bruta) OVER(PARTITION BY marca)::numeric,0) AS promedio_marca
	FROM nonulos 
),
--Fill nulls with average per brand
tabla_limpia AS(
	SELECT *,
	COALESCE (venta_bruta, promedio_marca) AS venta_bruta_sn
	FROM nulosavg 
)
--Create final view using only the same columns as the original table
SELECT id_transaccion,id_vehiculo,id_ubicacion,id_cliente,fecha,unidades,venta_bruta_sn
FROM tabla_limpia;
-- view result view with no nulls and no duplicates.
SELECT *
FROM fact_ventas_cl;
