using MedicalLabScheduler.Core.CommonModels.View;
using MedicalLabScheduler.Core.CommonModels.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MedicalLabScheduler.Presentation.ViewModels
{
    class LaboratoriesViewModel : ViewModel<IView>
    {
        public LaboratoriesViewModel(IView view) : base(view)
        {
        }
    }
}
