-- -----------------------------------------------------
-- Schema LittleLemonDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `LittleLemonDB` DEFAULT CHARACTER SET utf8 ;
USE `LittleLemonDB` ;

-- -----------------------------------------------------
-- Table `Bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Bookings` (
  `BookingID` INT NOT NULL,
  `BookingDate` DATETIME NOT NULL,
  `TableNumber` INT NOT NULL,
  PRIMARY KEY (`BookingID`)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `CustomerDetails`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CustomerDetails` (
  `CustomerID` INT NOT NULL,
  `Contacts` VARCHAR(255) NOT NULL,
  `Names` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`CustomerID`)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Order_Delivery_Status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Order_Delivery_Status` (
  `StatusID` INT NOT NULL,
  `DeliveryDate` DATETIME NOT NULL,
  `DeliveryStatus` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`StatusID`)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Orders` (
  `OrderID` INT NOT NULL,
  `OrderDate` DATETIME NOT NULL,
  `Quantity` INT NOT NULL,
  `TotalCost` INT NOT NULL,
  `StatusID` INT NOT NULL,
  `CustomerID` INT NOT NULL,
  PRIMARY KEY (`OrderID`),
  FOREIGN KEY (`CustomerID`) REFERENCES `CustomerDetails` (`CustomerID`),
  FOREIGN KEY (`StatusID`) REFERENCES `Order_Delivery_Status` (`StatusID`)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Staff_Information`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Staff_Information` (
  `StaffID` INT NOT NULL,
  `Name` VARCHAR(255) NOT NULL,
  `Role` VARCHAR(255) NOT NULL,
  `Salary` INT NOT NULL,
  PRIMARY KEY (`StaffID`)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Menu` (
  `MenuID` INT NOT NULL,
  `MenuName` VARCHAR(255) NOT NULL,
  `Starters` VARCHAR(255),
  `Cuisines` VARCHAR(255),
  `Courses` VARCHAR(255),
  `Drinks` VARCHAR(255),
  `Desserts` VARCHAR(255),
  `OrderID` INT,
  `BookingID` INT,
  `StaffID` INT,
  PRIMARY KEY (`MenuID`),
  FOREIGN KEY (`OrderID`) REFERENCES `Orders` (`OrderID`),
  FOREIGN KEY (`BookingID`) REFERENCES `Bookings` (`BookingID`),
  FOREIGN KEY (`StaffID`) REFERENCES `Staff_Information` (`StaffID`)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Insert data into CustomerDetails
-- -----------------------------------------------------
INSERT INTO `CustomerDetails` (`CustomerID`, `Names`, `Contacts`)
VALUES
(1, 'John Doe', 'john.doe@example.com'),
(2, 'Jane Doe', 'jane.doe@example.com'),
(3, 'Alice', 'alice@example.com'),
(4, 'Bob', 'bob@example.com'),
(5, 'Charlie', 'charlie@example.com'),
(6, 'David', 'david@example.com'),
(7, 'Emily', 'emily@example.com'),
(8, 'Frank', 'frank@example.com'),
(9, 'Grace', 'grace@example.com'),
(10, 'Hannah', 'hannah@example.com');

-- -----------------------------------------------------
-- Insert data into Staff_Information
-- -----------------------------------------------------
INSERT INTO `Staff_Information` (`StaffID`, `Name`, `Role`, `Salary`)
VALUES
(1, 'Sarah', 'Manager', 55000),
(2, 'Tom', 'Waiter', 30000),
(3, 'Linda', 'Chef', 40000),
(4, 'Robert', 'Cashier', 31000),
(5, 'Daniel', 'Waiter', 32000),
(6, 'Susan', 'Hostess', 28000),
(7, 'Chris', 'Manager', 60000),
(8, 'Jessica', 'Chef', 38000),
(9, 'Brian', 'Waiter', 29000),
(10, 'Kim', 'Hostess', 27000);

-- -----------------------------------------------------
-- Insert data into Menu
-- -----------------------------------------------------
INSERT INTO `Menu` (`MenuID`, `MenuName`, `Starters`, `Cuisines`, `Courses`, `Drinks`, `Desserts`, `OrderID`, `BookingID`, `StaffID`)
VALUES
(1, 'Garlic Butter Shrimp', 'Garlic Butter Shrimp', 'Italian', 'Appetizer', 'White Wine', 'Tiramisu', 1, 1, 1),
(2, 'Spring Rolls', 'Spring Rolls', 'Chinese', 'Appetizer', 'Green Tea', 'Fruit Tart', 2, 2, 2),
(3, 'Caprese Salad', 'Caprese Salad', 'Italian', 'Salad', 'Iced Tea', 'Cheesecake', 3, 3, 3),
(4, 'Chicken Wings', 'Chicken Wings', 'American', 'Appetizer', 'Soda', 'Chocolate Cake', 4, 4, 4),
(5, 'Tomato Soup', 'Tomato Soup', 'French', 'Soup', 'Red Wine', 'Creme Brulee', 5, 5, 5),
(6, 'Sushi Rolls', 'Sushi Rolls', 'Japanese', 'Appetizer', 'Sake', 'Mochi Ice Cream', 6, 6, 6),
(7, 'Hummus with Pita', 'Hummus with Pita', 'Lebanese', 'Appetizer', 'Mint Tea', 'Baklava', 7, 7, 7),
(8, 'Tandoori Chicken', 'Tandoori Chicken', 'Indian', 'Main Course', 'Lassi', 'Gulab Jamun', 8, 8, 8),
(9, 'Greek Salad', 'Greek Salad', 'Greek', 'Salad', 'Ouzo', 'Baklava', 9, 9, 9),
(10, 'Steak au Poivre', 'Steak au Poivre', 'French', 'Main Course', 'Red Wine', 'Creme Brulee', 10, 10, 10);

-- -----------------------------------------------------
-- Insert data into Bookings
-- -----------------------------------------------------
INSERT INTO `Bookings` (`BookingID`, `BookingDate`, `TableNumber`)
VALUES
(1, '2023-09-01 12:00:00', 10),
(2, '2023-09-01 12:30:00', 12),
(3, '2023-09-02 13:00:00', 14),
(4, '2023-09-02 14:00:00', 16),
(5, '2023-09-03 15:00:00', 18),
(6, '2023-09-03 16:00:00', 20),
(7, '2023-09-04 17:00:00', 22),
(8, '2023-09-04 18:00:00', 24),
(9, '2023-09-05 19:00:00', 26),
(10, '2023-09-05 20:00:00', 28);

-- -----------------------------------------------------
-- Insert data into Orders
-- -----------------------------------------------------
INSERT INTO `Orders` (`OrderID`, `OrderDate`, `Quantity`, `TotalCost`, `StatusID`, `CustomerID`)
VALUES
(1, '2023-09-01 12:00:00', 3, 499, 1, 5),
(2, '2023-09-01 12:30:00', 2, 295, 2, 8),
(3, '2023-09-02 13:00:00', 4, 599, 3, 4),
(4, '2023-09-02 14:00:00', 1, 199, 4, 7),
(5, '2023-09-03 15:00:00', 5, 795, 5, 1),
(6, '2023-09-03 16:00:00', 2, 295, 6, 9),
(7, '2023-09-04 17:00:00', 3, 499, 7, 2),
(8, '2023-09-04 18:00:00', 4, 599, 8, 6),
(9, '2023-09-05 19:00:00', 1, 199, 9, 3),
(10, '2023-09-05 20:00:00', 5, 795, 10, 10);

-- -----------------------------------------------------
-- Insert data into Order_Delivery_Status
-- -----------------------------------------------------
INSERT INTO `Order_Delivery_Status` (`StatusID`, `DeliveryDate`, `DeliveryStatus`)
VALUES
(1, '2023-09-01 12:15:00', 'Delivered'),
(2, '2023-09-01 12:45:00', 'Preparing'),
(3, '2023-09-02 13:15:00', 'Preparing'),
(4, '2023-09-02 14:15:00', 'Out for delivery'),
(5, '2023-09-03 15:15:00', 'Out for delivery'),
(6, '2023-09-03 16:15:00', 'Delivered'),
(7, '2023-09-04 17:15:00', 'Preparing'),
(8, '2023-09-04 18:15:00', 'Delivered'),
(9, '2023-09-05 19:15:00', 'Delivered'),
(10, '2023-09-05 20:15:00', 'Delivered');

-- -----------------------------------------------------
-- Create Procedure: GetMaxQuantity
-- -----------------------------------------------------
DELIMITER //

CREATE PROCEDURE `GetMaxQuantity`()
BEGIN
  SELECT MAX(Quantity) AS `Max Quantity in Order` FROM `Orders`;
END //

DELIMITER ;

-- -----------------------------------------------------
-- Create Procedure: GetOrderDetail
-- -----------------------------------------------------
DELIMITER //

CREATE PROCEDURE `GetOrderDetail`(IN orderId INT)
BEGIN
  SELECT `OrderID`, `Quantity`, `TotalCost` FROM `Orders` WHERE `OrderID` = orderId;
END //

DELIMITER ;

-- -----------------------------------------------------
-- Create Procedure: CancelOrder
-- -----------------------------------------------------
DELIMITER //

CREATE PROCEDURE `CancelOrder`(IN orderId INT)
BEGIN
  DELETE FROM `Orders` WHERE `OrderID` = orderId;
END //

DELIMITER ;

-- -----------------------------------------------------
-- Create Procedure: AddValidBooking
-- -----------------------------------------------------
DELIMITER //

CREATE PROCEDURE `AddValidBooking`(
    IN bookingDate DATETIME,
    IN tableNumber INT,
    IN customerName VARCHAR(255)
)
BEGIN
    DECLARE existingBookingCount INT;

    -- Check if the table is already booked
    SELECT COUNT(*) INTO existingBookingCount
    FROM `Bookings`
    WHERE `BookingDate` = bookingDate AND `TableNumber` = tableNumber;

    -- If the table is already booked, return error
    IF existingBookingCount > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Table is already booked for this date.';
    ELSE
        -- Insert the new booking if not already booked
        INSERT INTO `Bookings` (`BookingDate`, `TableNumber`)
        VALUES (bookingDate, tableNumber);
    END IF;
END //

DELIMITER ;

-- -----------------------------------------------------
-- Create Procedure: UpdateBooking
-- -----------------------------------------------------
DELIMITER //

CREATE PROCEDURE `UpdateBooking`(
    IN bookingID INT,
    IN bookingDate DATETIME
)
BEGIN
    UPDATE `Bookings` SET `BookingDate` = bookingDate WHERE `BookingID` = bookingID;
END //

DELIMITER ;

-- -----------------------------------------------------
-- Create Procedure: CancelBooking
-- -----------------------------------------------------
DELIMITER //

CREATE PROCEDURE `CancelBooking`(IN bookingID INT)
BEGIN
    DELETE FROM `Bookings` WHERE `BookingID` = bookingID;
END //

DELIMITER ;
