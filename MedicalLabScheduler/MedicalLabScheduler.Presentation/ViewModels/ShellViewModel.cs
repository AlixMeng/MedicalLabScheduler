using MedicalLabScheduler.Core.CommonModels.View;
using MedicalLabScheduler.Core.CommonModels.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MedicalLabScheduler.Presentation.ViewModels
{
    class ShellViewModel : ViewModel<IView>
    {
        private string _userName;
        private string _userRole;

        public ShellViewModel(IView view) : base(view)
        {
            _userName = CurrentUser.Login;
            _userRole = CurrentUser.MemberRole;
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
    }
}
