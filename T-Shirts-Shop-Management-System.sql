--Create Database

CREATE DATABASE [T_shirts_Shop_Management]

GO
USE [T_shirts_Shop_Management]
GO

-- Create needed tables

CREATE TABLE [Sizes](
	[Id] INT PRIMARY KEY IDENTITY,
	[Size] VARCHAR(3) NOT NULL,
	CONSTRAINT	CHK_Size 
	CHECK		([Size] IN ('XS','S', 'M', 'L','XL','XXL')),
	[CHEST] NVARCHAR(20) NOT NULL,
	[Waist] NVARCHAR(20) NOT NULL
					)	

CREATE TABLE [Brands](
	[Id] INT PRIMARY KEY IDENTITY,
	[Name] NVARCHAR(20) NOT NULL UNIQUE,
	[Description] NVARCHAR(MAX)
					 )

CREATE TABLE [Types of fits](
	[Id] INT PRIMARY KEY IDENTITY,
	[Name] NVARCHAR(20) NOT NULL UNIQUE,
	[Description] NVARCHAR(MAX)
							)

CREATE TABLE [Colours]	(
	[Id] INT PRIMARY KEY IDENTITY,
	[Colour] NVARCHAR(20) NOT NULL UNIQUE,
						)

CREATE TABLE [Addresses](
	[Id] INT PRIMARY KEY IDENTITY,
	[Town] NVARCHAR(20) NOT NULL,
	[Country] NVARCHAR(20) NOT NULL,
	[Street] NVARCHAR(50) NOT NULL,
						)

GO
CREATE TABLE [Clients]	(
	[Id] INT PRIMARY KEY IDENTITY,
	[FirstName] VARCHAR(30) NOT NULL,
	[LastName] VARCHAR(30) NOT NULL,
	[Email] NVARCHAR(30),
	[AddressId] INT NOT NULL FOREIGN KEY REFERENCES [Addresses]([Id])
						)
GO

GO
CREATE TABLE [TShirts]	(
	[Id] INT PRIMARY KEY IDENTITY,
	[Model] NVARCHAR(20) NOT NULL,
	[BrandId] INT NOT NULL FOREIGN KEY REFERENCES [Brands]([Id]),
	[SizeId] INT NOT NULL FOREIGN KEY REFERENCES [Sizes]([Id]),
	[PriceForOneTshirt] DECIMAL(5, 2) NOT NULL,
	[ColourId] INT NOT NULL FOREIGN KEY REFERENCES [Colours]([Id]),
	[FitTypeId] INT NOT NULL FOREIGN KEY REFERENCES [Types of fits]([Id])
						)
GO

GO
CREATE TABLE [Orders](
	[ClientId] INT,
	[TshirtId] INT,
	CONSTRAINT PK_ids 
	PRIMARY KEY	([ClientId],[TshirtId]),
	CONSTRAINT	FK_clients 
	FOREIGN KEY	([ClientId]) REFERENCES [Clients]([Id]),
	CONSTRAINT	FK_tshirts 
	FOREIGN KEY	([TshirtId]) REFERENCES [TShirts]([Id])
					)
GO

-- Insert data in all tables
USE [T_shirts_Shop_Management]

-- Table: Sizes
INSERT INTO [Sizes]([Size],[Chest], [Waist])
		VALUES
	('XS', '86-92 cm ', '61-66 cm'),
	('S', '92-98 cm', '71-76 cm'),
	('M', '90-102 cm' , '76-82 cm'),
	('L', '102-107 cm', '83-90 cm'),
	('XL', '107-115 cm', '92-102 cm'),
	('XXL', '112-125 cm', '102-115 cm') 

-- Table: Brands
INSERT INTO [Brands]([Name],[Description])
		VALUES
	('Nike', 'American multinational corporation for sports equipment'),
	('Adidas', 'German multinational corporation for sports equipment'),
	('Puma', 'German multinational corporation for sports equipment'),
	('Reebok', 'American corporation for sports equipment'),
	('Bench', 'British clothing brand'),
	('Lotto', 'Italian multinational corporation for sports equipment'),
	('Fred Perry', 'British clothing brand'),
	('Ralph Lauren', 'American clothing brand'),
	('Boss', 'German clothing brand'),
	('Armani', 'Italian clothing brand'),
	('The North Face', 'American corporation for sports equipment'),
	('Columbia', 'American multinational corporation for sports equipment') 

