using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace OOSDDemo.Forgotten_Account
{
    public partial class Check_Username : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
        SqlConnection conn;
        SqlCommand cmd;
        int existanceNumber;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string Error = Server.UrlDecode(Request.QueryString["Error"]);
                LabelMessage.Text = Error;
                LabelMessage.ForeColor = System.Drawing.Color.Red;
                ButtonNext.Visible = false;
            }
        }

        protected void ButtonCheck_Click(object sender, EventArgs e)
        {
            try
            {
                System.Threading.Thread.Sleep(2000);
                conn = new SqlConnection(connectionString);
                conn.Open();
                //Response.Write("Connected!");
                string userExistance = "SELECT COUNT (*) FROM Users WHERE username='" + TextBoxCheckUsername.Text + "'";
                cmd = new SqlCommand(userExistance, conn);
                existanceNumber = Convert.ToInt32(cmd.ExecuteScalar().ToString());
                if (existanceNumber == 1)
                {
                    ButtonNext.Visible = true;
                    LabelMessage.Text = "Username Available! Please click on the following button to continur.";
                    LabelMessage.ForeColor = System.Drawing.Color.Blue;
                }
                else
                {
                    LabelMessage.Text = "Invalid Username";
                    LabelMessage.ForeColor = System.Drawing.Color.Red;
                    //Response.Write("");
                }
                conn.Close();
            }
            catch (Exception ex)
            {
                LabelMessage.Text = "Connection can't be opened due to " + ex.Message;
                LabelMessage.ForeColor = System.Drawing.Color.Red;
                Response.Write("");
            }
        }

        protected void ButtonNext_Click(object sender, EventArgs e)
        {
            System.Threading.Thread.Sleep(1000);
            string username = Server.UrlEncode(TextBoxCheckUsername.Text);
            Response.Redirect("Security Answer.aspx?Username=" + username);
        }
    }
}