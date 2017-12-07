using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Threading;

namespace OOSDDemo
{
    public partial class Services : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ImageButtonImagepp_Click(object sender, ImageClickEventArgs e)
        {
            Thread.Sleep(2000);
            Response.Redirect("ImagePlusPlus.aspx");
        }

        protected void ImageButtonStandardCalculator_Click(object sender, ImageClickEventArgs e)
        {
            Thread.Sleep(2000);
            Response.Redirect("Standard Calculator.aspx");
        }

        protected void ImageButtonScientificCalculator_Click(object sender, ImageClickEventArgs e)
        {
            Thread.Sleep(2000);
            Response.Redirect("Scientific Calculator.aspx");
        }
    }
}