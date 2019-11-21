using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace InlandMarinaDB
{
    public class Slip
    {
        public int id { get; set; }
        public int width { get; set; }
        public int length { get; set; }

        public Slip(int id, int width, int length)
        {
            this.id = id;
            this.width = width;
            this.length = length;
        }


    }
}