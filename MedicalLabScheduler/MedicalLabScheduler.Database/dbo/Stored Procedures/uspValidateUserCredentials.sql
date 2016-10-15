CREATE PROCEDURE dbo.uspValidateUserCredentials
	@UserName varchar(50),
	@UserPwdHash varbinary(16),
	@Err varchar(100) = NULL OUTPUT
AS
BEGIN
	IF (@UserName IS NULL) OR (@UserPwdHash IS NULL)
	BEGIN
		SELECT @Err = 'ERROR: You must specify a user name and password.'
		RETURN (1)
	END
	ELSE
		IF (SELECT COUNT(*) FROM [dbo].[Users]
			WHERE [UserName] = @UserName) = 0
		BEGIN
			SELECT @Err = 'ERROR: User does not exist.' 
			RETURN (2)
		END
	ELSE
		IF (SELECT [Active] FROM [dbo].[Users]
			WHERE [UserName] = @UserName) = 0
		BEGIN
			SELECT @Err = 'ERROR: User is inactive.' 
			RETURN (3)
		END

	BEGIN TRANSACTION

	BEGIN TRY
	-- Get given user Id
	DECLARE @Uid int
	SELECT @Uid = [UserID] FROM [dbo].[Users]
			WHERE [UserName] = @UserName;
	-- Get stored password hash and password salt	
	DECLARE @OrigPwdHash varbinary(16)
	DECLARE @PSalt varchar(32)
	SELECT @OrigPwdHash = [PasswordHash], 
				 @PSalt = [PasswordSalt]
	FROM [dbo].[UserCredentials]
	WHERE [PasswordID] = @Uid;
	-- Check if given password is correct
	IF (@OrigPwdHash <> HASHBYTES('MD5', @PSalt + CAST(@UserPwdHash as varchar)))
		BEGIN
			-- Insert fail bit
			INSERT INTO [dbo].[LoginAttempts]
				([UserID], [Success])
			VALUES (@Uid, 0);

			COMMIT TRANSACTION

			SELECT @Err = 'ERROR: Password is incorrect.'
			RETURN (4)
		END
	ELSE
		BEGIN
			-- SUCCESS!
			INSERT INTO [dbo].[LoginAttempts]
				([UserID], [Success])
			VALUES (@Uid, 1);

			SELECT [UserID], [UserName], [RoleID], [Active]
			FROM [dbo].[Users]
			WHERE [UserName] = @UserName;

			COMMIT TRANSACTION

			RETURN (0)
		END
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
	END CATCH
END