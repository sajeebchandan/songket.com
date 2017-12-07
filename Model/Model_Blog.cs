using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class Model_Blog
    {
        public int B_ID { get; set; }
        public string B_Cat { get; set; }
        public string B_Title { get; set; }
        public string B_Post { get; set; }
        public byte[] B_Image { get; set; }
        public string B_File { get; set; }
        public string B_FileName { get; set; }
        public string B_Date { get; set; }
    }
}
