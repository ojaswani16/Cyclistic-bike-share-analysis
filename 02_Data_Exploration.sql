-- Row count
SELECT COUNT(*) FROM `cyclistic-analysis-461216.cyclistic_2024_data.rides_2024`;

-- Checked for NULLs
SELECT 
  COUNTIF(start_station_name IS NULL) AS null_start_station,
  COUNTIF(end_station_name IS NULL) AS null_end_station
FROM `cyclistic-analysis-461216.cyclistic_2024_data.rides_2024`;

-- Count by member type
SELECT member_casual, COUNT(*) AS ride_count
FROM `cyclistic-analysis-461216.cyclistic_2024_data.rides_2024`
GROUP BY member_casual;

-- Check rideable type distribution
SELECT rideable_type, COUNT(*) AS ride_count
FROM `cyclistic-analysis-461216.cyclistic_2024_data.rides_2024`
GROUP BY rideable_type;
