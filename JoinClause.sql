SELECT c.ClientID, c.FullName, o.OrderID, o.TotalCost, m.MenuName, mi.Starter, mi.Course 
FROM Clients AS c INNER JOIN Orders AS o 
ON c.ClientID = o.ClientID 
INNER JOIN Menu AS m 
ON m.MenuID = o.MenuID 
INNER JOIN MenuItems AS mi 
ON mi.MenuItemsID = m.MenuItemsID 
WHERE o.TotalCost > 150 
ORDER BY o.TotalCost ASC;