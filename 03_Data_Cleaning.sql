-- Check for duplicate ride_id
SELECT ride_id, COUNT(ride_id)
FROM `cyclistic-analysis-461216.cyclistic_2024_data.rides_2024`
GROUP BY ride_id
HAVING COUNT(ride_id) > 1;

-- Count total duplicate rows
SELECT COUNT(*) AS total_duplicate_rows
FROM `cyclistic-analysis-461216.cyclistic_2024_data.rides_2024`
WHERE ride_id IN (
  SELECT ride_id
  FROM `cyclistic-analysis-461216.cyclistic_2024_data.rides_2024`
  GROUP BY ride_id
  HAVING COUNT(*) > 1
);

-- Trimming whitespace from station names
CREATE OR REPLACE TABLE `cyclistic-analysis-461216.cyclistic_2024_data.cleaned_rides_2024` AS
SELECT 
  *,
  TRIM(start_station_name) AS start_station_name,
  TRIM(end_station_name) AS end_station_name
FROM `cyclistic-analysis-461216.cyclistic_2024_data.cleaned_rides_2024`;

-- Removing NULL station names 
CREATE OR REPLACE TABLE `cyclistic-analysis-461216.cyclistic_2024_data.analysis_cyclistic` AS
SELECT *
FROM `...cleaned_rides_2024`
WHERE start_station_name IS NOT NULL
  AND start_station_id IS NOT NULL
