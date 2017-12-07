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
    public partial class Security_Answer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string username = Server.UrlDecode(Request.QueryString["Username"]);
            if (username != null)
            {
                LabelMessage.Visible = false;
            }
            else
            {
                string Error = Server.UrlEncode("Check your username first");
                Response.Redirect("Check Username.aspx?Error="+Error);
            }

        }

        protected void ButtonSubmit_Click(object sender, EventArgs e)
        {
            System.Threading.Thread.Sleep(2000);
            string connectionString = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            string username = Server.UrlDecode(Request.QueryString["Username"]);
            SqlConnection conn;
            SqlCommand cmd;
            SqlDataReader dataReader;
            string sqlSucker = "SELECT securityquestion, securityanswer FROM Users WHERE username=@username";
            string suckedQuestion = string.Empty;
            string suckedHashedAnswer = string.Empty;
            conn = new SqlConnection(connectionString);
            try
            {
                conn.Open();
                cmd = new SqlCommand(sqlSucker, conn);
                cmd.Parameters.AddWithValue("@username", username);
                dataReader = cmd.ExecuteReader();

                while (dataReader.Read())
                {
                    suckedQuestion = dataReader.GetValue(0).ToString();
                    suckedHashedAnswer = dataReader.GetValue(1).ToString();
                }
            }
            catch (Exception ex)
            {
                LabelMessage.Text = ex.Message;
            }
            finally
            {
                conn.Close();
            }
            if (suckedQuestion == DropDownListSecurityQuestion.SelectedItem.Text && SampleHash.SampleHash.VerifyHash(TextBoxSecurityQuestion.Text, "SHA256", suckedHashedAnswer.ToString()))
            {
                Session["Username"] = Server.UrlDecode(Request.QueryString["Username"]);
                Session["SecurityAnswer"] = "Passed";
                Response.Redirect("Reset Password.aspx");
            }
            else
            {
                LabelMessage.Visible = true;
                LabelMessage.Text = "Invalid security question or answer!";
                LabelMessage.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}