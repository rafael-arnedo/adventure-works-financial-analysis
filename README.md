# Adventure Works Financial Analysis with SQL
## Overview
This project analyzes Adventure Works sales, product, customer, territory, and marketing data to evaluate financial performance across global markets. The objective is to identify the countries generating the highest revenue and profitability while assessing the effectiveness of marketing investments through ROI analysis.
The analysis supports strategic decision-making by helping stakeholders determine where future marketing budgets should be allocated to maximize returns.
---
## Business Problem
The Chief Financial Officer (CFO) wants to answer two critical business questions:
1. Which countries generate the highest revenue and gross profit?
2. Which markets are the most profitable when marketing expenses are considered?
By combining transactional sales data with product costs, territory information, and marketing campaign spending, this project provides a data-driven framework for evaluating market performance and investment opportunities.
---
## Project Objectives
- Explore and understand a relational database schema.
- Combine multiple tables using SQL JOINs.
- Clean and prepare data for analysis.
- Handle missing values and standardize data fields.
- Calculate key financial metrics:
- Revenue
- Cost
- Gross Profit
- Profit Margin
- Return on Investment (ROI)
- Perform quality assurance (QA) checks.
- Deliver executive-level business insights using the Context → Finding → Implication (CFI) framework.
---
## Dataset
The project uses a subset of the Adventure Works database.
### Tables Used
| Table | Description |
|---------|-------------|
| ventas_2017 | Sales transaction data at order-line level |
| productos | Product catalog including product cost and price |
| productos_categorias | Product category and subcategory hierarchy |
| clientes | Customer master data and segmentation |
| territorios | Country and continent mapping |
| campanas | Marketing campaign investment by territory |
---
## Data Model
The analysis integrates transactional and dimensional data through relational joins:
- Sales → Products
- Products → Categories
- Sales → Customers
- Customers → Territories
- Territories → Marketing Campaigns
This approach enables revenue, profitability, and ROI calculations at the country and regional levels.
---
## Methodology
### 1. Data Exploration
- Reviewed database schema and table relationships.
- Identified primary and foreign keys.
- Validated table granularity and business definitions.
### 2. Data Preparation
- Joined fact and dimension tables.
- Cleaned and standardized fields.
- Managed null values and data inconsistencies.
- Created reusable SQL views.
### 3. Financial KPI Development
#### Revenue
```sql
Quantity * UnitPrice
```
#### Cost
```sql
Quantity * ProductCost
```
#### Gross Profit
```sql
Revenue - Cost
```
#### Profit Margin
```sql
Gross Profit / Revenue
```
#### Return on Investment (ROI)
```sql
(Gross Profit - Marketing Spend) / Marketing Spend
```
### 4. Quality Assurance (QA)
- Reconciled totals against source data.
- Validated KPI calculations.
- Verified margin percentages.
- Reviewed market-level aggregations.
- Checked for missing or duplicate records.
### 5. Executive Analysis
Insights were structured using the Context → Finding → Implication framework to facilitate business decision-making.
---
## Key Skills Demonstrated
### SQL
- SELECT
- WHERE
- CASE WHEN
- GROUP BY
- ORDER BY
- Aggregate Functions
- Common Table Expressions (CTEs)
- Views
- Data Validation
### Data Analysis
- Financial Analysis
- Revenue Analysis
- Profitability Analysis
- ROI Analysis
- Market Performance Evaluation
- KPI Development
### Business Intelligence
- Executive Reporting
- Data Storytelling
- Decision Support Analysis
- Market Prioritization
---
## Business Value
This project helps stakeholders:
- Identify the highest-performing countries and regions.
- Understand profitability beyond sales volume.
- Evaluate marketing efficiency across markets.
- Prioritize investment opportunities based on ROI.
- Support data-driven budget allocation decisions.
---
## Potential Insights
- Identify countries generating the largest share of total revenue.
- Compare gross profit performance across territories.
- Detect markets with strong sales but low profitability.
- Highlight territories delivering the highest ROI on marketing investments.
- Recommend markets for future marketing budget expansion.
---
## Technologies Used
- SQL
- Relational Databases
- Financial Analytics
- Data Validation
- Business Intelligence
---

## Key Findings
- United States generated the highest revenue ($3.53M) and gross profit ($1.45M).
- Australia delivered the highest ROI (49.16%), making it the most efficient market for marketing investments.
- United Kingdom maintained strong profitability with an ROI above 22%.
- Germany, France, and Canada showed positive financial performance but lower marketing efficiency.
- Future marketing investments should prioritize the United States and Australia.
  
## Business Recommendations
1. Increase marketing investment in the United States and Australia due to their strong financial performance and returns.
2. Review campaign strategies in Germany, France, Canada, and the United Kingdom to improve marketing efficiency.
   
## Author
**Rafael Eduardo Arnedo Padilla**
Data Analyst | Supply Chain Analytics | Logistics Analytics | Business Intelligence
Specialized in transforming operational and financial data into actionable business insights through SQL, Power BI, Python, and advanced analytics.
```
