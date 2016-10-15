CREATE PROCEDURE dbo.uspGetTestById
	@TestId int
AS
BEGIN
	SELECT [TestPanelCode], [TestSubpanelCode], [TestDescription], [UnitPrice]
	FROM [dbo].[TestTypes]
	WHERE [TestTypeCode] = @TestId;
END