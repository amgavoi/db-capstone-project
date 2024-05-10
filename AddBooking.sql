DELIMITER //
CREATE PROCEDURE AddBooking(IN Booking_id INT, IN Booking_Date DATETIME, IN Table_Number INT, IN Customer_id INT) 
BEGIN 
INSERT INTO Bookings VALUES (Booking_id, Booking_Date, Table_Number, Customer_id);
SELECT "New booking added" AS "Confirmation";
END //
DELIMITER ;

CALL AddBooking(5, "2022-12-30", 1, 4);