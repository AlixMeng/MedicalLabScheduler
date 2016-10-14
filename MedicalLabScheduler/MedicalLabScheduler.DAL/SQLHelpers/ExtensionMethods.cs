using System;
using System.Data;

namespace MedicalLabScheduler.DAL.SQLHelpers
{
    public static class ExtensionMethods
    {
        public static bool ColumnExists(this IDataRecord reader, string columnName)
        {
            for (var i = 0; i < reader.FieldCount; i++)
            {
                if (string.Equals(reader.GetName(i), columnName, StringComparison.OrdinalIgnoreCase))
                {
                    return true;
                }
            }

            return false;
        }
    }
}
