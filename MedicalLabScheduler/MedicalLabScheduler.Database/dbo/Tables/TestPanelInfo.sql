CREATE TABLE dbo.TestPanelInfo
(
	[TestPanelID] int NOT NULL,
	[TestSubpanelID] int NOT NULL,
	[Description] nvarchar(max),
	CONSTRAINT [PK_TestPanelInfo_TestPanelID]
		PRIMARY KEY NONCLUSTERED ([TestPanelID], [TestSubpanelID])
)