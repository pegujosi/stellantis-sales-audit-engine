/*
==========================================================
AUTOR:       JSPG
FECHA:       2025-01-22
DESCRIPCIÓN: Query para correccion de marcas.
PROCESO:     1. Remplaza nombre de marcas con minusculas.
             2. Crea vista con marcas corregidas.
==========================================================
*/
DROP VIEW IF EXISTS dim_vehiculos_cl;

CREATE OR REPLACE VIEW 
dim_vehiculos_cl AS
SELECT modelo, id_vehiculo,
	REPLACE(
		REPLACE(
			REPLACE(
				REPLACE(
					REPLACE(
						REPLACE(
							REPLACE(marca,'ram','RAM'),
						'peugeot','Peugeot'),
					'ram','RAM'),
				'alfa romeo','Alfa Romeo'),
			'jeep','Jeep'),
		'fiat', 'Fiat'),
	'dodge','Dodge') AS marcas_cl
FROM dim_vehiculos;

--Revisa como quedo la vista
SELECT*
FROM dim_vehiculos_cl;

--Agrupa ventas por marca corroborar vs dashboard
SELECT v.marcas_cl,
SUM(f.venta_bruta_sn) AS ventas_pormarca
FROM fact_ventas_cl f
JOIN dim_vehiculos_cl v ON f.id_vehiculo=v.id_vehiculo
GROUP BY v.marcas_cl
;