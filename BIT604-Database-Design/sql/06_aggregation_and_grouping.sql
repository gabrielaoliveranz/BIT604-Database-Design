-- BIT604 Database | Assessment 3
-- DIY Merchandise Database
-- Task 3: Aggregation and grouping
-- Gabriela Olivera - 5141369

USE DIY_MERCHANDISE;

-- (i) Total sales per department
SELECT d.DepartmentName, SUM(pp.QuantitySold * pp.UnitPrice) AS TotalSales
FROM PurchaseProduct pp
INNER JOIN Product p ON pp.ProductID = p.ProductID
INNER JOIN Department d ON p.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName
ORDER BY TotalSales DESC;

-- (ii) Total number of products per department
SELECT d.DepartmentName, COUNT(p.ProductID) AS TotalProducts
FROM Product p
INNER JOIN Department d ON p.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName
ORDER BY TotalProducts DESC;

-- (iii) Total number of employees per role
SELECT r.RoleType, COUNT(e.EmployeeID) AS TotalEmployees
FROM Employee e
INNER JOIN Role r ON e.RoleID = r.RoleID
GROUP BY r.RoleType
ORDER BY TotalEmployees DESC;

-- (iv) Min, average, max and total sales in February
SELECT
    MIN(TotalAmount) AS MinSale,
    AVG(TotalAmount) AS AvgSale,
    MAX(TotalAmount) AS MaxSale,
    SUM(TotalAmount) AS TotalSales
FROM Purchase
WHERE PurchaseDate BETWEEN '2026-02-01' AND '2026-02-28';

-- (v) How many times each trailer was used in January
SELECT t.RegistrationNumber, COUNT(tr.RentalID) AS TimesUsed
FROM TrailerRental tr
INNER JOIN Trailer t ON tr.TrailerID = t.TrailerID
WHERE tr.PickupDate LIKE '%/01/2026'
GROUP BY t.RegistrationNumber
ORDER BY TimesUsed DESC;
