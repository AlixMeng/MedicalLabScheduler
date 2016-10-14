USE [MDLABData]
GO
CREATE PROCEDURE dbo.uspValidateUserCredentials
	@UserName varchar(50),
	@UserPwdHash varbinary(32),
	@Err varchar(100) = NULL OUTPUT
AS
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
BEGIN TRAN
BEGIN TRY
	-- Get given user Id
	DECLARE @Uid int
	SELECT @Uid = [UserID] FROM [dbo].[Users]
			WHERE [UserName] = @UserName;
	-- Get stored password hash and password salt	
	DECLARE @OrigPwdHash varbinary(32)
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

			COMMIT TRAN
			SELECT @Err = 'ERROR: Password is incorrect.'
			RETURN (4)
		END
	ELSE
		BEGIN
			-- SUCCESS!
			INSERT INTO [dbo].[LoginAttempts]
				([UserID], [Success])
			VALUES (@Uid, 1);	

			COMMIT TRAN
			RETURN (0)
		END
END TRY
BEGIN CATCH
	ROLLBACK TRAN
END CATCH
GO

--DECLARE @ERR varchar(100)
--DECLARE @retcode int
--declare @p varbinary(32)
--select @p = HASHBYTES('MD5', '1111');
--EXEC @retcode = dbo.ValidateUserCredentials
--	'user', @p, @ERR OUTPUT;

CREATE PROCEDURE dbo.uspGetLaboratories
	@City varchar(100) = NULL,
	@Country varchar(100) = NULL
AS
	SELECT [LaboratoryID], [NumberBuilding], [NumberStreet], 
		[Street], [City], [Country]
	FROM [dbo].[Laboratories]
	where ([Country] = @Country OR @Country IS NULL) AND
		([City] = @City OR @City IS NULL)
	RETURN
GO

CREATE PROCEDURE dbo.uspLaboratoryById
	@LabID int
AS
	SELECT [NumberBuilding], [NumberStreet], [Street], [City], [Country]
	FROM [dbo].[Laboratories]
	WHERE [LaboratoryID] = @LabID;
	RETURN;
GO

CREATE PROCEDURE dbo.uspGetTests
	@TPanelCode int = NULL,
	@TSubpanelCode int = NULL
AS
	SELECT [TestTypeCode], [TestPanelCode], [TestSubpanelCode], 
		[TestDescription], [UnitPrice]
	FROM [dbo].[TestTypes]
	WHERE ([TestPanelCode] = @TPanelCode OR @TPanelCode IS NULL) AND
		([TestSubpanelCode] = @TSubpanelCode OR @TSubpanelCode IS NULL);
	RETURN;
GO

CREATE PROCEDURE dbo.uspGetTestById
	@TestId int
AS
	SELECT [TestPanelCode], [TestSubpanelCode], [TestDescription], [UnitPrice]
	FROM [dbo].[TestTypes]
	WHERE [TestTypeCode] = @TestId;
	RETURN;
GO

CREATE PROCEDURE dbo.uspGetTestPanels
AS
	SELECT [TestPanelID], [TestSubpanelID], [Description]
	FROM [dbo].[TestPanelInfo];
	RETURN;
GO

CREATE PROCEDURE dbo.uspGetUserById
	@UserId int,
	@UserName varchar(50) OUTPUT
AS
	SELECT @UserName = [UserName]
	FROM [dbo].[Users]
		WHERE [UserID] = @UserId;
	RETURN;
GO

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
GO

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
GO

CREATE PROCEDURE dbo.uspAddPatient
	@uname varchar(50),
	@passhash varbinary(32),
	@firstname nvarchar(100),
	@lastname nvarchar(100),
	@gen bit,
	@email varchar(100),
	@phone varchar(50)
AS
	BEGIN TRANSACTION
	BEGIN TRY
		DECLARE @uid int
		EXEC dbo.uspAddUser @uname, 3, @passhash, @uid OUTPUT
		INSERT INTO [dbo].[Patients]
			([PatientID], [FirstName], [LastName], [Gender], [Email], [Phone])
		VALUES
			(@uid, @firstname, @lastname, @gen, @email, @phone);

		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
	END CATCH
	RETURN;
GO

CREATE PROCEDURE dbo.uspAddStaffMember
	@uname varchar(50),
	@passhash varbinary(32),
	@labid int,
	@idcard int,
	@firstname nvarchar(100),
	@lastname nvarchar(100)
AS
	BEGIN TRANSACTION
	BEGIN TRY
		DECLARE @uid int
		EXEC dbo.uspAddUser @uname, 2, @passhash, @uid OUTPUT
		INSERT INTO [dbo].[Staff]
			([StaffID], [LaboratoryID], [IDCardNumber], [FirstName], [LastName])
		VALUES
			(@uid, @labid, @idcard, @firstname, @lastname);

		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
	END CATCH
	RETURN;
GO

CREATE PROCEDURE dbo.uspGetAppoinments
	@client_code int = NULL,
	@lab_code int = NULL,
	@date date = NULL
AS
	SELECT [AppoinmentID], [PatientCode], [LaboratoryCode],
		[TestCode], [VisitDate], [MedicalNotes]
	FROM [dbo].[Appoinments]
	WHERE ([PatientCode] = @client_code OR @client_code IS NULL) AND
		([LaboratoryCode] = @lab_code OR @lab_code IS NULL) AND
		(CAST([VisitDate] as date) = @date OR  @date IS NULL) AND
		([VisitDate] > GETDATE())
	RETURN;
GO