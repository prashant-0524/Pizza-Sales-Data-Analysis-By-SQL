Pizza Sales Data Analysis Project BY Using SQL (2015)

📌 Project Overview
This project provides a comprehensive analysis of a pizza restaurant's sales data for the year 2015. Using SQL, I extracted and analyzed over 21,000 orders to identify key performance indicators (KPIs), consumer behavior trends, and operational bottlenecks. The goal is to provide data-driven recommendations for menu optimization and staffing efficiency.

📊 Business Performance (KPIs)
The following metrics represent the high-level performance for the year 2015:
* **Total Revenue:** $817,860
* **Total Orders:** 21,350
* **Total Pizzas Sold:** 49,574
* **Top Revenue Generator:** The **Thai Chicken Pizza** ($43,434)

🔍 Key Insights & Analysis

1. Product & Size Performance
**Size Matters:** Large (L) pizzas are the primary revenue driver, accounting for **46% of total revenue** ($375,318).
**The "Tail" End:** XL and XXL sizes are underperforming, contributing less than 2% to the total revenue combined.
**Recommendation:** Simplify the menu by removing XXL sizes to reduce inventory complexity and packaging costs.

2. Operational Trends: "When the Heat is On"
The analysis identified two distinct peak periods:
**Lunch Rush:** 12:00 PM – 1:00 PM
**Dinner Peak:** 5:00 PM – 7:00 PM (Highest hourly revenue).
**Recommendation:** Optimize staff scheduling to ensure maximum capacity during these windows to maintain service speed.

3. Monthly Seasonality
Revenue remains relatively stable year-round.
Minor peaks were observed in **July** and **January**, suggesting opportunities for seasonal marketing campaigns.

🛠️ Tools Used
**SQL:** For data extraction, cleaning, and complex aggregations (Joins, Window Functions, Date/Time analysis).
**Data Source:** 4 Relational CSV files (Orders, Order Details, Pizzas, and Pizza Types).
**Documentation:** Detailed PDF presentation summarizing findings.

📂 Repository Structure
* `Data/`: Contains the 4 raw CSV files used for analysis.
* `SQL_Scripts/`: The `.sql` file containing the full database setup and analysis queries.
* `Reports/`: A PDF presentation with visual breakdowns of the findings.

🚀 How to Use
1. Clone the repository.
2. Import the `.sql` script into your SQL environment (e.g., MySQL, PostgreSQL).
3. Run the queries against the provided datasets to replicate the findings.
