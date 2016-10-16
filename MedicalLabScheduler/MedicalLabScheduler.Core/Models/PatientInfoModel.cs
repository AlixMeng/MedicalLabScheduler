using MedicalLabScheduler.Core.CommonModels.Data;

namespace MedicalLabScheduler.Core.Models
{
    public class PatientInfoModel : Entity<int>
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Gender { get; set; }
        public string Email{ get; set; }
        public string Phone { get; set; }
    }
}
