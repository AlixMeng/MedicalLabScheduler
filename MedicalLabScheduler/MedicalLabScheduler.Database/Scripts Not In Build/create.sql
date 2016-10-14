USE [MDLABData]
GO
CREATE TABLE dbo.UserRoles
(
	[RoleID] int IDENTITY(1,1),
	[Description] varchar(50) NOT NULL,
	CONSTRAINT [PK_UserRoles_RoleID] PRIMARY KEY CLUSTERED([RoleID])
)
GO
CREATE TABLE dbo.Users
(
	[UserID] int IDENTITY(1,1),
	[UserName] varchar(50) NOT NULL,
	[RoleID] int NOT NULL,
	[Active] bit NOT NULL DEFAULT 1,
	[CreatedDate] datetime NOT NULL DEFAULT (getdate()),
	CONSTRAINT [PK_Users_UserID] PRIMARY KEY CLUSTERED ([UserID]),
	CONSTRAINT [UQ_Users_UserName] UNIQUE NONCLUSTERED ([UserName]),
	CONSTRAINT [FK_Users_RoleID] 
		FOREIGN KEY ([RoleID]) REFERENCES [dbo].[UserRoles] ([RoleID]),
	--CONSTRAINT [CK_Users_CreatedDate] CHECK ([CreatedDate] >= getdate())
)
GO
CREATE TABLE dbo.UserCredentials
(
	[PasswordID] int NOT NULL,
	[PasswordSalt] varchar(32) NULL,
	[PasswordHash] varbinary(32) NOT NULL,
	[ModifiedDate] datetime NOT NULL 
		DEFAULT getdate(),
	CONSTRAINT [PK_UserCredentials_PasswordID] PRIMARY KEY CLUSTERED ([PasswordID]),
	CONSTRAINT [FK_UserCredentials_PasswordID]
		FOREIGN KEY ([PasswordID]) REFERENCES [dbo].[Users] ([UserID])
)

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
GO

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
GO

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
GO

CREATE TABLE dbo.LoginAttempts
(
	[LoginAttemptID] int IDENTITY(1,1),
	[UserID] int NOT NULL,
	[Success] bit NOT NULL,
	[CreatedDate] datetime NOT NULL 
		DEFAULT getdate(),
	CONSTRAINT [PK_LoginAttempts_LoginAttemptID] 
		PRIMARY KEY CLUSTERED ([LoginAttemptID]),
	CONSTRAINT [FK_LoginAttemtps_UserID]
		FOREIGN KEY ([UserID]) REFERENCES [dbo].[Users] ([UserID])
)
GO

CREATE TABLE dbo.TestPanelInfo
(
	[TestPanelID] int NOT NULL,
	[TestSubpanelID] int NOT NULL,
	[Description] nvarchar(max),
	CONSTRAINT [PK_TestPanelInfo_TestPanelID]
		PRIMARY KEY NONCLUSTERED ([TestPanelID], [TestSubpanelID])
)
GO

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
GO

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
GO