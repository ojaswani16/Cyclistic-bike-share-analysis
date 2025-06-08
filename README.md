# Cyclistic Bike-Share Analysis: Member vs. Casual Rider Behaviour
A data analysis case study exploring ride usage patterns of Cyclistic's casual and annual members to provide actionable business recommendations.

## Table of Contents
- [Overview](#overview)
- [Ask](#ask)
- [Prepare](#prepare)
- [Process](#process)
- [Analysis](#analysis)
- [Share](#share)
- [Act](#act)
- [Conclusion](#conclusion)

## Overview

This project is part of the **Google Data Analytics Capstone**. The goal is to analyse how Cyclistic’s casual riders and annual members use the bike-share service differently, and provide actionable insights to help convert casual riders into members.

---

## Ask

### Business Task

To identify behavioural differences between casual riders and annual members to uncover actionable, data-driven insights that support strategic marketing decisions, aimed at converting casual riders into annual members.

---

## Prepare

### Data Source

- **Dataset**: Divvy/Cyclistic Public Bike-Share Dataset  
- **URL**: [divvy-tripdata.s3.amazonaws.com](https://divvy-tripdata.s3.amazonaws.com/index.html)  
- **Format**: `.csv`  
- **Date Range**: April 2024 – April 2025  
- **Provider**: Lyft/Divvy (City of Chicago)  
- **Queries and Processed Using**: Google BigQuery

The data is public, anonymised, and verified for completeness and consistency, making it reliable and suitable for educational analysis.

### Data Validation & Credibility Assessment

- Downloaded 13 monthly CSV files.
- Verified schema consistency across months (column names, types, and order).
- Performed structure and type checks in Excel:
    - Counted blanks to identify missing data.
    - Validate formats of timestamps and IDs.
- No corrupt files or ethical concerns found. Data suitable for educational analysis.

---

### Tools Used

- **Excel** – Initial structure checks & derived column creation.
- **Google BigQuery (SQL)** – Cleaning, merging, transformation, and querying.
- **Tableau** – Data visualisation & dashboarding.

---

## Process

### Tools Chosen
- **Excel** was used initially to inspect the data and perform basic formatting and calculations.
- **Google BigQuery (SQL)** was selected for its ability to handle large datasets and perform efficient cleaning and transformation tasks.

### Data Preparation and Cleaning Workflow

#### 1. Initial Inspection (Excel)
- Created new derived columns:
  month, day_of_week, day_type, ride_length, and ride_length_mins.
- Reformatted inconsistent date/time and categorical values.
- Counted blanks to assess cleaning load for SQL phase.

#### 2. Data Integration & Cleanup (BigQuery)
- Uploaded all monthly files to BigQuery individually.
- Combined the 13 monthly tables using `UNION ALL`.
- Standardised column types with `CAST()`.
- Removed duplicate `ride_id` rows.
- Filtered out records with null start station data; end station nulls were kept due to limited impact on analysis.
- Filtered out rides shorter than 1 minute or longer than 1440 minutes (24 hours) to avoid outliers and skewed averages.
- Created additional columns directly in SQL:
hour (ride start hour) and month_num (numeric form of month). 

### SQL Scripts

- [01. Data Combining.sql](01_Data_Combining.sql)
- [02. Data Exploration.sql](02_Data_Exploration.sql)
- [03. Data Cleaning.sql](03_Data_Cleaning.sql)
- [04. Data Analysis.sql](04_Data_Analysis.sql)

### Documentation

- Each step was documented and validated to maintain transparency and reproducibility.
- The relevance to the business question drove cleaning decisions.

The final dataset was clean, consistent, and ready for advanced analysis.

---

## Analysis

### How do Annual Members & Casual Riders Use Cyclistic Bikes Differently?

#### 1. Ride Frequency & Duration
- Members took 3.15M rides compared to 1.79M by casual riders — 76% more.
- Casual riders take longer trips on average (22.8 mins) than members (12.3 mins).

#### 2. Day of Week Patterns
- Members follow a strong weekday usage pattern, peaking midweek and declining on weekends, indicating routine commuting behaviour. 
- Casual riders exhibit the opposite, spiking on weekends, enforcing recreational or leisure-based use.

#### 3. Hourly Ride Trends
- Members show sharp, structured usage peaks in early morning (8 AM) and afternoon (5 PM), typical commute hours.
- Casual riders exhibit a more gradual increase, peaking (12–5 PM), aligning with midday leisure use.

#### 4. Seasonality
- Members peak in April (~440K rides), then again in September, showing consistent year-round usage, especially in spring.
- Casual riders peak in July and drop sharply post-October, indicating more weather-sensitive or seasonal usage.

#### 5. Ride Length Distribution
- Members typically ride 0–10 mins, suggesting shorter, functional commutes.
- Casual riders are more likely to take longer, recreational rides ranging from 15 minutes to over an hour.

#### 6. Weekend Trends
- Casual riders tend to ride significantly longer on weekends, reinforcing recreational or leisure-based usage. 
- Members maintain steady durations throughout the week, indicating utility-driven travel.
  
#### 7. Station Preferences
- Casual riders favour tourist-friendly areas (e.g., Millennium Park, Streeter Dr & Grand Ave).
- Members use downtown locations (e.g., Clinton St and Washington Blvd), supporting the commuter narrative.

#### 8. Trip Completion 
- Over 96% of trips end at a different station.
- Members are ~20x more likely to end rides at the same station, possibly due to loop rides or fitness purposes.

## Share 

The insights are presented through interactive Tableau dashboards to highlight the behavioural differences between annual members and casual riders.

### Dashboard Overview

#### 1. Temporal Analysis Dashboard

- Total Ride Count & Duration: Members take significantly more rides, though casual riders have longer trip durations on average.
- Monthly Trends: Member usage remains steady across the year with peaks in spring and fall. Casual rider activity is highly seasonal, peaking in summer.
- Weekday vs Weekend Patterns: Members ride mostly on weekdays, suggesting commuting habits. Casual riders dominate on weekends, indicating recreational use.
- Day-wise Trends: Members peak midweek; casual riders peak during weekends.

![Cyclistic Dashboard_1](https://github.com/user-attachments/assets/a8734823-7157-4f25-90a2-07793f0b4f74)

#### 2. Ride Type & Duration Analysis Dashboard

- Bike Type Preferences: Casual riders prefer electric scooters; members lean towards classic and electric bikes.
- Hourly Ride Trends: Members show commute-time peaks (8 AM and 5 PM), while casual usage builds gradually toward mid-afternoon.
- Trip Duration Distribution: Members mostly take short trips (0–10 mins), while casual riders are more likely to take longer trips.

![Cyclistic Dashboard_2](https://github.com/user-attachments/assets/22f3f3f4-c72b-426e-898a-56fe4b3e9c65)

### Visualisation Strategy

- Dashboards are created in Tableau to ensure professional-quality presentation.
- Charts are annotated, colour-coded, and aligned for ease of interpretation.
- Data is segmented clearly by rider type, time, and bike preference to highlight key behavioural contrasts.

**Full Interactive Dashboards:** [View on Tableau Public](https://public.tableau.com/views/Cyclistic_Analysis_17492411920950/TemporalAnalysis?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)

## Act 

Based on the analysis of Cyclistic’s bike-share data, we identified clear behavioural differences between annual members and casual riders. These insights inform strategies to convert more casual riders into loyal members.

### Top 3 Recommendations

#### 1. Flexible Trial-Based Membership Plans
Introduce low-commitment options such as a weekend-only membership and short-term trial passes (7–14 days) during seasonal peaks. These align with the usage patterns of casual riders and allow them to experience membership benefits with minimal risk, thereby increasing the likelihood of conversion.

#### 2. Behaviour-Driven Marketing & Cost-Saving Campaigns
Leverage ride history to segment casual users—especially those with high ride frequency or longer durations—and target them through personalised digital campaigns. Highlight potential savings through membership using in-app prompts, email insights, and social media ads to nudge them toward conversion.

#### 3. Seasonal Passes 
Launch summer-specific passes tailored to casual riders’ seasonal preferences, accompanied by timely upgrade prompts encouraging users to convert to full annual membership. This approach taps into their peak engagement window while gently guiding them toward a longer-term commitment.

## Conclusion

Annual members use Cyclistic bikes for short, frequent, weekday commutes, while casual riders take longer, leisure-oriented trips, mostly on weekends and during warmer months. These distinct patterns support data-driven membership strategies aimed at increasing annual subscriptions through tailored offerings and targeted outreach.
