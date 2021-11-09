-- Create a new Table (Yearly analysis)
CREATE TABLE yearly_cyclistic AS
(SELECT * FROM "202005-divvy-tripdata"
UNION
SELECT * FROM "202006-divvy-tripdata"
UNION 
SELECT * FROM "202007-divvy-tripdata"
UNION
SELECT * FROM "202008-divvy-tripdata"
UNION
SELECT * FROM "202009-divvy-tripdata"
UNION
SELECT * FROM "202010-divvy-tripdata"
UNION 
SELECT * FROM "202011-divvy-tripdata"
UNION
SELECT * FROM "202012-divvy-tripdata"
UNION
SELECT * FROM "202101-divvy-tripdata"
UNION
SELECT * FROM "202102-divvy-tripdata"
UNION
SELECT * FROM "202103-divvy-tripdata"
UNION
SELECT * FROM "202104-divvy-tripdata"
UNION 
SELECT * FROM "202105-divvy-tripdata");


SELECT 
    DISTINCT count(ride_id) AS total_rides, avg(ride_length) AS mean_ride_length, max(ride_length) AS   max_ride_length, min(ride_length) AS min_ride_length, MODE() WITHIN GROUP (ORDER BY day_of_week) AS modal_value
FROM yearly_cyclistic;

-- Check for NULL
SELECT *
FROM yearly_cyclistic
WHERE ride_length = NULL 

CREATE TABLE avg_ride AS
(SELECT avg(ride_length), day_of_week, member_casual
FROM yearly_cyclistic
GROUP BY member_casual, day_of_week
);

CREATE TABLE member_casual AS
(SELECT count(member_casual), member_casual
FROM yearly_cyclistic
GROUP BY member_casual);


-- Spring
CREATE TABLE spring AS
(SELECT * FROM "202005-divvy-tripdata" 
UNION
SELECT * FROM "202006-divvy-tripdata"
);

CREATE TABLE season_spring AS
(
SELECT avg(ride_length) AS mean_ride_length, day_of_week, member_casual
FROM spring
GROUP BY member_casual, day_of_week
ORDER BY day_of_week
)

-- Summer
CREATE TABLE summer AS
(
SELECT * FROM "202006-divvy-tripdata"
UNION
SELECT * FROM "202007-divvy-tripdata"
UNION
SELECT * FROM "202008-divvy-tripdata"
UNION
SELECT * FROM "202009-divvy-tripdata"
); 

CREATE TABLE season_summer AS 
(
SELECT avg(ride_length) AS mean_ride_length, day_of_week, member_casual
FROM summer
GROUP BY member_casual, day_of_week
ORDER BY day_of_week
);

-- Fall
CREATE TABLE fall AS 
(
SELECT * FROM "202010-divvy-tripdata"
UNION
SELECT * FROM "202011-divvy-tripdata"
UNION
SELECT * FROM "202012-divvy-tripdata"
);

CREATE TABLE season_fall AS 
(
SELECT avg(ride_length) AS mean_ride_length, day_of_week, member_casual
FROM fall
GROUP BY member_casual, day_of_week
ORDER BY day_of_week
);

--Winter
CREATE TABLE winter AS 
(
SELECT * FROM "202012-divvy-tripdata"
UNION
SELECT * FROM "202101-divvy-tripdata"
UNION
SELECT * FROM "202102-divvy-tripdata"
UNION
SELECT * FROM "202103-divvy-tripdata"
);

CREATE TABLE season_winter AS 
(
SELECT avg(ride_length) AS mean_ride_length, day_of_week, member_casual
FROM winter
GROUP BY member_casual, day_of_week
ORDER BY day_of_week
);

CREATE TABLE ride_length AS
( 
SELECT member_casual, start_station_name, end_station_name, ride_length
FROM yearly_cyclistic
WHERE coun(start_sta)
LIMIT 30
);

CREATE TABLE top_50 AS (
WITH yc AS (SELECT ride_id, rideable_type, started_at, ended_at, start_station_name, end_station_name,            start_lat,start_lng, end_lat, end_lng, member_casual, ride_length
            FROM yearly_cyclistic
            ) 
            
    SELECT i.*
    FROM (
           SELECT member_casual, start_station_name, end_station_name, num, rank() OVER (PARTITION BY           member_casual ORDER BY num DESC) num_rank
           FROM (
            SELECT member_casual, start_station_name, end_station_name, count(1) num
            FROM yc
            GROUP BY member_casual,  start_station_name, end_station_name
            ) ii
    ) i
    WHERE num_rank <= 50
 );
 
 
-- Summary stats 

--Spring

CREATE TABLE spring_stats AS 
(
SELECT 
   MODE() WITHIN GROUP (ORDER BY day_of_week) AS mode_day_of_week, max(ride_length) AS max_ride_length   ,avg(ride_length) AS avg_ride_length, member_casual
FROM "spring" 
GROUP BY member_casual
)
--Summer
CREATE TABLE summer_stats AS 
(
SELECT 
   MODE() WITHIN GROUP (ORDER BY day_of_week) AS mode_day_of_week, max(ride_length) AS max_ride_length   ,avg(ride_length) AS avg_ride_length, member_casual
FROM "summer" 
GROUP BY member_casual
)
--Fall
CREATE TABLE fall_stats AS 
(
SELECT 
   MODE() WITHIN GROUP (ORDER BY day_of_week) AS mode_day_of_week, max(ride_length) AS max_ride_length   ,avg(ride_length) AS avg_ride_length, member_casual
FROM "fall" 
GROUP BY member_casual
)
--Winter
CREATE TABLE winter_stats AS 
(
SELECT 
   MODE() WITHIN GROUP (ORDER BY day_of_week) AS mode_day_of_week, max(ride_length) AS max_ride_length   ,avg(ride_length) AS avg_ride_length, member_casual
FROM "winter" 
GROUP BY member_casual
)

--ride type
CREATE TABLE summer_ride_type AS
( 
SELECT
    MODE() WITHIN GROUP (ORDER BY rideable_type) AS most_used_bike, member_casual, count(rideable_type) AS "# frequency of bike type"
FROM summer
GROUP BY member_casual
)

CREATE TABLE spring_ride_type AS
(
SELECT
    MODE() WITHIN GROUP (ORDER BY rideable_type) AS most_used_bike, member_casual, count(rideable_type) AS "# frequency of bike type"
FROM spring
GROUP BY member_casual
)

CREATE TABLE fall_ride_type AS(
SELECT
    MODE() WITHIN GROUP (ORDER BY rideable_type) AS most_used_bike, member_casual, count(rideable_type) AS "# frequency of bike type"
FROM fall
GROUP BY member_casual
)

CREATE TABLE winter_ride_type AS
(
SELECT
    MODE() WITHIN GROUP (ORDER BY rideable_type) AS most_used_bike, member_casual, count(rideable_type) AS "# frequency of bike type"
FROM winter
GROUP BY member_casual
)

CREATE TABLE yearly_ride_type AS
(
SELECT
    MODE() WITHIN GROUP (ORDER BY rideable_type) AS most_used_bike, member_casual, count(rideable_type) AS "# frequency of bike type"
FROM yearly_cyclistic
GROUP BY member_casual
)

CREATE TABLE rideable_type AS 
(
SELECT
     rideable_type, member_casual, day_of_week, count(rideable_type) AS "# frequency of bike type"
FROM winter
GROUP BY member_casual, day_of_week, rideable_type
ORDER BY member_casual
)


