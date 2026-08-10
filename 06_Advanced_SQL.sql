USE uber_analysis;
WITH revenue_cte AS
(
    SELECT
        pickup_location,
        SUM(booking_value) AS total_revenue
    FROM uber_rides
    WHERE booking_status = 'Completed'
    GROUP BY pickup_location
)

SELECT *
FROM revenue_cte
ORDER BY total_revenue DESC
LIMIT 5;

SELECT vehicle_type, AVG(booking_value) AS avergare_fare
 FROM uber_rides
 WHERE booking_status = 'Completed'
 GROUP BY vehicle_type
 HAVING AVG(booking_value) = 
 (
    SELECT MAX(avg_fare)
    FROM
    (
      SELECT AVG(booking_value) AS avg_fare
      FROM uber_rides
      WHERE booking_status = 'Completed'
      GROUP BY vehicle_type
      ) AS t
);

SELECT pickup_location, COUNT(*) AS total_bookings
FROM uber_rides
GROUP BY pickup_location
HAVING COUNT(*) >
(
  SELECT AVG(total_bookings)
  FROM 
  (
    SELECT COUNT(*) AS total_bookings
    FROM uber_rides
    GROUP BY pickup_location
) AS t
);

SELECT vehicle_type, SUM(booking_value) AS total_revenue,
RANK() OVER (ORDER BY SUM(booking_value) DESC) AS revenue_park
FROM uber_rides
WHERE booking_status = 'Completed'
GROUP BY vehicle_type;

SELECT
    pickup_location,
    COUNT(*) AS total_bookings,
    DENSE_RANK() OVER (ORDER BY COUNT(*) DESC) AS booking_rank
FROM uber_rides
GROUP BY pickup_location;

DROP VIEW completed_rides;

CREATE VIEW completed_rides AS
SELECT
    booking_id,
    booking_date,
    time,
    customer_id,
    vehicle_type,
    pickup_location,
    drop_location,
    booking_value,
    ride_distance,
    payment_method,
    driver_ratings,
    customer_rating
FROM uber_rides
WHERE booking_status = 'Completed';

SELECT *
FROM completed_rides
LIMIT 10;

CREATE TABLE customer_summary AS
SELECT
    customer_id,
    COUNT(*) AS total_bookings,
    SUM(CASE
        WHEN booking_status = 'Completed' THEN 1
        ELSE 0
    END) AS completed_bookings,
    SUM(CASE
        WHEN booking_status = 'Completed' THEN booking_value
        ELSE 0
    END) AS total_revenue
FROM uber_rides
GROUP BY customer_id;

SELECT
    u.customer_id,
    u.booking_id,
    u.booking_date,
    u.booking_status,
    c.total_bookings,
    c.completed_bookings,
    c.total_revenue
FROM uber_rides u
LEFT JOIN customer_summary c
    ON u.customer_id = c.customer_id
LIMIT 20;

SELECT
    u.customer_id,
    c.total_bookings,
    c.completed_bookings,
    c.total_revenue
FROM uber_rides u
INNER JOIN customer_summary c
    ON u.customer_id = c.customer_id
GROUP BY
    u.customer_id,
    c.total_bookings,
    c.completed_bookings,
    c.total_revenue
ORDER BY c.total_revenue DESC;

SELECT
    customer_id,
    total_bookings,
    total_revenue,
    CASE
        WHEN total_revenue >= 5000 THEN 'High Value'
        WHEN total_revenue >= 2500 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS customer_segment
FROM customer_summary
ORDER BY total_revenue DESC;