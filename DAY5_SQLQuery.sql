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

select * from emp
select * from New_hire

select Department from emp
union 
select Depart from New_hire










