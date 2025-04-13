-- Create the database and tables
CREATE SCHEMA IF NOT EXISTS `LittleLemonDB` DEFAULT CHARACTER SET utf8;
USE `LittleLemonDB`;

CREATE TABLE IF NOT EXISTS `Bookings` (
  BookingID INT NOT NULL,
  Date DATETIME NOT NULL,
  TableNumber INT NOT NULL,
  PRIMARY KEY (BookingID)
);

CREATE TABLE IF NOT EXISTS `CustomerDetails` (
  CustomerID INT NOT NULL,
  Contacts VARCHAR(255) NOT NULL,
  Names VARCHAR(255) NOT NULL,
  PRIMARY KEY (CustomerID)
);

CREATE TABLE IF NOT EXISTS `Order_Delivery_Status` (
  StatusID INT NOT NULL,
  DeliveryDate DATETIME NOT NULL,
  DeliveryStatus VARCHAR(255) NOT NULL,
  PRIMARY KEY (StatusID)
);

CREATE TABLE IF NOT EXISTS `Orders` (
  OrderID INT NOT NULL,
  OrderDate DATETIME NOT NULL,
  Quantity INT NOT NULL,
  TotalCost INT NOT NULL,
  StatusID INT NOT NULL,
  CustomerID INT NOT NULL,
  PRIMARY KEY (OrderID),
  FOREIGN KEY (CustomerID) REFERENCES CustomerDetails(CustomerID),
  FOREIGN KEY (StatusID) REFERENCES Order_Delivery_Status(StatusID)
);

CREATE TABLE IF NOT EXISTS `Staff_Information` (
  StaffID INT NOT NULL,
  Role VARCHAR(255) NOT NULL,
  Salary VARCHAR(255) NOT NULL,
  PRIMARY KEY (StaffID)
);

CREATE TABLE IF NOT EXISTS `Menu` (
  MenuID INT NOT NULL,
  Starters VARCHAR(255) NOT NULL,
  Cuisines VARCHAR(255) NOT NULL,
  Courses VARCHAR(255) NOT NULL,
  Drinks VARCHAR(255) NOT NULL,
  Desserts VARCHAR(255) NOT NULL,
  OrderID INT NOT NULL,
  BookingID INT NOT NULL,
  StaffID INT NOT NULL,
  PRIMARY KEY (MenuID),
  FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
  FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID),
  FOREIGN KEY (StaffID) REFERENCES Staff_Information(StaffID)
);
