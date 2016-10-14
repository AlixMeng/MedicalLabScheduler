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