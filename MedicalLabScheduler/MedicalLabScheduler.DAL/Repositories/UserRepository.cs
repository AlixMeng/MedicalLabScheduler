using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MedicalLabScheduler.Core.Models;
using MedicalLabScheduler.DAL.Abstraction.Repositories;

namespace MedicalLabScheduler.DAL.Repositories
{
    public class UserRepository : GenericRepository<UserModel>, IUserRepository
    {
        public UserRepository(string connection) : base(connection)
        { }

        public UserModel GetUserByLogin(string login, string password)
        {
            throw new NotImplementedException();
        }
    }
}