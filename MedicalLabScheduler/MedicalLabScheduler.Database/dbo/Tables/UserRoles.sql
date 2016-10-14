CREATE TABLE dbo.UserRoles
(
	[RoleID] int IDENTITY(1,1),
	[Description] varchar(50) NOT NULL,
	CONSTRAINT [PK_UserRoles_RoleID] PRIMARY KEY CLUSTERED([RoleID])
)