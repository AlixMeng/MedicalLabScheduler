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