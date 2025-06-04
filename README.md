# Cyclistic-bike-share-analysis
A data analysis case study exploring ride usage patterns of Cyclistic's casual and annual members to provide actionable business recommendations.
## Overview

This project is part of the **Google Data Analytics Capstone**. The goal is to analyse how Cyclistic’s casual riders and annual members use the bike-share service differently, and provide actionable insights to help convert casual riders into members.

---

## Business Task

To identify behavioural differences between casual riders and annual members to uncover actionable, data-driven insights that support strategic marketing decisions, aimed at converting casual riders into annual members.


---

## Data Source

- **Dataset**: Divvy/Cyclistic Public Bike-Share Dataset  
- **URL**: [divvy-tripdata.s3.amazonaws.com](https://divvy-tripdata.s3.amazonaws.com/index.html)  
- **Format**: `.csv`  
- **Date Range**: April 2024 – April 2025  
- **Provider**: Lyft/Divvy (City of Chicago)  
- **Stored Using**: Google BigQuery

The data is public, anonymised, and verified for completeness and consistency, making it reliable and suitable for educational analysis.

---

## Tools Used

- **SQL** (Google BigQuery) – Data cleaning, transformation, and analysis.
- **Excel** – Initial data exploration and structure validation  
- **Tableau** – Data visualisation

---

## Process

### Tools Chosen
- **Excel** was used initially to inspect the data and perform basic formatting and calculations.
- **Google BigQuery (SQL)** was selected for its ability to handle large datasets and perform efficient cleaning and transformation tasks.

### Data Integrity and Cleaning
- Removed null values, duplicate ride IDs, and rows with negative ride durations.
- Standardised datetime formats and ensured consistent schema across all 13 monthly CSVs.
- Created new fields such as `ride_length`, `ride_length_minutes`, `day_of_week`, `month`, and `day_type` for better analysis.
- Resolved data type mismatches using SQL functions like `CAST()` and `FORMAT_TIMESTAMP()`.
- Merged monthly datasets into a single clean table using `UNION ALL`.

### Documentation
- Each step of the cleaning process was logged for transparency and reproducibility.

The cleaned dataset was consistent and ready for analysis.

---


