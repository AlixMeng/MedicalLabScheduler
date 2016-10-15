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