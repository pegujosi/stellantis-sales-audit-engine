--Identify errors
SELECT COUNT(*) AS email_error
FROM dim_clientes
WHERE email LIKE '%\_err%' ESCAPE '\'
OR email LIKE '%@@%';

/*
==================================================================================
AUTHOR:       JSPG
DATE:        2025-01-22
DESCRIPTION: Clear view of clients table.
PROCESS:     1. Fix errors on email adress
			 2. Creates view without errors of '@@' & '_err'.
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


--General view
SELECT *
FROM dim_clientes;