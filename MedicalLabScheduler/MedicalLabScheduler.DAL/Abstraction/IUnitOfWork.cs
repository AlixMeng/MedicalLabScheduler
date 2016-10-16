using MedicalLabScheduler.DAL.Abstraction.Repositories;

namespace MedicalLabScheduler.DAL.Abstraction
{
    public interface IUnitOfWork
    {
        IRepository<TEntity> GetRepository<TEntity>() where TEntity : class, new();
    }
}
