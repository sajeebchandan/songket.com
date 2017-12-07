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
    public partial class Reset_Password : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] == null || Session["SecurityAnswer"] == null)
            {
                string Error = Server.UrlEncode("Check your username first");
                Response.Redirect("Check Username.aspx?Error=" + Error);
            }
        }

        protected void ButtonResetPassword_Click(object sender, EventArgs e)
        {
            System.Threading.Thread.Sleep(2000);
            string connectionString = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            SqlConnection conn;
            SqlCommand cmd;
            string HashedNewPassword = SampleHash.SampleHash.ComputeHash(TextBoxConfirmNewPassword.Text, "SHA256", null);
            conn = new SqlConnection(connectionString);
            string sqlCHANGEPASSWORD = "UPDATE Register SET pass=@pass WHERE username=@username";

            conn.Open();
            cmd = new SqlCommand(sqlCHANGEPASSWORD, conn);
            cmd.Parameters.AddWithValue("@pass", HashedNewPassword);
            cmd.Parameters.AddWithValue("@username", Session["Username"]);
            cmd.ExecuteNonQuery();
            Session["New"] = null;
            Session["Username"] = null;
            Session["SecurityAnswer"] = null;
            Session.Abandon();
            Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetNoStore();
            Response.Redirect("~/Login.aspx?Message="+ Server.UrlEncode( "Password Successfully changed. Please login to continue."));
        }
    }
}