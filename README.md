# 🏦 Bank Loan Default Risk Analysis

> **An end-to-end Excel analytics project identifying high-risk borrowers and the key financial drivers behind loan defaults — from raw data to an interactive multi-page dashboard.**

---

## 📌 Table of Contents

- [Project Overview](#project-overview)
- [Business Problem Statement](#business-problem-statement)
- [Dataset Overview](#dataset-overview)
- [Tools & Technologies](#tools--technologies)
- [Project Workflow](#project-workflow)
- [Data Cleaning Summary](#data-cleaning-summary)
- [Feature Engineering](#feature-engineering)
- [SQL Analysis & Validation](#sql-analysis--validation)
- [Dashboard Overview](#dashboard-overview)
- [Key Insights](#key-insights)
- [Business Recommendations](#business-recommendations)
- [Repository Structure](#repository-structure)
- [Conclusion](#conclusion)
- [Author](#author)

---

## Project Overview

This project delivers a complete data analytics solution for loan default risk management. Using **5,000 loan application records** across 33 features — covering customer demographics, financial profiles, credit history, and loan details — the project identifies which borrowers are most likely to default and what factors drive that risk.

**Key business questions answered:**
- What is the overall default rate across the portfolio?
- Which customers are most likely to default?
- Which financial factors drive loan defaults?
- How does credit score impact borrower risk?
- How can banks identify high-risk borrowers before approving a loan?

---

## Business Problem Statement

Banks lose significant money when borrowers stop repaying loans. The challenge is that lending decisions are made upfront — before future repayment behaviour is known. Without a structured way to assess risk, approvals become inconsistent and costly.

This project builds a data-driven risk framework that:
- Measures default risk at the portfolio level
- Pinpoints the borrower segments most likely to default
- Identifies the financial thresholds where risk escalates sharply
- Supports better, faster credit decisions

---

## Dataset Overview

| Metric | Value |
|---|---|
| Raw Records | 5,100 |
| Cleaned Records | 5,000 |
| Duplicates Removed | 100 |
| Raw Columns | 33 |
| Final Columns | 40 |
| Engineered Features | 7 |

| Category | Key Columns |
|---|---|
| Customer Demographics | Age, Gender, Marital Status, Dependents, Education, City Tier |
| Employment | Occupation, Employment Status, Years of Employment |
| Financial Profile | Annual Income, Monthly Expenses, Savings Balance, DTI Ratio, Existing EMI |
| Credit History | Credit Score, Missed Payments, Previous Defaults, Credit History Years |
| Loan Details | Loan Type, Loan Amount, Loan Term, Interest Rate, EMI |
| Risk Metrics | Defaulted, Days Past Due, Risk Category |

---

## Tools & Technologies

| Tool | Purpose |
|---|---|
| **Microsoft Excel** | Primary environment for data storage, analysis, and dashboard development |
| **Power Query** | Data ingestion, transformation, and cleaning pipeline |
| **Pivot Tables** | Aggregations and KPI calculations powering all dashboard visuals |
| **SQL Server** | Independent validation of all dashboard KPIs and chart values |
| **Data Visualization** | Multi-page interactive dashboard with slicers, KPI cards, and charts |
| **Business Analysis** | Risk segmentation, default driver identification, and recommendations |

---

## Project Workflow

```
Raw Data → Data Cleaning → Feature Engineering → Exploratory Analysis → Risk Assessment → Dashboard Development → Business Insights
```

| Stage | What Was Done |
|---|---|
| **Raw Data** | 5,100 records, 33 columns — inspected for quality issues |
| **Data Cleaning** | Removed duplicates, treated missing values, fixed negative financials, standardised text |
| **Feature Engineering** | Created 7 new analytical columns for segmentation and KPI calculations |
| **Exploratory Analysis** | Used Pivot Tables to explore distributions and spot default patterns |
| **Risk Assessment** | Calculated default rates across all borrower and financial segments |
| **Dashboard Development** | Built four-page interactive Excel dashboard with dynamic slicers |
| **Business Insights** | Translated findings into clear recommendations for lending teams |

---

## Data Cleaning Summary

| Activity | Scope | Outcome |
|---|---|---|
| **Duplicate Removal** | 100 duplicate rows | Dataset reduced from 5,100 to 5,000 unique records |
| **Missing Value Treatment** | 5 columns · 2,561 nulls | Numerical columns filled with median; categorical columns filled with 'Unknown' |
| **Invalid Value Correction** | 3 columns · 94 negative values | Annual Income (23), Monthly Expenses (25), Existing EMI (46) — replaced with column median |
| **Text Standardisation** | 5 columns | Inconsistent casing and variant spellings fixed across Gender, Marital Status, Employment Status, Occupation, Risk Category |
| **Validation Checks** | 7 key columns | Age (18–75), Credit Score (300–900), Loan Amount, Interest Rate, DTI — all verified |

---

## Feature Engineering

| New Feature | Source Column | Logic | Business Value |
|---|---|---|---|
| **Defaulted_Flag** | Defaulted | Yes = 1, No = 0 | Powers numeric default rate calculations across all dashboards |
| **Credit_Score_Band** | Credit_Score | Poor / Average / Good / Fair / Excellent | Segments borrowers by credit quality for risk comparison |
| **DTI_Band** | Debt_to_Income_Ratio | 0–20% / 21–40% / 41–60% / 61%+ | Identifies financially over-stretched borrowers |
| **Loan_Amount_Band** | Loan_Amount | 0–2L / 2–5L / 5–10L / 10–20L / 20L+ | Enables default rate comparison by loan size |
| **Interest_Rate_Band** | Interest_Rate | Below 8% / 8–10% / 10–12% / 12–14% / Above 14% | Supports pricing risk analysis |
| **EMI_Band** | EMI | 0–5K / 5–10K / 10–20K / 20–40K / Above 40K | Measures monthly repayment burden |
| **Savings_Balance_Band** | Savings_Balance | 0–25K / 25–50K / 50K–1L / 1–5L / 5L+ | Evaluates liquidity strength vs default risk |

---

## SQL Analysis & Validation

All dashboard KPIs and chart values were independently validated in SQL Server to confirm accuracy between the Excel output and the underlying data.

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

| Dashboard | Queries | What Was Validated |
|---|---|---|
| **Executive Dashboard** | 5 | Loan type split, default count, employment breakdown, risk category, loan term distribution |
| **Customer Risk Analysis** | 5 | Credit score band rates, employment default rates, missed payments, city tier, previous defaults |
| **Financial Analysis** | 5 | Loan amount bands, interest rate bands, DTI analysis, EMI bands, savings balance bands |

---

## Dashboard Overview

**Global KPIs shown on every page:**

| KPI | Value |
|---|---|
| Total Loan Applications | 5,000 |
| Default Rate | 31.50% |
| Avg Credit Score | 602 |
| Avg DTI | 35.01% |
| Avg Interest Rate | 14.54% |

**Filters available on every page:** Loan Type · Risk Category · Employment Status

---

### 🏠 Landing Page

![Landing Page](Dashboard%20Images/Landing%20Page.png)

The entry point and navigation hub for the entire project. Includes the business problem, dataset summary, project workflow, key business questions, tools used, and direct links to all three dashboards.

---

### 📈 Executive Dashboard

![Executive Dashboard](Dashboard%20Images/Executive%20Dashboard.png)

**Pivot Tables used:**

![KPI Calculations Pivot Tables]
![Executive Dashboard Pivot Tables](Dashboard%20Images/Executive%20Dashboard%20Pivot%20Tables.png)

Portfolio-level overview for senior stakeholders — covers loan type distribution, default split, employment breakdown, risk category, and loan term analysis.

| Chart | Key Number |
|---|---|
| Loan Applications by Loan Type | Auto 1,265 · Personal 1,249 · Home 1,243 · Education 1,243 |
| Defaulted vs Not | 32% defaulted · 68% performing |
| By Employment Status | Employed 2,050 · Unknown 1,016 · UnEmployed 1,002 · Self Employed 932 |
| By Risk Category | High Risk 31.5% · Low Risk 68.5% |
| By Loan Term | 12-month highest (869) · 240-month lowest (812) |

---

### 👤 Customer Risk Analysis

![Customer Risk Analysis](Dashboard%20Images/Customer%20Risk%20Analysis.png)

**Pivot Tables used:**

![Customer Risk Pivot Tables](Dashboard%20Images/Customer%20Risk%20Pivot%20Tables.png)

Examines which borrower characteristics most strongly predict default behaviour.

| Chart | Key Number |
|---|---|
| Credit Score Band | Poor: 40.3% default · Excellent: 21.8% default |
| Employment Status | UnEmployed: 33.0% · Employed: 30.9% |
| Missed Payments | Spikes from 24.8% (0 missed) to 37%+ (4+ missed) |
| City Tier | Tier 2: 33.1% · Tier 1: 31.7% · Tier 3: 29.7% |
| Previous Defaults | 0 prior: 22.2% · 1 prior: 37.0% · 2 prior: 36.0% |

---

### 💰 Financial Analysis

![Financial Analysis](Dashboard%20Images/Financial%20Analysis.png)

**Pivot Tables used:**

![Financial Analysis Pivot Tables](Dashboard%20Images/Financial%20Analysis%20Pivot%20Tables.png)

Focuses on how loan size, interest rate, debt load, repayment amount, and savings level relate to default risk.

| Chart | Key Number |
|---|---|
| Loan Amount Band | ₹20 Lakh+: 33.2% default · ₹2–5 Lakh: 29.1% |
| Interest Rate Band | 8–10% band: 33.8% (highest — signals adverse selection) |
| DTI Band | DTI 61%+: 39.1% default (highest across all segments) |
| EMI Band | ₹5,001–10,000: 27.6% (lowest) · ₹10,001–20,000: 32.3% |
| Savings Balance | Below ₹25,000: 39.6% default (highest liquidity risk) |

---

## Key Insights

#### Portfolio Level

1. The overall default rate of **31.5%** means nearly 1 in 3 borrowers fails to repay — this level of risk requires a portfolio-wide review.
2. Loan type distribution is nearly identical across all four products (~1,243–1,265 each), so default risk is not concentrated in any single loan type.

#### Credit & Borrower Risk

1. **Credit score is the strongest single predictor of default.** Poor-score borrowers default at 40.3% — nearly double the 21.8% rate for Excellent-score borrowers. The relationship holds consistently across all five bands.
2. **One previous default raises risk by 67%.** Borrowers with a prior default default at 37%, vs 22.2% for clean-history borrowers.
3. **Missed payments are an early warning signal.** Default rates stay manageable (24–26%) for 0–2 missed payments, then jump sharply above 37% from 4 missed payments onward.

#### Employment & Location

1. **Unemployed borrowers carry the highest default rate by employment segment (33%)**, followed by Self Employed (31.5%).
2. **Tier 2 city borrowers default slightly more (33.1%)** than Tier 1 (31.7%) and Tier 3 (29.7%) — geographic risk is broadly spread.

#### Financial Structure

1. **DTI above 61% is the biggest financial red flag** — this group defaults at 39.1%, the highest rate across all financial segments.
2. **Low savings is a strong vulnerability signal.** Borrowers with under ₹25,000 in savings default at 39.6%, nearly 10 points above the ₹1–5 Lakh savings group (30.9%).
3. **Larger loans carry more risk.** The ₹20 Lakh+ bracket has the highest loan-size default rate at 33.2%.
4. **The 8–10% interest rate band defaults the most (33.8%)** — counterintuitive, likely reflecting adverse selection where moderate-risk borrowers get mid-range rates but still default at high rates.

---

## Business Recommendations

1. **Set a DTI cap of 50% for new approvals.** Risk escalates sharply beyond this point. Any application above 50% DTI should go through a secondary review.

2. **Flag all applicants with prior defaults for mandatory escalation.** One previous default increases default likelihood by over 65%. This should be a hard trigger in the credit decisioning process.

3. **Trigger early intervention at 3 missed payments.** Default rates are still manageable below 4 missed payments. Proactive outreach — payment plans, restructuring — at 3 missed payments can prevent defaults before they happen.

4. **Require collateral or a co-signer for loans above ₹20 Lakh.** This segment carries the highest default rate (33.2%) and represents the largest individual exposure per loan.

5. **Add a minimum savings balance to eligibility checks.** Borrowers with under ₹25,000 in savings default at 39.6%. A verified savings floor acts as a basic liquidity buffer.

6. **Review pricing for the 8–10% interest rate band.** This band unexpectedly shows the highest default rate (33.8%), suggesting the current model is underpricing risk for this group.

7. **Apply stricter terms for unemployed and self-employed applicants.** Default rates of 33.0% and 31.5% respectively warrant additional documentation requirements — income proof, guarantors, or shorter loan terms.

---

## Repository Structure

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

## Conclusion

This project shows how raw loan application data can be turned into a reliable credit risk tool using Excel, SQL, and structured analytics thinking. The four-page dashboard gives lending teams an immediate read on portfolio health, borrower risk segments, and the financial factors that predict default.

The four strongest predictors identified: **credit score, prior default history, debt-to-income ratio, and savings balance.** Each maps directly to a policy action banks can implement today.

**Skills demonstrated:**
- End-to-end project delivery in Excel
- Data cleaning and quality management with Power Query
- Feature engineering and business-logic segmentation
- SQL-based KPI validation
- Multi-page interactive dashboard design
- Credit risk domain knowledge and business storytelling

---

## Author

**Kiran Kalisetti**
Data Analyst

<a href="https://www.linkedin.com/in/kiran-kalisetti" target="_blank">
  <img src="https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white" alt="LinkedIn"/>
</a>
&nbsp;
<a href="mailto:kalisettikiran920@gmail.com?subject=Regarding%20your%20Bank%20Loan%20Default%20Risk%20Analysis%20Project">
  <img src="https://img.shields.io/badge/Email-Contact%20Me-D14836?style=for-the-badge&logo=gmail&logoColor=white" alt="Email"/>
</a>
&nbsp;
<a href="https://github.com/kalisettikiran920-afk" target="_blank">
  <img src="https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white" alt="GitHub"/>
</a>

---

*Built with Microsoft Excel · Power Query · SQL Server*
