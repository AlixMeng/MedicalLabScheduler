using MedicalLabScheduler.DAL.Abstraction.Repositories;
using MedicalLabScheduler.DAL.SQLHelpers;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace MedicalLabScheduler.DAL.Repositories
{
    public class GenericRepository<TEntity> : IRepository<TEntity> where TEntity : class, new()
    {
        private readonly SqlCommandWrapper _sqlWrapper;

        public GenericRepository(string connection)
        {
            _sqlWrapper = new SqlCommandWrapper(connection);
        }

        public SqlCommandWrapper SqlWrapper
        {
            get { return _sqlWrapper; }
        }

        public IEnumerable<TEntity> ExecuteReader(string spName, Func<SqlDataReader, TEntity> callback, SqlParameter[] parameters = null)
        {
            var result = SqlWrapper.ExecuteReader<TEntity>(CommandType.StoredProcedure, spName, parameters, callback);
            return (IEnumerable<TEntity>)result;
        }

        public IEnumerable<TEntity> ExecuteReaderWithParams(string spName, SqlParameter[] parameters)
        {
            var result = SqlWrapper.ExecuteReaderWithParams<TEntity>(CommandType.StoredProcedure, spName, parameters);

            return (IEnumerable<TEntity>)result;
        }

        public void ExecuteReaderWithoutParamsAndCallback(string spName)
        {
            SqlWrapper.ExecuteReaderWithoutParamsAndCallback(CommandType.StoredProcedure, spName);
        }
    }
}
