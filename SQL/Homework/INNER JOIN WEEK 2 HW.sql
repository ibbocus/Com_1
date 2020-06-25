USE Northwind

SELECT * FROM Customers
WHERE City = 'Paris'

SELECT COUNT(*) AS 'Number of Employees in London' FROM Employees
WHERE City = 'London'

SELECT * FROM Employees
Where TitleOfCourtesy = 'Dr.'

SELECT COUNT(*) AS 'PRODUCTS DISCONTINUED' FROM Products
WHERE Discontinued = 1

sp_help Products
SELECT(
      SELECT COUNT(*)
	  FROM   Customers
	  ) AS Total_Customers,
	  (SELECT COUNT(*)
	  FROM   Employees
	  ) AS No_Of_Departments



SELECT * FROM Customers
SELECT c.CompanyName, c.City, c.Country, c.Region
FROM Customers c
WHERE c.Region='BC'
--TOP--
SELECT TOP 100 c.CompanyName, City FROM Customers c

SELECT p.ProductName, p.UnitPrice FROM Products p
WHERE p.UnitsInStock > 0 AND p.UnitPrice > 29.99

SELECT DISTINCT c.Country
FROM Customers c
ORDER BY c.Country
SELECT DISTINCT c.Country
FROM Customers c


/* WILD CARDS */
--%
SELECT
(SELECT COUNT(SCountry) 
FROM Customers c WHERE Country like 'G%')  AS 'Countries Beginning with G',
(SELECT COUNT(Country) 
FROM Customers c WHERE Country like 'G%')  AS 'Countries Beginning with A'



SELECT DISTINCT c.Country
FROM Customers c WHERE Country LIKE '__A%'

SELECT
p.ProductName,
CHARINDEX('''',p.ProductName) as "number of quotes"
FROM Products p
WHERE 'number of quotes' is 0


SELECT c.PostalCode "Post Code",
LEFT(c.PostalCode, CHARINDEX(' ',c.PostalCode)-1) AS "Post Code Region",
CHARINDEX (' ',PostalCode) AS "Space Found", Country
FROM customers c
WHERE Country ='UK'

use Northwind

SELECT
DATEADD(y,5,getdate())
from Orders o

GETDATE()

SELECT
CONCAT(e.FirstName, ' ', e.LastName) AS 'Full Name',
DATEDIFF(HOUR,e.BirthDate,GETDATE())/ (8766.00000) AS Age
FROM Employees e
select (365.25*24)

SELECT
CONCAT(e.FirstName, ' ', e.LastName) AS 'Full Name',
(DATEDIFF(DAY, e.BirthDate, GetDate()) / 365.25) as Age
FROM Employees e

SELECT
CONCAT(e.FirstName, ' ', e.LastName) AS 'Full Name',
ROUND((DATEDIFF(DAY, e.BirthDate, GetDate()) / 365),0) as Age
FROM Employees e

SELECT
CONCAT(e.FirstName, ' ', e.LastName) AS 'Full Name',
DATEDIFF(YEAR, e.BirthDate, GetDate())  as Age
FROM Employees e



SELECT CASE 
WHEN DATEDIFF(d,o.OrderDate, o.ShippedDate) < 10 THEN 'ON TIME'
ELSE 'OVERDUE'
END AS "STATUS"
FROM Orders o
/* Condito */

SELECT 
CONCAT(e.FirstName, ' ', e.LastName) as "Full Name",
DATEDIFF(YEAR, e.BirthDate, GetDate())  as "Age",
CASE
WHEN DATEDIFF(YEAR, e.BirthDate, GetDate()) > 65 THEN 'RETIRED'
WHEN DATEDIFF(YEAR, e.BirthDate, GetDate()) > 60 THEN 'RETIREMENT DUE'
ELSE 'MORE THAN 5 YEARS TO GO'
END AS "STATUS"
FROM Employees e

SELECT 
DATEDIFF(YEAR, e.BirthDate, GetDate())  as Age
FROM Employees e

SELECT
p.SupplierID,
AVG(p.UnitsOnOrder) AS "AVG",
MIN(p.UnitsOnOrder) AS "MIN",
MAX(p.UnitsOnOrder) AS "MAX"
FROM PRODUCTS p
where SupplierID = 1
group by p.SupplierID

SELECT
p.SupplierID,
AVG(p.UnitsOnOrder) AS "AVG",
MIN(p.UnitsOnOrder) AS "MIN",
MAX(p.UnitsOnOrder) AS "MAX"
FROM PRODUCTS p
where SupplierID = 2
group by p.SupplierID

-- GROUP BY and ORDER BY
SELECT
p.CategoryID,
AVG(p.ReorderLevel) AS "AVG"
WHERE AVG(p.UnitsOnOrder) > 5
FROM PRODUCTS p
GROUP BY p.CategoryID
HAVING AVG(p.UnitsOnOrder) > 5
ORDER BY "AVG" DESC

SELECT 
p.SupplierID,
SUM(p.UnitsOnOrder) AS "AVG"
FROM PRODUCTS p
GROUP BY p.SupplierID
HAVING AVG(p.UnitsOnOrder) > 5
ORDER BY "AVG" DESC



select * from products 

SELECT
s.SupplierID, p.UnitsInStock
FROM Suppliers s
RIGHT JOIN Products p
ON p.SupplierID = s.SupplierID

select o.EmployeeID, o.OrderID, C.ContactName
from Orders o
join Customers c
   on c.customerid = o.customerid


   --INNER JOIN 
SELECT c.customerID, c.contactName, o.employeeID, o.ShipCity
FROM orders o 
INNER JOIN customers c
ON c.customerID = o.CustomerID
ORDER BY EmployeeID;

SELECT e.EmployeeID, e.FirstName, o.OrderDate , et.TerritoryID
FROM orders o
INNER JOIN Employees e
ON o.EmployeeID=e.EmployeeID
INNER JOIN EmployeeTerritories et
ON et.EmployeeID=e.EmployeeID


SELECT * 
FROM Orders o 
CROSS JOIN customers c;

SELECT
COUNT(o.CustomerID)
FROM orders o

SELECT
COUNT(o.CustomerID)
FROM Customers o

SELECT 91 * 830

SELECT p.SupplierID
AVG(p.UnitsOnOrder) as "Average Units on Order"
FROM Products p

select * from products
SELECT
p.SupplierID,
AVG(p.UnitsOnOrder) AS "AVG"
FROM PRODUCTS p
group by p.SupplierID



SELECT  s.CompanyName AS "Supplier Name", AVG(p.UnitsOnOrder) AS "Average UnitsOnOrder"
FROM products p
INNER JOIN Suppliers s
ON p.SupplierID=s.SupplierID
GROUP BY s.SupplierID, s.CompanyName
ORDER BY "Average UnitsOnOrder" DESC

