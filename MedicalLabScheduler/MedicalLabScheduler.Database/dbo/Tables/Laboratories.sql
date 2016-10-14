CREATE TABLE dbo.Laboratories
(
	[LaboratoryID] int IDENTITY(1,1),
	[NumberBuilding] nvarchar(10) NULL,
	[NumberStreet] smallint NOT NULL,
	[Street] nvarchar(100) NULL,
	[City] nvarchar(100) NOT NULL,
	[Country] nvarchar(100) NOT NULL,
	CONSTRAINT [PK_Laboratories_LaboratoryID] 
		PRIMARY KEY CLUSTERED ([LaboratoryID])
)