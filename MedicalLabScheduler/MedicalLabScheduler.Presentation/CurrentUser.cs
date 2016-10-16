using MedicalLabScheduler.Core.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MedicalLabScheduler.Presentation
{
    class CurrentUser
    {
        private static UserModel _currentUser;

        public static void Initialize(UserModel user)
        {
            if (_currentUser != null)
            {
                throw new InvalidOperationException("Current user has already been specified");
            }
            _currentUser = user;
        }

        public static int Id => _currentUser.Id;

        public static string Login => _currentUser.Login;

        public static string MemberRole => _currentUser.MemberRole;

        public static bool Loaded { get { return _currentUser == null; } }
    }
}
