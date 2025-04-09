-- Procedimento para obter a quantidade máxima
DELIMITER //
CREATE PROCEDURE GetMaxQuantity()
BEGIN
    SELECT MAX(Quantity) AS MaxQuantity FROM OrderDetails;
END //
DELIMITER ;

-- Comando para chamar o procedimento
CALL GetMaxQuantity();
