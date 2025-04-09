-- Declaração preparada GetOrderDetail
PREPARE GetOrderDetail FROM 
'SELECT 
     o.OrderID,
     m.ItemName,
     od.Quantity,
     m.Price,
     (od.Quantity * m.Price) AS TotalCost
 FROM Orders o
 JOIN OrderDetails od ON o.OrderID = od.OrderID
 JOIN Menu m ON od.MenuID = m.MenuID
 WHERE o.CustomerID = ?';

-- Executar a consulta com ID 1
SET @id = 1;
EXECUTE GetOrderDetail USING @id;
