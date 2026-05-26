-- BIT604 Database | Assessment 3
-- DIY Merchandise Database
-- Task 2a (supplement): Set department for each payroll record
-- Gabriela Olivera - 5141369

USE DIY_MERCHANDISE;

-- Set each payroll record to the employee's department
UPDATE Payroll p
JOIN Employee e ON p.EmployeeID = e.EmployeeID
SET p.DepartmentID = e.DepartmentID;

-- Some employees worked in a second department in December.
-- These updates reflect staff rotation across departments.
UPDATE Payroll SET DepartmentID = 2 WHERE PayID = 44286;
UPDATE Payroll SET DepartmentID = 4 WHERE PayID = 44287;
UPDATE Payroll SET DepartmentID = 6 WHERE PayID = 44288;
UPDATE Payroll SET DepartmentID = 5 WHERE PayID = 44289;
UPDATE Payroll SET DepartmentID = 4 WHERE PayID = 44290;
UPDATE Payroll SET DepartmentID = 5 WHERE PayID = 44291;
