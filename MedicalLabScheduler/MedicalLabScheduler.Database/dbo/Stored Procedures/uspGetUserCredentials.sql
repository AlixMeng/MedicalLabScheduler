CREATE PROCEDURE dbo.uspGetUserCredentials
	@UserName varchar(50)
AS
	-- Get given user Id
	DECLARE @UId int
	DECLARE @URole int
	SELECT @UId = [UserID],  @URole = [RoleID]
	FROM [dbo].[Users]
		WHERE [UserName] = @UserName;
	IF @@ROWCOUNT <> 0
	BEGIN
		IF @URole = 2
			BEGIN
				SELECT [IDCardNumber], [FirstName], [LastName]
				FROM [dbo].[Staff]
				WHERE [StaffID] = @UId;
			END
		ELSE IF @URole = 3
			BEGIN
				SELECT [FirstName], [LastName], [Gender], [Email], [Phone]
				FROM [dbo].[Patients]
				WHERE [PatientID] = @UId;
			END
	END

	RETURN;