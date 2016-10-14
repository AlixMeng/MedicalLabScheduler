CREATE PROCEDURE dbo.uspGetTestPanels
AS
	SELECT [TestPanelID], [TestSubpanelID], [Description]
	FROM [dbo].[TestPanelInfo];
	RETURN;