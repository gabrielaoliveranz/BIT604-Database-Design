-- BIT604 Database | Assessment 3
-- DIY Merchandise Database
-- Task 1a: Create database and tables
-- Gabriela Olivera - 5141369

DROP DATABASE IF EXISTS DIY_MERCHANDISE;
CREATE DATABASE DIY_MERCHANDISE;
USE DIY_MERCHANDISE;

-- Tables are created without foreign keys so data can be loaded in any order.
-- Foreign keys are added in script 01b after all data is loaded.

CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL
);

CREATE TABLE Role (
    RoleID INT PRIMARY KEY,
    RoleType VARCHAR(100) NOT NULL
);

CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL,
    Street VARCHAR(255),
    Suburb VARCHAR(100),
    City VARCHAR(100),
    Phone VARCHAR(20),
    CustomerType VARCHAR(50) NOT NULL
);

CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    DepartmentID INT NOT NULL,
    RoleID INT NOT NULL,
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL,
    Address VARCHAR(255),
    Phone VARCHAR(20),
    HourlyRate DECIMAL(10,2) NOT NULL,
    SupervisorID INT NULL
);

CREATE TABLE Product (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(255) NOT NULL,
    QuantityInStock INT NOT NULL,
    CostPrice DECIMAL(10,2) NOT NULL,
    SellingPrice DECIMAL(10,2) NOT NULL,
    DepartmentID INT NOT NULL
);

CREATE TABLE Purchase (
    PurchaseID INT PRIMARY KEY,
    CustomerID INT NOT NULL,
    PurchaseDate DATE NOT NULL,
    TotalAmount DECIMAL(10,2) NOT NULL
);

-- PurchaseProduct resolves the many-to-many between Purchase and Product
CREATE TABLE PurchaseProduct (
    PurchaseID INT NOT NULL,
    ProductID INT NOT NULL,
    QuantitySold INT NOT NULL,
    UnitPrice DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (PurchaseID, ProductID)
);

CREATE TABLE Receipt (
    ReceiptID INT PRIMARY KEY,
    PurchaseID INT NOT NULL,
    ReceiptDate DATE
);

CREATE TABLE Trailer (
    TrailerID INT PRIMARY KEY,
    RegistrationNumber VARCHAR(20) NOT NULL,
    WOFDate VARCHAR(20)
);

CREATE TABLE TrailerRental (
    RentalID INT PRIMARY KEY,
    CustomerID INT NOT NULL,
    TrailerID INT NOT NULL,
    RegistrationNumber VARCHAR(20),
    PickupDateTime VARCHAR(20),
    ReturnDateTime VARCHAR(20),
    PickupDate VARCHAR(20),
    RentalFee DECIMAL(10,2) NOT NULL
);

-- DepartmentID added to record which department hours were worked in
CREATE TABLE Payroll (
    PayID INT PRIMARY KEY,
    EmployeeID INT NOT NULL,
    DepartmentID INT,
    HoursWorked DECIMAL(10,2) NOT NULL,
    PayDate VARCHAR(20)
);

