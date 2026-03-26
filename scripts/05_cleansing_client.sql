--View table 
SELECT *
FROM dim_clientes;

--Identify errors
SELECT COUNT(*) AS email_error
FROM dim_clientes
WHERE email LIKE '%\_err%' ESCAPE '\'
OR email LIKE '%@@%';

/*
==================================================================================
AUTOR:       JSPG
FECHA:       2025-01-22
DESCRIPCIÓN: Vista limpia de tabla de clientes para reporte.
PROCESO:     1. Remplaza errores.
			 2. Genera la vista sin errores '@@' & '_err'.
==================================================================================
*/
DROP VIEW IF EXISTS dim_clientes_cl;

CREATE OR REPLACE VIEW dim_clientes_cl AS
WITH
tabla_limpia_clientes AS(
--Change values and create columns without errors
SELECT *, REPLACE(REPLACE(email,'_err','m'),'@@','@') AS email_cl
FROM dim_clientes
)
--Create final view using only the same columns as the original table
SELECT id_cliente,nombre_completo,email_cl,edad
FROM tabla_limpia_clientes;
-- view result view with no nulls and no duplicates.
SELECT *
FROM dim_clientes_cl;


