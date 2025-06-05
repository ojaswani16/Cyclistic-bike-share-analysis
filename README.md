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

## Share Phase

The final Tableau dashboard presents key findings through visual summaries. It highlights:

- Monthly and daily ride trends by rider type
- Hourly usage patterns to show peak commute vs leisure times
- Duration-based comparisons across weekdays and weekends
- Ride type classifications and ride length distributions

These visualisations help communicate how annual members and casual riders use Cyclistic bikes differently, supporting targeted marketing strategies to increase memberships.

![Cyclistic Dashboard](cyclistic_dashboard.png)

## Act 

Based on the analysis of Cyclistic’s bike-share data, we identified clear behavioural differences between annual members and casual riders. These insights inform strategies to convert more casual riders into loyal members.

### Final Conclusion

Annual members use Cyclistic bikes for short, frequent, weekday commutes, while casual riders take longer, leisure-oriented trips, mostly on weekends and during warmer months. These distinct patterns suggest targeted marketing and product offerings can improve membership conversion.

### Top 3 Recommendations

#### 1. Introduce a “Weekend-Only Membership” Plan
Offer a low-cost membership tier that activates only on weekends, when casual riders are most active. This limited plan caters directly to their behaviour, easing them into the membership ecosystem without demanding a full annual commitment.

#### 2. Promote “Long Ride Savings” With Membership

#### 3. Ride-Now, Decide-Later Trial
Seasonal Pass with Upgrade Option
