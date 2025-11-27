--menampilkan data dari semua tabel produk
SELECT *
FROM Production.product;

--menampilakan nama, productnumber, dan listprice
SELECT Name, ProductNumber, ListPrice
FROM Production.Product;

--menampilkan data mengguanakan alias kolom
SELECT Name AS [Nama Barang], ListPrice AS 'Harga Jual'
FROM Production.Product;

--menampilkan HargaBaru = listPrice * 1.1
SELECT Name, ListPrice, (ListPrice * 1.1) AS HargaBaru
FROM Production.Product;

--menampilkan data dengan menggabungkan string
SELECT name + '(' + ProductNumber + ')' AS ProdukLengkap
FROM Production.Product;

--filterisasi data
--Menampilkan Produk yg berwarna 'red'
SELECT Name, Color, Listprice
FROM Production.Product
WHERE Color = 'red';

--menmapilkan product yg harganya lebih dari 1000
SELECT Name, ListPrice
FROM Production.Product
WHERE ListPrice > 1000;

--menampilkan produk yang berwarna black dan list pricenya lebih dari 500
SELECT Name, Color, Listprice
FROM Production.Product
WHERE Color = 'Black' AND ListPrice > 500;

--menampilkan produk yg berwarna red, blue, black
SELECT Name, Color
FROM Production.Product
WHERE Color IN ( 'red', 'blue', 'black');

--menampilkan data yang namanya mengandung kata road
SELECT Name, ProductNumber
FROM Production.Product
WHERE NAme LIKE '%Road%';

--Agregasi dan pengelompokan
--menghitung total baris
SELECT COUNT (*) AS TotalProduk
FROM Production.Product;

--Menampilkan warna produk dan jumlahnya
SELECT Color,COUNT(*) AS JumlahProduk
FROM Production.Product
GROUP BY Color;

--menampilkan productid, jumlah ordderqty, dan rata2 unit pricr
SELECT ProductID, SUM(Orderqty) AS TotalTerjual, AVG(UnitPrice) AS RataRataHarga
FROM Sales.SalesOrderDetail
GROUP BY ProductID

SELECT *
FROM Sales.SalesOrderDetail;

--menampilkan data dengan grouping lebih dari satuk kolom
SELECT Color, Size, COUNT(*) AS Jumlah
FROM Production.Product
GROUP BY Color, Size;

SELECT *
FROM Production.Product;

--filter hasil agregasi
--menampillkan warna produk yg jumlahnyalebih dari 20
SELECT Color, COUNT(*) AS Jumlah
FROM Production.Product
GROUP BY Color
HAVING COUNT(*) >= 2;

--tampilkan warna produk yang ListPrice > 500 dan jumlahnya lebih dari 10
SELECT Color, COUNT(*) AS jumlah
FROM Production.Product
WHERE ListPRice > 500
GROUP  BY Color
HAVING COUNT(*) > 1;

--menampilkan productid yg jumlah orderqtynya lrbih dari 100
SELECT ProductID,SUM(OrderQty) As RataRataBeli
FROM Sales.SalesOrderDetail
GROUP BY ProductID
HAVING SUM(OrderQty) > 10;

--menampilkan specialOFFERID yang rata2 ordserqty lebih dari 2
SELECT SpecialOfferID, AVG(OrderQty) AS RataRataBeli
FROM Sales.SalesOrderDetail
GROUP BY SpecialOfferID
HAVING AVG(OrderQty) > 2;

--menampilkan warna yg listpricenya lebih dari 3000 menggunakan MAX
SELECT Color
FROM Production.Product
GROUP BY Color
HAVING MAX (ListPrice) > 3000;

--Advanced select dan Order By
--menampilkan jobTitle tanpa duplikat

SELECT DISTINCT JobTitle
FROM HumanResources.Employee;

SELECT JobTitle
FROM HumanResources.Employee;

--menampilkan 5 nama produk termahal
SELECT TOP 5 Name, ListPrice
FROM Production.product
Order BY ListPrice ASC;

--Offset Fecth
SELECT Name,Listprice
FROM Production.Product
ORDER BY ListPrice DESC
OFFSET 2 ROWS
FETCH NEXT 4 ROWS ONLY;

SELECT TOP 3 Color,SUM(ListPrice) AS TotalNilaiStok
FROM Production.Product
WHERE ListPrice > 0
GROUP BY Color
ORDER BY TotalNilaiStok DESC;

--no 1
SELECT ProductID, SUM(LineTotal) AS TotalUang
FROM Sales.SalesOrderDetail
GROUP BY ProductID;

--no 2
SELECT ProductID, SUM(LineTotal) AS TotalUang
FROM Sales.SalesOrderDetail
WHERE OrderQty >= 2
GROUP BY ProductID;

--no 3
SELECT ProductID, SUM(LineTotal) AS TotalUang
FROM Sales.SalesOrderDetail
WHERE OrderQty >= 2
GROUP BY ProductID;

--no 4
SELECT ProductID, SUM(LineTotal) AS TotalUang
FROM Sales.SalesOrderDetail
WHERE OrderQty >= 2
GROUP BY ProductID
HAVING SUM(LineTotal) > 50000;

--no 5
SELECT ProductID, SUM(LineTotal) AS TotalUang
FROM Sales.SalesOrderDetail
WHERE OrderQty >= 2
GROUP BY ProductID
HAVING SUM(LineTotal) > 50000
ORDER BY TotalUang DESC;

--no 6
SELECT TOP 10 ProductID, SUM(LineTotal) AS TotalUang
FROM Sales.SalesOrderDetail
WHERE OrderQty >= 2
GROUP BY ProductID
HAVING SUM(LineTotal) > 50000
ORDER BY TotalUang DESC;