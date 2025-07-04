CREATE DATABASE CASESTUDY_2

USE CASESTUDY_2

CREATE TABLE LOCATION (
  Location_ID INT PRIMARY KEY,
  City VARCHAR(50)
);

INSERT INTO LOCATION (Location_ID, City)
VALUES (122, 'New York'),
       (123, 'Dallas'),
       (124, 'Chicago'),
       (167, 'Boston');


  CREATE TABLE DEPARTMENT (
  Department_Id INT PRIMARY KEY,
  Name VARCHAR(50),
  Location_Id INT,
  FOREIGN KEY (Location_Id) REFERENCES LOCATION(Location_ID)
);


INSERT INTO DEPARTMENT (Department_Id, Name, Location_Id)
VALUES (10, 'Accounting', 122),
       (20, 'Sales', 124),
       (30, 'Research', 123),
       (40, 'Operations', 167);

	   CREATE TABLE JOB (
  Job_ID INT PRIMARY KEY,
  Designation VARCHAR(50)
);

CREATE TABLE JOB
(JOB_ID INT PRIMARY KEY,
DESIGNATION VARCHAR(20))

INSERT  INTO JOB VALUES
(667, 'CLERK'),
(668,'STAFF'),
(669,'ANALYST'),
(670,'SALES_PERSON'),
(671,'MANAGER'),
(672, 'PRESIDENT')


CREATE TABLE EMPLOYEE
(EMPLOYEE_ID INT,
LAST_NAME VARCHAR(20),
FIRST_NAME VARCHAR(20),
MIDDLE_NAME CHAR(1),
JOB_ID INT FOREIGN KEY
REFERENCES JOB(JOB_ID),
MANAGER_ID INT,
HIRE_DATE DATE,
SALARY INT,
COMM INT,
DEPARTMENT_ID  INT FOREIGN KEY
REFERENCES DEPARTMENT(DEPARTMENT_ID))

INSERT INTO EMPLOYEE VALUES
(7369,'SMITH','JOHN','Q',667,7902,'17-DEC-84',800,NULL,20),
(7499,'ALLEN','KEVIN','J',670,7698,'20-FEB-84',1600,300,30),
(7505,'DOYLE','JEAN','K',671,7839,'04-APR-85',2850,NULl,30),
(7506,'DENNIS','LYNN','S',671,7839,'15-MAY-85',2750,NULL,30),
(7507,'BAKER','LESLIE','D',671,7839,'10-JUN-85',2200,NULL,40),
(7521,'WARK','CYNTHIA','D',670,7698,'22-FEB-85',1250,500,30)



--1. List all the employee details.

SELECT * FROM EMPLOYEE

---2. List all the department details.

SELECT * FROM DEPARTMENT

---3. List all job details.

SELECT * FROM JOB

--4. List all the locations.

SELECT * FROM LOCATION

---5. List out the First Name, Last Name, Salary, Commission for all Employees.

SELECT FIRST_NAME , LAST_NAME, SALARY , COMM FROM EMPLOYEE

---6. List out the Employee ID, Last Name, Department ID for all employees and
---alias
--Employee ID as "ID of the Employee", Last Name as "Name of the
---Employee", Department ID as "Dep_id".

SELECT EMPLOYEE_ID AS ID_OF_THE_EMP , LAST_NAME AS NAME_OF_THE_EMP ,
DEPARTMENT_ID AS DEP_ID FROM EMPLOYEE

--7. List out the annual salary of the employees with their names only.

SELECT FIRST_NAME ,LAST_NAME ,SALARY*12 AS ANUALSALARY FROM EMPLOYEE

--WHERE Condition:

--1. List the details about "Smith".

SELECT * FROM EMPLOYEE WHERE LAST_NAME= 'SMITH'

--2. List out the employees who are working in department 20.

SELECT * FROM DEPARTMENT WHERE DEPARTMENT_ID=20

--3. List out the employees who are earning salary between 2000 and 3000.

SELECT * FROM EMPLOYEE WHERE SALARY BETWEEN 2000 AND 3000

--4. List out the employees who are working in department 10 or 20.

SELECT * FROM EMPLOYEE WHERE DEPARTMENT_ID BETWEEN 10 AND 20
SELECT * FROM EMPLOYEE WHERE DEPARTMENT_ID =10 OR DEPARTMENT_ID =20
SELECT * FROM EMPLOYEE WHERE DEPARTMENT_ID IN (10,20)

--5. Find out the employees who are not working in department 10 or 30.

