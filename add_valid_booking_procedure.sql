DELIMITER //

CREATE PROCEDURE AddValidBooking (
    IN b_date DATE,
    IN table_num INT,
    IN customer_id INT
)
BEGIN
    DECLARE existing INT;

    START TRANSACTION;

    SELECT COUNT(*) INTO existing
    FROM Reservation
    WHERE ReservationDate = b_date AND TableNumber = table_num;

    IF existing > 0 THEN
        ROLLBACK;
        SELECT 'Reservation cancelled – table already booked.' AS Message;
    ELSE
        INSERT INTO Reservation (CustomerID, ReservationDate, TimeSlot, NumPeople, TableNumber)
        VALUES (customer_id, b_date, '19:00:00', 2, table_num);
        COMMIT;
        SELECT 'Reservation successful!' AS Message;
    END IF;
END //

DELIMITER ;

CALL AddValidBooking('2025-04-20', 6, 5);