select abs(-10) as absolute_val
select ceiling(23.6)
select round(23.77,1)
select DATEDIFF(day,'2025-3-19','2025-09-03') as datedifference
select DATEDIFF(month,'2025-3-19','2025-09-03') as datedifference
select DATEDIFF(YEAR,'2025-3-19','2030-09-03') as datedifference

select replace('sql learning','s','My s')
select substring('poornima in hexaware',5,9)
select charindex('p','poornima')
select patindex('%info%','poornima info') as position
select stuff('ITemployee',2,3,'poor')
select left('TechGenie',4)
select right('techgenie',5)
select concat('poornima',space(5),'kumar')
select 'test'+space(4)+'user'
select * from sales.staffs
select (first_name+space(2)+last_name) as full_name from sales.staffs 
select ltrim('  mysql')
-----------------------------------------learning-----------------------------------------------
Create Table tblProducts
(
 [Id] int identity primary key,
 [Name] nvarchar(50),
 [Description] nvarchar(250)
)
Create Table tblProductSales
(
 Id int primary key identity,
 ProductId int foreign key references tblProducts(Id),
 UnitPrice int,
 QuantitySold int
)
Insert into tblProducts values ('TV', '52 inch black color LCD TV')
Insert into tblProducts values ('Laptop', 'Very thin black color acer laptop')
Insert into tblProducts values ('Desktop', 'HP high performance desktop')

Insert into tblProductSales values(3, 450, 5)
Insert into tblProductSales values(2, 250, 7)
Insert into tblProductSales values(3, 450, 4)
Insert into tblProductSales values(3, 450, 9)

select [id], [name], Description from tblProducts where id not in (select distinct ProductId from tblProductSales)
---below as error joins req tablename. variabe name--
select [Id],Name,Description from tblProducts 
left join tblProductSales on tblProducts.Id=tblProductSales.Id
where tblProductSales.ProductId is null

Select tp.[Id], [Name], [Description]
from tblProducts tp
left join tblProductSales
on tp.Id = tblProductSales.ProductId
where tblProductSales.ProductId IS NULL

--corelated subquery--
select name ,(select sum(QuantitySold) from tblProductSales where ProductId =tblProducts.Id) from tblProducts
order by name
-------------------exists ,any, all---------------------
select p.Id,p.Name from tblProducts p
where not exists(select ps.ProductId from tblProductSales ps
where ps.ProductId=p.Id)

select p.Id,p.Name from tblProducts p
where exists(select ps.ProductId from tblProductSales ps
where ps.ProductId=p.Id)
--any---

select p.Id,p.Name from tblProducts p
where p.id=any(select ps.ProductId from tblProductSales ps
where ps.UnitPrice>250)

---all---
select * from tblProducts;
select * from tblProductSales
select p.Id,p.Name from tblProducts p
where p.id in(select ps.ProductId from tblProductSales ps where ps.UnitPrice>
(select ps.UnitPrice from tblProductSales ps where ps.ProductId=2))


