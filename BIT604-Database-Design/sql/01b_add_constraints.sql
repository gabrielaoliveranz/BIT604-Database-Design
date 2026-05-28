-- BIT604 Database | Assessment 3
-- DIY Merchandise Database
-- Task 1a (supplement): Add foreign keys after data is loaded
-- Gabriela Olivera 

USE DIY_MERCHANDISE;

ALTER TABLE Employee
    ADD CONSTRAINT fk_emp_dept FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID),
    ADD CONSTRAINT fk_emp_role FOREIGN KEY (RoleID) REFERENCES Role(RoleID),
    ADD CONSTRAINT fk_emp_sup  FOREIGN KEY (SupervisorID) REFERENCES Employee(EmployeeID);

ALTER TABLE Product
    ADD CONSTRAINT fk_prod_dept FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID);

ALTER TABLE Purchase
    ADD CONSTRAINT fk_purch_cust FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID);

ALTER TABLE PurchaseProduct
    ADD CONSTRAINT fk_pp_purch FOREIGN KEY (PurchaseID) REFERENCES Purchase(PurchaseID),
    ADD CONSTRAINT fk_pp_prod  FOREIGN KEY (ProductID)  REFERENCES Product(ProductID);

ALTER TABLE Receipt
    ADD CONSTRAINT fk_rec_purch FOREIGN KEY (PurchaseID) REFERENCES Purchase(PurchaseID);

ALTER TABLE TrailerRental
    ADD CONSTRAINT fk_rent_cust  FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    ADD CONSTRAINT fk_rent_trail FOREIGN KEY (TrailerID)  REFERENCES Trailer(TrailerID);

ALTER TABLE Payroll
    ADD CONSTRAINT fk_pay_emp  FOREIGN KEY (EmployeeID)   REFERENCES Employee(EmployeeID),
    ADD CONSTRAINT fk_pay_dept FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID);
