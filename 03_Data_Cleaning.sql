-- Inspect the Data Structure
SELECT * 
FROM `cyclistic-analysis-461216.cyclistic_2024_data.rides_2024`
LIMIT 10;

-- Check for Duplicate ride_id
SELECT ride_id, COUNT(ride_id)
FROM `cyclistic-analysis-461216.cyclistic_2024_data.rides_2024`
GROUP BY ride_id
HAVING COUNT(ride_id) > 1;

-- Count Total Duplicate Rows
SELECT COUNT(*) AS total_duplicate_rows
FROM `cyclistic-analysis-461216.cyclistic_2024_data.rides_2024`
WHERE ride_id IN (
  SELECT ride_id
  FROM `cyclistic-analysis-461216.cyclistic_2024_data.rides_2024`
  GROUP BY ride_id
  HAVING COUNT(*) > 1
);

-- Trim Whitespace from Station Names
CREATE OR REPLACE TABLE `cyclistic-analysis-461216.cyclistic_2024_data.cleaned_rides_2024` AS
SELECT 
  *,
  TRIM(start_station_name) AS start_station_name,
  TRIM(end_station_name) AS end_station_name
FROM `cyclistic-analysis-461216.cyclistic_2024_data.rides_2024`;

-- Remove Rows with NULL Start Station Data
CREATE OR REPLACE TABLE `cyclistic-analysis-461216.cyclistic_2024_data.analysis_cyclistic` AS
SELECT *
FROM `cyclistic-analysis-461216.cyclistic_2024_data.cleaned_rides_2024`
WHERE start_station_name IS NOT NULL
  AND start_station_id IS NOT NULL;

-- Remove Invalid Ride Durations
DELETE FROM `cyclistic-analysis-461216.cyclistic_2024_data.cleaned_rides_2024`
WHERE trip_duration <= 0;

-- Row Count
SELECT COUNT(*) 
FROM `cyclistic-analysis-461216.cyclistic_2024_data.rides_2024`;

-- NULL Value Check
SELECT 
  COUNTIF(start_station_name IS NULL) AS null_start_station,
  COUNTIF(end_station_name IS NULL) AS null_end_station
FROM `cyclistic-analysis-461216.cyclistic_2024_data.rides_2024`;

-- Member Type Distribution
SELECT member_casual, COUNT(*) AS ride_count
FROM `cyclistic-analysis-461216.cyclistic_2024_data.rides_2024`
GROUP BY member_casual;

-- Rideable Type Distribution
SELECT rideable_type, COUNT(*) AS ride_count
FROM `cyclistic-analysis-461216.cyclistic_2024_data.rides_2024`
GROUP BY rideable_type;

-- Add Ride Hour
CREATE OR REPLACE TABLE `cyclistic-analysis-461216.cyclistic_2024_data.analysis_with_hour` AS
SELECT *,
  EXTRACT(HOUR FROM start_time) AS ride_hour
FROM `cyclistic-analysis-461216.cyclistic_2024_data.analysis_cyclistic`;

-- Add Month Number
CREATE OR REPLACE TABLE `cyclistic-analysis-461216.cyclistic_2024_data.analysis_with_hour` AS
SELECT *,
  EXTRACT(MONTH FROM PARSE_DATE('%B', month)) AS month_num
FROM `cyclistic-analysis-461216.cyclistic_2024_data.analysis_with_hour`;
