
## E-commerce Database System

## Description
This project is a comprehensive database system for an e-commerce platform. It includes SQL scripts for schema creation, data insertion, advanced queries, stored procedures, functions, and reporting. The database is designed to manage users, products, orders, reviews, and categories efficiently.

## Project Structure
The repository contains the following files:
- `schema.sql`: SQL script for creating the database schema.
- `data.sql`: SQL script for inserting sample data.
- `queries.sql`: SQL script with advanced queries for analytics and reporting.
- `procedures.sql`: SQL script for stored procedures.
- `functions.sql`: SQL script for user-defined functions.
- `reporting.sql`: SQL script for generating reports.
- `README.md`: Documentation for the project.

## Setup Instructions

1. **Clone the Repository:**
   ```bash
   git clone https://github.com/yourusername/ECommerceDB.git
   ```

2. **Navigate to the Project Directory:**
   ```bash
   cd ECommerceDB
   ```

3. **Open Your SQL Management Tool:**
   - Use a tool like MySQL Workbench or pgAdmin to execute the SQL scripts.

4. **Run SQL Scripts in Order:**
   - **Create Schema:**
     ```sql
     source schema.sql;
     ```
   - **Insert Sample Data:**
     ```sql
     source data.sql;
     ```
   - **Add Advanced Queries:**
     ```sql
     source queries.sql;
     ```
   - **Create Stored Procedures:**
     ```sql
     source procedures.sql;
     ```
   - **Create Functions:**
     ```sql
     source functions.sql;
     ```
   - **Run Reporting Queries:**
     ```sql
     source reporting.sql;
     ```

## Usage Examples

- **Total Revenue Query:**
  ```sql
  SELECT SUM(TotalAmount) AS TotalRevenue FROM Orders;
  ```

- **Top-Selling Products Query:**
  ```sql
  SELECT p.ProductName, SUM(oi.Quantity) AS TotalSold
  FROM Order_Items oi
  JOIN Products p ON oi.ProductID = p.ProductID
  GROUP BY p.ProductName
  ORDER BY TotalSold DESC;
  ```

- **Average Product Rating Query:**
  ```sql
  SELECT p.ProductName, AVG(r.Rating) AS AverageRating
  FROM Reviews r
  JOIN Products p ON r.ProductID = p.ProductID
  GROUP BY p.ProductName;
  ```

- **User Purchase History Query:**
  ```sql
  SELECT u.Username, o.OrderID, o.OrderDate, SUM(oi.Quantity * oi.Price) AS TotalSpent
  FROM Orders o
  JOIN Users u ON o.UserID = u.UserID
  JOIN Order_Items oi ON o.OrderID = oi.OrderID
  GROUP BY u.Username, o.OrderID, o.OrderDate;
  ```

## Stored Procedures & Functions

- **Process Order Procedure:**
  ```sql
  DELIMITER //
  CREATE PROCEDURE ProcessOrder(IN p_UserID INT, IN p_TotalAmount DECIMAL(10, 2))
  BEGIN
      DECLARE v_OrderID INT;
      INSERT INTO Orders (UserID, TotalAmount) VALUES (p_UserID, p_TotalAmount);
      SET v_OrderID = LAST_INSERT_ID();
      UPDATE Products p
      JOIN Order_Items oi ON p.ProductID = oi.ProductID
      SET p.StockQuantity = p.StockQuantity - oi.Quantity
      WHERE oi.OrderID = v_OrderID;
  END //
  DELIMITER ;
  ```

- **Calculate Discount Function:**
  ```sql
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
  ```

## Reporting Queries

- **Sales Trends Over Time:**
  ```sql
  SELECT DATE(OrderDate) AS Date, SUM(TotalAmount) AS DailySales
  FROM Orders
  GROUP BY DATE(OrderDate)
  ORDER BY DATE(OrderDate);
  ```

- **User Activity Summary:**
  ```sql
  SELECT u.Username, COUNT(o.OrderID) AS TotalOrders, SUM(o.TotalAmount) AS TotalSpent
  FROM Users u
  LEFT JOIN Orders o ON u.UserID = o.UserID
  GROUP BY u.Username;
  ```

## Contributing
Feel free to open issues or submit pull requests if you have suggestions for improvements or additional features.

## License
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
