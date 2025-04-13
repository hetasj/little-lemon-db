-- Cancel Order
DELIMITER //
CREATE PROCEDURE CancelOrder(IN orderId INT)
BEGIN
    DELETE FROM Orders WHERE OrderID = orderId;
END //
DELIMITER ;

-- Check Booking
DELIMITER //
CREATE PROCEDURE CheckBooking(IN booking_date DATE, IN table_number INT)
BEGIN
    DECLARE bookedTable INT DEFAULT 0;
    SELECT COUNT(*) INTO bookedTable
    FROM Bookings WHERE Date = booking_date AND TableNumber = table_number;
    
    IF bookedTable > 0 THEN
        SELECT CONCAT("Table ", table_number, " is already booked") AS "Booking status";
    ELSE
        SELECT CONCAT("Table ", table_number, " is not booked") AS "Booking status";
    END IF;
END //
DELIMITER ;

-- Add Valid Booking
DELIMITER //
CREATE PROCEDURE AddValidBooking(
    IN bookingDate DATETIME,
    IN tableNumber INT,
    IN customerName VARCHAR(255)
)
BEGIN
    DECLARE existingBookingCount INT;
    START TRANSACTION;

    SELECT COUNT(*) INTO existingBookingCount
    FROM Bookings
    WHERE Date = bookingDate AND TableNumber = tableNumber;

    IF existingBookingCount > 0 THEN
        ROLLBACK;
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Table is already booked.';
    ELSE
        INSERT INTO Bookings (Date, TableNumber)
        VALUES (bookingDate, tableNumber);
        COMMIT;
    END IF;
END //
DELIMITER ;

-- Update Booking
DELIMITER //
CREATE PROCEDURE UpdateBooking(IN booking_id INT, IN booking_date DATETIME)
BEGIN
    UPDATE Bookings SET Date = booking_date WHERE BookingID = booking_id;
    SELECT CONCAT("Booking ", booking_id, " updated") AS Confirmation;
END //
DELIMITER ;

-- Cancel Booking
DELIMITER //
CREATE PROCEDURE CancelBooking(IN booking_id_to_cancel INT)
BEGIN
    DELETE FROM Bookings WHERE BookingID = booking_id_to_cancel;
    SELECT CONCAT('Booking ', booking_id_to_cancel, ' cancelled') AS Confirmation;
END //
DELIMITER ;
