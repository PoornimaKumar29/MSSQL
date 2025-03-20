----1.What is a subquery in SQL Server?
--Subquery is nested inside another Query , retrive data will be used by main query

--2. What are the different types of subqueries in SQL Server?
--Corelated Subqueries

--3. How does a correlated subquery work?
-- Where inner query dependent on Outer Query

--4. What is the difference between a correlated subquery and a non-correlated subquery?
--In Non-corelated Subquery ,Outer Query dependent on inner query Output
--wherever in Corelated Subquery inner query dependent on Outer Query for Execution

--5. Can we use ORDER BY in a subquery?
--no
--6. What is the EXISTS clause in SQL Server?
--Clause check the existense of row in subquery if yes returns any row

--7. What is the difference between EXISTS and IN?
--EXISTS checks for row existence without considering values, 
--while IN compares specific values between the outer query and subquery.

--8. How does NOT EXISTS work?
--Contrast with exist , subquery return true if subquery return no row

--9. What is the ANY operator in SQL Server?
--The ANY operator compares a value to a set of values returned by a subquery and 
--returns TRUE if the condition matches any value.

--10. What is the ALL operator in SQL Server?
--The ALL operator requires that a condition must be TRUE 
--for all values returned by a subquery.

--11. What is the difference between ANY and ALL?
--ANY returns TRUE if at least one value matches, while ALL returns TRUE
--only if all values satisfy the condition.

--12. Can we use EXISTS, ANY, and ALL together in a query?
--Yes, EXISTS, ANY, and ALL can be used together in a query, depending
--on the logic required.

--13. What are some performance considerations when using subqueries?
--Using JOINs instead of subqueries when possible for better performance
--Avoiding correlated subqueries in large datasets
--Using EXISTS instead of IN for better efficiency in certain cases
--Using TOP or LIMIT to restrict subquery results if possible.

----------------------------------------------------------------------------LEARNING DAY5-----------------------------------------------------------
--SET FUNCTIONS
create table emp(
id int identity primary key ,
NAme varchar(100),
Department varchar(100),
)
insert into emp values('palanivasan','IT')
create table New_hire(
emp_id int identity primary key,
Name varchar(20),
Depart varchar(20)
)
insert into New_hire values ('guru','HR')
insert into New_hire values ('palani','Account')
insert into New_hire values ('edith','Account')
insert into New_hire values ('poornima','admin')
insert into New_hire values ('nithya','IT')

--union--
select Department from emp
union 
select Depart from New_hire

--union all--

select Department from emp
union all
select Depart from New_hire
---intersect---
select Department from emp
intersect
select Depart from New_hire
--except ---
select NAme, Department from emp
except
select Name,Depart from New_hire
---merge------
select * from emp
select * from New_hire

merge into emp as target
using New_hire as source
on (target.id =source.emp_id)
when matched then
update set 
target.Department=source.Depart
when not matched then
insert ( NAme,Department) values
(source.Name,source.Depart);


-- Step 1: Create the Employees Table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50),
    Department VARCHAR(50),
    Salary INT,
    JoinDate DATE,
    Experience INT
);

-- Step 2: Insert Sample Data
INSERT INTO Employees (EmployeeID, Name, Department, Salary, JoinDate, Experience)
VALUES 
    (1, 'John', 'IT', 60000, '2018-05-10', 5),
    (2, 'Alice', 'HR', 75000, '2017-03-20', 6),
    (3, 'Bob', 'IT', 50000, '2020-07-25', 3),
    (4, 'David', 'Finance', 80000, '2016-09-15', 7),
    (5, 'Emma', 'HR', 72000, '2019-12-3', 4),
    (6, 'Charlie', 'IT', 67000, '2015-06-01', 8),
    (7, 'Sophia', 'Finance', 90000, '2014-11-11', 9);
select Salary as Total_employee from Employees

select Department ,count(Department)  as COunt from Employees
group by Department

ELECT  COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Employees) AS Percentage 
FROM Employees 
select Department , avg(salary) from Employees
group by Department

SELECT 'Highest Salary' AS Category, EmployeeID, Name, Salary 
FROM Employees 
WHERE Salary = (SELECT MAX(Salary) FROM Employees)
except

SELECT 'Lowest Salary' AS Category, EmployeeID, Name, Salary 
FROM Employees 
WHERE Salary = (SELECT MIN(Salary) FROM Employees);
