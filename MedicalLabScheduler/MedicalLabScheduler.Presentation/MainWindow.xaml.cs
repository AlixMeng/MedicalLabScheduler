using MedicalLabScheduler.Core.CommonModels.View;
using System;
using System.Windows;
using MedicalLabScheduler.Presentation.ViewModels;
using MedicalLabScheduler.DAL.UnitOfWork;
using MedicalLabScheduler.Core.Models;
using System.Collections.Generic;

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
            if (!CurrentUser.Loaded)
            {
                this.statusBar.lblUserName.Text = CurrentUser.Login;
                this.statusBar.lblUserRole.Text = CurrentUser.MemberRole;
            }
        }
        
        public void InitializeViewModels()
        {
            (new LaboratoriesViewModel(LaboratoryListView,
               new EntityService<LaboratoryDepartmentModel>((DataContext as ShellViewModel).UnitOfWork))).Init();
            LaboratoryListView.laboratoryTable.ItemsSource = ((LaboratoriesViewModel)LaboratoryListView.DataContext).LaboratoriesCollectionView 
                as IEnumerable<LaboratoryDepartmentModel>;
        }

        protected override void OnClosed(EventArgs e)
        {
            base.OnClosed(e);
            Application.Current.Shutdown();
        }
    }
}
