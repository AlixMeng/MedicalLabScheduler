using MedicalLabScheduler.Core.Models;


namespace MedicalLabScheduler.DAL.Abstraction.Repositories
{
    interface IUserRepository : IGenericRepository<UserModel>
    {
       UserModel GetUserByLogin(string login, string password);
    }
}
