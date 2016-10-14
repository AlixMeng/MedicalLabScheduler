CREATE TABLE dbo.TestTypes
(
	[TestTypeCode] int,
	[TestPanelCode] int NOT NULL,
	[TestSubpanelCode] int NOT NULL,
	[TestDescription] nvarchar(max) NOT NULL,
	[UnitPrice] decimal NULL,
	CONSTRAINT [PK_TestTypes_TestTypeID]
		PRIMARY KEY NONCLUSTERED ([TestTypeCode]),
	CONSTRAINT [FK_TestTypes_TestPanelCode]
		FOREIGN KEY ([TestPanelCode], [TestSubpanelCode]) REFERENCES [dbo].[TestPanelInfo] ([TestPanelID], [TestSubpanelID]),
)