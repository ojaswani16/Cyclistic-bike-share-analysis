-- USER TYPE OVERVIEW
SELECT
  member_casual,
  COUNT(*) AS total_rides
FROM `cyclistic-analysis-461216.cyclistic_2024_data.analysis_cyclistic`
GROUP BY member_casual;

-- TOTAL RIDES & MEDIAN DURATION 
SELECT
  member_casual,
  COUNT(*) AS total_rides,
  APPROX_QUANTILES(ride_length_mins, 100)[OFFSET(50)] AS median_duration
FROM `cyclistic-analysis-461216.cyclistic_2024_data.tableau_analysis`
WHERE NOT (month_num = 4 AND EXTRACT(YEAR FROM started_at) = 2024)
GROUP BY member_casual;

-- MONTHLY TRENDS 
SELECT
  member_casual,
  month_num,
  month,
  EXTRACT(YEAR FROM started_at) AS ride_year,
  COUNT(*) AS total_rides
FROM `cyclistic-analysis-461216.cyclistic_2024_data.tableau_analysis`
WHERE NOT (month_num = 4 AND EXTRACT(YEAR FROM started_at) = 2024)
GROUP BY member_casual, month_num, month, ride_year
ORDER BY ride_year, month_num;

-- RIDES BY DAY OF WEEK
SELECT
  member_casual,
  day_of_week,
  COUNT(*) AS total_rides
FROM `cyclistic-analysis-461216.cyclistic_2024_data.tableau_analysis`
WHERE NOT (month_num = 4 AND EXTRACT(YEAR FROM started_at) = 2024)
GROUP BY member_casual, day_of_week
ORDER BY member_casual, day_of_week;

-- WEEKDAY VS WEEKEND RIDES
SELECT
  member_casual,
  day_type,
  COUNT(*) AS total_rides
FROM `cyclistic-analysis-461216.cyclistic_2024_data.tableau_analysis`
WHERE NOT (month_num = 4 AND EXTRACT(YEAR FROM started_at) = 2024)
GROUP BY member_casual, day_type
ORDER BY member_casual, day_type;

-- HOURLY RIDE TRENDS
SELECT
  member_casual,
  ride_hour,
  COUNT(*) AS total_rides
FROM `cyclistic-analysis-461216.cyclistic_2024_data.tableau_analysis`
WHERE NOT (month_num = 4 AND EXTRACT(YEAR FROM started_at) = 2024)
GROUP BY member_casual, ride_hour
ORDER BY member_casual, ride_hour;

-- BIKE TYPE DISTRIBUTION AND MEDIAN DURATION
SELECT
  member_casual,
  rideable_type,
  COUNT(*) AS total_rides,
  APPROX_QUANTILES(ride_length_mins, 100)[OFFSET(50)] AS median_duration
FROM `cyclistic-analysis-461216.cyclistic_2024_data.tableau_analysis`
WHERE NOT (month_num = 4 AND EXTRACT(YEAR FROM started_at) = 2024)
GROUP BY member_casual, rideable_type
ORDER BY member_casual, rideable_type;

-- RIDE DURATION DISTRIBUTION
SELECT
  member_casual,
  CASE
    WHEN ride_length_mins < 5 THEN '0–5 min'
    WHEN ride_length_mins < 10 THEN '5–10 min'
    WHEN ride_length_mins < 15 THEN '10–15 min'
    WHEN ride_length_mins < 30 THEN '15–30 min'
    WHEN ride_length_mins < 60 THEN '30–60 min'
    ELSE '60+ min'
  END AS duration_bucket,
  COUNT(*) AS total_rides
FROM `cyclistic-analysis-461216.cyclistic_2024_data.tableau_analysis`
WHERE NOT (month_num = 4 AND EXTRACT(YEAR FROM started_at) = 2024)
GROUP BY member_casual, duration_bucket
ORDER BY member_casual, duration_bucket;

-- TOP 10 START STATIONS BY USER TYPE
SELECT *
FROM (
  SELECT
    start_station_name,
    member_casual,
    COUNT(*) AS total_rides,
    ROW_NUMBER() OVER (PARTITION BY member_casual ORDER BY COUNT(*) DESC) AS rank
  FROM `cyclistic-analysis-461216.cyclistic_2024_data.analysis_cyclistic`
  GROUP BY start_station_name, member_casual
)
WHERE rank <= 10;



