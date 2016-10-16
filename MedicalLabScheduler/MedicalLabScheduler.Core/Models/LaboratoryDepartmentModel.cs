using MedicalLabScheduler.Core.CommonModels.Data;

namespace MedicalLabScheduler.Core.Models
{
    public class LaboratoryDepartmentModel: Entity<int>
    {
        public string NumberBuilding { get; set; }
        public string NumberStreet { get; set; }
        public string Street { get; set; }
        public string City { get; set; }
        public string Country { get; set; }
    }
}
