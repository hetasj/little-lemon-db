-- Get Max Quantity
CREATE PROCEDURE GetMaxQuantity()
BEGIN
    SELECT MAX(Quantity) AS "Max Quantity in Order" FROM Orders;
END;

-- Get Order Detail
PREPARE GetOrderDetail FROM 
'SELECT OrderID, Quantity, TotalCost FROM Orders WHERE CustomerID = ?';
