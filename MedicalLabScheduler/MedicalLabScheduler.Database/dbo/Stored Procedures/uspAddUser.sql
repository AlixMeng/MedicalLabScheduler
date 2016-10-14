CREATE PROCEDURE dbo.uspAddUser
	@uname varchar(50),
	@member_role int,
	@passhash varbinary(32),
	@uid int OUTPUT
AS
	BEGIN TRANSACTION
	BEGIN TRY
		INSERT INTO [dbo].[Users]
			([UserName], [RoleID])
		VALUES (@uname, @member_role);
		-- Get new user ID
		SELECT @uid = SCOPE_IDENTITY();
		-- Generate random password salt
		DECLARE @psalt varchar(32);
		SELECT @psalt = CAST(ROUND(RAND()*1e4, 0) as varchar);

		INSERT INTO [dbo].[UserCredentials]
			([PasswordID], [PasswordSalt], [PasswordHash])
		VALUES (@uid, @psalt, HASHBYTES('MD5', @psalt + CAST(@passhash as varchar)));

		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
	END CATCH
	RETURN;