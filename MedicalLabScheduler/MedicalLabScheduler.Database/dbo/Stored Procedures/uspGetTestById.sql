CREATE PROCEDURE dbo.uspGetTestById
	@TestId int
AS
	SELECT [TestPanelCode], [TestSubpanelCode], [TestDescription], [UnitPrice]
	FROM [dbo].[TestTypes]
	WHERE [TestTypeCode] = @TestId;
	RETURN;