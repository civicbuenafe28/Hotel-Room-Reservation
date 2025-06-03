CREATE DATABASE IF NOT EXISTS hoteldatabase;

DROP DATABASE hoteldatabase;

USE hoteldatabase;

CREATE TABLE IF NOT EXISTS customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255),
    city VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS rooms (
    room_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    room_no INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE SET NULL 
);

CREATE TABLE IF NOT EXISTS bookings (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    room_id INT,
    date_booked DATE,
    check_in_date DATE,  -- Add check-in date column
    check_out_date DATE, -- Add check-out date column
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE,
    FOREIGN KEY (room_id) REFERENCES rooms(room_id) ON DELETE CASCADE
);

-- Update Commands
UPDATE customers
SET email = 'newemail@example.com'
WHERE customer_id = 1;  -- Update the email of customer with ID 1

UPDATE rooms
SET room_no = 202
WHERE room_id = 3;     -- Update the room number of room with ID 3

-- Delete Commands
DELETE FROM rooms
WHERE room_id = 5;     -- Delete the room with ID 5

DELETE FROM customers
WHERE customer_id = 2;  -- Delete the customer with ID 2 (This will also delete their associated rooms due to the ON DELETE CASCADE constraint)
