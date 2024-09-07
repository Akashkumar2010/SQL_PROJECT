-- Insert sample data
INSERT INTO Users (Username, PasswordHash, Email) VALUES 
('john_doe', 'hashed_password1', 'john@example.com'),
('jane_smith', 'hashed_password2', 'jane@example.com');

INSERT INTO Categories (CategoryName) VALUES 
('Electronics'),
('Books'),
('Clothing');

INSERT INTO Products (ProductName, CategoryID, Price, StockQuantity, Description) VALUES 
('Smartphone', 1, 299.99, 50, 'Latest model smartphone'),
('Novel Book', 2, 19.99, 100, 'Bestselling novel'),
('T-shirt', 3, 9.99, 200, 'Comfortable cotton t-shirt');

INSERT INTO Orders (UserID, TotalAmount) VALUES 
(1, 319.97),
(2, 29.98);

INSERT INTO Order_Items (OrderID, ProductID, Quantity, Price) VALUES 
(1, 1, 1, 299.99),
(1, 3, 2, 9.99),
(2, 2, 1, 19.99);

INSERT INTO Reviews (ProductID, UserID, Rating, ReviewText) VALUES 
(1, 1, 5, 'Excellent phone with great features!'),
(2, 2, 4, 'Very good book, enjoyed reading it.');
