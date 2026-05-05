# Amazon-Sales-Insights-Analytics
SQL project analyzing Amazon sales data for business insights and performance trends.

## Project Overview
This project focuses on analyzing Amazon sales data using PostgreSQL. The goal was to explore business performance, understand customer behavior, and identify key factors affecting revenue and profitability.
We created a structured table and ran multiple SQL queries to extract meaningful insights across different business areas like revenue trends, customer patterns, product performance, and more.

### Dataset & Table Structure

The dataset contains order-level information, including:
- Customer details
- Product and category information
- Pricing (unit price, discount, tax)
- Order status and payment methods
- Location (city, state, country)
- Shipping cost and total revenue
  
A single table Amazon_Orders was created to store and analyze all this data efficiently.

### 1. Revenue & Growth Trends
What we did
- We analyzed monthly revenue and total number of orders using aggregation functions.

What we found
- This helps track business growth over time, showing which months performed well and identifying seasonal patterns or drops in sales.

### Top Selling Products & Categories
What we did
Identified top products based on total revenue
Found products with highest sales volume (quantity sold)

What we found
We can clearly see:
- Which products generate the most revenue
- Which products are sold the most
This helps in inventory planning and marketing focus.

### 3. Customer Behavior Insights
What we did
Identified repeat customers
Compared new vs repeat customers
Calculated Average Order Value (AOV)

What we found
Repeat customers contribute significantly to revenue
Customer loyalty patterns become visible
AOV helps understand spending behavior per order

### Discount Impact Analysis
What we did
Grouped orders based on discount levels and analyzed their effect on order value.

What we found
Discounts influence buying behavior
Higher discounts may increase orders but can affect profitability
Helps balance sales vs profit strategy

### Location-Based Trends
What we did
Analyzed revenue by state and city.

What we found
Identified top-performing regions
Helps in understanding geographical demand patterns
Useful for targeted marketing and logistics planning

### Shipping Cost & Efficiency
What we did
Compared shipping cost with order value
Grouped orders into low, medium, and high value

What we found
Shipping cost trends across different order types
Helps evaluate cost efficiency and pricing strategies

### Payment Method Trends
What we did
Analyzed orders, revenue, and average order value by payment method.

What we found
Popular payment methods among customers
Their impact on revenue
Useful for optimizing payment options and user experience

### Order Status & Returns
What we did
Counted orders based on their status.

What we found
Helps track completed, pending, or returned orders
Gives insight into operational efficiency and return rates

### Profitability Analysis
What we did
Calculated profit per order
Identified most profitable products
Measured discount impact on revenue
Found top customers by spending

What we found
True profitability after accounting for costs
High-revenue products are not always high-profit
A small group of customers contributes a large portion of revenue (Pareto principle)

### Key Takeaways
Revenue trends help in forecasting and planning
Repeat customers are crucial for long-term growth
Discounts should be optimized, not overused
Location data can guide regional strategies
Profitability analysis is essential beyond just revenue

### Tools Used
PostgreSQL
SQL (Aggregation, CASE statements, Grouping, Filtering)

### Conclusion
This project demonstrates how raw transactional data can be transformed into actionable insights using SQL. It highlights the importance of data-driven decision-making in improving sales performance, customer retention, and overall profitability.
