# BIT604 Assessment 3 - Run Guide
**Gabriela Olivera - 5141369**

This guide shows the steps to set up and populate the DIY_MERCHANDISE database.
CSV files are loaded using the Table Data Import Wizard (Topic 8 method).
Table 1 customers and Table 2 roles are inserted manually using SQL.

---

## Steps (run in this order)

### Step 1 — Create the tables
Run **`01_create_database_and_tables.sql`**
Creates the database and all 11 tables without foreign keys so CSV files can be imported in any order.

### Step 2 — Apply schema changes (Task 1b)
Run **`02_schema_modifications.sql`**
Adds img and cst_xml columns to Customer, drops and recreates PurchaseProduct.
Run this before importing the CSV files.

### Step 3 — Import the 8 CSV files using the Wizard
Use the Table Data Import Wizard in MySQL Workbench.

| CSV file | Table |
|---|---|
| department.csv | Department |
| customer.csv | Customer |
| employee.csv | Employee |
| product.csv | Product |
| purchase.csv | Purchase |
| receipt.csv | PurchaseProduct |
| trailer.csv | Trailer |
| customer_Trailer.csv | TrailerRental |
| payroll.csv | Payroll |

Two things to check in the wizard:
- Set the text qualifier to " (double quote). Employee addresses have commas inside quotes - if this is not set, columns will not line up correctly.
- For Payroll, map hoursWorked to HoursWorked and payDate to PayDate manually, as the table has an extra DepartmentID column the CSV does not include.

After importing, check row counts:
Department 6, Customer 26, Employee 29, Product 58, Purchase 58,
PurchaseProduct 116, Trailer 9, TrailerRental 10, Payroll 225.

### Step 4 — Fix NULL supervisors
Run **`01a_fix_nulls_after_import.sql`**
The wizard imports NULL as 0 for integer fields. This script sets SupervisorID back to NULL for top-level employees.

### Step 5 — Insert Table 1 and Table 2 (Task 2a)
Run **`03_task2a_insert_data.sql`**
Inserts the 6 customers from Table 1 (including Lily Boone's picture and XML) and the 7 roles from Table 2.

For the picture: copy customer.jpg to the MySQL Uploads folder.
Find the folder by running: SHOW VARIABLES LIKE 'secure_file_priv';
If LOAD_FILE returns NULL, load the image in Workbench: right-click the img cell on Lily Boone's row > Load Value From File.

### Step 6 — Add foreign keys
Run **`01b_add_constraints.sql`**
Adds all foreign keys. MySQL checks referential integrity at this point.

### Step 7 — Set departments in Payroll (needed for Task 4)
Run **`03b_payroll_enrichment.sql`**

### Step 8 — Update and delete (Task 2b)
Run **`04_update_and_delete_queries.sql`**
After this step Employee has 24 rows (5 casual employees are deleted).

### Step 9 — Data retrieval (Task 2c)
Run **`05_data_retrieval.sql`**

### Step 10 — Aggregation (Task 3)
Run **`06_aggregation_and_grouping.sql`**

### Step 11 — Gen AI queries (Task 4)
Run **`07_genai_queries.sql`**

### Step 12 — Data security (Task 5)
Run **`08_data_security.sql`**