-- Table: Types of fits
INSERT INTO [Types of fits]([Name],[Description])
		VALUES
	('Slim Fit', 'Shaped to the body.'),
	('Modern Fit', 'Follows the shape of the body with ease added for movement.'),
	('Easy Fit', 'Falls free from the body.'),
	('Regular Fit', 'Relaxed fit through the body'),
	('Loose Fit', 'Permits free play')

-- Table: Colours
INSERT INTO [Colours]([Colour])
		VALUES
	('Black'),
	('White'),
	('Colourful'),
	('Light Red'),
	('Dark Red'),
	('Light Purple'),
	('Dark Purple'),
	('Light Orange'),
	('Dark Orange'),
	('Light Blue'),
	('Dark Blue'),
	('Light Green'),
	('Dark Green'),
	('Light Yellow'),
	('Dark Yellow')

-- Table: TShirts
INSERT INTO [TShirts]([Model], [BrandId], [SizeId], [PriceForOneTshirt], [ColourId], [FitTypeId])
		VALUES
	('H2fsdf28', 5, 2, 50.20, 3, 2),
	('H257zhe28', 5, 3, 50.20, 2, 2),
	('Z257zhewre28', 5, 1, 50.20, 3, 2),
	('Qwe257zhe28', 5, 4, 50.20, 2, 2),
	('VCD257zhe28', 5, 5, 50.20, 3, 2),
	('89FS7zhe28', 5, 6, 50.20, 2, 2),
	('RQ12fd159', 12, 6, 105.00, 15, 3),
	('R12fal159', 12, 2, 105.00, 15, 3),
	('R869fal159', 12, 3, 105.00, 15, 3),
	('R1dfeal159', 12, 1, 105.00, 15, 3),
	('d15986GHD5', 1, 2, 34.20, 1, 1),
	('d3fd6GHD5', 1, 3, 34.20, 2, 1),
	('dnhd23GHD5', 1, 1, 34.20, 1, 1),
	('d34323D5', 1, 4, 34.20, 2, 1),
	('d75682HD5', 1, 5, 34.20, 1, 1),
	('G11598r89', 8, 2, 89.80, 10, 4),
	('Gfs894r89', 8, 3, 89.80, 14, 4),
	('G125sfr89', 8, 1, 89.80, 14, 4),
	('Gfds6352r89', 8, 4, 89.80, 10, 4),
	('Ge5848gr89', 8, 5, 89.80, 1, 4),
	('hGDW#231', 9, 2, 75.10, 8, 3),
	('hfju831', 9, 3, 75.10, 7, 3),
	('h58reG1', 9, 1, 75.10, 1, 3),
	('hGGFD888231', 9, 4, 75.10, 7, 3),
	('hGDW#231', 9, 5, 75.10, 8, 3),
	('G125sfr89', 10, 2, 45.70, 1, 2),
	('GGFD8r89', 10 ,3, 45.70, 3, 2),
	('G1FGDr89', 10, 1, 45.70, 1, 2),
	('G1598fr89', 10, 4, 45.70, 3, 2),
	('G125sfr89', 10, 5, 45.70, 1, 2),
	('gf489FDSF', 2, 2, 25.45, 7, 4),
	('gfGFDSF', 2, 3, 25.45, 8, 4),
	('gf48DGSF', 2, 1, 25.45, 4, 4),
	('gf4GFDDSF', 2, 4, 25.45, 8, 4),
	('gf489FDSF', 2, 6, 25.45, 7, 4),
	('F48FSEgs', 6, 2, 62.00, 1, 5),
	('F789degs', 6, 3, 62.00, 3, 5),
	('F48GE83egs', 6, 1, 62.00, 4, 5),
	('F415796egs', 6, 4, 62.00, 3, 5),
	('F486degs', 6, 6, 62.00, 1, 5),
	('ZE86585bras', 11, 3, 15.78, 3, 1),
	('ZE5858ras', 11, 2, 15.78, 8, 1),
	('ZE2558as', 11, 5, 15.78, 3, 2),
	('ZE1885as', 11, 6, 15.78, 8, 2),
	('AB757-8/3@4', 3, 3, 45.62, 15, 3),
	('AB7-5263@4', 3, 2, 45.62, 13, 4),
	('AB5883@4', 3, 1, 45.62, 12, 3),
	('AB75963@4', 3, 6, 45.62, 15, 4),
	('Q#f568gs', 4, 3, 37.80, 10, 5),
	('J587843s', 4, 1, 62.00, 11, 5),
	('Q#f568gs', 4, 4, 37.80, 12, 5),
	('Lo85699$', 4, 6, 62.00, 13, 5),
	('Q#f568gs', 4, 3, 47.80, 13, 1),
	('KLO158862Z', 4, 2, 15.78, 13, 1)