SELECT * FROM EMPLOYEE WHERE DEPARTMENT_ID NOT BETWEEN 10 AND 30
SELECT * FROM EMPLOYEE WHERE DEPARTMENT_ID NOT IN ( 10 , 30)

--6. List out the employees whose name starts with 'L'.

SELECT * FROM EMPLOYEE WHERE FIRST_NAME LIKE 'L%'

--7. List out the employees whose name starts with 'L' and ends with 'E'.

SELECT * FROM EMPLOYEE WHERE FIRST_NAME LIKE 'L%' AND LAST_NAME LIKE '%E'

--8. List out the employees whose name length is 4 and start with 'J'.

SELECT * FROM  EMPLOYEE WHERE FIRST_NAME LIKE 'J___'
SELECT * FROM EMPLOYEE WHERE FIRST_NAME LIKE 'J%'

--9. List out the employees who are working in department 30 and draw the
--salaries more than 2500.

SELECT * FROM EMPLOYEE WHERE DEPARTMENT_ID=30 AND SALARY>2500

--10. List out the employees who are not receiving commission.

SELECT * FROM EMPLOYEE WHERE COMM IS NULL

--ORDER BY Clause:

--1. List out the Employee ID and Last Name in ascending order based on the
---Employee ID.

SELECT   EMPLOYEE_ID , LAST_NAME FROM EMPLOYEE
ORDER BY EMPLOYEE_ID , LAST_NAME ASC

--2. List out the Employee ID and Name in descending order based on salary.

SELECT  SALARY, EMPLOYEE_ID , LAST_NAME , FIRST_NAME FROM EMPLOYEE
ORDER BY SALARY

--3. List out the employee details according to their Last Name in ascending-order

SELECT * FROM EMPLOYEE
ORDER BY LAST_NAME ASC

--4. List out the employee details according to their Last Name in ascending
--order and then Department ID in descending order.

SELECT * FROM EMPLOYEE
ORDER BY DEPARTMENT_ID DESC , LAST_NAME ASC

--GROUP BY and HAVING Clause:
--1. List out the department wise maximum salary, minimum salary and
--average salary of the employees.

SELECT DEPARTMENT_ID , MAX(SALARY) AS MAX_SAL , MIN(SALARY) AS MIN_SAL ,
AVG(SALARY) AS AV_SAL FROM EMPLOYEE
GROUP BY DEPARTMENT_ID

--2. List out the job wise maximum salary, minimum salary and average
--salary of the employees.

SELECT JOB_ID , MAX(SALARY) AS MAX_SAL , MIN(SALARY) AS MIN_SAL ,
AVG(SALARY) AS AV_SAL FROM EMPLOYEE
GROUP BY JOB_ID

--3. List out the number of employees who joined each month in ascending order.

SELECT * FROM EMPLOYEE

SELECT  COUNT(EMPLOYEE_ID) AS NOE , DATEPART(MONTH , HIRE_DATE) AS DOEJ FROM EMPLOYEE
GROUP BY DATEPART(MONTH , HIRE_DATE)
ORDER BY DATEPART(MONTH , HIRE_DATE) ASC


--4. List out the number of employees for each month and year in
--ascending order based on the year and month.

SELECT COUNT(EMPLOYEE_ID ) AS NO_OF_EMP , DATEPART( MONTH , HIRE_DATE) AS MONTH_EMP ,
DATEPART (YEAR , HIRE_DATE) AS YEAR_EMP FROM EMPLOYEE
GROUP BY   DATEPART( MONTH , HIRE_DATE),DATEPART (YEAR , HIRE_DATE)
ORDER BY DATEPART( MONTH , HIRE_DATE)ASC,DATEPART (YEAR , HIRE_DATE)ASC


--5. List out the Department ID having at least four employees.

SELECT DEPARTMENT_ID , COUNT(EMPLOYEE_ID ) AS TOTAL_N_EMP FROM EMPLOYEE
GROUP BY DEPARTMENT_ID
HAVING COUNT(EMPLOYEE_ID) >=4



--6. How many employees joined in February month.

SELECT  COUNT (EMPLOYEE_ID) AS NOE FROM EMPLOYEE
WHERE DATEPART (MONTH,HIRE_DATE) =2


--7. How many employees joined in May or June month.

SELECT  COUNT (EMPLOYEE_ID) AS NOE FROM EMPLOYEE
WHERE DATEPART (MONTH,HIRE_DATE) IN (5,6)

--8. How many employees joined in 1985?

SELECT  COUNT (EMPLOYEE_ID) AS NOE FROM EMPLOYEE
WHERE DATEPART (YEAR,HIRE_DATE) =1985


