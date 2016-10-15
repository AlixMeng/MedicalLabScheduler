using MedicalLabScheduler.Core.CommonModels.ViewModel;
using MedicalLabScheduler.Core.Views;

namespace MedicalLabScheduler.Core.ViewModels
{
    public class AuthenticationViewModel : ViewModel<IAuthenticationView>
    {
        public AuthenticationViewModel(IAuthenticationView view) : base(view)
        {
        }
    }
}
