using MedicalLabScheduler.Core.CommonModels.View;

namespace MedicalLabScheduler.Core.CommonModels.ViewModel
{
    public abstract class ViewModel<TView> : ViewModel where TView : IView
    {
        protected ViewModel(TView view) : base(view)
        {
            
        }

        protected TView ViewCore { get { return (TView)View; } }
    }
}
