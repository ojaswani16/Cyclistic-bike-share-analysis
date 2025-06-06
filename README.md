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

The insights have been distilled into well-structured dashboards to highlight the behavioural differences between annual members and casual riders.

### Dashboard Overview

#### 1. Temporal Analysis Dashboard

-Total Ride Count & Duration: Members take significantly more rides, though casual riders have longer trip durations on average.
-Monthly Trends: Member usage remains steady across the year with peaks in spring and fall. Casual usage is highly seasonal, peaking in summer.
-Weekday vs Weekend Patterns: Members ride mostly on weekdays, suggesting commuting habits. Casual riders dominate on weekends, indicating recreational use.
-Day-wise Trends: Members peak midweek; casual riders peak during weekends.

#### 2. Ride Type & Duration Analysis Dashboard

-Bike Type Preferences: Casual riders prefer electric scooters; members lean towards classic and electric bikes.
-Hourly Ride Trends: Members show commute-time peaks (8 AM and 5 PM), while casual usage builds gradually toward mid-afternoon.
-Trip Duration Distribution: Members mostly take short trips (0–10 mins), while casual riders are more likely to take longer trips.

### Visualisation Strategy

-Dashboards were created in Tableau to ensure professional-quality presentation.
-Charts are annotated, colour-coded, and aligned for ease of interpretation.
-Data is segmented clearly by rider type, time, and bike preference to highlight key behavioural contrasts.

These visualisations help communicate how annual members and casual riders use Cyclistic bikes differently, supporting targeted marketing strategies to increase memberships.

![Cyclistic Dashboard_1](https://github.com/user-attachments/assets/a8734823-7157-4f25-90a2-07793f0b4f74)
![Cyclistic Dashboard_1]( )

## Act 

Based on the analysis of Cyclistic’s bike-share data, we identified clear behavioural differences between annual members and casual riders. These insights inform strategies to convert more casual riders into loyal members.

### Final Conclusion

Annual members use Cyclistic bikes for short, frequent, weekday commutes, while casual riders take longer, leisure-oriented trips, mostly on weekends and during warmer months. These distinct patterns suggest targeted marketing and product offerings can improve membership conversion.

### Top 3 Recommendations

#### 1. Weekend-Only Membership
Introduce a low-cost plan exclusively valid on weekends to align with casual riders' peak usage, providing a flexible entry point into membership.

#### 2. Long Ride Savings Campaign
Utilise behavioural data to highlight potential savings for long rides through targeted app notifications and personalised email reports.

#### 3. Seasonal Membership 
Deploy a time-bound summer pass that includes prompts to upgrade to full annual membership towards the end of the season.

#### 4. Optimise Digital Marketing to Target High-Duration Casual Riders
Use historical ride data to segment and retarget casual riders who consistently take longer trips with tailored membership messaging.

#### 5. Introduce a Time-Limited Trial Membership at Peak Times
Offer casual riders a 7–14 day trial during weekends or seasonal peaks to access membership perks. This encourages high-engagement users to experience membership benefits first-hand, increasing the likelihood of conversion.
