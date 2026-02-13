## Excel Analysis & Data Cleaning
This folder contains the cleaned datasets and Excel-based analysis files used in the Netflix and Healthcare analytics projects.
All files in this directory are derived from the raw Kaggle datasets stored in the Datasets folder and represent the data preparation and exploratory analysis stage before SQL querying and dashboard creation.

## Netflix Titles – Cleaned & Structured

File: netflix_titles_analysis.xlsx

## Overview
This file contains the cleaned and structured version of the original Netflix dataset. Data cleaning and preparation steps were performed in Excel before visualization in Power BI.

## Key Cleaning & Preparation Steps
1. Handled missing values
2. Standardized date formats
3. Extracted Year Added from Date Added
4. Structured genre information
5. Removed unnecessary columns
6. Ensured consistent data formatting

## Purpose
1. Prepare dataset for dashboard creation
2. Perform initial exploratory data analysis
3. Validate data consistency before visualization
4. This file directly supports the Netflix Content Analysis Dashboard.

## Healthcare Dataset – Cleaned Data

File: healthcare_analytics_patient_flow_data_cleaned.csv

## Overview
This is the cleaned version of the raw healthcare patient flow dataset.

## Key Cleaning Steps
1. Standardized admission date & time formats
2. Created derived fields (e.g., admission year, month)
3. Verified categorical consistency (department, gender, status)
4. Handled missing or inconsistent records
5. Structured age groups

## Purpose
1. Prepare dataset for SQL analysis
2. Improve data reliability
3. Enable accurate KPI calculation

## Healthcare – Pivot Tables & Charts

File: healthcare_analytics_patient_flow_data_cleaned_pivot&charts.xlsx

## Overview
This Excel file contains pivot tables and charts created using the cleaned healthcare dataset.

## Analysis Performed
1. Admission Rate by Department
2. Average Wait Time Analysis
3. Satisfaction Score Trends
4. Department-wise Patient Volume
5. Monthly & Hourly Visit Trends

## Purpose
1. Conduct exploratory data analysis (EDA)
2. Identify patterns before SQL querying
3. Validate insights before building the Power BI dashboard
