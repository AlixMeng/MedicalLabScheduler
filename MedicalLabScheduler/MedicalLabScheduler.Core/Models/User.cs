using MedicalLabScheduler.Core.CommonModels.Data;

namespace MedicalLabScheduler.Core.Models
{
    public class User : Entity<int>
    {
        public string Login { get; set; }
        public int MemberRole { get; set; }
        public bool Disabled { get; set; }
    }
}
