-- Instrução com JOIN simples entre Orders e Menu
SELECT 
    o.OrderID,
    m.ItemName,
    od.Quantity
FROM Orders o
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Menu m ON od.MenuID = m.MenuID;