-- Table: Addresses
INSERT INTO [Addresses]([Town], [Country], [Street])
		VALUES
	('Plovdiv', 'Bulgaria', 'Shesti Septemvi Street'),
	('Munich', 'Germany', 'Glockenbachviertel'),
	('Paris', 'France', 'Necker Street'),
	('Zlatibor', 'Serbia', 'Krfska Street'),
	('Sofia', 'Bulgaria', 'James Boutcher Street'),
	('Milan', 'Italy', 'Via Olona Street'),
	('Bern', 'Switzerland', 'Gryphenhubeli 8'),
	('Varna', 'Bulgaria', 'Tsar Kaloyan Street'),
	('Madrid', 'Spain', 'C. de Hermopsilla'),
	('Barselona', 'Spain', 'Fort Pienc'),
	('London', 'UK', 'Short Gardens  Street'),
	('Manchester', 'UK', 'The Royal Street'),
	('Leipzig', 'Germany', 'Sudvortstad'),
	('Bucharest', 'Romania', 'Drumul Taberei'),
	('Pazardjik', 'Bulgaria', 'Treti Mart Street')

-- Table: Clients
INSERT INTO [Clients]([FirstName], [LastName], [Email], [AddressId])
		VALUES
	('Peter', 'Lenon', 'peter.lenon@pl.pl', 12 ),
	('Joana', 'Petrova', NULL, 1),
	('Georgi', 'Georgiev', 'georgi_12@gg.com', 15),
	('Alexandru', 'Florin', NULL, 14 ),
	('Karl', 'Uwe', 'karl123uwe@uw.k.eu', 13 ),
	('Sandra', 'Parker', NULL, 11),
	('Luis', 'Levon', 'l.levon@luis.eu', 3 ),
	('Alexandra', 'Petrova', 'petrova.ax@axp.bg', 5),
	('Klaus', 'Verg', 'kl.verg@klg.se', 4),
	('Gunter', 'Allimolos', NULL, 2),
	('Ludji', 'Josepe', NULL, 6 ),
	('Amaq', 'David', 'amaq.david@amd.eu', 10 ),
	('Ngo', 'Thang', 'ngo.thang@12s.com', 7 ),
	('Joan', 'Mehmen', 'mehmen.j@jmh.com', 8 ),
	('Adri', 'Style', NULL, 9 )

-- Table: Orders
INSERT INTO [Orders]([ClientId], [TshirtId])
		VALUES
	(3, 45),
	(6, 31),
	(9, 13),
	(12, 1),
	(15, 48),
	(1, 22),
	(14, 24),
	(11, 19),
	(8, 34),
	(5, 49),
	(4, 15),
	(10, 8),
	(13, 52)


-- Update the data by inreasing the prices by 15% of all Nike t-shirs and decrease the prices by 20% of t-shirts with size 'XXL'

UPDATE	[TShirts]
SET		[PriceForOneTshirt] = [PriceForOneTshirt] * 1.15
WHERE	[BrandId] = 1 

UPDATE	[TShirts]
SET		[PriceForOneTshirt] = [PriceForOneTshirt] * 0.80
WHERE	[SizeId] = 6

-- 1. Retrieve all t-shirt models, their prices and brands, sorted by brand name (alphabetically) and price (desc)
GO
CREATE PROC dbo.usp_ShowModelPriceBrand
AS
	SELECT	[t].[Model], 
			[t].[PriceForOneTshirt], 
			[b].[Name] AS [Brand]
	FROM	[TShirts] AS [t]
	JOIN	[Brands] AS [b]
	ON		[t].[BrandId] = [b].[Id]
	ORDER
	BY		[b].[Name],
			[t].[PriceForOneTshirt] DESC
GO
-- 2. Retrieve information about all t-shirts which are not ordered and are of size 'M'
GO
CREATE PROC dbo.usp_AvailableTshirtsOfSizeM
AS
	SELECT		[t].[Id] AS [T-Shit Id],
				[t].[Model],
				[b].[Name] AS [Brand],
				[s].[Size]
	FROM		[TShirts] AS [t]
	LEFT JOIN	[Orders] AS [o]
	ON			[t].[Id] = [o].TshirtId
	JOIN		[Brands] AS [b]
	ON			[t].[BrandId] = [b].[Id]
	JOIN		[Sizes] AS [s]
	ON			[t].[SizeId] = [s].[Id]
	WHERE		[o].[ClientId] IS NULL
	AND			[s].[Size] = 'M'

