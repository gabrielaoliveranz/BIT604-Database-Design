-- BIT604 Database | Assessment 3
-- DIY Merchandise Database
-- Task 2a: Insert data (Table 1 and Table 2)
-- Gabriela Olivera 

USE DIY_MERCHANDISE;

-- Table 1: Customer records (manual insert as required by the assessment)
-- img and cst_xml are inserted for Lily Boone (77823)
--
-- HOW TO LOAD THE PICTURE (img column):
-- Method A - LOAD_FILE (used below):
--   Copy customer.jpg to your MySQL Uploads folder first.
--   Find the folder with: SHOW VARIABLES LIKE 'secure_file_priv';
--   On Windows this is usually: C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/
--   The user also needs the FILE privilege.
--   If img shows NULL after running, use Method B.
--
-- Method B - Workbench (always works, no setup needed):
--   1. Run this script (img will be NULL at first, that is fine).
--   2. Right-click the Customer table > Select Rows.
--   3. Right-click the img cell on Lily Boone's row.
--   4. Choose Load Value From File and pick customer.jpg from anywhere.
--   5. Click Apply.

INSERT INTO Customer
(CustomerID, FirstName, LastName, Street, Suburb, City, Phone, CustomerType, img, cst_xml)
VALUES
(77823, 'Lily', 'Boone', '14 Masters Avenue', 'Hillcrest', 'Hamilton', '0211300174', 'Business',
LOAD_FILE('C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/customer.jpg'),
'<customer>
    <customerID>77823</customerID>
    <firstname>Lily</firstname>
    <lastname>Boone</lastname>
    <city>Hamilton</city>
</customer>'),
(77824, 'Finn', 'Allard', '16 Bay View Road', 'Manu Bay', 'Raglan', '0228763501', 'Individual', NULL, NULL),
(77825, 'Carter', 'Allan', '7 Grey Street', 'Cambridge', 'Cambridge', '0223672819', 'Individual', NULL, NULL),
(77826, 'Ben', 'Adams', '43 Morinsville Road', 'Hillcrest', 'Hamilton', '0271187362', 'Individual', NULL, NULL),
(77827, 'Amelia', 'Fraser', '10 Tristram Street', 'City Centre', 'Hamilton', '0205116875', 'Individual', NULL, NULL),
(77828, 'Ruby', 'Davies', '71 Cliff Street', 'Ngarunui Beach', 'Raglan', '0220345621', 'Business', NULL, NULL);

-- Table 2: Staff roles
INSERT INTO Role (RoleID, RoleType) VALUES
(1, 'Checkout'),
(2, 'Stacking'),
(3, 'Stocktaking'),
(4, 'Unloading'),
(5, 'Cleaning'),
(6, 'Supervisor'),
(7, 'Casual');
