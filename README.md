# 🛍️ Shopiverse – BI Solution

## 📌 Project Introduction
**Project Name:** Shopiverse Data Analysis  

Shopiverse is a **Business Intelligence solution** designed to analyze e-commerce and retail data.  
The primary goal is to extract actionable insights from **sales, customer, and seller data** to improve business performance.  

By understanding:
- Customer purchasing behavior  
- Top-performing vendors  
- Sales trends over time  

We deliver **strategic recommendations** that optimize marketing efforts and increase profitability.

---

## 🛠️ Tech Stack
- **SQL Server** (Database, SSIS, SSAS, SSRS)  
- **Python (pandas, numpy)**  
- **Power BI**  
- **Tableau**  

---


## 🔄 [Data Journey](https://github.com/Zanatyy/Shopiverse/tree/main/Data%20for%20documentation)

### 1. Data Acquisition
- Collected raw datasets from multiple sources (CSV, Excel, etc.).  
- Ensured comprehensive coverage and granularity.  

### 2. Preprocessing in Python
- Used **pandas / numpy** for data import & cleaning.  
- Standardized schemas and column names.  
- Handled missing values & duplicates.  
- Consolidated all datasets into a single source of truth.  

### 3. [Loading into SQL Server with SSIS](https://github.com/Zanatyy/Shopiverse/tree/main/SSIS)
- Designed **ETL pipelines** using SQL Server Integration Services (SSIS).  
- Mapped source → target tables.  
- Implemented **error handling** and validation.  

### 4. [Database Design & Optimization](https://github.com/Zanatyy/Shopiverse/blob/main/v4.bak)
- Built ERD with entities: Customer, Address, Order, Order_Details, Product, Seller, Category.  
- Applied constraints, foreign keys, and relationships.  
- Created views, stored procedures, functions, and triggers for auditing & error handling.  

---

## 🗄️ [Data Warehouse (DWH)](https://github.com/Zanatyy/Shopiverse/blob/main/GS_DWH.bak)
- Designed a **Star Schema** with:
  - **Fact Table** → transactional data (sales, profit, quantity).  
  - **Dimension Tables** → descriptive data (Customer, Product, Seller, Date, Address).  
- Implemented ETL with SSIS to load structured data.  
- Added **Audit & Error tables** with triggers for compliance and governance.  

---

## 📊 Reporting & Analysis

### 1. (SSRS (SQL Server Reporting Services))[https://github.com/Zanatyy/Shopiverse/tree/main/SSRS]
- Built structured reports for **data validation & business reporting**.  
- Checked aggregates and anomalies.  

### 2. (SSAS (SQL Server Analysis Services))[https://github.com/Zanatyy/Shopiverse/tree/main/Final%20Project%20Cube]
- Created OLAP cubes & analytical models.  
- Enabled **multi-dimensional slicing, KPIs, and trend analysis**.  

### 3. Power BI Dashboards
- Interactive dashboards across dimensions:
  - **Products** → top sellers, movement speed, categories.  
  - **Customers** → demographics, segmentation, sales overview.  
  - **Sellers** → performance, trends, profitability.  
  - **Geography** → regional performance, shipping costs.  
  - **Facts** → sales & profit analysis.  

### 4. Tableau Visualizations
- Alternative dashboards for deep-dive exploration.  
- Segmentation, regional insights, product & customer trends.  

---

The Shopiverse project represents a **full end-to-end BI pipeline**:  

- **Data integration** → Raw → Cleaned → DWH  
- **Data governance** → Audit + Error handling  
- **Analytics** → SSRS & SSAS  
- **Visualization** → Power BI & Tableau  

This workflow transforms raw data into **reliable, actionable insights** that empower decision-makers in the retail & e-commerce industry.  

---

