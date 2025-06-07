-- Created a combined table of all 13 months
-- Note: the first 8 months (April–November 2024) had a uniform schema
-- Later months required casting of ride_length

CREATE TABLE `cyclistic-analysis-461216.cyclistic_2024_data.rides_2024` AS

-- April to November 2024
SELECT * FROM `cyclistic-analysis-461216.cyclistic_2024_data.april_2024`
UNION ALL
SELECT * FROM `cyclistic-analysis-461216.cyclistic_2024_data.may_2024`
UNION ALL
SELECT * FROM `cyclistic-analysis-461216.cyclistic_2024_data.june_2024`
UNION ALL
SELECT * FROM `cyclistic-analysis-461216.cyclistic_2024_data.july_2024`
UNION ALL
SELECT * FROM `cyclistic-analysis-461216.cyclistic_2024_data.august_2024`
UNION ALL
SELECT * FROM `cyclistic-analysis-461216.cyclistic_2024_data.september_2024`
UNION ALL
SELECT * FROM `cyclistic-analysis-461216.cyclistic_2024_data.october_2024`
UNION ALL
SELECT * FROM `cyclistic-analysis-461216.cyclistic_2024_data.november_2024`

-- December 2024 to April 2025 with explicit casting of ride_length
UNION ALL
SELECT ride_id, rideable_type, started_at, ended_at, 
       CAST(ride_length AS STRING) AS ride_length,
       ride_length_mins, start_station_name, start_station_id, 
       end_station_name, end_station_id, start_lat, start_lng, 
       end_lat, end_lng, member_casual, month, day_of_week, day_type
FROM `cyclistic-analysis-461216.cyclistic_2024_data.december_2024`

UNION ALL
SELECT ride_id, rideable_type, started_at, ended_at, 
       CAST(ride_length AS STRING) AS ride_length,
       ride_length_mins, start_station_name, start_station_id, 
       end_station_name, end_station_id, start_lat, start_lng, 
       end_lat, end_lng, member_casual, month, day_of_week, day_type
FROM `cyclistic-analysis-461216.cyclistic_2024_data.january_2025`

UNION ALL
SELECT ride_id, rideable_type, started_at, ended_at, 
       CAST(ride_length AS STRING) AS ride_length,
       ride_length_mins, start_station_name, start_station_id, 
       end_station_name, end_station_id, start_lat, start_lng, 
       end_lat, end_lng, member_casual, month, day_of_week, day_type
FROM `cyclistic-analysis-461216.cyclistic_2024_data.february_2025`

UNION ALL
SELECT ride_id, rideable_type, started_at, ended_at, 
       CAST(ride_length AS STRING) AS ride_length,
       ride_length_mins, start_station_name, start_station_id, 
       end_station_name, end_station_id, start_lat, start_lng, 
       end_lat, end_lng, member_casual, month, day_of_week, day_type
FROM `cyclistic-analysis-461216.cyclistic_2024_data.march_2025`

UNION ALL
SELECT ride_id, rideable_type, started_at, ended_at, 
       CAST(ride_length AS STRING) AS ride_length,
       ride_length_mins, start_station_name, start_station_id, 
       end_station_name, end_station_id, start_lat, start_lng, 
       end_lat, end_lng, member_casual, month, day_of_week, day_type
FROM `cyclistic-analysis-461216.cyclistic_2024_data.april_2025`;
