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
        private static User currentUser;

        public static void Initialize(User user)
        {
            if (currentUser != null)
            {
                throw new InvalidOperationException("Current user has already been specified");
            }
            currentUser = user;
        }

        public static int Id => currentUser.Id;

        public static string Login => currentUser.Login;

        public static int MemberRole => currentUser.MemberRole;
    }
}
