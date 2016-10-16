using MedicalLabScheduler.Core.CommonModels.View;
using MedicalLabScheduler.Core.CommonModels.ViewModel;
using MedicalLabScheduler.DAL.Abstraction;
using MedicalLabScheduler.DAL.UnitOfWork;

namespace MedicalLabScheduler.Presentation.ViewModels
{
    class ShellViewModel : ViewModel<IView>
    {
        private IUnitOfWork _unitOfWork;

        private string _userName;
        private string _userRole;

        public ShellViewModel(IView view) : base(view)
        {
            _userName = CurrentUser.Login;
            _userRole = CurrentUser.MemberRole;
        }

        public ShellViewModel(IView view, IUnitOfWork unitOfWork) : this(view)
        {
            if(unitOfWork == null)
            {
                throw new System.InvalidOperationException();
            }
            _unitOfWork = unitOfWork;
        }

        #region Properties
        public IUnitOfWork UnitOfWork
        {
            get
            {
                return _unitOfWork;
            }
        }

        public string UserName
        {
            get
            {
                return _userName;
            }

            set
            {
                _userName = value;
                NotifyPropertyChanged("UserName");
            }
        }

        public string UserRole
        {
            get
            {
                return _userRole;
            }

            set
            {
                _userRole = value;
                NotifyPropertyChanged("UserRole");
            }
        }
        #endregion
    }
}
