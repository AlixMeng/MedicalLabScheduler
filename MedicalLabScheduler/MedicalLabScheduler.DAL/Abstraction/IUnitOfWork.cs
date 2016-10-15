using MedicalLabScheduler.DAL.Abstraction.Repositories;

namespace MedicalLabScheduler.DAL.Abstraction
{
    public interface IUnitOfWork
    {
        IGenericRepository<TEntity> GetRepository<TEntity>() where TEntity : class, new();
    }
}
