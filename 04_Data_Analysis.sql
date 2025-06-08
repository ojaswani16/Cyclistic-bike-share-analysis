-- USER TYPE OVERVIEW
SELECT member_casual, COUNT(*) AS total_rides
FROM `cyclistic-analysis-461216.cyclistic_2024_data.analysis_cyclistic`
GROUP BY member_casual;

-- MONTHLY TRENDS
SELECT
  member_casual,
  month,
  EXTRACT(MONTH FROM PARSE_DATE('%B', month)) AS month_num,
  COUNT(ride_id) AS ride_count,
  ROUND(AVG(ride_length_mins), 2) AS avg_ride_duration
FROM `cyclistic-analysis-461216.cyclistic_2024_data.analysis_with_hour`
GROUP BY member_casual, month, month_num
ORDER BY month_num;

-- RIDES BY DAY OF WEEK
SELECT member_casual, day_of_week, COUNT(*) AS ride_count
FROM `cyclistic-analysis-461216.cyclistic_2024_data.analysis_cyclistic`
GROUP BY member_casual, day_of_week;

-- RIDES BY DAY TYPE
SELECT member_casual, day_type, COUNT(*) AS ride_count
FROM `cyclistic-analysis-461216.cyclistic_2024_data.analysis_cyclistic`
GROUP BY member_casual, day_type;

-- RIDES BY HOUR
SELECT member_casual, hour, COUNT(*) AS ride_count
FROM `cyclistic-analysis-461216.cyclistic_2024_data.analysis_with_hour`
GROUP BY member_casual, hour;

-- BIKE TYPE DISTRIBUTION
SELECT
  rideable_type,
  member_casual,
  COUNT(ride_id) AS ride_count
FROM `cyclistic-analysis-461216.cyclistic_2024_data.analysis_cyclistic`
GROUP BY rideable_type, member_casual
ORDER BY ride_count DESC;

-- AVERAGE RIDE DURATION
SELECT member_casual, ROUND(AVG(ride_length_mins), 2) AS avg_duration
FROM `cyclistic-analysis-461216.cyclistic_2024_data.analysis_cyclistic`
GROUP BY member_casual;

-- RIDE DURATION BINS
SELECT
  member_casual,
  CASE
    WHEN ride_length_mins BETWEEN 1 AND 5 THEN '0–5 mins'
    WHEN ride_length_mins BETWEEN 6 AND 10 THEN '6–10 mins'
    WHEN ride_length_mins BETWEEN 11 AND 15 THEN '11–15 mins'
    WHEN ride_length_mins BETWEEN 16 AND 30 THEN '16–30 mins'
    WHEN ride_length_mins BETWEEN 31 AND 60 THEN '31–60 mins'
    WHEN ride_length_mins BETWEEN 61 AND 120 THEN '1–2 hours'
    WHEN ride_length_mins BETWEEN 121 AND 240 THEN '2–4 hours'
    WHEN ride_length_mins BETWEEN 241 AND 480 THEN '4–8 hours'
    WHEN ride_length_mins BETWEEN 481 AND 720 THEN '8–12 hours'
    ELSE '12–24 hours'
  END AS duration_bin,
  COUNT(ride_id) AS ride_count
FROM `cyclistic-analysis-461216.cyclistic_2024_data.analysis_cyclistic`
GROUP BY member_casual, duration_bin
ORDER BY duration_bin;

-- DURATION BIN BY DAY TYPE
SELECT
  duration_bin,
  day_type,
  member_casual,
  COUNT(ride_id) AS ride_count
FROM (
  SELECT *,
    CASE
      WHEN ride_length_mins BETWEEN 1 AND 5 THEN '0–5 mins'
      WHEN ride_length_mins BETWEEN 6 AND 10 THEN '6–10 mins'
      WHEN ride_length_mins BETWEEN 11 AND 15 THEN '11–15 mins'
      WHEN ride_length_mins BETWEEN 16 AND 30 THEN '16–30 mins'
      WHEN ride_length_mins BETWEEN 31 AND 60 THEN '31–60 mins'
      WHEN ride_length_mins BETWEEN 61 AND 120 THEN '1–2 hours'
      WHEN ride_length_mins BETWEEN 121 AND 240 THEN '2–4 hours'
      WHEN ride_length_mins BETWEEN 241 AND 480 THEN '4–8 hours'
      WHEN ride_length_mins BETWEEN 481 AND 720 THEN '8–12 hours'
      ELSE '12–24 hours'
    END AS duration_bin
  FROM `cyclistic-analysis-461216.cyclistic_2024_data.analysis_cyclistic`
)
GROUP BY duration_bin, day_type, member_casual
ORDER BY duration_bin, day_type;

-- TOP 10 START STATIONS PER USER TYPE
SELECT *
FROM (
  SELECT
    start_station_name,
    member_casual,
    COUNT(ride_id) AS ride_count,
    ROW_NUMBER() OVER (PARTITION BY member_casual ORDER BY COUNT(ride_id) DESC) AS rank
  FROM `cyclistic-analysis-461216.cyclistic_2024_data.analysis_cyclistic`
  GROUP BY start_station_name, member_casual
)
WHERE rank <= 10;

-- START AND END STATION MATCH
SELECT
  member_casual,
  CASE
    WHEN start_station_name = end_station_name THEN 'Same Station'
    ELSE 'Different Station'
  END AS trip_type,
  COUNT(ride_id) AS ride_count
FROM `cyclistic-analysis-461216.cyclistic_2024_data.analysis_cyclistic`
GROUP BY member_casual, trip_type;
