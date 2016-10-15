using MedicalLabScheduler.Core.CommonModels.View;

namespace MedicalLabScheduler.Core.Views
{
    public interface IAuthenticationView : IView
    {
        object DataContext { get; set; }
    }
}
