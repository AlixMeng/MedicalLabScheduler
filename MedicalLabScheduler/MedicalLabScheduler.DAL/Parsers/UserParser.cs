using MedicalLabScheduler.Core.Models;
using MedicalLabScheduler.DAL.SQLHelpers;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MedicalLabScheduler.DAL.Parsers
{
    public class UserParser
    {
        private static UserParser _instance;

        public static UserParser Instance
        {
            get { return _instance ?? (_instance = new UserParser()); }
        }

        public User MakeBuildingResult(SqlDataReader reader)
        {
            var model = new User();

            if (reader.ColumnExists(SQLModelParameters.UserID))
            {
                model.Id = reader[SQLModelParameters.UserID] is DBNull
                ? 0
                : Convert.ToInt32(reader[SQLModelParameters.UserID], CultureInfo.CurrentCulture);
            }

            if (reader.ColumnExists(SQLModelParameters.UserName))
            {
                model.Login = reader[SQLModelParameters.UserName] is DBNull
                ? string.Empty
                : reader[SQLModelParameters.UserName].ToString();
            }

            if (reader.ColumnExists(SQLModelParameters.RoleID))
            {
                model.MemberRole = reader[SQLModelParameters.RoleID] is DBNull
                ? 0
                : Convert.ToInt32(reader[SQLModelParameters.RoleID], CultureInfo.CurrentCulture);
            }

            if (reader.ColumnExists(SQLModelParameters.Active))
            {
                model.Disabled = reader[SQLModelParameters.Active] is DBNull
                ? true
                : !Convert.ToBoolean(reader[SQLModelParameters.Active]);
            }

            return model;
        }
    }
}
