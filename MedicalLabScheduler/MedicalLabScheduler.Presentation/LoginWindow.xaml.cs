using System.Windows;
using MedicalLabScheduler.Presentation.ViewModels;
using MedicalLabScheduler.Presentation.Services;
using MedicalLabScheduler.Core.Models;
using MedicalLabScheduler.Presentation.Views;

namespace MedicalLabScheduler.Presentation
{
    /// <summary>
    /// Interaction logic for LoginWindow.xaml
    /// </summary>
    public partial class LoginWindow : Window, IAuthenticationView
    {
        public LoginWindow()
        {
            InitializeComponent();
        }

        private void btnLogin_Click(object sender, RoutedEventArgs e)
        {
            AuthenticationViewModel viewModel = DataContext as AuthenticationViewModel;
            IAuthenticationService authService = viewModel.AuthenticationService;
            User user = authService.AuthenticateUser(tbxUsername.Text, pbxPassword.Password);

            if(user==null)
            {
                MessageBox.Show(this, "Invalid user name or password", "Authentication Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            else
            {
                CurrentUser.Initialize(user);
                this.DialogResult = true;
                this.Close();
            }
        }
    }
}
