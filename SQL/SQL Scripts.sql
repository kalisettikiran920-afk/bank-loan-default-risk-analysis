/*
=====================================
KPI Calculations
=====================================
*/

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


------------------------------------------------------------------------------------------------


/*
=======================================
Executive Dashboard
=======================================
*/

-- Loan Applications by Loan Type
SELECT
	Loan_Type,
	COUNT(*) AS total_loan_applications
FROM bank
GROUP BY Loan_Type

-- Loan Applications by Defaulted
SELECT
	Defaulted,
	COUNT(*) AS total_loan_applications
FROM bank
GROUP BY Defaulted

-- Loan Applications by Employment_Status
SELECT
	Employment_Status,
	COUNT(*) AS total_loan_applications
FROM bank
GROUP BY Employment_Status

-- Loan Applications by Risk Category
SELECT
	Risk_Category,
	COUNT(*) AS total_loan_applications
FROM bank
GROUP BY Risk_Category

-- Loan Applications by Loan Term Months
SELECT
	Loan_Term_Months,
	COUNT(*) AS total_loan_applications
FROM bank
GROUP BY Loan_Term_Months


------------------------------------------------------------------------------------------------


/*
=======================================
Customer Risk Analysis
=======================================
*/

-- Credit Score Band Analysis
SELECT
	Credit_Score_Band,
	COUNT(*) AS total_loan_applications,
	COUNT(CASE WHEN Defaulted_Flag = 1 THEN 1 END) AS defaulted_applications,
	COUNT(CASE WHEN Defaulted_Flag = 1 THEN 1 END) * 100.0/ COUNT(*) AS default_rate
FROM bank
GROUP BY Credit_Score_Band

-- Default Rate by Employment Status
SELECT
	Employment_Status,
	COUNT(*) AS total_loan_applications,
	COUNT(CASE WHEN Defaulted_Flag = 1 THEN 1 END) AS defaulted_applications,
	COUNT(CASE WHEN Defaulted_Flag = 1 THEN 1 END) * 100.0/ COUNT(*) AS default_rate
FROM bank
GROUP BY Employment_Status

-- Default Rate by Missed Payments Last 12 Months
SELECT
	Missed_Payments_Last_12_Months,
	COUNT(*) AS total_loan_applications,
	COUNT(CASE WHEN Defaulted_Flag = 1 THEN 1 END) AS defaulted_applications,
	COUNT(CASE WHEN Defaulted_Flag = 1 THEN 1 END) * 100.0/ COUNT(*) AS default_rate
FROM bank
GROUP BY Missed_Payments_Last_12_Months
ORDER BY Missed_Payments_Last_12_Months

-- Default Rate by City Tier
SELECT
	City_Tier,
	COUNT(*) AS total_loan_applications,
	COUNT(CASE WHEN Defaulted_Flag = 1 THEN 1 END) AS defaulted_applications,
	COUNT(CASE WHEN Defaulted_Flag = 1 THEN 1 END) * 100.0/ COUNT(*) AS default_rate
FROM bank
GROUP BY City_Tier
ORDER BY City_Tier

-- Default Rate by Previous Defaults
SELECT
	Previous_Defaults,
	COUNT(*) AS total_loan_applications,
	COUNT(CASE WHEN Defaulted_Flag = 1 THEN 1 END) AS defaulted_applications,
	COUNT(CASE WHEN Defaulted_Flag = 1 THEN 1 END) * 100.0/ COUNT(*) AS default_rate
FROM bank
GROUP BY Previous_Defaults


------------------------------------------------------------------------------------------------


/*
=======================================
Financial Analysis
=======================================
*/

-- Default Rate by Loan Amount Band
SELECT
	Loan_Amount_Band,
	COUNT(*) AS total_loan_applications,
	COUNT(CASE WHEN Defaulted_Flag = 1 THEN 1 END) AS defaulted_applications,
	COUNT(CASE WHEN Defaulted_Flag = 1 THEN 1 END) * 100.0/ COUNT(*) AS default_rate
FROM bank
GROUP BY Loan_Amount_Band

-- Default Rate by Interest Rate Band
SELECT
	Interest_Rate_Band,
	COUNT(*) AS total_loan_applications,
	COUNT(CASE WHEN Defaulted_Flag = 1 THEN 1 END) AS defaulted_applications,
	COUNT(CASE WHEN Defaulted_Flag = 1 THEN 1 END) * 100.0/ COUNT(*) AS default_rate
FROM bank
GROUP BY Interest_Rate_Band

-- DTI Band Analysis
SELECT
	DTI_Band,
	COUNT(*) AS total_loan_applications,
	COUNT(CASE WHEN Defaulted_Flag = 1 THEN 1 END) AS defaulted_applications,
	COUNT(CASE WHEN Defaulted_Flag = 1 THEN 1 END) * 100.0/ COUNT(*) AS default_rate
FROM bank
GROUP BY DTI_Band

-- Default Rate by EMI Band
SELECT
	EMI_Band,
	COUNT(*) AS total_loan_applications,
	COUNT(CASE WHEN Defaulted_Flag = 1 THEN 1 END) AS defaulted_applications,
	COUNT(CASE WHEN Defaulted_Flag = 1 THEN 1 END) * 100.0/ COUNT(*) AS default_rate
FROM bank
GROUP BY EMI_Band

-- Default Rate by Savings Balance Band
SELECT
	Savings_Balance_Band,
	COUNT(*) AS total_loan_applications,
	COUNT(CASE WHEN Defaulted_Flag = 1 THEN 1 END) AS defaulted_applications,
	COUNT(CASE WHEN Defaulted_Flag = 1 THEN 1 END) * 100.0/ COUNT(*) AS default_rate
FROM bank
GROUP BY Savings_Balance_Band