# Employee-Management-SQL-Project
A complete SQL case study on an employee management system. Covers table creation, basic and advanced queries using WHERE, ORDER BY, GROUP BY, joins, subqueries, and conditional logic. Includes 70+ real-world scenarios to practice data analysis on employee records, salaries, departments, job roles, and locations.


👨‍💼 Employee Management – SQL Project
📌 Project Overview
This project simulates an Employee Management System using SQL. It includes the creation and querying of relational database tables: EMPLOYEE, DEPARTMENT, JOB, and LOCATION. The project is designed to test and improve SQL skills across various domains, including data retrieval, filtering, grouping, subqueries, joins, and conditional logic.

🗃️ Database Schema
1. LOCATION Table
Column Name	Data Type	Description
Location_ID	INT (PK)	Unique location ID
City	VARCHAR	Name of the city

2. DEPARTMENT Table
Column Name	Data Type	Description
Department_ID	INT (PK)	Unique department ID
Name	VARCHAR	Department name
Location_ID	INT (FK)	Linked to LOCATION table

3. JOB Table
Column Name	Data Type	Description
Job_ID	INT (PK)	Unique job ID
Designation	VARCHAR	Job title

4. EMPLOYEE Table
Column Name	Data Type	Description
Employee_ID	INT (PK)	Employee ID
Last_Name	VARCHAR	Employee's last name
First_Name	VARCHAR	First name
Middle_Name	VARCHAR	Middle name
Job_ID	INT (FK)	Reference to JOB table
Hire_Date	DATE	Hiring date
Salary	FLOAT	Monthly salary
Comm	FLOAT	Commission
Department_ID	INT (FK)	Reference to DEPARTMENT

✅ SQL Tasks & Features
🔹 Basic Queries
Retrieve all records from employee, department, job, and location tables.

Use SELECT, column aliases, and calculated columns (e.g., annual salary).

🔹 WHERE Clauses
Filter employees based on salary, department, names, patterns, etc.

🔹 ORDER BY
Sort employee data by ID, name, salary, department, and combinations.

🔹 GROUP BY & HAVING
Department-wise and job-wise aggregation (MAX, MIN, AVG).

Monthly/Yearly employee join statistics.

Filtering grouped results (e.g., departments with ≥4 employees).

🔹 JOINs
Combine employee data with departments, jobs, and locations.

Retrieve employees by department name or location (e.g., Dallas, Boston).

🔹 Conditional Statements
Add salary grades using CASE.

Grade-wise employee count and filters.

🔹 Subqueries
Maximum/second highest salary.

Average salary per department comparison.

Check for departments with no employees.

🔹 Update and Delete
Salary updates (e.g., 10% hike for clerks).

Delete operations based on job/department conditions.👨‍💼 Employee Management – SQL Project
📌 Project Overview
This project simulates an Employee Management System using SQL. It includes the creation and querying of relational database tables: EMPLOYEE, DEPARTMENT, JOB, and LOCATION. The project is designed to test and improve SQL skills across various domains, including data retrieval, filtering, grouping, subqueries, joins, and conditional logic.


✅ SQL Tasks & Features
🔹 Basic Queries
Retrieve all records from employee, department, job, and location tables.

Use SELECT, column aliases, and calculated columns (e.g., annual salary).

🔹 WHERE Clauses
Filter employees based on salary, department, names, patterns, etc.

🔹 ORDER BY
Sort employee data by ID, name, salary, department, and combinations.

🔹 GROUP BY & HAVING
Department-wise and job-wise aggregation (MAX, MIN, AVG).

Monthly/Yearly employee join statistics.

Filtering grouped results (e.g., departments with ≥4 employees).

🔹 JOINs
Combine employee data with departments, jobs, and locations.

Retrieve employees by department name or location (e.g., Dallas, Boston).

🔹 Conditional Statements
Add salary grades using CASE.

Grade-wise employee count and filters.

🔹 Subqueries
Maximum/second highest salary.

Average salary per department comparison.

Check for departments with no employees.

🔹 Update and Delete
Salary updates (e.g., 10% hike for clerks).

Delete operations based on job/department conditions.

📂 Folder Structure
pgsql
Copy
Edit
📁 Employee-Management-SQL-Project/
├── 📄 README.md
├── 📁 SQL_Scripts/
│   ├── 01_create_tables.sql
│   ├── 02_insert_data.sql
│   ├── 03_simple_queries.sql
│   ├── 04_where_clause.sql
│   ├── 05_order_by_clause.sql
│   ├── 06_group_by_having.sql
│   ├── 07_joins.sql
│   ├── 08_conditional_statements.sql
│   ├── 09_subqueries.sql
💡 Sample Highlights
sql
Copy
Edit
-- Example: Get full employee details with department name
SELECT e.Employee_ID, e.First_Name, e.Last_Name, d.Name AS Department
FROM EMPLOYEE e
JOIN DEPARTMENT d ON e.Department_ID = d.Department_ID;

-- Example: Add salary grade using CASE
SELECT Employee_ID, First_Name,
  CASE 
    WHEN Salary >= 5000 THEN 'A'
    WHEN Salary >= 3000 THEN 'B'
    ELSE 'C'
  END AS Salary_Grade
FROM EMPLOYEE;
🧪 How to Use
Set up a relational database (MySQL, PostgreSQL, etc.).

Run 01_create_tables.sql to create all four tables.

Use 02_insert_data.sql to populate them.

Execute the categorized .sql files to run and explore each type of query.

🧠 Skills You Will Learn
Relational database design

SQL DDL and DML

Aggregation and filtering

Joining multiple tables

Subqueries and nested logic

Real-world business analysis in SQL
