CREATE TABLE dbo.Staff
(
	[StaffID] int NOT NULL,
	[LaboratoryID] int NOT NULL,
	[IDCardNumber] int NOT NULL,
	[FirstName] nvarchar(100) NOT NULL,
	[LastName] nvarchar(100) NOT NULL,
	CONSTRAINT [PK_Staff_StaffID] PRIMARY KEY CLUSTERED([StaffID]),
	CONSTRAINT [FK_Staff_StaffID] 
		FOREIGN KEY ([StaffID]) REFERENCES [dbo].[Users]([UserID]),
	CONSTRAINT [FK_Staff_LaboratoryID] 
		FOREIGN KEY ([LaboratoryID]) REFERENCES [dbo].[Laboratories]([LaboratoryID])
)