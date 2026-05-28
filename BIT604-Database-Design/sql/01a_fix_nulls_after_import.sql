-- BIT604 Database | Assessment 3
-- DIY Merchandise Database
-- Task 1a (supplement): Fix NULL supervisor values after CSV import
-- Gabriela Olivera 

USE DIY_MERCHANDISE;

-- The import wizard reads the text 'NULL' as 0 for integer fields.
-- This sets SupervisorID back to NULL for top-level employees.

UPDATE Employee SET SupervisorID = NULL WHERE SupervisorID = 0;
