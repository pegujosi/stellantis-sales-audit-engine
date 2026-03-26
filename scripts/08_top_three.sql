/*
===============================================================================
AUTHOR:       JSPG
DATE:       2025-01-22
DESCRIPTION: Top three on sales by location view.
PROCESS:     1. Paste sales table with clients and geography.
             Note: clear data views are necessary.
===============================================================================
*/
DROP VIEW IF EXISTS top_three;

CREATE OR REPLACE VIEW top_three AS
SELECT g.estado,c.nombre_completo,f.venta_bruta_sn
FROM fact_ventas_cl f
JOIN dim_clientes_cl c
ON f.id_cliente = c.id_cliente
JOIN dim_geografia g
ON f.id_ubicacion = g.id_ubicacion
;
--Top three visualization group by state, compare against dashboard
WITH ranking AS (
SELECT *, DENSE_RANK() OVER(PARTITION BY estado ORDER BY venta_bruta_sn DESC) AS top_sales
FROM top_three
)
SELECT * 
FROM ranking
WHERE top_sales <= 3
ORDER BY estado, top_sales
;