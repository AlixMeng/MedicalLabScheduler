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