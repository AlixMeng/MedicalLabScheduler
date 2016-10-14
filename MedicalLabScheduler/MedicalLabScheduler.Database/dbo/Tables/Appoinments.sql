CREATE TABLE dbo.Appoinments
(
	[AppoinmentID] int IDENTITY(1,1),
	[PatientCode] int NOT NULL,
	[LaboratoryCode] int NOT NULL,
	[TestCode] int NOT NULL,
	[VisitDate] datetime NOT NULL,
	[MedicalNotes] nvarchar(max) NULL,
	CONSTRAINT [PK_Appoinments_AppoinmentID]
		PRIMARY KEY CLUSTERED ([AppoinmentID]),
	CONSTRAINT [FK_Appoinments_PatientCode]
		FOREIGN KEY ([PatientCode]) REFERENCES [dbo].[Patients] ([PatientID]),
	CONSTRAINT [FK_Appoinments_LaboratoryCode]
		FOREIGN KEY ([LaboratoryCode]) REFERENCES [dbo].[Laboratories] ([LaboratoryID]),
	CONSTRAINT [FK_Appoinments_TestCode]
		FOREIGN KEY ([TestCode]) REFERENCES [dbo].[TestTypes] ([TestTypeCode])
)