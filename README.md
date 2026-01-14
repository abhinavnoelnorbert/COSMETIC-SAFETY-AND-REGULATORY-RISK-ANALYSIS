# Cosmetic Safety & Regulatory Risk Analysis
### U.S. Cosmetics Industry (2009–2020)
#### (Power BI | SQL | Data Modeling | DAX)

---

## Project Overview

This project analyzes **chemical safety and regulatory exposure across the U.S. cosmetics industry**, using public regulatory disclosures to identify **systemic risk patterns** at the **market, category, and company level.**

The study began as a **broad chemical risk assessment** across all regulated ingredients.
Through exploratory analysis, **Titanium Dioxide emerged as the most dominant and structurally embedded chemical**, accounting for the majority of product-level exposure and representing the **largest potential regulatory risk** to the industry.

The final outcome is a **decision-grade risk intelligence dashboard** focused on **where regulation would have the greatest impact.**

---

## Business Problem

Cosmetics companies, regulators, and investors face growing pressure around ingredient safety, but lack clarity on:

- Which regulated chemicals drive the majority of market exposure?
- Whether chemical risk is concentrated or systemic
- Which product categories are structurally dependent on high-risk ingredients
- Which companies face the highest reformulation and compliance risk

This project answers those questions using data-driven evidence, not assumptions.
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

## Analytical Approach

### Phase 1: Exploratory Chemical Risk Analysis
1. Assessed frequency and spread of all regulated chemicals
2. Measured market penetration across products, categories, and companies
3. Identified chemicals with systemic presence vs niche usage

**Key Finding:** Titanium Dioxide dominates the exposure landscape — far exceeding all other chemicals in both volume and breadth.

### Phase 2: Titanium-Focused Risk Deep Dive
Once Titanium Dioxide was identified as the primary driver, analysis pivoted to:
1. Market-wide dependency measurement
2. Category-level structural exposure
3. Company-level absolute risk concentration
4. Time-based reporting trends

## Data Engineering & Modeling

### Data Pipeline
1. Raw CSV ingestion
2. Python-based data cleaning and normalization
3. SQL validation and aggregation
4. Power BI semantic modeling with DAX

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
- Market scale and chemical landscape
- Titanium penetration vs all chemicals
- Reporting trends over time

### Category Risk Analysis
- Titanium dependency by product category
- Identification of structurally exposed categories
- Products-at-risk volume by category

### Company Risk Analysis
- Company-level Titanium risk score
- Risk band segmentation
- Exposure landscape (volume × penetration)
- Top firms by regulatory risk concentration

---

## Key Insights

### Market-Level
- **86.6% of cosmetic products contain Titanium Dioxide**
- Dependency has remained consistently high over 12 years
- No other regulated chemical shows comparable penetration

### Category-Level
- Makeup, Nail, Oral Hygiene, and Tattoo products show **near-total dependency**
- Hair care (non-coloring) shows relatively lower exposure

### Company-Level
- Risk is **concentrated among large, high-volume brands**
- Regulatory action would disproportionately impact **market leaders**
- Reformulation risk is **systemic**, not isolated

---

## Business Impact

This analysis can support:

- **Regulators** → Estimate market disruption before policy action 
- **Cosmetic companies** → Prioritize reformulation strategies  
- **Investors** → Identify hidden regulatory risk  
- **Compliance teams** → Monitor structural ingredient risk

---

## Tools & Technologies

- Python (Pandas, NumPy) — data cleaning & preparation  
- SQL (MySQL) — validation & aggregation  
- Power BI — data modeling, DAX, visualization  
- Star Schema Modeling — BI best practices  

---

## Key Takeaway

This project demonstrates how **exploratory analysis can uncover systemic risk** and how Business Intelligence can be used not just to report metrics, but to **anticipate regulatory and business impact.**

Titanium Dioxide was not assumed to be the risk — the data revealed it.
---

## Author

**Abhinav Noel Norbert**  

Business Intelligence & Data Analytics  

Former Management Consultant
