using System;
using MedicalLabScheduler.Core.Models;
using MedicalLabScheduler.DAL.Abstraction.Repositories;
using System.Data.SqlClient;
using MedicalLabScheduler.DAL.SQLHelpers;
using System.Data;
using System.Security.Cryptography;
using MedicalLabScheduler.DAL.Parsers;
using System.Collections.Generic;

namespace MedicalLabScheduler.Presentation.Services
{
    public class AuthenticationService : IAuthenticationService
    {
        private readonly IUserRepository _userRepository;

        public AuthenticationService(IUserRepository userRepository)
        {
            if(userRepository == null)
            {
                throw new InvalidOperationException("Specified an empty user repository");
            }

            _userRepository = userRepository;
        }

        public User AuthenticateUser(string username, string password)
        {
            var errInfo = new SqlParameter(StoredProcedureParameters.ParamErr, "")
            {
                Direction = ParameterDirection.Output
            };

            var parameters = new[]
            {
                new SqlParameter(StoredProcedureParameters.ParamUserName, username),
                new SqlParameter(StoredProcedureParameters.ParamUserPwdHash, CalculateMD5Hash(password)),
                errInfo
            };

            var user = _userRepository.ExecuteReader(StoredProcedureNames.SpValidateUserCredentials,
                UserParser.Instance.MakeBuildingResult, parameters);

            return First<User>(user);
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
