using MedicalLabScheduler.Core.CommonModels;

namespace MedicalLabScheduler.Core.Models
{
    public class User : Entity<int>
    {
        public string Login { get; private set; }
        public int MemberRole { get; private set; }
        public bool Disabled { get; private set; }
    }
}
