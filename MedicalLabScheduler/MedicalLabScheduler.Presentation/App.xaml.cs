using MedicalLabScheduler.DAL.Abstraction;
using MedicalLabScheduler.DAL.Abstraction.Repositories;
using MedicalLabScheduler.DAL.Repositories;
using MedicalLabScheduler.DAL.UnitOfWork;
using MedicalLabScheduler.Presentation.Services;
using MedicalLabScheduler.Presentation.ViewModels;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using System.Windows;

namespace MedicalLabScheduler.Presentation
{
    /// <summary>
    /// Interaction logic for App.xaml
    /// </summary>
    public partial class App : Application
    {
        protected override void OnStartup(StartupEventArgs e)
        {
            base.OnStartup(e);

            IUnitOfWork unitOfWork = new UnitOfWork(ConfigurationManager.ConnectionStrings["MSSqlLocalDbConnectionString"].ConnectionString);
            AuthenticationService authService = new AuthenticationService((unitOfWork as UnitOfWork).UserRepository);

            LoginWindow loginWindow = new LoginWindow();
            AuthenticationViewModel loginViewModel = new AuthenticationViewModel(loginWindow, authService);            

            if(loginWindow.ShowDialog() == true)
            {
                ShutdownMode = ShutdownMode.OnMainWindowClose;
                MedicalLabScheduler.Presentation.MainWindow mainWindow = new Presentation.MainWindow();
                MainWindow = mainWindow;
            }
            else
            {
                this.Shutdown();
            }
        }
    }
}
