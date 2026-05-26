-- BIT604 Database | Assessment 3
-- DIY Merchandise Database
-- Task 4: Gen AI queries
-- Gabriela Olivera - 5141369

USE DIY_MERCHANDISE;

-- (i) Customers who purchased products in January 2026
-- Prompt: "Write a SQL query for MySQL to show the list of customers who
-- purchased products in January 2026. The database is DIY_MERCHANDISE.
-- The Customer table has CustomerID, FirstName and LastName. The Purchase
-- table has PurchaseID, CustomerID and PurchaseDate. Link both tables using
-- CustomerID and filter by January 2026."

SELECT DISTINCT c.CustomerID, c.FirstName, c.LastName
FROM Customer c
INNER JOIN Purchase p ON c.CustomerID = p.CustomerID
WHERE p.PurchaseDate BETWEEN '2026-01-01' AND '2026-01-31';

-- (ii) Customers who bought from more than two departments between January and February
-- Prompt: "Write a SQL query for MySQL to find customers who bought products
-- from more than two departments between January and February 2026. The database
-- is DIY_MERCHANDISE. Tables: Customer (CustomerID, FirstName, LastName),
-- Purchase (PurchaseID, CustomerID, PurchaseDate), PurchaseProduct (PurchaseID,
-- ProductID), Product (ProductID, DepartmentID), Department (DepartmentID,
-- DepartmentName). Group by customer and use HAVING to filter more than two
-- departments."

SELECT c.CustomerID, c.FirstName, c.LastName, COUNT(DISTINCT d.DepartmentID) AS Departments
FROM Customer c
INNER JOIN Purchase p ON c.CustomerID = p.CustomerID
INNER JOIN PurchaseProduct pp ON p.PurchaseID = pp.PurchaseID
INNER JOIN Product pr ON pp.ProductID = pr.ProductID
INNER JOIN Department d ON pr.DepartmentID = d.DepartmentID
WHERE p.PurchaseDate BETWEEN '2026-01-01' AND '2026-02-28'
GROUP BY c.CustomerID, c.FirstName, c.LastName
HAVING COUNT(DISTINCT d.DepartmentID) > 2;

-- (iii) Employees who worked in at least two departments in December
-- Prompt: "Write a SQL query for MySQL to list all employees who worked in at
-- least two departments in December 2026. The database is DIY_MERCHANDISE.
-- The Employee table has EmployeeID, FirstName and LastName. The Payroll table
-- has PayID, EmployeeID, DepartmentID and PayDate. Join both tables and use
-- GROUP BY and HAVING to find employees with two or more different departments."

SELECT e.EmployeeID, e.FirstName, e.LastName, COUNT(DISTINCT pay.DepartmentID) AS Departments
FROM Employee e
INNER JOIN Payroll pay ON e.EmployeeID = pay.EmployeeID
WHERE pay.PayDate = '2026-12-31'
GROUP BY e.EmployeeID, e.FirstName, e.LastName
HAVING COUNT(DISTINCT pay.DepartmentID) >= 2;

-- (iv) Total hours worked by employees in each department in March
-- Prompt: "Write a SQL query for MySQL to show the total hours worked by
-- employees in each department in March 2026. The database is DIY_MERCHANDISE.
-- The Payroll table has EmployeeID, DepartmentID, HoursWorked and PayDate.
-- The Department table has DepartmentID and DepartmentName. Join both tables,
-- filter by March 2026 and use SUM with GROUP BY."

SELECT d.DepartmentName, SUM(pay.HoursWorked) AS TotalHours
FROM Payroll pay
INNER JOIN Department d ON pay.DepartmentID = d.DepartmentID
WHERE pay.PayDate = '2026-03-31'
GROUP BY d.DepartmentName
ORDER BY TotalHours DESC;
