using MedicalLabScheduler.Core.Models;


namespace MedicalLabScheduler.DAL.Abstraction.Repositories
{
    public interface IUserRepository : IGenericRepository<User>
    {
       User GetUserByLogin(string login, string password);
    }
}
