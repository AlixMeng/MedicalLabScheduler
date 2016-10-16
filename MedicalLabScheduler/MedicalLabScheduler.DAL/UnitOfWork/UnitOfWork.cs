using MedicalLabScheduler.DAL.Abstraction;
using MedicalLabScheduler.DAL.Abstraction.Repositories;
using MedicalLabScheduler.DAL.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MedicalLabScheduler.DAL.UnitOfWork
{
    public class UnitOfWork : IUnitOfWork
    {
        private readonly Dictionary<Type, object> _repositories = new Dictionary<Type, object>();

        private readonly string _connection;

        private IUserRepository _userRepository;

        public UnitOfWork(string connection)
        {
            _connection = connection;
        }

        public IRepository<TEntity> GetRepository<TEntity>() where TEntity : class, new()
        {
            if (_repositories.Keys.ToList().Contains(typeof(TEntity)))
            {
                // Return the repository for that Model class
                return _repositories[typeof(TEntity)] as IRepository<TEntity>;
            }

            // If the repository for that Model class doesn't exist, create it
            var repository = new GenericRepository<TEntity>(_connection);

            // Add it to the dictionary
            _repositories.Add(typeof(TEntity), repository);

            return repository;
        }

        public IUserRepository UserRepository
        {
            get
            {
                return _userRepository ?? (_userRepository = new UserRepository(_connection));
            }
        }
    }
}
