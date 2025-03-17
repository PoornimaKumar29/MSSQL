/*
truncate table student
alter table student drop column Attedance
delete from student where Stud_id=4
select * from student order by Stud_id
alter table student drop constraint pk_aadhaar
alter table student drop constraint UQ_Aadhaar
alter table student add constraint pk_Studid primary key (Stud_id)
drop table student*/

--check table data--
select * from INFORMATION_SCHEMA.TABLES
--check col name--
SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS  WHERE TABLE_NAME = 'employee';
--check constraint name--
SELECT name FROM sys.check_constraints WHERE parent_object_id = OBJECT_ID('MarchProduction');

--DAY 2 SQL--

create database MoonWork
use MoonWork
select * from MarchProduction
create table MarchProduction(
product_Id int ,
product_Category varchar(100) not null,
product_Price int check (product_price>100),
Stock varchar(100) check (Stock in ('Available' , 'Not Available' , 'Restore')),
Discount decimal(5,2)default 0 check(Discount>=0 and Discount<=100), 
)
--change column datatype--
alter table MarchProduction drop constraint CK__MarchProd__Stock__37A5467C
alter table MarchProduction alter column stock varchar(100)
alter table MarchProduction add constraint ck_marchprod_stock check(Stock in ('Avail','Notavial','restor'))
-- rename database--
alter database MoonWork modify name= Pilgrim

-- dropping command--

 use master
 drop database Pilgrim
 drop table MarchProduction

 --if databse in active kill them first--
 ALTER DATABASE Pilgrim SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
  

-- you can explictly name the constraint orelse system will do it --

 create table customer (
  Customer_name varchar(100),
  Mobile bigint unique,
  Location varchar(100) default 'chennai',
  constraint cus_location check(Location in ('Mumbai' , 'Hyderbad',  'bangalore')),
  CONSTRAINT cus_mobile CHECK (Mobile >= 6000000000 AND Mobile <= 9999999999)


 )
 --it you not explictly named the constraint get constraint name from sytam using below command--
 SELECT name FROM sys.check_constraints WHERE parent_object_id = OBJECT_ID('Customer');

--insert values--
insert into MarchProduction values(1,'Serum', 650 ,'Avail', 0.20)
insert into MarchProduction values(1,'sunscreen', 550 ,'Avail', 0.10)

select * from Marchproduction
update MarchProduction set Product_id=1 where Product_Price=650
--primary key --
alter table customer add Cus_id int
alter table customer alter column Cus_id int not null
alter table customer add constraint pk_cusid primary key(Cus_id)

--composite pk--
create table cusorder(
order_id int ,
Customer_id int ,
Product_id int,
constraint pk_ordercus primary key(order_id,Customer_id)
)
insert into cusorder values(1,101,1)
insert into cusorder values(2,101,3)
insert into cusorder values(2,101,3) --error duplicate not allow in composite pk--

select * from cusorder
 --dealing with bikestores datbase--
 select * from sales.customers
 
 select distinct state from sales.customers

 select distinct state , city from sales.customers order by city asc , state desc

 select distinct first_name, state from sales.customers order by first_name asc , state asc

--usage of selectingTopRows Command--
 select * from sales.order_items

 select count(*) from sales.order_items

 select sum(list_price) from sales.order_items

select top 5 with ties product_name,list_price from production.products order by list_price 
select top 1 percent product_id,list_price from sales.order_items