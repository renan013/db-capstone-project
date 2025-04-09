DELIMITER //

CREATE PROCEDURE CheckBooking(
    IN booking_date DATE,
    IN table_number INT
)
BEGIN
    DECLARE booking_exists INT;

    SELECT COUNT(*) INTO booking_exists
    FROM Reservation
    WHERE ReservationDate = booking_date
      AND TableNumber = table_number;

    IF booking_exists > 0 THEN
        SELECT CONCAT("Mesa ", table_number, " já está reservada para ", booking_date) AS Status;
    ELSE
        SELECT CONCAT("Mesa ", table_number, " está disponível para ", booking_date) AS Status;
    END IF;
END //

DELIMITER ;

-- Testes do procedimento armazenado CheckBooking

-- Teste 1: Mesa 2 está ocupada em 2025-04-13
CALL CheckBooking('2025-04-13', 2);

-- Teste 2: Mesa 6 está livre em 2025-04-13
CALL CheckBooking('2025-04-13', 6);

-- Teste 3: Mesa 3 está ocupada em 2025-04-17
CALL CheckBooking('2025-04-17', 3);

-- Teste 4: Mesa 2 também está ocupada em 2025-04-14
CALL CheckBooking('2025-04-14', 2);
