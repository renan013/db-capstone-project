-- Subconsulta para encontrar o pedido com maior quantidade
SELECT * FROM Orders
WHERE OrderID = (
    SELECT OrderID
    FROM OrderDetails
    ORDER BY Quantity DESC
    LIMIT 1
);
