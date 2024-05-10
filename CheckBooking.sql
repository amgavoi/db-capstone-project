DELIMITER //
CREATE PROCEDURE CheckBooking (IN booking_date DATETIME, IN table_number INT) 
BEGIN
DECLARE booking_status INT DEFAULT 0;
SELECT COUNT(BookingID) INTO booking_status 
FROM Bookings WHERE BookingDate = booking_date AND TableNo = table_number;
IF booking_status > 0 THEN 
SELECT CONCAT('Table ', table_number, ' is already booked') AS 'Booking Status';
ELSE 
SELECT CONCAT('Table ', table_number, ' is available for booking') AS 'Booking Status';
END IF;
END//
DELIMITER ;

CALL CheckBooking('2022-11-12', 3);