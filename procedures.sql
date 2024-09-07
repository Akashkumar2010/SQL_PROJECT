-- Stored procedure to process a new order
DELIMITER //

CREATE PROCEDURE ProcessOrder(IN p_UserID INT, IN p_TotalAmount DECIMAL(10, 2))
BEGIN
    DECLARE v_OrderID INT;
    
    -- Insert new order
    INSERT INTO Orders (UserID, TotalAmount) VALUES (p_UserID, p_TotalAmount);
    SET v_OrderID = LAST_INSERT_ID();
    
    -- Update stock quantities for each product
    -- Assumes order_items table has products and quantities
    UPDATE Products p
    JOIN Order_Items oi ON p.ProductID = oi.ProductID
    SET p.StockQuantity = p.StockQuantity - oi.Quantity
    WHERE oi.OrderID = v_OrderID;
END //

DELIMITER ;
