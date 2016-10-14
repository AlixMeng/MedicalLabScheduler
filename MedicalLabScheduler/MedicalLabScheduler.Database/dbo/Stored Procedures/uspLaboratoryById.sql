CREATE PROCEDURE dbo.uspLaboratoryById
	@LabID int
AS
	SELECT [NumberBuilding], [NumberStreet], [Street], [City], [Country]
	FROM [dbo].[Laboratories]
	WHERE [LaboratoryID] = @LabID;
	RETURN;