using MedicalLabScheduler.Core.CommonModels.View;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using MedicalLabScheduler.Presentation.Views;
using MedicalLabScheduler.Presentation.ViewModels;

namespace MedicalLabScheduler.Presentation
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window, IView
    {
        public MainWindow()
        {
            InitializeComponent();

            LaboratoriesViewModel laboratoriesView = new LaboratoriesViewModel(this.LaboratoryListView);

            this.statusBar.lblUserName.Text = CurrentUser.Login;
            this.statusBar.lblUserRole.Text = CurrentUser.MemberRole;
        }

        protected override void OnClosed(EventArgs e)
        {
            base.OnClosed(e);
            Application.Current.Shutdown();
        }
    }
}
