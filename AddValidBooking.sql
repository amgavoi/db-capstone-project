DELIMITER //
CREATE PROCEDURE AddValidBooking (IN booking_date DATETIME, IN table_number INT) 
BEGIN 
DECLARE booking_status INT DEFAULT 0;
START TRANSACTION;
SELECT COUNT(BookingID) INTO booking_status 
FROM Bookings WHERE BookingDate = booking_date AND TableNo = table_number;
IF booking_status > 0 THEN 
ROLLBACK;
SELECT CONCAT('Table ', table_number, ' is already booked - Booking cancelled') AS 'Booking Status';
ELSE 
INSERT INTO Bookings (BookingDate, TableNo) VALUES (booking_date, table_number);
COMMIT;
SELECT CONCAT('Table ', table_number, ' has been booked successfully') AS 'Booking Status';
END IF;
END //
DELIMITER ;

CALL AddValidBooking("2022-10-10", 5);