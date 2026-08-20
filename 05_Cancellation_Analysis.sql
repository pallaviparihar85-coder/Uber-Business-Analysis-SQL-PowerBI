SELECT
    reason_for_cancelling_by_customer AS cancellation_reason,
    COUNT(*) AS total_cancellations
FROM uber_rides
WHERE booking_status = 'Cancelled by Customer'
GROUP BY reason_for_cancelling_by_customer
ORDER BY total_cancellations DESC;

SELECT
    driver_cancellation_reason,
    COUNT(*) AS total_cancellations
FROM uber_rides
WHERE booking_status = 'Cancelled by Driver'
GROUP BY driver_cancellation_reason
ORDER BY total_cancellations DESC;

SELECT booking_status, COUNT(*) AS total_bookings
FROM uber_rides
WHERE booking_status IN ('Cancelled by Customer','Cancelled by Driver')
GROUP BY booking_status;

SELECT booking_status, COUNT(*) AS total_bookings
FROM uber_rides
WHERE booking_status <> 'Completed'
GROUP BY booking_status
ORDER BY total_bookings DESC;
