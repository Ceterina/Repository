--IF OBJECT_ID ('WAREHOUSE') IS NOT NULL
--	DROP SCHEMA WAREHOUSE
--GO


--CONSTRAINT PK_Products PRIMARY KEY CLUSTERED (ProductID),
--	CONSTRAINT UQ_Products_SKU UNIQUE (SKU),
--	CONSTRAINT CK_products_Price CHECK (Price >= 0),
--	CONSTRAINT DF_Products_Status DEFAULT('InStock') FOR [Status]
--	);




IF OBJECT_ID ('Warehouse.Products', 'U') IS NOT NULL
	DROP TABLE Warehouse.Products
GO

IF EXISTS (SELECT * FROM SYS.SCHEMAS WHERE name = 'Warehouse')
	DROP SCHEMA WAREHOUSE
GO

CREATE SCHEMA Warehouse
GO


CREATE TABLE Warehouse.Products (
	ProductID INT IDENTITY (1,1)  NOT NULL,
	SKU		  NVARCHAR(20)	      NOT NULL  UNIQUE,
	Price	  DECIMAL(10, 2)      NOT NULL  CHECK (Price >= 0),
	[Status]  NVARCHAR(50)        NOT NULL
	);
ALTER TABLE Warehouse.Products
  ADD CONSTRAINT PK_Products PRIMARY KEY CLUSTERED (ProductID);

ALTER TABLE Warehouse.Products
  ADD CONSTRAINT UQ_Products_SKU UNIQUE (SKU);

ALTER TABLE Warehouse.Products
  ADD CONSTRAINT CK_Products_Price CHECK (Price > 0);

ALTER TABLE Warehouse.Products
  ADD CONSTRAINT DF_Products_Status DEFAULT (N'InStock') FOR [Status];
GO


INSERT INTO Warehouse.Products (SKU, Price)
VALUES ('MB-M1',  1000),
	   ('MB-M2',  1300),
	   ('MB-M3',  1500),
	   ('MB-M4',  1700),
	   ('MB-Pro', 2000);

SELECT *
	FROM [Warehouse].[Products];
GO