-- TOTAL ROWS
SELECT COUNT(*) AS total_rows
FROM `cyclistic-analysis-461216.cyclistic_2024_data.rides_2024`;

-- NULL VALUES CHECK
SELECT 
  COUNTIF(start_station_name IS NULL) AS null_start_station,
  COUNTIF(end_station_name IS NULL) AS null_end_station
FROM `cyclistic-analysis-461216.cyclistic_2024_data.rides_2024`;

-- RIDER TYPE DISTRIBUTION
SELECT member_casual, COUNT(*) AS ride_count
FROM `cyclistic-analysis-461216.cyclistic_2024_data.rides_2024`
GROUP BY member_casual;

-- BIKE TYPE DISTRIBUTION
SELECT rideable_type, COUNT(*) AS ride_count
FROM `cyclistic-analysis-461216.cyclistic_2024_data.rides_2024`
GROUP BY rideable_type;

-- DUPLICATE RIDE_ID CHECK
SELECT ride_id, COUNT(ride_id)
FROM `cyclistic-analysis-461216.cyclistic_2024_data.rides_2024`
GROUP BY ride_id
HAVING COUNT(ride_id) > 1;

-- TOTAL DUPLICATE ROWS
SELECT COUNT(*) AS total_duplicate_rows
FROM `cyclistic-analysis-461216.cyclistic_2024_data.rides_2024`
WHERE ride_id IN (
  SELECT ride_id
  FROM `cyclistic-analysis-461216.cyclistic_2024_data.rides_2024`
  GROUP BY ride_id
  HAVING COUNT(*) > 1
);

-- PREVIEW START/END TIME FORMATS
SELECT start_time, end_time
FROM `cyclistic-analysis-461216.cyclistic_2024_data.rides_2024`
LIMIT 10;
