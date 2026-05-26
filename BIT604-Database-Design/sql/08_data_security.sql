-- BIT604 Database | Assessment 3
-- DIY Merchandise Database
-- Task 5: Data security - users and permissions
-- Gabriela Olivera - 5141369

USE DIY_MERCHANDISE;

-- -------------------------------------------------------
-- Task 5b: Create one representative user for each role
-- -------------------------------------------------------

-- Checkout employee (shop assistant)
CREATE USER 'checkout_user'@'localhost' IDENTIFIED BY 'Checkout123!';

-- Supervisor
CREATE USER 'supervisor_user'@'localhost' IDENTIFIED BY 'Supervisor123!';

-- Owner
CREATE USER 'owner_user'@'localhost' IDENTIFIED BY 'Owner123!';

-- -------------------------------------------------------
-- Permissions for checkout employee
-- Read-only access to Product
-- Can record sales (INSERT on Purchase, PurchaseProduct, Receipt)
-- No changes allowed once a sale is completed
-- -------------------------------------------------------
GRANT SELECT ON DIY_MERCHANDISE.Product TO 'checkout_user'@'localhost';
GRANT SELECT ON DIY_MERCHANDISE.Customer TO 'checkout_user'@'localhost';
GRANT SELECT, INSERT ON DIY_MERCHANDISE.Purchase TO 'checkout_user'@'localhost';
GRANT SELECT, INSERT ON DIY_MERCHANDISE.PurchaseProduct TO 'checkout_user'@'localhost';
GRANT SELECT, INSERT ON DIY_MERCHANDISE.Receipt TO 'checkout_user'@'localhost';

-- -------------------------------------------------------
-- Permissions for supervisor
-- Can read and modify products and sales transactions
-- No DELETE, no CREATE USER
-- -------------------------------------------------------
GRANT SELECT, UPDATE ON DIY_MERCHANDISE.Product TO 'supervisor_user'@'localhost';
GRANT SELECT, UPDATE ON DIY_MERCHANDISE.Department TO 'supervisor_user'@'localhost';
GRANT SELECT, UPDATE ON DIY_MERCHANDISE.Purchase TO 'supervisor_user'@'localhost';
GRANT SELECT, UPDATE ON DIY_MERCHANDISE.PurchaseProduct TO 'supervisor_user'@'localhost';
GRANT SELECT, UPDATE ON DIY_MERCHANDISE.Receipt TO 'supervisor_user'@'localhost';
GRANT SELECT ON DIY_MERCHANDISE.Customer TO 'supervisor_user'@'localhost';
GRANT SELECT ON DIY_MERCHANDISE.Employee TO 'supervisor_user'@'localhost';

-- -------------------------------------------------------
-- Permissions for owner
-- Full access to all tables
-- Can create user accounts for new employees
-- Cannot perform major database administration tasks
-- -------------------------------------------------------
GRANT SELECT, INSERT, UPDATE, DELETE ON DIY_MERCHANDISE.Customer TO 'owner_user'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON DIY_MERCHANDISE.Employee TO 'owner_user'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON DIY_MERCHANDISE.Product TO 'owner_user'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON DIY_MERCHANDISE.Department TO 'owner_user'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON DIY_MERCHANDISE.Purchase TO 'owner_user'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON DIY_MERCHANDISE.PurchaseProduct TO 'owner_user'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON DIY_MERCHANDISE.Receipt TO 'owner_user'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON DIY_MERCHANDISE.Payroll TO 'owner_user'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON DIY_MERCHANDISE.Role TO 'owner_user'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON DIY_MERCHANDISE.Trailer TO 'owner_user'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON DIY_MERCHANDISE.TrailerRental TO 'owner_user'@'localhost';
GRANT CREATE USER ON *.* TO 'owner_user'@'localhost';

FLUSH PRIVILEGES;
