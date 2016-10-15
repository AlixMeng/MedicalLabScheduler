namespace MedicalLabScheduler.DAL.SQLHelpers
{
    public static class StoredProcedureNames
    {
        public const string SpValidateUserCredentials = "[dbo].[uspValidateUserCredentials]";

        public const string SpGetPersonInfo = "[dbo].[uspGetPersonInfo]";

        public const string SpGetTestById = "[dbo].[uspGetTestById]";
        public const string SpGetTestPanels = "[dbo].[uspGetTestPanels]";
        public const string SpGetTests = "[dbo].[uspGetTests]";

        public const string SpGetLaboratories = "[dbo].[uspGetLaboratories]";
        public const string SpGetLaboratoryById = "[dbo].[uspGetLaboratoryById]";

        public const string SpGetAppoinments = "[dbo].[uspGetAppoinments]";
    }
}
