--DECLARE @ERR varchar(100)
--DECLARE @retcode int
--declare @p varbinary(32)
--select @p = HASHBYTES('MD5', '1111');
--EXEC @retcode = dbo.ValidateUserCredentials
--	'user', @p, @ERR OUTPUT;

CREATE PROCEDURE dbo.uspGetLaboratories
	@City varchar(100) = NULL,
	@Country varchar(100) = NULL
AS
	SELECT [LaboratoryID], [NumberBuilding], [NumberStreet], 
		[Street], [City], [Country]
	FROM [dbo].[Laboratories]
	where ([Country] = @Country OR @Country IS NULL) AND
		([City] = @City OR @City IS NULL)
	RETURN