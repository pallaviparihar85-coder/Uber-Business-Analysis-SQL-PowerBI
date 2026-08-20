SELECT pickup_location, COUNT(*) AS total_bookings
FROM uber_rides
GROUP BY pickup_location
ORDER BY total_bookings DESC
LIMIT 10;

SELECT drop_location, COUNT(*) AS total_bookings
FROM uber_rides
GROUP BY drop_location
ORDER BY total_bookings DESC
LIMIT 10;

SELECT pickup_locations, SUM(bookings_value) AS total_revenue 
FROM uber_rides 
WHERE booking_status='Completed'
GROUP BY pickup_location
ORDER BY total_revenue DESC;

SELECT
pickup_location,
drop_location,
COUNT(*) AS total_trips
FROM uber_rides
GROUP BY pickup_location,drop_location
ORDER BY total_trips DESC
LIMIT 10;

SELECT
HOUR(time) AS booking_hour,
COUNT(*) AS total_bookings
FROM uber_rides
GROUP BY booking_hour
ORDER BY total_bookings DESC;

SELECT
DAYNAME(booking_date) AS weekday,
COUNT(*) AS total_bookings
FROM uber_rides
GROUP BY weekday
ORDER BY total_bookings DESC;

SELECT
    MONTHNAME(booking_date) AS month,
    COUNT(*) AS total_bookings
FROM uber_rides
GROUP BY MONTH(booking_date), MONTHNAME(booking_date)
ORDER BY MONTH(booking_date);

SELECT
    CASE
        WHEN DAYOFWEEK(booking_date) IN (1,7) THEN 'Weekend'
        ELSE 'Weekday'
    END AS day_type,
    COUNT(*) AS total_bookings
FROM uber_rides
GROUP BY day_type;
