# Cyclistic Bike-Share Analysis: Member vs. Casual Rider Behaviour
A data analysis case study exploring ride usage patterns of Cyclistic's casual and annual members to provide actionable business recommendations.

## Table of Contents
- [Overview](#overview)
- [Ask](#ask)
- [Prepare](#prepare)
- [Process](#process)
- [Analyze](#analyze)
- [Share](#share)
- [Act](#act)
- [Conclusion](#conclusion)

## Overview 

This project is part of the **Google Data Analytics Capstone**. The goal is to analyse how Cyclistic’s casual riders and annual members use the bike-share service differently, and provide actionable insights to help convert casual riders into members.

## TL;DR

- This case study explores ride behaviour differences between Cyclistic’s casual riders and annual members using 12 months of trip data.
- Tools used: Excel (cleaning), BigQuery (SQL querying), Tableau (visualisation)
- Key findings: Casual riders take longer, weekend rides; members ride shorter durations on weekdays
- Dashboards reveal trends in usage across time, duration, and geography
- Recommendations include: short-term trials, targeted marketing, and seasonal pass offerings

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
- **Date Range**: May 2024 – April 2025  
- **Provider**: Lyft/Divvy (City of Chicago)  
- **Queries and Processed Using**: Google BigQuery

The data is public, anonymised, and verified for completeness and consistency, making it reliable and suitable for educational analysis.

### Data Validation & Credibility Assessment

- Downloaded 12 monthly CSV files.
- Verified schema consistency across months (column names, types, and order).
- Performed structure and type checks in Excel:
    - Counted blanks to identify missing data.
    - Validated formats of timestamps and IDs.
- No corrupt files or ethical concerns found. Data suitable for educational analysis.

---

### Tools Used

- **Excel**: Initial structure checks & derived column creation.
- **Google BigQuery (SQL)**: Cleaning, merging, transformation, and querying.
- **Tableau**: Data visualisation & dashboarding.

Note: Ride duration data was skewed, so the median was calculated alongside the mean to better reflect central tendency.

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
- Combined the 12 monthly tables using `UNION ALL`.
- Standardised column types with `CAST()`.
- Removed duplicate `ride_id` rows.
- Filtered out records with null start station data; end station nulls were kept due to limited impact on analysis.
- Filtered out rides shorter than 1 minute or longer than 1440 minutes (24 hours) to avoid extreme outliers.
- Median was used alongside mean to account for the remaining skewness in trip duration.
- Created additional columns directly in SQL:
  - ride_hour (start hour)
  - month_num (month number)

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

## Analyze

### How do Annual Members & Casual Riders Use Cyclistic Bikes Differently?

#### 1. Ride Frequency & Duration
- Members took 2.93M rides compared to 1.68M by casual riders — 74% more.
- Casual riders take longer trips than members, with a median duration of 13 minutes compared to 9 for members. Casuals ride ~44% longer per trip.

#### 2. Day of Week Patterns
| Peak Weekday | Members → Thursday (484K) | Casuals → Sunday (345K) |
- Members follow a strong weekday usage pattern (2.24M rides), peaking midweek and declining on weekends, indicating routine commuting behaviour. 
- Casual riders exhibit the opposite, spiking on weekends. They use bikes disproportionately more on weekends, signalling that their riding is tied to free time, or leisure, rather than daily routines.

#### 3. Hourly Ride Trends
| Commute Peaks | Members → 8AM & 5PM | Casuals → 3–5PM |
- Members exhibit sharp, structured usage peaks in the early morning (8 AM) and afternoon (5 PM), typical commute hours.
- Casual riders exhibit a more gradual increase. Rides ramp up late morning, peak mid-afternoon, aligning with midday leisure.

#### 4. Seasonality
| Peak Month | Members → September (370K) | Casuals → July (259K) |
- Members maintain high usage from spring through autumn, peaking in September (~370k). This shows year-round commitment.
- Casual riders display strong seasonality, peaking in July and dropping significantly after October (only ~20K in January); they’re season-sensitive.

#### 5. Ride Length Distribution
| >30 mins Trips | Casuals → ~326K | Members → ~182K |
- Only 6% of member rides go beyond 30 minutes, reflecting quick, purpose-driven usage like commuting or errands.
- 19% of casual rides last over 30 minutes, showing they often ride for leisure or exploration

#### 6. Weekend Trends
- Casual riders tend to ride significantly longer on weekends, reinforcing recreational or leisure-based usage. 
- Members maintain steady durations throughout the week, indicating utility-driven travel.
  
#### 7. Station Preferences
- Casual riders favour tourist-friendly areas (e.g., Millennium Park, Streeter Dr & Grand Ave).
- Members use downtown locations (e.g., Clinton St and Washington Blvd), supporting the commuter narrative.

## Share 

The insights are presented through interactive Tableau dashboards to highlight the behavioural differences between annual members and casual riders.

### Dashboard Overview

#### 1. Temporal Analysis Dashboard

- Total Ride Count & Duration: Members take significantly more rides, though median ride durations show that casual riders consistently take longer trips than members.
- Monthly Trends: Members ride consistently across seasons with mild peaks in spring and autumn. Casual usage is more seasonal, sharply peaking during summer months.
- Weekday vs. Weekend Patterns: Members ride mostly on weekdays, suggesting commuting habits. Casual riders dominate on weekends, indicating recreational use.
- Day-wise Trends: Members peak midweek; casual riders peak during weekends.

![Cyclistic Dashboard_1](https://github.com/user-attachments/assets/3b38d936-5870-4f9f-b6cd-1bb929766d4c)

#### 2. Ride Type & Duration Analysis Dashboard

- Bike Type Preferences: Casual riders favour classic bikes due to their affordability and longer ride durations, indicating recreational or leisure-driven use. Members prefer electric bikes, reflecting a focus on speed and efficiency for routine or utility-based travel.
- Hourly Ride Trends: Members show commute-time peaks (8 AM and 5 PM), while casual usage builds gradually toward mid-afternoon.
- Trip Duration Distribution: Members mostly take trips around 9 minutes, while casual riders take longer rides, with a median closer to 13 minutes. 

![Cyclistic Dashboard_2](https://github.com/user-attachments/assets/a5fcf0f2-d679-41eb-8d38-f6bb50b00faf)

### Visualisation Strategy

- Interactive dashboards were created using Tableau for a clean, professional visual presentation.
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

**For Future:** Further research could explore pricing sensitivity, ride bundling strategies, or analyse cancellation reasons using customer support data if available.