GO
-- 3. Retrieve the addresses of all customers who placed an order and info about the order
GO
CREATE PROC dbo.usp_AddressesOfOrders
AS
	SELECT		[t].[Model],
				[b].[Name],
				[s].[Size],
				[t].[PriceForOneTshirt],
				[c].[Colour],
	CONCAT_WS	(' ',[cl].[FirstName], [cl].[LastName]) AS [Customer],
	CONCAT_WS	(' ',[a].[Town], [a].[Country]) AS [Address]
	FROM		[TShirts] AS [t]
	JOIN		[Brands] AS [b]
	ON			[t].[BrandId] = [b].[Id]
	JOIN		[Sizes] AS [s]
	ON			[t].[SizeId] = [s].[Id]
	JOIN		[Colours] AS [c]
	ON			[t].[ColourId] = [c].[Id]
	RIGHT JOIN	[Orders] AS [o]
	ON			[t].[Id] = [o].[TshirtId]
	JOIN		[Clients] AS [cl]
	ON			[o].[ClientId] = [cl].[Id]
	JOIN		[Addresses] AS [a]
	ON			[cl].[AddressId] = [a].[Id]

GO

-- 4 .Retrieve data if there is a person, whose name looks like "George Georgiev", has placed an order
-- the exact spelling of the name is unknown

GO
CREATE PROC dbo.usp_FindCustomerByName
	(@SearchedName NVARCHAR(50))
AS
	SELECT * 
	FROM	(
			SELECT	CONCAT_WS(' ',[c].[FirstName], 
					[c].[LastName]) AS [FullName]
			FROM	[Clients] AS [c]
			JOIN	[Orders] AS [o]
			ON		[c].[Id] = [o].[ClientId]
			) 
			AS [n]
	WHERE SOUNDEX([n].[FullName]) = SOUNDEX(@SearchedName)
GO 
-- 5. Retrieve info about how many t-shirts have left
GO
CREATE PROC dbo.usp_LeftTshirtsForSale
AS
	SELECT (
			(SELECT COUNT(*) AS [AllTshirts] FROM [TShirts]) 
			- 
			(SELECT COUNT(*) AS [OrderedTshirts] FROM [Orders]) 
			)
	AS [LeftTshirtsForSale]
GO
-- 6. Retrieve info about the profit generated by all orders (the profit is 20% of the final price) 
GO
CREATE PROC dbo.usp_Profit
AS
	SELECT	ROUND((0.2 * SUM([PriceForOneTshirt])), 2) 
	AS		[Profit]
	FROM	(
			SELECT	[t].[PriceForOneTshirt],
					[o].[TshirtId]
			FROM	[TShirts] AS [t]
			JOIN	[Orders] AS [o]
			ON		[t].[Id] = [o].[TshirtId]
			) 
			AS [OrdersByIdAndPrice]

-- 7. Tshirts sorted in four price categories 'Very cheap', Cheap','Expensive', 'Too expensive' 
-- Price ranges: (0 - 24.99), (25.00 - 49.99), (50.00 - 74.99), (75.00 - ...)
GO
CREATE PROC dbo.usp_PriceCategories
AS
	SELECT	[Id],
			[Model],
			CASE
				WHEN [PriceForOneTshirt] < 25 THEN 'Very cheap'
				WHEN [PriceForOneTshirt] BETWEEN 25 AND 49.99 THEN 'Cheap'
				WHEN [PriceForOneTshirt] BETWEEN 50 AND 74.99 THEN 'Expnsive'
				WHEN [PriceForOneTshirt] >= 75 THEN 'Too expensive'
			END 
			AS [PriceCategory]
	FROM	[TShirts]
	ORDER BY [PriceForOneTshirt]
GO

-- 1.
EXEC dbo.usp_ShowModelPriceBrand
-- 2.
EXEC dbo.usp_AvailableTshirtsOfSizeM
-- 3.
EXEC dbo.usp_AddressesOfOrders
-- 4.
EXEC dbo.usp_FindCustomerByName 'George Georgiev'
-- 5.
EXEC dbo.usp_LeftTshirtsForSale
-- 6.
EXEC dbo.usp_Profit 
-- 7.
EXEC dbo.usp_PriceCategories