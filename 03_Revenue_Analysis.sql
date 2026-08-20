SELECT ROUND(SUM(booking_value),2) AS total_revenue
FROM uber_rides
WHERE booking_status = 'Completed';

SELECT ROUND(AVG(booking_value),2) AS average_booking_value
FROM uber_rides
WHERE booking_status = 'Completed';

SELECT vehicle_type, ROUND(SUM(booking_value),2) AS total_revenue
FROM uber_rides
WHERE booking_status = 'Completed'
GROUP BY vehicle_type
ORDER BY total_revenue DESC;

SELECT payment_method, ROUND(SUM(booking_value),2) AS total_revenue
FROM uber_rides
WHERE booking_status = 'Completed'
GROUP BY payment_method
ORDER BY total_revenue DESC;

SELECT vehicle_type, ROUND(SUM(booking_value),2) AS total_revenue
FROM uber_rides
WHERE booking_status = 'Completed'
GROUP BY vehicle_type
ORDER BY total_revenue DESC
LIMIT 5;
