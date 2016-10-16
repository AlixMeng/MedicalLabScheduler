using MedicalLabScheduler.Core.CommonModels.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MedicalLabScheduler.Core.Models
{
    public class LaboratoryAppoinmentModel : Entity<int>
    {
        public int PatientCode { get; set; }
        public int LaboratoryCode { get; set; }
        public int TestCode{ get; set; }
        public DateTime DateTime { get; set; }
        public string Notes { get; set; }
    }
}
