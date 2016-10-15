using System;
using System.Collections.Generic;
using System.Data.SqlClient;

namespace MedicalLabScheduler.DAL.Abstraction.Repositories
{
    public interface IGenericRepository<TEntity> where TEntity : class, new()
    {
        IEnumerable<TEntity> ExecuteReader(string spName, Func<SqlDataReader, TEntity> callback,
            SqlParameter[] parameters = null);

        IEnumerable<TEntity> ExecuteReaderWithParams(string spName, SqlParameter[] parameters);

        void ExecuteReaderWithoutParamsAndCallback(string spName);
    }
}
