# 🏦 Bank Loan Default Risk Analysis

> **An end-to-end data analytics project that identifies high-risk borrowers and uncovers the key financial and demographic drivers behind loan defaults — from raw data to an interactive multi-page Excel dashboard.**

---

## 📌 Table of Contents

- [Project Overview](#-project-overview)
- [Business Problem Statement](#-business-problem-statement)
- [Dataset Overview](#-dataset-overview)
- [Tools & Technologies](#-tools--technologies)
- [Project Workflow](#-project-workflow)
- [Data Cleaning Summary](#-data-cleaning-summary)
- [Feature Engineering](#-feature-engineering)
- [SQL Analysis & Validation](#-sql-analysis--validation)
- [Dashboard Overview](#-dashboard-overview)
- [Key Insights](#-key-insights)
- [Business Recommendations](#-business-recommendations)
- [Repository Structure](#-repository-structure)
- [Conclusion](#-conclusion)
- [Author](#-author)

---

## 🔍 Project Overview

This project delivers a complete data analytics solution for loan default risk management in the banking sector. Using a dataset of **5,000 loan applications** with 33 raw features spanning customer demographics, financial profiles, credit history, and loan details, the project identifies which borrowers are most likely to default and what financial factors contribute most to that risk.

The analysis moves through the full analytics lifecycle — data cleaning, feature engineering, SQL-based validation, and interactive dashboard development — producing actionable insights that lending institutions can use to improve credit decisions, reduce portfolio risk, and protect financial performance.

**Key business questions answered:**
- What is the overall default rate across the loan portfolio?
- Which customers are most likely to default?
- Which financial factors drive loan defaults?
- How does credit score impact borrower risk?
- How can banks proactively identify high-risk borrowers before approval?

---

## 💼 Business Problem Statement

Banks and lending institutions face substantial financial losses when borrowers fail to repay their loans. A single default can trigger a chain of consequences — from provisioning costs and regulatory scrutiny to reputational damage and reduced lending capacity. At scale, unmanaged default risk threatens the stability of an entire loan portfolio.

The core challenge is that lending decisions are made at the point of application, when future repayment behaviour is still unknown. Banks must rely on available borrower data — income, credit score, debt obligations, employment stability — to estimate risk. Without a structured analytical framework, this process is inconsistent, slow, and prone to human bias.

This project addresses that gap by building a data-driven risk identification system that:

- Quantifies default risk at the portfolio level
- Identifies the borrower segments with the highest default likelihood
- Reveals the financial thresholds beyond which default risk escalates sharply
- Provides a repeatable analytical framework that supports credit policy decisions

By understanding *who* defaults and *why*, lending institutions can tighten eligibility criteria for high-risk segments, implement early intervention strategies, and ultimately protect portfolio quality.

---

## 📁 Dataset Overview

The raw dataset contains **5,100 loan application records** across **33 features** covering five business domains: customer demographics, employment information, financial profile, credit history, and loan details.

| Metric | Value |
|---|---|
| Raw Records | 5,100 |
| Cleaned Records | 5,000 |
| Duplicates Removed | 100 |
| Raw Columns | 33 |
| Final Columns (after Feature Engineering) | 40 |
| Engineered Features | 7 |

### Data Categories

| Category | Key Columns |
|---|---|
| Customer Demographics | Age, Gender, Marital Status, Dependents, Education, City Tier |
| Employment Information | Occupation, Employment Status, Years of Employment |
| Financial Profile | Annual Income, Monthly Expenses, Savings Balance, DTI Ratio, Existing EMI |
| Credit History | Credit Score, Credit History Years, Missed Payments, Previous Defaults |
| Loan Details | Loan Type, Loan Amount, Loan Term, Interest Rate, EMI |
| Risk Metrics | Defaulted, Days Past Due, Risk Category |

---

## 🛠 Tools & Technologies

| Tool | Purpose |
|---|---|
| **Microsoft Excel** | Primary environment for data storage, analysis, and dashboard development |
| **Power Query** | Data ingestion, transformation, and automated refresh pipeline |
| **Pivot Tables** | Aggregations, cross-tabulations, and dynamic KPI calculations for all dashboard visuals |
| **SQL Server** | Independent validation of all dashboard KPIs and chart values using T-SQL queries |
| **Data Visualization** | Multi-page interactive dashboard with slicers, KPI cards, combo charts, and donut charts |
| **Business Analysis** | Risk segmentation, default driver identification, and actionable insight generation |

---

## 🔄 Project Workflow

```
Raw Data → Data Cleaning → Feature Engineering → Exploratory Analysis → Risk Assessment → Dashboard Development → Business Insights
```

### Step 1 — Raw Data
The raw dataset of 5,100 loan application records was collected, covering borrower demographics, financial attributes, credit history, and loan specifics across 33 columns. Initial inspection revealed data quality issues including duplicate records, missing values, negative financial entries, and inconsistent categorical labels.

### Step 2 — Data Cleaning
A structured cleaning process was applied to resolve all identified quality issues. This included removing 100 duplicate records, treating 2,561 missing values across 5 columns, correcting 94 invalid negative financial entries, and standardising inconsistent text categories across 5 columns. The cleaned dataset contains 5,000 records ready for analysis.

### Step 3 — Feature Engineering
Seven new analytical features were created from existing columns to enable richer segmentation and risk analysis. Continuous variables such as Credit Score, DTI Ratio, Loan Amount, Interest Rate, EMI, and Savings Balance were binned into business-meaningful bands. A binary Defaulted Flag was created to support numeric KPI calculations across all dashboards.

### Step 4 — Exploratory Analysis
The cleaned and enriched dataset was explored using Pivot Tables to understand the distribution of loan applications, default patterns, and key metrics across all borrower segments. This stage surfaced early signals about which variables are most strongly associated with default risk.

### Step 5 — Risk Assessment
Default rates were calculated and compared across all customer risk segments — credit score bands, employment status, city tier, missed payment history, previous defaults, loan amount bands, interest rate bands, DTI bands, EMI bands, and savings balance bands. This produced a comprehensive risk profile of the borrower population.

### Step 6 — Dashboard Development
A four-page interactive Excel dashboard was designed and built, covering a Landing Page, Executive Dashboard, Customer Risk Analysis, and Financial Analysis. Each dashboard page includes dynamic slicers for Loan Type, Risk Category, and Employment Status, allowing stakeholders to filter and explore the data interactively.

### Step 7 — Business Insights
Findings were translated into clear, business-language insights and actionable recommendations targeted at credit risk teams, lending managers, and portfolio analysts. SQL scripts were used to independently validate every KPI and chart value against the dashboard output.

---

## 🧹 Data Cleaning Summary

| Activity | Scope | Outcome |
|---|---|---|
| **Duplicate Removal** | 100 duplicate rows | Dataset reduced from 5,100 to 5,000 unique records |
| **Missing Value Treatment** | 5 columns · 2,561 total nulls | Numerical columns imputed with median; categorical columns filled with 'Unknown'. No records dropped |
| **Invalid Value Correction** | 3 columns · 94 negative values | Annual Income (23), Monthly Expenses (25), Existing EMI (46) — all replaced with column median |
| **Text Standardisation** | 5 columns | Inconsistent casing and variant spellings consolidated across Gender, Marital Status, Employment Status, Occupation, and Risk Category |
| **Validation Checks** | 7 key columns | All values confirmed within expected business and statistical ranges — Customer ID, Loan ID, Age (18–75), Credit Score (300–900), Loan Amount, Interest Rate, DTI Ratio |
| **Feature Engineering** | 7 new columns | Dataset expanded from 33 to 40 columns; fully analytics-ready |

---

## ⚙️ Feature Engineering

Seven new analytical columns were created during data preparation to enable business-level segmentation and dashboard reporting.

| New Feature | Source Column | Logic | Business Value |
|---|---|---|---|
| **Defaulted_Flag** | Defaulted | Yes = 1, No = 0 | Enables numeric default rate calculations across all KPI cards and dashboard charts |
| **Credit_Score_Band** | Credit_Score | Poor / Average / Good / Fair / Excellent | Segments borrowers by credit quality tier for risk profiling and segment-level default comparison |
| **DTI_Band** | Debt_to_Income_Ratio | 0–20% / 21–40% / 41–60% / 61%+ | Classifies borrowers by debt burden level; identifies financially stressed segments |
| **Loan_Amount_Band** | Loan_Amount | 0–2L / 2–5L / 5–10L / 10–20L / 20L+ | Enables loan exposure analysis and default rate comparison by loan size |
| **Interest_Rate_Band** | Interest_Rate | Below 8% / 8–10% / 10–12% / 12–14% / Above 14% | Supports rate-tier default comparison and loan pricing risk analysis |
| **EMI_Band** | EMI | 0–5K / 5–10K / 10–20K / 20–40K / Above 40K | Classifies monthly repayment burden for affordability and default pattern analysis |
| **Savings_Balance_Band** | Savings_Balance | 0–25K / 25–50K / 50K–1L / 1–5L / 5L+ | Evaluates liquidity strength and its relationship to default risk |

---

## 🗄️ SQL Analysis & Validation

All dashboard KPIs and chart values were independently validated using SQL Server (T-SQL) to ensure complete accuracy between the Excel dashboard output and the underlying data.

### KPI Validation Queries

```sql
-- Total Loan Applications
SELECT COUNT(*) AS total_loan_applications FROM bank

-- Default Rate (%)
SELECT AVG(CAST(Defaulted_Flag AS FLOAT)) * 100 AS default_rate FROM bank

-- Average Credit Score
SELECT AVG(Credit_Score) AS avg_credit_score FROM bank

-- Average DTI (%)
SELECT AVG(Debt_to_Income_Ratio) AS avg_DTI FROM bank

-- Average Interest Rate (%)
SELECT AVG(Interest_Rate) AS avg_interest_rate FROM bank
```

### SQL Validation Coverage

| Dashboard | SQL Scripts | What Was Validated |
|---|---|---|
| **Executive Dashboard** | 5 queries | Loan type distribution, default split, employment breakdown, risk category counts, loan term distribution |
| **Customer Risk Analysis** | 5 queries | Credit score band default rates, employment status default rates, missed payment default rates, city tier default rates, previous default impact |
| **Financial Analysis** | 5 queries | Loan amount band default rates, interest rate band default rates, DTI band analysis, EMI band default rates, savings balance band default rates |

Every figure visible in the dashboard — total applications, default rate, average credit score, average DTI, average interest rate, and all chart values — was cross-checked against SQL output to confirm accuracy.

---

## 📊 Dashboard Overview

The project delivers a four-page interactive Excel dashboard with consistent navigation, KPI cards, and dynamic slicers across all pages.

**Global KPIs (displayed on every dashboard page):**

| KPI | Value |
|---|---|
| Total Loan Applications | 5,000 |
| Default Rate | 31.50% |
| Average Credit Score | 602 |
| Average DTI | 35.01% |
| Average Interest Rate | 14.54% |

**Global Filters (available on every dashboard page):**
- Loan Type: Auto · Home · Personal · Education
- Risk Category: High · Low
- Employment Status: Employed · Self Employed · UnEmployed · Unknown

---

### 🏠 Landing Page

![Landing Page](Dashboard%20Images/Landing%20Page.png)

The Landing Page serves as the project entry point and navigation hub. It provides a structured overview of the entire project in a single view, giving stakeholders immediate context before exploring any dashboard.

**Contents:**
- **Business Problem** — Explains why loan default analysis matters and what the project aims to solve
- **Dataset Summary** — Highlights 5,000 applications, 33 features, and the key data categories covered
- **Project Workflow** — A visual seven-stage pipeline from Raw Data through to Business Insights
- **Key Business Questions** — Five decision-relevant questions that the dashboards are built to answer
- **Tools & Technologies** — Visual reference of all six tools used: Excel, Power Query, Pivot Tables, SQL Server, Data Visualization, Business Analysis
- **Explore Dashboards** — Direct navigation cards to the Executive Dashboard, Customer Risk Analysis, and Financial Analysis

---

### 📈 Executive Dashboard

![Executive Dashboard](Dashboard%20Images/Executive%20Dashboard.png)

The Executive Dashboard delivers a portfolio-level view of the loan book, designed for senior stakeholders who need a fast, reliable read on the health of the lending portfolio.

**Charts & Visuals:**

| Visual | Type | Key Finding |
|---|---|---|
| Loan Applications by Loan Type | Horizontal Bar | Auto (1,265), Personal (1,249), Home (1,243), Education (1,243) — near-equal distribution |
| Loan Applications by Defaulted | Pie Chart | 32% defaulted (Yes), 68% performing (No) |
| Loan Applications by Employment Status | Horizontal Bar | Employed (2,050), Unknown (1,016), UnEmployed (1,002), Self Employed (932) |
| Loan Applications by Risk Category | Donut Chart | High Risk: 31.5%, Low Risk: 68.5% |
| Loan Applications by Loan Term | Column Chart | 12-month term has highest volume (869); 240-month term lowest (812) |

**Insights Box:**
1. Overall default rate is **31.5%** — nearly 1 in 3 borrowers defaults, posing significant portfolio risk.
2. **Unemployed borrowers** contribute disproportionately to defaults despite being a smaller applicant segment.
3. Loan type distribution is nearly equal (~1,243–1,265), meaning no single loan type dominates default risk.

---

### 👤 Customer Risk Analysis Dashboard

![Customer Risk Analysis](Dashboard%20Images/Customer%20Risk%20Analysis.png)

The Customer Risk Analysis Dashboard examines borrower-level risk drivers — identifying which customer characteristics are most strongly associated with default behaviour.

**Charts & Visuals:**

| Visual | Type | Key Finding |
|---|---|---|
| Credit Score Band Analysis | Combo Chart (Bar + Line) | Poor score: 40.3% default rate; Excellent score: 21.8% default rate |
| Default Rate by Employment Status | Horizontal Bar | UnEmployed (33.0%), Self Employed (31.5%), Unknown (31.2%), Employed (30.9%) |
| Default Rate by Missed Payments (Last 12M) | Column Chart | 24.8% at 0 missed payments; spikes to 37%+ from 4 missed payments onward |
| Default Rate by City Tier | Pie Chart | Tier 2 (33.1%), Tier 1 (31.7%), Tier 3 (29.7%) |
| Default Rate by Previous Defaults | Column Chart | 0 previous defaults: 22.2%; 1 previous default: 37.0%; 2 previous defaults: 36.0% |

**Insights Box:**
1. **Poor credit score** borrowers default at **40.3%** — nearly double Excellent-score borrowers (21.8%). Credit score is the #1 risk predictor.
2. Customers with **1+ previous defaults** default at **37%**, vs. just **22.2%** for clean-history borrowers — prior defaults are a critical red flag.
3. Default rates spike sharply **from 4 missed payments onward (37%+)** — early intervention at 3 missed payments is strongly recommended.

---

### 💰 Financial Analysis Dashboard

![Financial Analysis](Dashboard%20Images/Financial%20Analysis.png)

The Financial Analysis Dashboard focuses on the financial structure of loans, examining how borrowing size, interest burden, debt load, repayment amount, and savings levels relate to default risk.

**Charts & Visuals:**

| Visual | Type | Key Finding |
|---|---|---|
| Default Rate by Loan Amount Band | Column Chart | ₹20 Lakh+ has the highest default rate (33.2%); ₹2–5 Lakh the lowest (29.1%) |
| Default Rate by Interest Rate Band | Column Chart | 8–10% band shows the highest default rate (33.8%) — signals adverse selection |
| DTI Band Analysis | Combo Chart (Bar + Line) | DTI 61%+: 39.1% default rate — highest across all financial bands |
| Default Rate by EMI Band | Horizontal Bar | ₹5,001–10,000 band: lowest default rate (27.6%); ₹10,001–20,000: 32.3% |
| Default Rate by Savings Balance Band | Horizontal Bar | ₹0–25,000 savings: 39.6% default rate — highest liquidity risk segment |

**Insights Box:**
1. Borrowers with **DTI above 61%** default at **39.1%** — the highest across all financial bands, confirming debt burden as the top financial risk driver.
2. Borrowers with **savings below ₹25,000** default at **39.6%** — low liquidity is a major vulnerability signal.
3. Loans of **₹20 Lakh+** carry the highest default rate (33.2%) — large loan amounts need stricter eligibility and collateral checks.

---

## 💡 Key Insights

**Portfolio-Level**
1. The overall default rate of **31.5%** means nearly 1 in 3 borrowers fails to repay — a level that warrants urgent portfolio-wide risk review.
2. Loan type distribution is nearly identical across Auto, Personal, Home, and Education loans (~1,243–1,265 applications each), confirming that default risk is not concentrated in any single product line.

**Credit & Borrower Risk**
3. **Credit score is the single strongest predictor of default.** Borrowers in the Poor credit band default at 40.3% — nearly double the rate of Excellent-score borrowers (21.8%). The relationship is consistent across all five bands.
4. **Prior default history is a critical red flag.** Borrowers with even one previous default default at 37%, compared to just 22.2% for clean-history borrowers — a 67% relative increase in risk.
5. **Missed payment behaviour predicts future default.** Default rates remain relatively stable (24–26%) for borrowers with 0–2 missed payments, then spike sharply from 4 missed payments onward (37%+).

**Employment & Demographics**
6. **Unemployed borrowers carry the highest employment-segment default rate (33%)**, followed closely by Self Employed (31.5%). Employment instability is a consistent risk signal.
7. **Tier 2 city borrowers default at the highest rate (33.1%)**, slightly ahead of Tier 1 (31.7%) and Tier 3 (29.7%), suggesting that geographic risk is broadly distributed with modest variation.

**Financial Structure**
8. **Debt-to-Income Ratio is the most powerful financial risk indicator.** Borrowers with DTI above 61% default at 39.1% — the highest default rate across all financial segments. The risk escalates sharply above the 40% DTI threshold.
9. **Low savings is a strong vulnerability signal.** Borrowers with savings below ₹25,000 default at 39.6%, nearly 10 percentage points higher than borrowers with ₹1–5 Lakh in savings (30.9%).
10. **Large loans carry elevated risk.** The ₹20 Lakh+ bracket has the highest loan-size default rate (33.2%), pointing to affordability stress at higher principal amounts.
11. **The 8–10% interest rate band shows the highest default rate (33.8%)**, which is counterintuitive — this likely reflects adverse selection, where moderate-risk borrowers are approved at elevated rates but still default at high rates.

---

## ✅ Business Recommendations

1. **Introduce a DTI hard cap at 50% for new loan approvals.** Borrowers above this threshold show a sharp escalation in default risk. Any application with DTI above 50% should require a secondary credit review or be declined outright.

2. **Treat prior default history as a mandatory screening criterion.** Borrowers with one or more previous defaults default at 37% — over 65% higher than clean-history borrowers. A prior default flag should trigger automatic risk escalation in the credit decisioning process.

3. **Implement a missed payment early warning system at 3 missed payments.** Default rates remain manageable (24–26%) for borrowers with 0–2 missed payments, then spike above 37% from 4 payments onward. Proactive outreach at the 3-missed-payment mark — restructuring offers, payment plans, or collections — can prevent default before it occurs.

4. **Apply stricter collateral and affordability requirements for loans above ₹20 Lakh.** Large-principal loans carry the highest default rate (33.2%). Tightening eligibility, requiring co-signers, or mandating collateral for this segment can reduce exposure without reducing loan volume.

5. **Build a minimum savings threshold into the eligibility criteria.** Borrowers with savings below ₹25,000 default at 39.6%. A minimum verified savings balance requirement acts as a liquidity buffer and filters out borrowers who cannot absorb repayment shocks.

6. **Review pricing strategy for the 8–10% interest rate band.** This band unexpectedly shows the highest default rate (33.8%), suggesting the current pricing model may be underestimating risk for mid-rate borrowers. A rate recalibration using default probability scores would better align pricing with actual risk.

7. **Deploy targeted risk mitigation for unemployed and self-employed borrowers.** These segments carry default rates of 33.0% and 31.5% respectively. Requiring income stability documentation, guarantor support, or shorter loan tenures for these applicant categories can reduce portfolio exposure.

---

## 📁 Repository Structure

```text
bank-loan-default-risk-analysis/
│
├── Images/
│   ├── Dashboard Icons
│   ├── Logos
│   └── Other Visual Assets
│
├── Dashboard Images/
│   ├── Landing Page.png
│   ├── Executive Dashboard.png
│   ├── Customer Risk Analysis.png
│   └── Financial Analysis.png
│
├── Raw Dataset/
│   └── Bank Loan Default Risk Raw Dataset.xlsx
│
├── Cleaned Dataset/
│   └── Bank Loan Default Risk Cleaned & FE Dataset.xlsx
│
├── Documentation/
│   ├── Data Dictionary.pdf
│   └── Data Cleaning & Feature Engineering.pdf
│
├── SQL/
│   └── SQL Scripts.sql
│
├── Excel Project/
│   └── Bank Loan Default Risk Analysis (Full Project).xlsx
│
└── README.md
```

---

## 📝 Conclusion

This project demonstrates how structured data analytics can transform raw loan application data into a reliable credit risk intelligence system. By applying a disciplined end-to-end workflow — from data cleaning and feature engineering through SQL validation and interactive dashboard development — the project produces insights that are both analytically sound and directly actionable for lending institutions.

The analysis identifies credit score, prior default history, debt-to-income ratio, and savings liquidity as the four most significant predictors of loan default. These findings are not just observations — they translate directly into credit policy levers that banks can apply to reduce portfolio risk, improve approval quality, and implement proactive borrower monitoring.

**Skills demonstrated through this project:**
- End-to-end data analytics project delivery
- Data cleaning and quality management (Excel + Power Query)
- Feature engineering and business-logic band creation
- SQL-based KPI validation and cross-verification
- Multi-page interactive dashboard design in Excel
- Credit risk domain knowledge and financial analysis
- Business storytelling and data-driven recommendation generation

---

## 👤 Author

**Kiran Kalisetti**
Data Analyst

<a href="https://www.linkedin.com/in/kiran-kalisetti" target="_blank">
  <img src="https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white" alt="LinkedIn"/>
</a>
&nbsp;
<a href="https://github.com/kalisettikiran920-afk" target="_blank">
  <img src="https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white" alt="GitHub"/>
</a>

---

*Built with Microsoft Excel · Power Query · SQL Server*
