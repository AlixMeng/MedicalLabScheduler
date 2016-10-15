namespace MedicalLabScheduler.Core.CommonModels.View
{
    public interface IView
    {
        /// <summary>
        /// Gets or sets the data context of the view.
        /// </summary>
        object DataContext { get; set; }
    }
}
