namespace MedicalLabScheduler.DAL.SQLHelpers
{
    public static class StoredProcedureNames
    {
        public const string SpSearchBuildings = "[dbo].[bsp_SearchBuildings]";
        public const string SpSearchBuildingsWithOutParams = "[dbo].[bsp_SearchBuildingsWithOutParams]";
        public const string SpGetAllBuildings = "[dbo].[bsp_GetAllBuildings]";

        public const string SpGetAllPersons = "[dbo].[bsp_GetAllPersons]";
        public const string SpSearchPersonBuildings = "[dbo].[bsp_SearchPersonBuildings]";
        public const string SpSearchFamilyMembers = "[dbo].[bsp_SearchFamilyMembers]";
    }
}
