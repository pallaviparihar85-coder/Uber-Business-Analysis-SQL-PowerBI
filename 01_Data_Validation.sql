CREATE DATABASE uber_analysis;
USE uber_analysis;
CREATE TABLE uber_rides (
    `date` VARCHAR(50),
    `time` VARCHAR(50),
    `booking_id` VARCHAR(100),
    `booking_status` VARCHAR(100),
    `customer_id` VARCHAR(100),
    `vehicle_type` VARCHAR(100),
    `pickup_location` VARCHAR(255),
    `drop_location` VARCHAR(255),
    `avg_vtat` VARCHAR(50),
    `avg_ctat` VARCHAR(50),
    `cancelled_rides_by_customer` VARCHAR(100),
    `reason_for_cancelling_by_customer` VARCHAR(255),
    `cancelled_rides_by_driver` VARCHAR(100),
    `driver_cancellation_reason` VARCHAR(255),
    `incomplete_rides` VARCHAR(100),
    `incomplete_ride_reason` VARCHAR(255),
    `booking_value` VARCHAR(50),
    `ride_distance` VARCHAR(50),
    `driver_ratings` VARCHAR(50),
    `customer_rating` VARCHAR(50),
    `payment_method` VARCHAR(100)
);

SET GLOBAL local_infile = 1;

LOAD DATA LOCAL INFILE 'C:/Users/Lenovo/OneDrive/Desktop/uber_analysis.csv'
INTO TABLE uber_rides
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

SELECT COUNT(*) AS total_rows
FROM uber_rides;

SELECT *
FROM uber_rides
LIMIT 10;

SELECT booking_id, COUNT(*) AS duplicate_count
FROM uber_rides
GROUP BY booking_id
HAVING COUNT(*) > 1;

SELECT *
FROM uber_rides
WHERE booking_id = 'CNR1232977';

ALTER TABLE uber_rides DROP COLUMN date

ALTER TABLE uber_rides
ADD COLUMN booking_date DATE;


SET SQL_SAFE_UPDATES = 0;
UPDATE uber_rides
SET booking_date = STR_TO_DATE(date, '%d-%m-%Y');
SET SQL_SAFE_UPDATES = 1;

SELECT booking_date
FROM uber_rides
LIMIT 10;
