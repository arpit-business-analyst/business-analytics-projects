## Healthcare Analysis — SQL
This folder contains MySQL queries used for analyzing the healthcare patient flow dataset.
The queries support data cleaning, transformation, and multi-level business analysis.

## Database Setup:
1. Created database: healthcare_analytics
2. Designed table: patient_flow
3. Performed data cleaning and datatype corrections
4. Handled NULL values and inconsistent entries
5. Added primary key (visit_id)

## Analysis Levels:
The queries are structured progressively:

Level 1 – Basic Exploration:
Admission filtering
Visit counts
Department listing
Date range analysis

Level 2 – Time-Based Analysis:
Visits by year & month
Busiest hour
Weekday vs weekend comparison

Level 3 – Department Insights:
Admission rate by department
Average wait time
Satisfaction analysis

Level 4 – Demographic Analysis:
Visits by gender & age group
Admission rate by race
Satisfaction comparison

Level 5 – Operational Insights:
Wait time vs satisfaction relationship
Outlier detection
Hourly satisfaction analysis

Level 6 – Executive Summary Query:
Total visits
Total admissions
Admission rate
Average wait time
Average satisfaction score

## Files Included:
healthcare_queries.sql – All MySQL queries

## Skills Demonstrated:
1. MySQL
2. Data Cleaning
3. Aggregation & Grouping
4. Conditional Logic (CASE)
5. Subqueries
6. Analytical Query Writing
