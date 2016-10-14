CREATE PROCEDURE dbo.uspGetUserById
	@UserId int,
	@UserName varchar(50) OUTPUT
AS
	SELECT @UserName = [UserName]
	FROM [dbo].[Users]
		WHERE [UserID] = @UserId;
	RETURN;