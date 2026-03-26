/*
==========================================================
AUTHOR:       JSPG
DATE:       2025-01-22
DESCRIPTION: Query for fix grammar bran.
PROCESS:     1. Replace brand names with lowercase letters. 
			 2. Create a view with the corrected brands.
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

--General view
SELECT*
FROM dim_vehiculos_cl;

--Goup sales by brand, check against dashboard
SELECT v.marcas_cl,
SUM(f.venta_bruta_sn) AS ventas_pormarca
FROM fact_ventas_cl f
JOIN dim_vehiculos_cl v ON f.id_vehiculo=v.id_vehiculo
GROUP BY v.marcas_cl
;