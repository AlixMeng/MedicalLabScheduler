CREATE TABLE dbo.UserCredentials
(
	[PasswordID] int NOT NULL,
	[PasswordSalt] varchar(32) NULL,
	[PasswordHash] varbinary(16) NOT NULL,
	[ModifiedDate] datetime NOT NULL 
		DEFAULT getdate(),
	CONSTRAINT [PK_UserCredentials_PasswordID] PRIMARY KEY CLUSTERED ([PasswordID]),
	CONSTRAINT [FK_UserCredentials_PasswordID]
		FOREIGN KEY ([PasswordID]) REFERENCES [dbo].[Users] ([UserID])
)