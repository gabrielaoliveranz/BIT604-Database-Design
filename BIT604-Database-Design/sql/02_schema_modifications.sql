-- BIT604 Database | Assessment 3
-- DIY Merchandise Database
-- Task 1b: Schema modifications
-- Gabriela Olivera - 5141369

USE DIY_MERCHANDISE;

-- (i) Add a comment column to Department (not required)
ALTER TABLE Department
ADD comment VARCHAR(255) NULL;

-- (i) Delete the comment column
ALTER TABLE Department
DROP COLUMN comment;

-- (ii) Add img column to Customer to store pictures
ALTER TABLE Customer
ADD img LONGBLOB;

-- (iii) Add cst_xml column to Customer to store XML data
ALTER TABLE Customer
ADD cst_xml TEXT;

-- (iv) Delete PurchaseProduct table
DROP TABLE PurchaseProduct;

-- Recreate PurchaseProduct (no foreign keys yet, added later in 01b)
CREATE TABLE PurchaseProduct (
    PurchaseID INT NOT NULL,
    ProductID INT NOT NULL,
    QuantitySold INT NOT NULL,
    UnitPrice DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (PurchaseID, ProductID)
);
