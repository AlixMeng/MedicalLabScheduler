USE [MDLABData]
GO
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
GO

CREATE PROCEDURE dbo.uspGetLaboratories
	@City varchar(100) = NULL,
	@Country varchar(100) = NULL
AS
BEGIN
	SELECT [LaboratoryID], [NumberBuilding], [NumberStreet], 
		[Street], [City], [Country]
	FROM [dbo].[Laboratories]
	where ([Country] = @Country OR @Country IS NULL) AND
		([City] = @City OR @City IS NULL)
END
GO

CREATE PROCEDURE dbo.uspGetLaboratoryById
	@LabID int
AS
BEGIN
	SELECT [NumberBuilding], [NumberStreet], [Street], [City], [Country]
	FROM [dbo].[Laboratories]
	WHERE [LaboratoryID] = @LabID;
END
GO

CREATE PROCEDURE dbo.uspGetTests
	@TPanelCode int = NULL,
	@TSubpanelCode int = NULL
AS
BEGIN
	SELECT [TestTypeCode], [TestPanelCode], [TestSubpanelCode], 
		[TestDescription], [UnitPrice]
	FROM [dbo].[TestTypes]
	WHERE ([TestPanelCode] = @TPanelCode OR @TPanelCode IS NULL) AND
		([TestSubpanelCode] = @TSubpanelCode OR @TSubpanelCode IS NULL);
END
GO

CREATE PROCEDURE dbo.uspGetTestById
	@TestId int
AS
BEGIN
	SELECT [TestPanelCode], [TestSubpanelCode], [TestDescription], [UnitPrice]
	FROM [dbo].[TestTypes]
	WHERE [TestTypeCode] = @TestId;
END
GO

CREATE PROCEDURE dbo.uspGetTestPanels
AS
BEGIN
	SELECT [TestPanelID], [TestSubpanelID], [Description]
	FROM [dbo].[TestPanelInfo];
END
GO

CREATE PROCEDURE dbo.uspGetPersonInfo
	@UId int
AS
BEGIN
	-- Get member role
	DECLARE @URole int
	SELECT @URole = [RoleID]
	FROM [dbo].[Users]
		WHERE [UserID] = @UId;
	IF @@ROWCOUNT <> 0
	BEGIN
		-- Member role 'STAFF'
		IF @URole = 2
			BEGIN
				SELECT [IDCardNumber], [FirstName], [LastName], [LaboratoryID]
				FROM [dbo].[Staff]
				WHERE [StaffID] = @UId;
			END
		ELSE
			-- Member role 'Patient' 
			IF @URole = 3
			BEGIN
				SELECT [FirstName], [LastName], [Gender], [Email], [Phone]
				FROM [dbo].[Patients]
				WHERE [PatientID] = @UId;
			END
	END
END
GO

CREATE PROCEDURE dbo.uspCreateUser
	@uname varchar(50),
	@member_role int,
	@passhash varbinary(16),
	@uid int OUTPUT
AS
BEGIN
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
END
GO

CREATE PROCEDURE dbo.uspAddPatient
	@uname varchar(50),
	@passhash varbinary(16),
	@firstname nvarchar(100),
	@lastname nvarchar(100),
	@gen bit,
	@email varchar(100),
	@phone varchar(50)
AS
BEGIN
	BEGIN TRANSACTION
	BEGIN TRY
		DECLARE @uid int
		EXEC dbo.uspCreateUser @uname, 3, @passhash, @uid OUTPUT
		INSERT INTO [dbo].[Patients]
			([PatientID], [FirstName], [LastName], [Gender], [Email], [Phone])
		VALUES
			(@uid, @firstname, @lastname, @gen, @email, @phone);

		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
	END CATCH
END
GO

CREATE PROCEDURE dbo.uspAddStaffMember
	@uname varchar(50),
	@passhash varbinary(16),
	@labid int,
	@idcard int,
	@firstname nvarchar(100),
	@lastname nvarchar(100)
AS
BEGIN
	BEGIN TRANSACTION
	BEGIN TRY
		DECLARE @uid int
		EXEC dbo.uspCreateUser @uname, 2, @passhash, @uid OUTPUT
		INSERT INTO [dbo].[Staff]
			([StaffID], [LaboratoryID], [IDCardNumber], [FirstName], [LastName])
		VALUES
			(@uid, @labid, @idcard, @firstname, @lastname);

		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
	END CATCH
END
GO

CREATE PROCEDURE dbo.uspGetAppoinments
	@client_code int = NULL,
	@lab_code int = NULL,
	@date date = NULL
AS
BEGIN
	SELECT [AppoinmentID], [PatientCode], [LaboratoryCode],
		[TestCode], [VisitDate], [MedicalNotes]
	FROM [dbo].[Appoinments]
	WHERE ([PatientCode] = @client_code OR @client_code IS NULL) AND
		([LaboratoryCode] = @lab_code OR @lab_code IS NULL) AND
		(CAST([VisitDate] as date) = @date OR  @date IS NULL) AND
		([VisitDate] > GETDATE())
END
GO