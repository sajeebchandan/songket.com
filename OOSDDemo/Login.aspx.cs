using Controller;
using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OOSDDemo
{
    public partial class Login : System.Web.UI.Page
    {
        Model_User CheckLogin = new Model_User();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string msg = Server.UrlDecode( Request.QueryString["Message"]);
                string error = Server.UrlDecode( Request.QueryString["Error"]);
                if (msg != null)
                {
                    LabelMessage.Text = msg.ToString();
                    LabelMessage.ForeColor = System.Drawing.Color.Blue;
                }
                if (error != null)
                {
                    LabelMessage.Text = error.ToString();
                    LabelMessage.ForeColor = System.Drawing.Color.Red;
                }
            }
        }

        protected void ButtonLogin_Click(object sender, EventArgs e)
        {
            if (ActionController.CheckLogin(TextBoxUsername.Text, TextBoxPassword.Text) == true)
            {
                    System.Threading.Thread.Sleep(2000);
                    Session["New"] = TextBoxUsername.Text;
                    Response.Redirect("Profile.aspx");
            }
            else
            {
                LabelMessage.Text = "username Or Password is wrong!";
                LabelMessage.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}