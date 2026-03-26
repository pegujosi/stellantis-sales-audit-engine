# Stellantis Sales Audit Engine: SQL Data Cleaning & Audit

### 📌 Contexto del Proyecto
En el sector automotriz, la integridad de los datos de ventas y clientes es crítica para la planeación de producción y logística. Este proyecto simula un proceso de auditoría y limpieza de datos (Data Quality) para una base de datos de ventas de Stellantis, asegurando que la información esté lista para análisis de KPIs.

### 🛠️ Tecnologías Utilizadas
* **Base de Datos:** PostgreSQL
* **Lenguaje:** SQL (DML, DDL, Ventanas de tiempo, CTEs)
* **Herramientas:** Git/GitHub

### 📂 Estructura de Scripts
El pipeline sigue un orden lógico de auditoría y limpieza:
1. **Auditoría Inicial:** `01_null_detection.sql` a `03_duplicates_count.sql`. Identificación de huecos de información y redundancias.
2. **Transformación (Cleaning):** `04_cleansing_sales.sql` a `06_brand_correction.sql`. Estandarización de marcas y formatos.
3. **Business Logic:** `07_weekend_sales.sql` y `08_top_three.sql`. Consultas específicas para reporteo de ventas estratégicas.

### 🚀 Cómo Ejecutar
1. Clonar el repositorio.
2. Crear una base de datos en PostgreSQL.
3. Ejecutar los scripts en el orden numérico establecido.

---
**Contacto:** [JSPG] - [www.linkedin.com/in/joel-silverio-pérez-guerrero]