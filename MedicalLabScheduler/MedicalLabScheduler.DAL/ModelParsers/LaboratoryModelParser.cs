using MedicalLabScheduler.Core.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MedicalLabScheduler.Core.Models;
using MedicalLabScheduler.DAL.SQLHelpers;
using System.Globalization;

namespace MedicalLabScheduler.DAL.ModelParsers
{
    class LaboratoryModelParser
    {
        private static LaboratoryModelParser _instance;

        public static LaboratoryModelParser Instance
        {
            get { return _instance ?? (_instance = new LaboratoryModelParser()); }
        }

        public LaboratoryDepartmentModel MakeBuildingResult(SqlDataReader reader)
        {
            var model = new LaboratoryDepartmentModel();

            if (reader.ColumnExists(SqlModelParameters.LaboratoryID))
            {
                model.Id = reader[SqlModelParameters.UserID] is DBNull
                ? 0
                : Convert.ToInt32(reader[SqlModelParameters.LaboratoryID], CultureInfo.CurrentCulture);
            }

            if (reader.ColumnExists(SqlModelParameters.NumberBuilding))
            {
                model.NumberBuilding = reader[SqlModelParameters.NumberBuilding] is DBNull
                ? string.Empty
                : reader[SqlModelParameters.NumberBuilding].ToString();
            }

            if (reader.ColumnExists(SqlModelParameters.NumberStreet))
            {
                model.NumberStreet = reader[SqlModelParameters.NumberStreet] is DBNull
                ? string.Empty
                : reader[SqlModelParameters.NumberStreet].ToString();
            }

            if (reader.ColumnExists(SqlModelParameters.Street))
            {
                model.Street = reader[SqlModelParameters.Street] is DBNull
                ? string.Empty
                : reader[SqlModelParameters.Street].ToString();
            }

            if (reader.ColumnExists(SqlModelParameters.City))
            {
                model.City = reader[SqlModelParameters.City] is DBNull
                ? string.Empty
                : reader[SqlModelParameters.City].ToString();
            }

            if (reader.ColumnExists(SqlModelParameters.Country))
            {
                model.Country = reader[SqlModelParameters.Country] is DBNull
                ? string.Empty
                : reader[SqlModelParameters.Country].ToString();
            }

            return model;
        }
    }
}
