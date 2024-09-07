-- Function to calculate discount
DELIMITER //

CREATE FUNCTION CalculateDiscount(p_TotalAmount DECIMAL(10, 2))
RETURNS DECIMAL(10, 2)
BEGIN
    DECLARE v_Discount DECIMAL(10, 2);
    IF p_TotalAmount > 100 THEN
        SET v_Discount = p_TotalAmount * 0.10; -- 10% discount
    ELSE
        SET v_Discount = 0;
    END IF;
    RETURN v_Discount;
END //

DELIMITER ;