--9. How many employees joined each month in 1985?

SELECT  DATEPART(MONTH , HIRE_DATE ) AS MONTH , COUNT (EMPLOYEE_ID) AS NOE FROM EMPLOYEE
WHERE DATEPART (YEAR,HIRE_DATE) =1985
GROUP BY DATEPART(MONTH,HIRE_DATE)
ORDER BY DATEPART(MONTH , HIRE_DATE ) ASC


--10. How many employees were joined in April 1985?

SELECT  DATEPART(MONTH , HIRE_DATE ) AS MONTH , COUNT (EMPLOYEE_ID) AS NOE FROM EMPLOYEE
WHERE DATEPART (YEAR,HIRE_DATE) =1985 AND DATEPART (MONTH,HIRE_DATE) =4
GROUP BY DATEPART(MONTH,HIRE_DATE) 


--11. Which is the Department ID having greater than or equal to 3 employees
--joining in April 1985?

SELECT COUNT(DEPARTMENT_ID), DATEPART(MONTH , HIRE_DATE ) AS MONTH , COUNT (EMPLOYEE_ID) AS NOE FROM EMPLOYEE
WHERE DATEPART (YEAR,HIRE_DATE) =1985 AND DATEPART (MONTH,HIRE_DATE) =4
GROUP BY DATEPART(MONTH,HIRE_DATE) 
HAVING COUNT (EMPLOYEE_ID) >=3

--Joins:


--1.List out employees with their department names.


SELECT * FROM EMPLOYEE JOIN DEPARTMENT ON 
EMPLOYEE.DEPARTMENT_ID= DEPARTMENT.DEPARTMENT_ID


SELECT 
    Employee.DEPARTMENT_ID, 
    Employee.Employee_ID, 
	EMPLOYEE.
    Department.Name
FROM 
    Employee
JOIN 
    Department ON Employee.Department_ID = Department.Department_ID;


--2. Display employees with their designations.

SELECT * FROM EMPLOYEE JOIN JOB ON EMPLOYEE.JOB_ID=JOB.Job_ID


--3. Display the employees with their department names and city.

SELECT * FROM LOCATION JOIN DEPARTMENT ON 
LOCATION.Location_ID=DEPARTMENT.Location_Id

--4. How many employees are working in different departments? Display with
--department names.

SELECT DEPARTMENT.NAME, COUNT(EMPLOYEE.EMPLOYEE_ID ) AS NO_OF_EMP_EACH_DEP FROM EMPLOYEE 
JOIN DEPARTMENT ON EMPLOYEE.DEPARTMENT_ID=DEPARTMENT.Department_Id
GROUP BY  DEPARTMENT.[NAME]

--5. How many employees are working in the sales department?

SELECT COUNT(EMPLOYEE.EMPLOYEE_ID )AS NO_OF_EMOP, DEPARTMENT.[NAME ] FROM EMPLOYEE
JOIN DEPARTMENT ON EMPLOYEE.DEPARTMENT_ID=DEPARTMENT.Department_Id
WHERE NAME LIKE 'SALES'
GROUP BY DEPARTMENT.[NAME ] 

--6. Which is the department having greater than or equal to 3
--employees and display the department names in
--ascending order.

SELECT COUNT(EMPLOYEE.EMPLOYEE_ID )AS NO_OF_EMOP, DEPARTMENT.[NAME ] FROM EMPLOYEE
JOIN DEPARTMENT ON EMPLOYEE.DEPARTMENT_ID=DEPARTMENT.Department_Id
GROUP BY DEPARTMENT.[NAME ]
HAVING COUNT (EMPLOYEE.EMPLOYEE_ID )>=3
ORDER BY NAME ASC

--7. How many employees are working in 'Dallas

SELECT COUNT(EMPLOYEE.EMPLOYEE_ID )AS NO_OF_EMOP,   LOCATION.City FROM EMPLOYEE
JOIN DEPARTMENT ON EMPLOYEE.DEPARTMENT_ID=DEPARTMENT.Department_Id
JOIN LOCATION ON DEPARTMENT.Location_Id= Location.LOCATION_ID
WHERE CITY ='DALLAS'
GROUP BY  LOCATION.City




--8. Display all employees in sales or operation departments

SELECT EMPLOYEE.EMPLOYEE_ID , EMPLOYEE.LAST_NAME , EMPLOYEE.FIRST_NAME , DEPARTMENT.[NAME ]  FROM EMPLOYEE
JOIN DEPARTMENT ON EMPLOYEE.DEPARTMENT_ID=DEPARTMENT.Department_Id
WHERE NAME IN('SALES','OPERATIONS')


