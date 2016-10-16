using MedicalLabScheduler.Core.CommonModels.Data;

namespace MedicalLabScheduler.Core.Models
{
    public class UserModel : Entity<int>
    {
        public string Login { get; set; }
        public string MemberRole { get; set; }
        public bool Disabled { get; set; }
    }
}
