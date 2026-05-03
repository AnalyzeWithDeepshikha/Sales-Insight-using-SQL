# Sales Insights using SQL
Retrieve data from SQL Server to solve real business problems and provide insights to stakeholders

## Executive Summary

This project focuses on analyzing pizza sales data using SQL to extract meaningful business insights and support data-driven decision-making. The analysis covers customer ordering behavior, product performance, revenue trends, and operational efficiency.

Using SQL techniques such as joins, aggregations, window functions, and subqueries, the project identifies high-performing products, peak order times, and revenue contribution across categories. The insights help optimize pricing strategies, improve product offerings, and enhance operational efficiency.

This project demonstrates how raw transactional data can be transformed into actionable insights for strategic business decisions.

---

## Problem Statement

The objective of this project is to analyze pizza sales data to:

* Understand customer ordering patterns
* Identify best-selling pizzas and categories
* Analyze revenue trends
* Support business decision-making

---

## Tools and Technologies

* SQL Server
* T-SQL
* Data Cleaning Techniques
* Aggregations and Window Functions
* Joins and Subqueries

---

## Dataset Overview

The dataset consists of four tables:

* Orders: order_id, date, time
* Order Details: order_details_id, order_id, pizza_id, quantity
* Pizzas: pizza_id, pizza_type_id, size, price
* Pizza Types: pizza_type_id, name, category

---

## Data Cleaning

* Checked for null values in key columns
* Converted data types (VARCHAR to DATE, TIME, DECIMAL)
* Ensured data consistency and accuracy

---

## Key Analysis Performed

### Basic Analysis

* Total number of orders
* Total revenue generated
* Highest-priced pizza
* Most common pizza size
* Top 5 most ordered pizzas
* Category-wise quantity distribution

### Advanced Analysis

* Orders distribution by hour
* Average pizzas ordered per day
* Top 3 pizzas by revenue
* Revenue contribution by category
* Cumulative revenue over time
* Top pizzas per category using ranking

---

## Key Insights

* Total Orders: 21,350
* Total Revenue: 817,860.05
* Most common pizza size: Large
* Top revenue-generating pizzas:

  * Thai Chicken Pizza
  * Barbecue Chicken Pizza
  * California Chicken Pizza

---

## Business Impact

* Identifies high-demand products
* Supports pricing and promotion strategies
* Improves operational efficiency
* Enables data-driven decision-making

---

## Future Enhancements

* Build dashboards using Power BI
* Add customer segmentation analysis
* Implement sales forecasting models
* Integrate real-time data pipelines

---

## Contact

LinkedIn: [deepshikhasharma1996](https://www.linkedin.com/in/deepshikhasharma1996/)
Email: sdeepshikha15@gmail.com
