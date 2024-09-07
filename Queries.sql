-- Total revenue
SELECT SUM(TotalAmount) AS TotalRevenue FROM Orders;

-- Top-selling products
SELECT p.ProductName, SUM(oi.Quantity) AS TotalSold
FROM Order_Items oi
JOIN Products p ON oi.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY TotalSold DESC;

-- Average product rating
SELECT p.ProductName, AVG(r.Rating) AS AverageRating
FROM Reviews r
JOIN Products p ON r.ProductID = p.ProductID
GROUP BY p.ProductName;

-- User purchase history
SELECT u.Username, o.OrderID, o.OrderDate, SUM(oi.Quantity * oi.Price) AS TotalSpent
FROM Orders o
JOIN Users u ON o.UserID = u.UserID
JOIN Order_Items oi ON o.OrderID = oi.OrderID
GROUP BY u.Username, o.OrderID, o.OrderDate;