SELECT * FROM EMPLOYEE

--CONDITIONAL STATEMENT
--1. Display the employee details with salary grades. Use conditional statement to
--create a grade column.

SELECT * , CASE 
WHEN SALARY<1000 THEN 'A'
WHEN SALARY <2000 THEN 'B'
WHEN SALARY >2000 THEN 'C'
ELSE 'D'
END AS GRADE
FROM EMPLOYEE

--2. List out the number of employees grade wise. Use conditional statement to
--create a grade column.

SELECT SALARY, COUNT(*) AS NO_OF_EMP ,
CASE 
WHEN SALARY<1000 THEN 'A'
WHEN SALARY <2000 THEN 'B'
WHEN SALARY >2000 THEN 'C'
ELSE 'D'
END AS GRADE
FROM EMPLOYEE
GROUP BY SALARY

--3. Display the employee salary grades and the number of employees between
--2000 to 5000 range of salary.

SELECT SALARY, COUNT(*) AS NO_OF_EMP ,
CASE 
WHEN SALARY<1000 THEN 'A'
WHEN SALARY <2000 THEN 'B'
WHEN SALARY >2000 THEN 'C'
ELSE 'D'
END AS GRADE
FROM EMPLOYEE
WHERE SALARY BETWEEN 2000 AND 5000
GROUP BY SALARY

--Subqueries:

--1. Display the employees list who got the maximum salary.

SELECT *  FROM EMPLOYEE WHERE 
SALARY= (SELECT MAX(SALARY) FROM EMPLOYEE)

--2. Display the employees who are working in the sales department.

SELECT EMPLOYEE.* , DEPARTMENT.NAME FROM EMPLOYEE JOIN
DEPARTMENT ON EMPLOYEE.DEPARTMENT_ID =DEPARTMENT.DEPARTMENT_ID   
WHERE NAME='SALES'

SELECT *
FROM EMPLOYEE
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID FROM DEPARTMENT WHERE NAME = 'SaLES')


--3. Display the employees who are working as 'Clerk'.

SELECT EMPLOYEE.* , JOB.DESIGNATION FROM EMPLOYEE JOIN
JOB ON EMPLOYEE.JOB_ID =JOB.JOB_ID
WHERE DESIGNATION='CLERK'

SELECT * FROM EMPLOYEE
WHERE JOB_ID =(SELECT JOB_ID FROM JOB WHERE DESIGNATION='CLERK')


--4. Display the list of employees who are living in 'Boston'.


SELECT EMPLOYEE.* , LOCATION.CITY FROM EMPLOYEE JOIN
DEPARTMENT ON EMPLOYEE.DEPARTMENT_ID =DEPARTMENT.DEPARTMENT_ID   
JOIN LOCATION ON DEPARTMENT.LOCATION_ID = LOCATION.LOCATION_ID
WHERE CITY='BOSTON'

--5. Find out the number of employees working in the sales department.

SELECT COUNT (* ) AS NO_OFEMP , DEPARTMENT.NAME FROM EMPLOYEE JOIN
DEPARTMENT ON EMPLOYEE.DEPARTMENT_ID =DEPARTMENT.DEPARTMENT_ID   
WHERE NAME='SALES'
GROUP BY DEPARTMENT.NAME

--6. Update the salaries of employees who are working as clerks on the basis of
--10%.

UPDATE EMPLOYEE 
SET SALARY = SALARY *1.10
WHERE JOB_ID= (SELECT JOB_ID FROM JOB WHERE DESIGNATION= 'CLERK')

SELECT * FROM EMPLOYEE


--7. Display the second highest salary drawing employee details.

SELECT *
FROM EMPLOYEE
WHERE SALARY = (
    SELECT MAX(SALARY)
    FROM EMPLOYEE
    WHERE SALARY < (SELECT MAX(SALARY) FROM EMPLOYEE)
)



--8. List out the employees who earn more than every employee in department 30.

SELECT * FROM EMPLOYEE
WHERE SALARY > ( SELECT MAX(SALARY) FROM EMPLOYEE WHERE DEPARTMENT_ID=30)


--9. Find out which department has no employees.

SELECT * FROM DEPARTMENT
WHERE DEPARTMENT_ID NOT IN ( SELECT DEPARTMENT_ID FROM EMPLOYEE)


--10. Find out the employees who earn greater than the average salary for
--their department.

SELECT * FROM EMPLOYEE
WHERE SALARY > (SELECT AVG(SALARY) FROM EMPLOYEE WHERE DEPARTMENT_ID= DEPARTMENT_ID)
