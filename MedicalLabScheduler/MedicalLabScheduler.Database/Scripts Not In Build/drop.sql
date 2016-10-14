USE [MDLABData]
GO
-- Drop foreign keys
IF OBJECT_ID (N'dbo.[Users]', N'U') IS NOT NULL
	ALTER TABLE [dbo].[Users] DROP CONSTRAINT [FK_Users_RoleID]
GO
IF OBJECT_ID (N'dbo.[UserCredentials]', N'U') IS NOT NULL
	ALTER TABLE [dbo].[UserCredentials] DROP CONSTRAINT [FK_UserCredentials_PasswordID]
GO
IF OBJECT_ID (N'dbo.[TestTypes]', N'U') IS NOT NULL
	ALTER TABLE [dbo].[TestTypes] DROP CONSTRAINT [FK_TestTypes_TestPanelCode]
GO
IF OBJECT_ID (N'dbo.[Staff]', N'U') IS NOT NULL
	ALTER TABLE [dbo].[Staff] DROP CONSTRAINT [FK_Staff_StaffID]
GO
IF OBJECT_ID (N'dbo.[Patients]', N'U') IS NOT NULL
	ALTER TABLE [dbo].[Patients] DROP CONSTRAINT [FK_Patients_PatientID]
GO
IF OBJECT_ID (N'dbo.[LoginAttempts]', N'U') IS NOT NULL
	ALTER TABLE [dbo].[LoginAttempts] DROP CONSTRAINT [FK_LoginAttemtps_UserID]
GO
IF OBJECT_ID (N'dbo.[Appoinments]', N'U') IS NOT NULL
	ALTER TABLE [dbo].[Appoinments] DROP CONSTRAINT [FK_Appoinments_TestCode]
GO
IF OBJECT_ID (N'dbo.[Appoinments]', N'U') IS NOT NULL
	ALTER TABLE [dbo].[Appoinments] DROP CONSTRAINT [FK_Appoinments_PatientCode]
GO
IF OBJECT_ID (N'dbo.[Appoinments]', N'U') IS NOT NULL
	ALTER TABLE [dbo].[Appoinments] DROP CONSTRAINT [FK_Appoinments_LaboratoryCode]
GO
-- Drop tables
IF OBJECT_ID (N'dbo.[Users]', N'U') IS NOT NULL
	DROP TABLE [dbo].[Users]
GO
IF OBJECT_ID (N'dbo.[UserRoles]', N'U') IS NOT NULL
DROP TABLE [dbo].[UserRoles]
GO
IF OBJECT_ID (N'dbo.[UserCredentials]', N'U') IS NOT NULL
DROP TABLE [dbo].[UserCredentials]
GO
IF OBJECT_ID (N'dbo.[TestTypes]', N'U') IS NOT NULL
DROP TABLE [dbo].[TestTypes]
GO
IF OBJECT_ID (N'dbo.[TestPanelInfo]', N'U') IS NOT NULL
DROP TABLE [dbo].[TestPanelInfo]
GO
IF OBJECT_ID (N'dbo.[Staff]', N'U') IS NOT NULL
DROP TABLE [dbo].[Staff]
GO
IF OBJECT_ID (N'dbo.[Patients]', N'U') IS NOT NULL
DROP TABLE [dbo].[Patients]
GO
IF OBJECT_ID (N'dbo.[LoginAttempts]', N'U') IS NOT NULL
DROP TABLE [dbo].[LoginAttempts]
GO
IF OBJECT_ID (N'dbo.[Laboratories]', N'U') IS NOT NULL
DROP TABLE [dbo].[Laboratories]
GO
IF OBJECT_ID (N'dbo.[Appoinments]', N'U') IS NOT NULL
DROP TABLE [dbo].[Appoinments]
GO
-- Drop stored procedures
/****** Object:  StoredProcedure [dbo].[uspValidateUserCredentials]    Script Date: 13.10.2016 23:20:07 ******/
DROP PROCEDURE [dbo].[uspValidateUserCredentials]
GO
/****** Object:  StoredProcedure [dbo].[uspLaboratoryById]    Script Date: 13.10.2016 23:20:07 ******/
DROP PROCEDURE [dbo].[uspLaboratoryById]
GO
/****** Object:  StoredProcedure [dbo].[uspGetUserCredentials]    Script Date: 13.10.2016 23:20:07 ******/
DROP PROCEDURE [dbo].[uspGetUserCredentials]
GO
/****** Object:  StoredProcedure [dbo].[uspGetUserById]    Script Date: 13.10.2016 23:20:07 ******/
DROP PROCEDURE [dbo].[uspGetUserById]
GO
/****** Object:  StoredProcedure [dbo].[uspGetTests]    Script Date: 13.10.2016 23:20:07 ******/
DROP PROCEDURE [dbo].[uspGetTests]
GO
/****** Object:  StoredProcedure [dbo].[uspGetTestPanels]    Script Date: 13.10.2016 23:20:07 ******/
DROP PROCEDURE [dbo].[uspGetTestPanels]
GO
/****** Object:  StoredProcedure [dbo].[uspGetTestById]    Script Date: 13.10.2016 23:20:07 ******/
DROP PROCEDURE [dbo].[uspGetTestById]
GO
/****** Object:  StoredProcedure [dbo].[uspGetLaboratories]    Script Date: 13.10.2016 23:20:07 ******/
DROP PROCEDURE [dbo].[uspGetLaboratories]
GO
/****** Object:  StoredProcedure [dbo].[uspGetAppoinments]    Script Date: 13.10.2016 23:20:07 ******/
DROP PROCEDURE [dbo].[uspGetAppoinments]
GO
/****** Object:  StoredProcedure [dbo].[uspAddUser]    Script Date: 13.10.2016 23:20:07 ******/
DROP PROCEDURE [dbo].[uspAddUser]
GO
/****** Object:  StoredProcedure [dbo].[uspAddStaffMember]    Script Date: 13.10.2016 23:20:07 ******/
DROP PROCEDURE [dbo].[uspAddStaffMember]
GO
/****** Object:  StoredProcedure [dbo].[uspAddPatient]    Script Date: 13.10.2016 23:20:07 ******/
DROP PROCEDURE [dbo].[uspAddPatient]
GO