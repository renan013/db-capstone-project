-- Consulta da Tabela Virtual (View ou JOIN)
SELECT 
    o.OrderID,
    c.CustomerID,
    c.FullName,
    od.Quantity,
    m.ItemName
FROM Orders o
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Menu m ON od.MenuID = m.MenuID
JOIN Customers c ON o.CustomerID = c.CustomerID;
