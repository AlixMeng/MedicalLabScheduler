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