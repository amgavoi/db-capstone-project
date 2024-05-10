DELIMITER //
CREATE PROCEDURE CancelBooking(IN Booking_id INT) 
BEGIN 
DELETE FROM Bookings WHERE BookingID = Booking_id;
SELECT CONCAT('Booking ', Booking_id, ' has been cancelled') AS 'Confirmation';
END //
DELIMITER ;

CALL CancelBooking(5);