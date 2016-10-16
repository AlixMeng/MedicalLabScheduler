namespace MedicalLabScheduler.DAL.SQLHelpers
{
    public static class StoredProcedureParameters
    {
        public const string ParamUserName = "@UserName";
        public const string ParamUserPasswordHash = "@UserPwdHash";
        public const string ParamServerResponce = "@Err";

        public const string ParamCity = "@City";
        public const string ParamCountry = "@Country";
    }
}
