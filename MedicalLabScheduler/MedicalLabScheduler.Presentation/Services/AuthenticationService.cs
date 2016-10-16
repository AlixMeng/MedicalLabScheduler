using System;
using MedicalLabScheduler.Core.Models;
using MedicalLabScheduler.DAL.Abstraction.Repositories;
using System.Data.SqlClient;
using MedicalLabScheduler.DAL.SQLHelpers;
using System.Data;
using System.Security.Cryptography;
using MedicalLabScheduler.DAL.ModelParsers;
using System.Collections.Generic;

namespace MedicalLabScheduler.Presentation.Services
{
    public class AuthenticationService : IAuthenticationService
    {
        private readonly IRepository<UserModel> _userRepository;

        public AuthenticationService(IRepository<UserModel> userRepository)
        {
            if(userRepository == null)
            {
                throw new InvalidOperationException("Specified an empty user repository");
            }

            _userRepository = userRepository;
        }

        public UserResultModel AuthenticateUser(string username, string clearTextPassword)
        {
            var errInfo = new SqlParameter(StoredProcedureParameters.ParamServerResponce, SqlDbType.VarChar, 100)
            {
                Direction = ParameterDirection.Output
            };

            var parameters = new[]
            {
                new SqlParameter(StoredProcedureParameters.ParamUserName, username),
                new SqlParameter(StoredProcedureParameters.ParamUserPasswordHash, CalculateMD5Hash(clearTextPassword)),
                errInfo
            };

            var user = _userRepository.ExecuteReader(StoredProcedureNames.SpValidateUserCredentials,
                UserModelParser.Instance.MakeBuildingResult, parameters);

            return new UserResultModel() { UserModel = First<UserModel>(user), ServerResponse = errInfo.Value.ToString() };
        }

        #region Helpers
        private byte[] CalculateMD5Hash(string clearTextPassword)
        {
            MD5 md5 = MD5.Create();
            byte[] inputBytes = System.Text.Encoding.ASCII.GetBytes(clearTextPassword);
            return md5.ComputeHash(inputBytes);
        }

        private static T First<T>(IEnumerable<T> items)
        {
            using (IEnumerator<T> iter = items.GetEnumerator())
            {
                iter.MoveNext();
                return iter.Current;
            }
        }
        #endregion
    }
}
