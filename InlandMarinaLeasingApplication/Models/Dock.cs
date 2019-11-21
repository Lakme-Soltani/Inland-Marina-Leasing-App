using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace InlandMarinaDB
{
    public class Dock
    {
        public int id { get; set; }
        public string name { get; set; }
        public bool waterService;
        public bool electricalService;
        public List<Slip> slips { get; set; }

        public Dock(int id, string name, bool waterService, bool electricalService, List<Slip> slips)
        {
            this.id = id;
            this.name = name;
            this.waterService = waterService;
            this.electricalService = electricalService;
            this.slips = slips;
        }

    }
}