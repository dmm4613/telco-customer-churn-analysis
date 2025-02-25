select * from telco;


/* Customer Churn Rate */

SELECT 
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,  
    CAST(ROUND((SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0) / COUNT(*), 2) AS DECIMAL(5,2)) AS churn_rate
FROM telco;


/* Churn Rate by Contract Type*/

SELECT 
    Contract,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    CAST(ROUND((SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0) / COUNT(*), 2) AS DECIMAL(5,2)) AS churn_rate
FROM telco
GROUP BY Contract
ORDER BY churn_rate DESC;


/* AVG Monthly Charges of Churned vs. Retained Customers */

SELECT 
    Churn,
    ROUND(AVG(MonthlyCharges), 2) AS avg_monthly_charges
FROM telco
GROUP BY Churn;


/* Churn Rate by Payment Method */

SELECT 
    PaymentMethod,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    CAST(ROUND((SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0) / COUNT(*), 2) AS DECIMAL(5,2)) AS churn_rate
FROM telco
GROUP BY PaymentMethod
ORDER BY churn_rate DESC;


/* Tenure Distribution of Churned Customers */

SELECT 
    CAST(tenure AS INT) AS tenure_group,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers
FROM telco
GROUP BY CAST(tenure AS INT)
ORDER BY tenure_group;


/* Top 10 High-Spending Customers */

SELECT 
    customerID, 
    MonthlyCharges, 
    TotalCharges, 
    Contract
FROM telco
ORDER BY MonthlyCharges DESC
OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY;


/* Services Impacting Churn */

SELECT 
    InternetService,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    CAST(ROUND((SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0) / COUNT(*), 2) AS DECIMAL(5,2)) AS churn_rate
FROM telco
GROUP BY InternetService
ORDER BY churn_rate DESC;


/* Churn Rate Based on Senior Citizen Status */

SELECT 
    CAST(SeniorCitizen AS INT) AS senior_status,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    CAST(ROUND((SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0) / COUNT(*), 2) AS DECIMAL(5,2)) AS churn_rate
FROM telco
GROUP BY CAST(SeniorCitizen AS INT);


/* Churn Rate by Paperless Billing */

SELECT 
    PaperlessBilling,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    CAST(ROUND((SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0) / COUNT(*), 2) AS DECIMAL(5,2)) AS churn_rate
FROM telco
GROUP BY PaperlessBilling;



