SELECT COUNT(DISTINCT customer_id) AS total_customer
FROM uber_rides;

SELECT ROUND(AVG(customer_rating),2) AS average_customer_rating
FROM uber_rides
WHERE booking_status = 'Completed';

SELECT vehicle_type, ROUND(AVG(customer_rating),2) AS average_customer_rating
FROM uber_rides
WHERE booking_status = 'Completed'
GROUP BY vehicle_type
ORDER BY average_customer_rating DESC;

SELECT payment_method, COUNT(*) AS total_booking
FROM uber_rides
GROUP BY payment_method
ORDER BY total_booking DESC;

