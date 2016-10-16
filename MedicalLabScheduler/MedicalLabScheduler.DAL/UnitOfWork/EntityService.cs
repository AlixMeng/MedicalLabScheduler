using MedicalLabScheduler.DAL.Abstraction;
using MedicalLabScheduler.DAL.Abstraction.Repositories;

namespace MedicalLabScheduler.DAL.UnitOfWork
{
    public class EntityService<TEntity> where TEntity : class, new()
    {
        private IUnitOfWork _unitOfWork;
        private IRepository<TEntity> _repository;

        public EntityService(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
            _repository = unitOfWork.GetRepository<TEntity>();
        }

        public IRepository<TEntity> Repository
        {
            get
            {
                return _repository;
            }
        }

        public IUnitOfWork UnitOfWork
        {
            get
            {
                return _unitOfWork;
            }

        }

    }
}
