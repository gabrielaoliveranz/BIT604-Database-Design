# BIT604 — DIY Merchandise Database Design
**Open Polytechnic of New Zealand · Level 6 Certificate in Data Analytics & Database Design**

A complete relational database project for a fictional DIY retail business, built in MySQL. Covers schema design, data import, CRUD operations, aggregation, AI-assisted querying, and role-based data security.

---

## What this project demonstrates

- **Schema design** — 11 tables with normalised relationships, foreign key constraints, and schema modifications (LONGBLOB for images, XML storage, table recreation)
- **Data import** — CSV import via MySQL Workbench with edge-case handling (NULL integers, quoted commas in addresses, manual column mapping)
- **CRUD operations** — INSERT, UPDATE, DELETE with referential integrity; self-JOIN for employee/supervisor hierarchy
- **Aggregation & grouping** — sales by department, products by category, hours worked by employee, trailer usage frequency
- **Gen AI-assisted queries** — complex multi-table queries generated and validated with AI tooling (Task 4)
- **Data security** — role-based access control (RBAC) with three permission levels: checkout employee, supervisor, and owner; user creation and privilege demonstration

---

## Database schema overview

| Table | Description |
|---|---|
| Customer | Customer records including image (LONGBLOB) and XML data |
| Employee | Staff with self-referencing SupervisorID |
| Department | 6 departments (Building, Electrical, Garden, Paints, etc.) |
| Role | 7 roles including Shelf Stacking, Supervisor, Owner |
| Product | 58 products across departments |
| Purchase | 58 customer purchases |
| PurchaseProduct | Line items linking purchases to products |
| Trailer | 9 trailers available for rental |
| TrailerRental | 10 trailer rental records |
| Payroll | 225 payroll records with hours worked and pay dates |

---

## Repository structure

```
├── README.md
├── RUN_GUIDE.md                          ← Setup instructions (start here)
├── sql/
│   ├── 01_create_database_and_tables.sql ← Schema creation (no FK)
│   ├── 01a_fix_nulls_after_import.sql    ← NULL repair post-import
│   ├── 01b_add_constraints.sql           ← Foreign key constraints
│   ├── 02_schema_modifications.sql       ← Schema changes (Task 1b)
│   ├── 03_task2a_insert_data.sql         ← Manual inserts (Task 2a)
│   ├── 03b_payroll_enrichment.sql        ← Payroll department mapping
│   ├── 04_update_and_delete_queries.sql  ← UPDATE & DELETE (Task 2b)
│   ├── 05_data_retrieval.sql             ← SELECT queries (Task 2c)
│   ├── 06_aggregation_and_grouping.sql   ← Aggregation (Task 3)
│   ├── 07_genai_queries.sql              ← AI-assisted queries (Task 4)
│   └── 08_data_security.sql             ← RBAC & user permissions (Task 5)
└── data/
    ├── department.csv
    ├── customer.csv
    ├── employee.csv
    ├── product.csv
    ├── purchase.csv
    ├── receipt.csv
    ├── trailer.csv
    ├── customer_Trailer.csv
    └── payroll.csv
└── screenshots/
    ├── eer_diagram.png
    ├── Task_3i_total_sales_per_department.png
    ├── Task_3iv_min_avg_max_totalsales_february.png
    ├── Task_3iii_total_number_of_employees_per_role.png
    ├── task5d_ii_action1_delete_error.png
    ├── task5d_iv_drop_database_error.png
    └── task5b_users_created.png
    ```

---

## How to run

See **[RUN_GUIDE.md](RUN_GUIDE.md)** for full step-by-step setup instructions.

**Requirements:** MySQL 8.x · MySQL Workbench

**Expected row counts after full setup:**
Department 6 · Customer 26+6 · Employee 24 (after deletes) · Product 58 · Purchase 58 · PurchaseProduct 116 · Trailer 9 · TrailerRental 10 · Payroll 225

---

## Key SQL patterns used

```sql
-- Self-JOIN for employee/supervisor hierarchy
SELECT
    e.FirstName AS 'Employee First Name',
    e.LastName  AS 'Employee Last Name',
    s.FirstName AS 'Supervisor First Name',
    s.LastName  AS 'Supervisor Last Name'
FROM Employee e
LEFT JOIN Employee s ON e.SupervisorID = s.EmployeeID;

-- Aggregation: total sales by department
SELECT d.DepartmentName, SUM(p.Price) AS TotalSales
FROM Product p
JOIN Department d ON p.DepartmentID = d.DepartmentID
JOIN PurchaseProduct pp ON p.ProductID = pp.ProductID
GROUP BY d.DepartmentName
ORDER BY TotalSales DESC;
```

---

## Screenshots

### Entity Relationship Diagram (EER)
![EER Diagram](screenshots/eer_diagram.png)

### Aggregation — Total Sales by Department
![Sales by Department](screenshots/Task_3i_total_sales_per_department.png)

### Aggregation — Min, Avg, Max Sales in February
![Min Avg Max](screenshots/Task_3iv_min_avg_max_totalsales_february.png)

### Aggregation — Employees by Role
![Employees by Role](screenshots/Task_3iii_total_number_of_employees_per_role.png)

### Data Security — Supervisor DELETE Denied
![Delete Denied](screenshots/task5d_ii_action1_delete_error.png)

### Data Security — Owner DROP DATABASE Denied
![Drop Denied](screenshots/task5d_iv_drop_database_error.png)

### Data Security — Users Created with Role-Based Access
![Users Created](screenshots/task5b_users_created.png)

---

## Stack

MySQL 8 · MySQL Workbench · SQL (DDL, DML, DCL) · NoSQL (MongoDB equivalent documented)

---

*Part of my data analytics portfolio. See also: [APOPHENIA — NZ Kiwifruit Export Risk Simulator](https://apophenia-nz.vercel.app)*
