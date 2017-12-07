using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public abstract class Abstract_Person
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public string Username { get; set; }
        public string Email { get; set; }
        public string Gender { get; set; }
        public string Country { get; set; }
        public string DOB { get; set; }
        public string Password { get; set; }
        public byte[] photo { get; set; }
        public string Squestion { get; set; }
        public string Sanswer { get; set; }
        public string SUsername { get; set; }
    }
}
