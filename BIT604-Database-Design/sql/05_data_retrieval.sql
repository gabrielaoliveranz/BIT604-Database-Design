-- BIT604 Database | Assessment 3
-- DIY Merchandise Database
-- Task 2c: Data retrieval
-- Gabriela Olivera - 5141369

USE DIY_MERCHANDISE;

-- (i) List of customers
SELECT * FROM Customer;

-- (ii) List of employees and their supervisors
SELECT
    e.FirstName AS 'Employee First Name',
    e.LastName  AS 'Employee Last Name',
    s.FirstName AS 'Supervisor First Name',
    s.LastName  AS 'Supervisor Last Name'
FROM Employee e
LEFT JOIN Employee s ON e.SupervisorID = s.EmployeeID;

-- (iii) List of departments
SELECT * FROM Department;

/* (iv) NoSQL solution for (iii)
-- In a document database like MongoDB, departments are stored as JSON documents.
-- The query would be:

db.departments.find({})

-- Result after renaming 'painting' to 'Paints':
[
  { "DepartmentID": 1, "DepartmentName": "building" },
  { "DepartmentID": 2, "DepartmentName": "electrical" },
  { "DepartmentID": 3, "DepartmentName": "garden" },
  { "DepartmentID": 4, "DepartmentName": "Paints" },
  { "DepartmentID": 5, "DepartmentName": "plumbing" },
  { "DepartmentID": 6, "DepartmentName": "timber" }
]
*/
