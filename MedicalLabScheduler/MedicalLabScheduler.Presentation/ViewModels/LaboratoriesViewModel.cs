using MedicalLabScheduler.Core.CommonModels.View;
using MedicalLabScheduler.Core.CommonModels.ViewModel;
using MedicalLabScheduler.Core.Models;
using MedicalLabScheduler.DAL.Abstraction.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MedicalLabScheduler.Presentation.ViewModels
{
    class LaboratoriesViewModel : ViewModel<IView>
    {
        private IRepository<LaboratoryDepartmentModel> _laboratoryRepository;
        public LaboratoriesViewModel(IView view) : base(view)
        {
        }
    }
}
