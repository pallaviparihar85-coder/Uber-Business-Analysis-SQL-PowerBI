SELECT COUNT(*) AS total_bookings
FROM uber_rides;

SELECT DISTINCT booking_status
FROM uber_rides;

SELECT COUNT(*) AS successful_booking
FROM uber_rides
WHERE booking_status = 'Completed';

SELECT DISTINCT cancelled_rides_by_customer
FROM uber_rides;

SELECT COUNT(*) AS customer_cancelled_booking
FROM uber_rides
WHERE cancelled_rides_by_customer = 1;

SELECT DISTINCT cancelled_rides_by_driver
FROM uber_rides;

SELECT COUNT(*) AS driver_cancelled_booking
FROM uber_rides
WHERE cancelled_rides_by_driver = 1;

SELECT COUNT(*) AS no_driver_found
FROM uber_rides
WHERE booking_status = 'No Driver Found';

SELECT COUNT(*) AS incomplete_bookings
FROM uber_rides
WHERE booking_status = 'Incomplete';

SELECT booking_status,
    COUNT(*) AS total_bookings
FROM uber_rides
GROUP BY booking_status
ORDER BY total_bookings DESC;

SELECT ROUND(
COUNT(CASE WHEN booking_status = 'Completed' THEN 1 END)
*100.0 / COUNT(*),2
) AS completion_rate
FROM uber_rides;

SELECT
ROUND(
COUNT(CASE
WHEN booking_status IN ('Cancelled by Customer','Cancelled by Driver')
THEN 1 END
)*100.0/COUNT(*),2
) AS cancellation_rate
FROM uber_rides;