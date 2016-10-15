using MedicalLabScheduler.Core.Models;

namespace MedicalLabScheduler.Presentation.Services
{
    public interface IAuthenticationService
    {
        User AuthenticateUser(string username, string password);
    }
}
