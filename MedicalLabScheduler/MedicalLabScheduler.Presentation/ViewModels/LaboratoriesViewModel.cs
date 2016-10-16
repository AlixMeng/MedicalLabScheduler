using MedicalLabScheduler.Core.CommonModels.View;
using MedicalLabScheduler.Core.CommonModels.ViewModel;
using MedicalLabScheduler.Core.Models;
using MedicalLabScheduler.DAL.ModelParsers;
using MedicalLabScheduler.DAL.SQLHelpers;
using MedicalLabScheduler.DAL.UnitOfWork;
using System;
using System.Collections.Generic;

namespace MedicalLabScheduler.Presentation.ViewModels
{
    class LaboratoriesViewModel : ViewModel<IView>
    {
        private EntityService<LaboratoryDepartmentModel> _laboratoryService;
        private IEnumerable<LaboratoryDepartmentModel> _laboratories;

        public LaboratoriesViewModel(IView view) : base(view)
        {
        }

        public LaboratoriesViewModel(IView view, EntityService<LaboratoryDepartmentModel> entityService) : this(view)
        {
            if (entityService == null)
            {
                throw new ArgumentException("AuthenticationService instance is not specified");
            }
            
            _laboratoryService = entityService;
        }

        public IEnumerable<LaboratoryDepartmentModel> LaboratoriesCollectionView
        {
            get
            {
                return _laboratories;
            }
        }

        public IEnumerable<LaboratoryDepartmentModel> GetAllLaboratories()
        {
            var laboratories = _laboratoryService.Repository.ExecuteReader(StoredProcedureNames.SpGetLaboratories,
                LaboratoryModelParser.Instance.MakeBuildingResult, null);

            return laboratories;
        }

        public void Init()
        {
            _laboratories = GetAllLaboratories();
            
        }
    }
}
