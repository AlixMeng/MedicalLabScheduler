using System.Windows;
using MedicalLabScheduler.Core.Models;
using System;
using MedicalLabScheduler.Presentation.ViewModels;

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

        public void ShowView(object parameter)
        {
            if (parameter is UserResultModel)
            {
                UserResultModel resultModel = parameter as UserResultModel;
                if (resultModel.UserModel == null)
                {
                    MessageBox.Show(this, resultModel.ServerResponse, "Authentication Error", MessageBoxButton.OK, MessageBoxImage.Error);
                }
                else
                {
                    this.DialogResult = true;
                    this.Close();
                }
            }
            else
            {
                throw new ArgumentException("Invalid parameter type");
            }
        }
    }
}
