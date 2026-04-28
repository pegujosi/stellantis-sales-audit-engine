# Stellantis Sales Audit Engine: ETL pipeline process

## Data extraction and cleaning from stellantis_db using SQL

### 📌 Background 1 (SQL)
In automotive companies, the integrity of sales and customer data are critical for production, sales and logistics planning. This project simulates a data quality audit and initial cleansing process for a stellantis_db database, To avoid modifying the original database, SQL files create many views, those views also can be loaded for data visualization without affecting original database, keeping data integrity.

#### 🛠️ Implemented technologies
* **Data Base:** PostgreSQL
* **Language:** SQL (DML, window functions, CTEs)
* **Tools:** pgAdmin, Git/GitHub

#### 📂 Scripts structures
The pipeline follows a logical order of auditing and cleaning:
1. **Initial EDA:** `01_null_detection.sql` to `03_duplicates_count.sql`. Identifying information gaps and duplicate data.
2. **Transformation (Cleaning):** `04_cleansing_sales.sql` to `06_brand_correction.sql`. Brands and formats standarization.
3. **Business Logic:** `07_weekend_sales.sql` and `08_top_three.sql`. Specific queries to report.

#### 🚀 How to execute?
1. Clone the repository.
2. Create a PostgreSQL database using the backup file data/stellantis_db.tar.
3. Run the scripts in the specified numerical order.

## Data analysis and transformation from stellantis_db using Python

### 📌 Background 2 (Python)
To start handling outliers, we created two files called raw_data.parquet and clean_data.parquet coming from views created previously on SQL, We continue doing a deeper cleaning of data, such as changing types and deleting duplicates.
Next, we identify outliers using Median Absolute Deviation and robust Z-score then impute outliers by brand median and create an outlier report (reports/outlier.csv). At the end we can find clean_data.parquet such file does not include nulls, duplicates and outliers.
Next, we run some normality test and graphs in order to justify statistical treatment of outliers.
Finally we create a new table on directly from main.py file named fact_ventas_lake, this last table is totally cleaned data filled.

#### 🛠️ Implemented technologies
* **Data Base:** Pandas dataframes
* **Language:** Python, SQL
* **Tools:** VSC, Git/GitHub, scipy.stats, numpy, seaborn, matplotlib, sqlalchemy, pandas

#### 📂 Scripts structures
The pipeline follows a logical order of auditing and cleaning:
1. **Initial extraction:** `01_extraction.ipynb`. Performing data extraction from PostgreSQL.
2. **Transformation (Cleaning):** `02_cleaning.ipynb`. Outlier detection and imputation.
3. **Statistical analysis:** `03_statistical_analysis.ipynb`. Statistical tests.
4. **Data Load:** `main.py`. Creates a new table with cleaned and usable data.

#### 🚀 How to execute?
1. Run `main.py` file.

## Data visualization using Power BI

### 📌 Background 3 (Power BI)
Once data cleaned and transformed is loaded, we make data visualization on power BI, the target is to show four main points: 
1. Server conection.
2. Power query transformation.
3. DAX functions (measures).
4. Dashboard creation.

#### 🛠️ Implemented technologies
* **Data Base:** Server conection
* **Expressions:** DAX, M
* **Tools:** Power BI desktop, Power query.

#### 📂 File structure
The dashboard follows an "F" shape:
1. **Dashboard:** `dashboard.pdf`. On this dashboard we show two main KPI (Total sales and sold vehicles) through four years in several locations, targets for stakeholders are; top location on sales and fulfilment of monthly sales. 

#### 🚀 How to execute?
1. Open `reports/dashboard.pdf` file.

---
**Contacto:** [JoelSPG] - [www.linkedin.com/in/joel-silverio-pérez-guerrero]