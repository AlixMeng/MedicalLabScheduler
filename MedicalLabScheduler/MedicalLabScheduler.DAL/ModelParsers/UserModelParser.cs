using MedicalLabScheduler.Core.Models;
using MedicalLabScheduler.DAL.SQLHelpers;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MedicalLabScheduler.DAL.ModelParsers
{
    public class UserModelParser
    {
        private static UserModelParser _instance;

        public static UserModelParser Instance
        {
            get { return _instance ?? (_instance = new UserModelParser()); }
        }

        public UserModel MakeBuildingResult(SqlDataReader reader)
        {
            var model = new UserModel();

            if (reader.ColumnExists(SqlModelParameters.UserID))
            {
                model.Id = reader[SqlModelParameters.UserID] is DBNull
                ? 0
                : Convert.ToInt32(reader[SqlModelParameters.UserID], CultureInfo.CurrentCulture);
            }

            if (reader.ColumnExists(SqlModelParameters.UserName))
            {
                model.Login = reader[SqlModelParameters.UserName] is DBNull
                ? string.Empty
                : reader[SqlModelParameters.UserName].ToString();
            }

            if (reader.ColumnExists(SqlModelParameters.MemberRole))
            {
                model.MemberRole = reader[SqlModelParameters.MemberRole] is DBNull
                ? string.Empty
                : reader[SqlModelParameters.MemberRole].ToString();
            }

            if (reader.ColumnExists(SqlModelParameters.Active))
            {
                model.Disabled = reader[SqlModelParameters.Active] is DBNull
                ? true
                : !Convert.ToBoolean(reader[SqlModelParameters.Active]);
            }

            return model;
        }
    }
}
