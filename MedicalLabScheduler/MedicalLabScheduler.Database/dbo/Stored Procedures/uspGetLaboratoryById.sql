CREATE PROCEDURE dbo.uspGetLaboratoryById
	@LabID int
AS
BEGIN
	SELECT [NumberBuilding], [NumberStreet], [Street], [City], [Country]
	FROM [dbo].[Laboratories]
	WHERE [LaboratoryID] = @LabID;
END