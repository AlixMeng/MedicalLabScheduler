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