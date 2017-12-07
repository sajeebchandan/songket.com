using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OOSDDemo
{
    public partial class Check_Recipient : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonCheck_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Anonymous Message/Anonymous Message.aspx");
        }
    }
}