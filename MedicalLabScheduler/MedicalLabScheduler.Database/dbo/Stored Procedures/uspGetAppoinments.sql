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