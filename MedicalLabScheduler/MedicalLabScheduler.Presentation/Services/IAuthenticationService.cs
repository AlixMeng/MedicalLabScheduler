using MedicalLabScheduler.Core.Models;

namespace MedicalLabScheduler.Presentation.Services
{
    public interface IAuthenticationService
    {
        UserResultModel AuthenticateUser(string username, string password);
    }
}
