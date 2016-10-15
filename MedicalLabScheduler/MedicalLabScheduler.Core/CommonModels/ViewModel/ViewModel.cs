using MedicalLabScheduler.Core.CommonModels.View;
using System;
using System.ComponentModel;

namespace MedicalLabScheduler.Core.CommonModels.ViewModel
{
    public abstract class ViewModel : IViewModel
    {
        private readonly IView _view;

        protected ViewModel(IView view)
        {
            if (view == null)
            {
                throw new ArgumentNullException("view");
            }

            this._view = view;
            view.DataContext = this;
        }

        /// <summary>
        /// Gets the associated view.
        /// </summary>
        public object View { get { return _view; } }

        #region INotifyPropertyChanged Members
        public event PropertyChangedEventHandler PropertyChanged;

        public void NotifyPropertyChanged(string propertyName)
        {
            if (PropertyChanged != null)
                PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
        }
        #endregion
    }
}
