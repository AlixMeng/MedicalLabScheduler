using MedicalLabScheduler.Core.Models;

namespace MedicalLabScheduler.Core.Services
{
    interface IAuthenticationService
    {
        User AuthenticateUser(string username, string password);
    }
}
