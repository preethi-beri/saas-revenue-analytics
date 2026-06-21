# SaaS Revenue & Customer Analytics Dashboard

![Dashboard Preview](saas_dashboard.png)

## Project Overview

This project presents an interactive SaaS Revenue & Customer Analytics Dashboard developed using Power BI, PostgreSQL, SQL, and DAX. The dashboard provides actionable insights into revenue performance, customer retention, subscription plan performance, churn analysis, and Monthly Recurring Revenue (MRR).

The primary objective of this project is to help stakeholders monitor key business metrics, identify customer behavior patterns, evaluate subscription performance, and support data-driven decision-making through interactive analytics.

---

## Project Highlights

✔ Interactive KPI Dashboard

✔ Revenue Analysis & Trend Monitoring

✔ Customer Churn Analysis

✔ Monthly Recurring Revenue (MRR) Tracking

✔ Dynamic Date, Status, and Plan Filters

✔ Business Intelligence Reporting using Power BI

✔ PostgreSQL + SQL Data Pipeline

✔ Executive-Level Dashboard Design

---

## Business Problem

SaaS businesses depend heavily on recurring revenue and customer retention. Understanding customer churn, subscription plan performance, and revenue trends is critical for sustainable business growth.

This dashboard helps answer the following business questions:

* How much revenue is being generated?
* What is the current customer base?
* What percentage of customers are churning?
* Which subscription plans generate the highest revenue?
* How does revenue change over time?
* What is the Monthly Recurring Revenue (MRR)?

---

## Dashboard KPIs

| KPI                 | Description                                         |
| ------------------- | --------------------------------------------------- |
| Total Revenue       | Total revenue generated from subscriptions          |
| Total Customers     | Total number of customers                           |
| Active Customers    | Customers with active subscriptions                 |
| Cancelled Customers | Customers who have churned                          |
| Churn Rate          | Percentage of customers who cancelled subscriptions |
| MRR                 | Monthly Recurring Revenue                           |

---

## Dashboard Features

### Interactive Filters

* Customer Status Filter
* Subscription Plan Filter
* Transaction Date Range Filter

### Visualizations

* Revenue by Subscription Plan
* Customer Churn Distribution
* Revenue Trend Over Time
* Executive KPI Cards

---

## Technology Stack

| Technology | Purpose                              |
| ---------- | ------------------------------------ |
| PostgreSQL | Database Management                  |
| SQL        | Data Analysis & Querying             |
| Power BI   | Dashboard Development                |
| DAX        | KPI and Business Metric Calculations |
| CSV        | Source Data Storage                  |

---

## Key DAX Measures

### Active Customers

```DAX
Active Customers =
CALCULATE(
    COUNT('public transactions'[customer_id]),
    'public transactions'[status] = "Active"
)
```

### Cancelled Customers

```DAX
Cancelled Customers =
CALCULATE(
    COUNT('public transactions'[customer_id]),
    'public transactions'[status] = "Canceled"
)
```

### Churn Rate

```DAX
Churn Rate % =
DIVIDE(
    [Cancelled Customers],
    [Total Customers],
    0
)
```

### Monthly Recurring Revenue (MRR)

```DAX
MRR =
DIVIDE(
    SUM('public transactions'[amount]),
    36
)
```

---

## Dashboard Preview

![Dashboard Preview](saas_dashboard.png)

---

## Business Insights

### Revenue Analysis

* Enterprise subscriptions contribute the highest share of revenue.
* Premium subscription plans generate significantly more revenue than basic plans.
* Revenue distribution highlights the importance of customer upgrades and premium offerings.

### Customer Retention

* Approximately 85% of customers remain active.
* Churn rate remains around 15%, indicating relatively strong customer retention.
* Monitoring churn trends helps identify retention improvement opportunities.

### Revenue Trends

* Revenue demonstrates stable growth across the analysis period.
* Trend analysis helps identify seasonality, customer purchasing patterns, and revenue fluctuations.
* Historical performance can support forecasting and strategic planning.

---

## Project Structure

```text
saas-revenue-analytics/
│
├── dashboard/
├── data/
│   └── subscription_transactions.csv
│
├── database/
│   ├── schema.sql
│   ├── views.sql
│   └── analytics_queries.sql
│
├── scripts/
│   └── generate_data.py
│
├── saas_dashboard.png
├── saas_revenue_customer_analytics_dashboard.pbix
└── README.md
```

---

## Skills Demonstrated

* Data Analysis
* Business Intelligence
* Power BI Dashboard Development
* SQL Querying
* PostgreSQL Database Management
* Data Modeling
* KPI Development
* DAX Calculations
* Data Visualization
* Revenue Analytics
* Customer Churn Analysis
* Business Metrics Reporting

---

## Future Enhancements

* Customer Lifetime Value (CLV) Analysis
* Revenue Forecasting
* Cohort Analysis
* Retention Analysis Dashboard
* Real-Time Data Integration
* Automated Refresh Pipelines

---

## Author

**Preethi Beri**

Data Science Student | Aspiring Data Analyst | Power BI Enthusiast

GitHub: https://github.com/preethi-beri

LinkedIn: https://www.linkedin.com/in/preethi-beri/

---

⭐ If you found this project useful, consider giving the repository a star.
