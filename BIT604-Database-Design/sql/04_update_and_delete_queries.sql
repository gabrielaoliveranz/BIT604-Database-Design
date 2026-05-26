-- BIT604 Database | Assessment 3
-- DIY Merchandise Database
-- Task 2b: Update and delete queries
-- Gabriela Olivera - 5141369

USE DIY_MERCHANDISE;

-- (i) Change department name from 'painting' to 'Paints'
UPDATE Department
SET DepartmentName = 'Paints'
WHERE DepartmentName = 'painting';

-- (ii) Change role from 'Stacking' to 'shelf stacking'
UPDATE Role
SET RoleType = 'shelf stacking'
WHERE RoleType = 'Stacking';

-- (iii) Delete all casual employees
DELETE FROM Employee
WHERE RoleID = (SELECT RoleID FROM Role WHERE RoleType = 'Casual');
