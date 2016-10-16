using MedicalLabScheduler.Core.Models;


namespace MedicalLabScheduler.DAL.Abstraction.Repositories
{
    public interface IUserRepository : IRepository<UserModel>
    {
       UserModel GetUserByLogin(string login, string password);
    }
}
