
------------------------------DAY2 Recap Questions---------------------------------
---1.
create table Customer(
Customer_id int identity(1,1) primary key,
Customer_Name varchar(100),
Customer_Location varchar(100),
)
create table Customer1(
Cus_id int ,
Cus_name varchar(100),
constraint pk_cusid primary key(Cus_id),
)
---2. uk vs pk
--pk shld be unique doesnot allow unique values ,where uk allows null val once.
--Thereis only one pk in table , uk can have multiple key

--3.
alter table Customer1 add constraint fk_cusidcusname foreign key(Cus_id) references Customer(Customer_id)

--4.purpose of check constraint
--check the specific condition in particular column
--example
alter table Customer add constraint ch_Location check(Customer_Location in('Mumbai','Chennai'))

--5.What is a DEFAULT constraint and how do you implement it?
-- In default Constraint we Provide some default value for column if no explicit data provided.
create table Product(
prod_id int not null,
prod_price int not null default 100,
manufac_data date default getdate(),
)
drop table Product
--6 can we add default constraint for existing table or not? if yes give the example sql query for the same.If NO Give the reason why?
--yes can do 
alter table Customer add Constraint df_location default 'chennai' for Customer_Location

--7.drop constraint?
alter table Customer drop Constraint df_location

--8.delete foreign key?
 --on delete cascade  enabled, the referenced row and all dependent rows will be deleted.
 --orelse need to delete the referende row details then delete the target row.

 --9.

 --10.composite pk?
 alter table Product add constraint cpk_prodidprodprice primary key(Prod_id, Prod_price)
 
 
 ---------------------------------------DAY3--------------------------------------------
 --operators--
select 10+20 as addition
select 10-20 as sub
select 10*20 as multi
select 10/20 as div
select 10%20 as modulus

alter database HexaPrac modify name=[SQL-D3]
--absolute---
select value,abs(value) as absolute_value from (values(-15.38),(0)) as testdata(value)
--ceiling---
select ceiling(12.6) 
select ceiling(-23.89)
---floor----
select floor(-23.63)

select floor(23.63)
---power
select power(2,3)

--rand---
select rand()

declare @count int 
set @count=1
while(@count<=10)
begin
print floor(rand()*10)
set @count=@count+1
end

--char---

Declare @Number int
Set @Number = 75
While(@Number <= 90)
Begin
 Print lower(CHAR(@Number))
 Set @Number = @Number + 1
End
go
--date function---
select getdate() as currentdate
select CURRENT_TIMESTAMP 
select CURRENT_USER
select SYSDATETIME() as systime
---date part extraction----
select DATEPART(QUARTER,'2020-12-6')

SELECT YEAR('2020-3-18') AS YEARVALUE
SELECT MONTH('2020-3-18') AS MONTHVALUE
SELECT DAY('2020-3-18') AS DAYVALUE

SELECT DATENAME(WEEKDAY,'2025-03-18') AS MONTHNAME


SELECT DATEADD(DAY,30,'2025-03-18') AS DATEPLUS30DAYS

SELECT DATEDIFF(DAY,'2025-03-18','2025-09-28') AS DATEDIFFERENCE

SELECT EOMONTH('2025-05-18') AS LASTDAYOFMONTH
SELECT CONVERT(VARCHAR,GETDATE()) AS FORMATTEDDATE


SELECT FORMAT(GETDATE(),'dd/mm')

select ISDATE('2025-03-45') as IsvalidDate
-----joins---

create table employee(
employee_id int primary key,
emp_name varchar(100),
emp_email varchar(100),
emp_phoone bigint
)
select * from employee
create table deprt(
dep_id int,
dep_name varchar(100),
Location varchar(100)
)
insert into deprt values(1,'it','chennai'),
(2,null,'bangaore')
alter table deprt add employee_id int 
update deprt set employee_id=101 where Location='chennai'
update deprt set employee_id=102 where Location='bangaore'
insert into employee values(104,null,'abc.com',989909208)	
select * from deprt
alter table deprt add constraint pk_employee foreign key(employee_id) references employee(employee_id)

select e.emp_name , count(d.dep_id) as no_of_employee from employee e
inner join deprt d
on e.employee_id=d.employee_id
group by e.emp_name,d.dep_id,d.dep_name

select e.emp_name,e.employee_id,d.dep_id from employee e
join deprt d on e.employee_id=d.employee_id

select e.emp_name,e.employee_id,d.dep_id from employee e
left join deprt d on e.employee_id=d.employee_id


select e.emp_name,e.employee_id,d.dep_id from employee e
right join deprt d on e.employee_id=d.employee_id

select e.emp_name,e.employee_id,d.dep_id from employee e
full join deprt d on e.employee_id=d.employee_id

select e.emp_name,e.employee_id,d.dep_id from employee e
cross join deprt d 

create table Employee1
(
id int primary key,
Name varchar(10),
Managerid int null
)

insert into Employee1 values
(1,'Poornima',null),
(2,'Geethica',1),
(3,'Manju Sri',1),
(4,'Jerome',2),
(5,'Nithyasri',3)
select * from Employee1

SELECT E1.ID,E1.Name,e2.Name as ManagerName
from Employee1 e1
left join
Employee1 e2 
ON e1.Managerid=e2.id



--1.Write a query to display product names along with their corresponding category names.
--2.List all orders with customer name, order date, product name, and quantity ordered.
--3.Using Left join Show all products and their stock information. Include products that have zero stock.
--4.Self JOIN Display each staff member along with their manager's name
--5.List all stores and the staff members working at each store. Include stores that have no staff. using right join
--6.Find the top 3 customers who have spent the most money on bike products, showing customer name, total amount spent, and the number of orders they've placed.
--7.For each brand, show the number of products and the average list price. 
--8.List all orders placed in 2018 that include products from the "Mountain Bikes" category.
--9.Write a query that shows, for each store, the total revenue by category for the year 2018.
 



