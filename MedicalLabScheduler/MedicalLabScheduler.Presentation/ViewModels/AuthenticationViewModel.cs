using MedicalLabScheduler.Core.CommonModels.ViewModel;
using MedicalLabScheduler.Core.Models;
using MedicalLabScheduler.Presentation.Services;
using System;

namespace MedicalLabScheduler.Presentation.ViewModels
{
    public class AuthenticationViewModel : ViewModel<IAuthenticationView>
    {
        private readonly IAuthenticationService _authenticationService;
        private readonly DelegateCommand _loginCommand;
        private string _username;
        private readonly string _nameOrPwdNotSpecifiedInfo = "ERROR: You must specify a user name and password";

        public AuthenticationViewModel(IAuthenticationView view) : base(view)
        {
            _loginCommand = new DelegateCommand(Login);
        }

        public AuthenticationViewModel(IAuthenticationView view, AuthenticationService authenticationService) : this(view)
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

        public IAuthenticationService AuthenticationService
        {
            get { return _authenticationService; }
        }

        public DelegateCommand LoginCommand
        {
            get
            {
                return _loginCommand;
            }
        }

        public bool IsAuthenticated
        {
            get; set;
        }

        private void Login(object parameter)
        {
            System.Windows.Controls.PasswordBox passwordBox = parameter as System.Windows.Controls.PasswordBox;
            string textPassword = passwordBox.Password;
            UserResultModel userResult;
            if (Username != "" && textPassword != "")
            {
                userResult = _authenticationService.AuthenticateUser(Username, textPassword);
            }
            else
            {
                userResult = new UserResultModel() { UserModel = null, ServerResponse = _nameOrPwdNotSpecifiedInfo};
            }

            if (userResult.UserModel != null)
            {
                CurrentUser.Initialize(userResult.UserModel);
                
            }
            ViewCore.ShowView(userResult);
        }
    }
}
