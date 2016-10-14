CREATE TABLE dbo.Patients
(
	[PatientID] int NOT NULL,
	[FirstName] nvarchar(100) NULL,
	[LastName] nvarchar(100) NULL,
	[Gender] bit NOT NULL,
	[Email] varchar(100) NULL,
	[Phone] varchar(50) NOT NULL,
	CONSTRAINT [PK_Patients_PatientID] PRIMARY KEY CLUSTERED ([PatientID]),
	CONSTRAINT [FK_Patients_PatientID] 
		FOREIGN KEY ([PatientID]) REFERENCES [dbo].[Users] ([UserID])

)