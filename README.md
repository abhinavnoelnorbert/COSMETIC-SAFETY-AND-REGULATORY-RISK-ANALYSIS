# Titanium Dioxide Exposure & Regulatory Risk Intelligence  
### U.S. Cosmetics Industry (Power BI | SQL | Data Modeling | DAX)

---

## Project Overview

This project analyzes **Titanium Dioxide exposure across the U.S. cosmetics industry** to assess **regulatory, reformulation, and compliance risk** at the **product, category, and company level**.

Titanium Dioxide is one of the most widely used cosmetic ingredients and is under increasing regulatory scrutiny due to potential carcinogenic and respiratory risks.  
The goal of this project is to move beyond simple counts and percentages and build a **decision-grade risk intelligence dashboard**.

---

## Business Problem

Regulators, cosmetic brands, and investors need to answer:

- How deeply is the cosmetics industry dependent on Titanium Dioxide?
- Which product categories are most exposed?
- Which companies face the highest regulatory and reformulation risk?
- Who would be impacted the most if Titanium usage were restricted or banned?

This project provides **data-backed answers** to these questions.

---

## Dataset

**Source:** California Safe Cosmetics Program (CSCP)

**Scope:**
- 36,972 cosmetic products  
- 123 regulated chemicals  
- 604 companies  
- Reporting period: 2009–2020  

Each record represents the usage of a regulated chemical in a cosmetic product.

---

## Data Engineering & Modeling

### Data Pipeline
1. Raw CSV ingestion
2. Python-based data cleaning and normalization
3. SQL validation and aggregation
4. Power BI semantic model & DAX measures

### Star Schema Design

**Fact Table**
- `Fact_ProductChemical`  
  - One row per **Product × Chemical**

**Dimension Tables**
- `Dim_Product` — Product, Brand, Category, Subcategory  
- `Dim_Company` — Company information  
- `Dim_Chemical` — Chemical name & CAS number  
- `Dim_Category` — Primary product category  
- `Dim_Date` — Unified date dimension (Year, Month, Quarter)

This structure enables:
- Time-series analysis  
- Category benchmarking  
- Company-level risk comparison  
- Chemical-level drilldowns  

---

## Key Metrics (DAX)

| Metric | Description |
|------|------------|
| Total Products | Size of the cosmetic market |
| Total Chemicals | Unique regulated chemicals |
| Titanium Products | Products containing Titanium Dioxide |
| Titanium Penetration % | Market-wide dependency |
| Companies Using Titanium | Breadth of exposure |
| Titanium Risk Score | Absolute Titanium exposure per company |
| Titanium Risk Band | High / Medium / Low exposure classification |

**Design Choice:**  
Companies are ranked using **absolute Titanium exposure**, not just percentages, to highlight **systemic risk**.

---

## Dashboard Pages

### Market Overview
- Total products, chemicals, companies
- Overall Titanium penetration
- Trend of product reporting over time

### Category Risk Analysis
- Titanium penetration by product category
- Category-level exposure comparison
- Identification of high-dependency categories

### Company Risk Analysis
- Company-level Titanium risk score
- Risk band classification (High / Medium / Low)
- Scatter analysis: product volume vs penetration
- Top companies by regulatory exposure

---

## Key Insights

### Market-Level
- **86.6% of cosmetic products contain Titanium Dioxide**
- Dependency has remained consistently high over 12 years

### Category-Level
- Makeup, Nail Products, and Oral Hygiene show **extreme dependency**
- Hair care (non-coloring) shows relatively lower exposure

### Company-Level
- Large brands carry **highest absolute exposure**, not just high percentages
- Regulatory action would disproportionately impact **market leaders**
- Reformulation risk is **systemic**, not isolated

---

## Business Impact

This dashboard can support:

- **Regulators** → Assess potential market disruption from chemical restrictions  
- **Cosmetic companies** → Prioritize reformulation strategies  
- **Investors** → Identify hidden regulatory risk  
- **Compliance teams** → Monitor chemical exposure trends  

---

## Tools & Technologies

- Python (Pandas, NumPy) — data cleaning & preparation  
- SQL (MySQL) — validation & aggregation  
- Power BI — data modeling, DAX, visualization  
- Star Schema Modeling — BI best practices  

---

## Repository Structure

/data
├── raw/
├── cleaned/

/sql
├── validation_queries.sql

/powerbi
├── titanium_risk_dashboard.pbix

/notebooks
├── data_cleaning.ipynb

README.md

---

## Key Takeaway

This project demonstrates **end-to-end analytical thinking** — from raw regulatory data to a business-ready risk intelligence system — and shows how BI can be used to **anticipate regulatory and compliance risk**, not just report metrics.

---

## Author

**Abhinav Noel Norbert**  
Business Intelligence & Data Analytics  
