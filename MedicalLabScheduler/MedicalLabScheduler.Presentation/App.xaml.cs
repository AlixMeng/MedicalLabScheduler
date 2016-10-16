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

            IUnitOfWork unitOfWork = new UnitOfWork(ConfigurationManager.ConnectionStrings["SqlExpressConnectionString"].ConnectionString);
            // IUnitOfWork unitOfWork = new UnitOfWork(ConfigurationManager.ConnectionStrings["MSSqlLocalDbConnectionString"].ConnectionString); // (localdb) connection
            AuthenticationService authService = new AuthenticationService(unitOfWork.GetRepository<Core.Models.UserModel>());

            LoginWindow loginWindow = new LoginWindow();
            AuthenticationViewModel loginViewModel = new AuthenticationViewModel(loginWindow, authService);

            Current.ShutdownMode = ShutdownMode.OnExplicitShutdown;
            if(loginWindow.ShowDialog() == true)
            {
                Current.ShutdownMode = ShutdownMode.OnMainWindowClose;
                Current.MainWindow = new MainWindow();
            }
            else
            {
                Current.Shutdown();
            }
        }
    }
}
