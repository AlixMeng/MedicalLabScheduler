using MedicalLabScheduler.Core.CommonModels.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MedicalLabScheduler.Core.Models
{
    public class LaboratoryTestPanelModel
    {
        public int PanelCode { get; set; }
        public int SubpanelCode { get; set; }
        public string Description { get; set; }
    }
}
