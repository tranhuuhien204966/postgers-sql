
-- Bai tap thuc hanh
-- #1
--select Title, FirstName, MiddleName, LastName from Person.Person
--go
-- #2
-- select Title, FirstName, MiddleName, LastName, EmailAddress from Person.Contact
-- #3
--SELECT rtrim(concat(FirstName + ' ', MiddleName + ' ', LastName + ' ')) as PersonName FROM Person.Person 
--go
-- #4
--select * from Person.Address
--go
-- #5
--select distinct city from Person.Address
--go
-- #6
--select top 10 * from Person.Address
--go
-- #7
--select avg(Rate) from HumanResources.EmployeePayHistory;
--go
-- #8
--select count(*) from HumanResources.Employee
--go

-- #9
-- select * from Sales.Customer
-- go

--use AdventureWorks
--go

--select * from Sales.SalesOrderDetail
--go

--select * from Sales.SalesO
--use AdventureWorks
--go

-- #9
-- select * from Person.Person as e inner join (select d.BusinessEntityID, count(a.OrderQty) as quantity from Sales.SalesOrderDetail as a
-- inner join Sales.SalesOrderHeader as b on a.SalesOrderID = b.SalesOrderID
-- inner join Sales.Customer as c on c.CustomerID = b.CustomerID
-- inner join Person.Person as d on c.PersonID = d.BusinessEntityID
-- group by d.BusinessEntityID having count(a.OrderQty) > 10) as f on e.BusinessEntityID = f.BusinessEntityID

--#10

-- select * from Production.Product as c inner join (select count(b.OrderQty) as quantity, a.ProductID from Production.Product as a 
-- full outer join Sales.SalesOrderDetail as b
-- on a.ProductID = b.ProductID
-- group by a.ProductID
-- having count(b.OrderQty) < 1) as d
-- on c.ProductID = d.ProductID

-- #11
--create index Idx_Person on Person.Person(BusinessEntityID);
--go



-- select * from Person.Person
go



