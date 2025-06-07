--Total Rides by User Type
SELECT member_casual, COUNT(*) AS total_rides
FROM cyclistic_analysis
GROUP BY member_casual;

--Rides by Month
SELECT member_casual, month, COUNT(*) AS rides
FROM cyclistic_analysis
GROUP BY member_casual, month;

--Rides by Day of Week
SELECT member_casual, day_of_week, COUNT(*) AS ride_count
FROM cyclistic_analysis
GROUP BY member_casual, day_of_week;

--Rides by Day Type (Weekend/Weekday)
SELECT member_casual, day_type, COUNT(*) AS ride_count
FROM cyclistic_analysis
GROUP BY member_casual, day_type;

--Rides by Hour
SELECT member_casual, hour, COUNT(*) AS ride_count
FROM cyclistic_analysis
GROUP BY member_casual, hour;

--Rides by Bike Type
SELECT member_casual, rideable_type, COUNT(*) AS ride_count
FROM cyclistic_analysis
GROUP BY member_casual, rideable_type;

--Average Duration (in Minutes)
SELECT member_casual, AVG(ride_length_mins) AS avg_duration
FROM cyclistic_analysis
GROUP BY member_casual;

--Duration Bins (Example)
SELECT member_casual, duration_bin, COUNT(*) AS ride_count
FROM cyclistic_analysis
GROUP BY member_casual, duration_bin;

--Top 10 Start Stations
SELECT start_station_name, member_casual, COUNT(*) AS ride_count
FROM cyclistic_analysis
WHERE start_station_name IS NOT NULL
GROUP BY start_station_name, member_casual
ORDER BY ride_count DESC
LIMIT 10;
