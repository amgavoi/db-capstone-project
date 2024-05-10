CREATE PROCEDURE CancelOrder (IN inputID INT) 
DELETE FROM Orders 
WHERE OrderID = inputID;

CALL CancelOrder(5);