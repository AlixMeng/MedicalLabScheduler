using MedicalLabScheduler.Core.CommonModels.ViewModel;
using MedicalLabScheduler.Core.Models;
using MedicalLabScheduler.Presentation.Services;
using MedicalLabScheduler.Presentation.Views;
using System;

namespace MedicalLabScheduler.Presentation.ViewModels
{
    public class AuthenticationViewModel : ViewModel<IAuthenticationView>
    {
        private readonly IAuthenticationService _authenticationService;

        private string _username;
        private string _passwordString;

        public AuthenticationViewModel(IAuthenticationView view) : base(view)
        {
        }

        public AuthenticationViewModel(IAuthenticationView view, AuthenticationService authenticationService) : base(view)
        {
            if(authenticationService == null)
            {
                throw new ArgumentException("AuthenticationService instance is not specified");
            }
            _authenticationService = authenticationService;
        }

        public string Username
        {
            get { return _username; }
            set
            {
                _username = value;
                NotifyPropertyChanged("Username");
            }
        }

        public string Password
        {
            get { return _passwordString; }
            set
            {
                _passwordString = value;
                NotifyPropertyChanged("Password");
            }
        }

        public IAuthenticationService AuthenticationService
        {
            get { return _authenticationService; }
        }
    }
}
