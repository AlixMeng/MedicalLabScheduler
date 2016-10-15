CREATE PROCEDURE dbo.uspGetTestPanels
AS
BEGIN
	SELECT [TestPanelID], [TestSubpanelID], [Description]
	FROM [dbo].[TestPanelInfo];
END