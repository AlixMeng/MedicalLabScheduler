CREATE PROCEDURE dbo.uspGetTests
	@TPanelCode int = NULL,
	@TSubpanelCode int = NULL
AS
	SELECT [TestTypeCode], [TestPanelCode], [TestSubpanelCode], 
		[TestDescription], [UnitPrice]
	FROM [dbo].[TestTypes]
	WHERE ([TestPanelCode] = @TPanelCode OR @TPanelCode IS NULL) AND
		([TestSubpanelCode] = @TSubpanelCode OR @TSubpanelCode IS NULL);
	RETURN;