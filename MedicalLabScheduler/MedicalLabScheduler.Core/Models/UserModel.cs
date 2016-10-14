using MedicalLabScheduler.Core.CommonModels;

namespace MedicalLabScheduler.Core.Models
{
    public class UserModel : Entity<int>
    {
        public string Login { get; set; }
        public string Password { get; set; }
        public int MemberRole { get; set; }
        public bool Disabled { get; set; }
    }
}
