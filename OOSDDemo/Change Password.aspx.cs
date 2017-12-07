using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace OOSDDemo
{
    public partial class Change_Password : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
        SqlConnection conn;
        SqlCommand cmd;
        SqlDataReader dataReader;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["New"] == null)
            {
                Session.Abandon();
                Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
                Response.Cache.SetCacheability(HttpCacheability.NoCache);
                Response.Cache.SetNoStore();
                Response.Redirect("Login.aspx?Error="+ Server.UrlEncode("Please Login to continue"));
            }
            if (!IsPostBack)
            {
                LabelMessage.Visible = false;

            }
        }

        protected void ButtonChangePassword_Click(object sender, EventArgs e)
        {
            if (Session["New"] != null)
            {
                string sqlPasswordSucker = "SELECT pass FROM Users WHERE username=@username";
                conn = new SqlConnection(connectionString);
                string suckedHashedPassword = string.Empty;
                try
                {
                    conn.Open();
                    cmd = new SqlCommand(sqlPasswordSucker, conn);
                    cmd.Parameters.AddWithValue("@username", Session["New"].ToString());
                    dataReader = cmd.ExecuteReader();

                    while (dataReader.Read())
                    {
                        suckedHashedPassword = dataReader.GetValue(0).ToString();
                    }
                }
                catch (Exception ex)
                {

                }
                finally
                {
                    conn.Close();
                    cmd.Dispose();
                }

                if (SampleHash.SampleHash.VerifyHash(TextBoxConfirmNewPassword.Text, "SHA256", suckedHashedPassword.ToString()))
                {
                    LabelMessage.Visible = true;
                    LabelMessage.Text = "This is your old password.\nPlease enter a new password";
                    LabelMessage.ForeColor = System.Drawing.Color.Red;
                }
                else if (SampleHash.SampleHash.VerifyHash(TextBoxConfirmNewPassword.Text, "SHA256", suckedHashedPassword.ToString()) == false && SampleHash.SampleHash.VerifyHash(TextBoxCurrentPassword.Text, "SHA256", suckedHashedPassword.ToString()) == true)
                {
                    string HashedNewPassword = SampleHash.SampleHash.ComputeHash(TextBoxConfirmNewPassword.Text, "SHA256", null);
                    conn = new SqlConnection(connectionString);
                    string sqlCHANGEPASSWORD = "UPDATE Users SET pass=@pass WHERE username=@username";
                    try
                    {
                        conn.Open();
                        cmd = new SqlCommand(sqlCHANGEPASSWORD, conn);
                        cmd.Parameters.AddWithValue("@pass", HashedNewPassword);
                        cmd.Parameters.AddWithValue("@username", Session["New"].ToString());
                        cmd.ExecuteNonQuery();
                        //Response.Write("Password Successfully changed!\nPlease login to continue!");
                        Session["New"] = null;
                        Session.Abandon();
                        Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
                        Response.Cache.SetCacheability(HttpCacheability.NoCache);
                        Response.Cache.SetNoStore();
                        Response.Redirect("Login.aspx?Message=" + Server.UrlEncode("Password Successfully changed\nPlease login to continue"));
                    }
                    catch (Exception ex)
                    {
                        Response.Write("Can't change password due to " + ex.Message);
                    }
                    finally
                    {
                        conn.Close();
                    }
                }
                else
                {
                    LabelMessage.Text = "Current Password is not matched!";
                    Session.Abandon();
                    Session["New"] = null;
                    Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
                    Response.Cache.SetCacheability(HttpCacheability.NoCache);
                    Response.Cache.SetNoStore();
                    Response.Redirect("Login.aspx?Error="+ Server.UrlEncode("You have tries a wrong password.\nPlease login to change your password"));
                }
            }
            else
            {
                Session.Abandon();
                Session["New"] = null;
                Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
                Response.Cache.SetCacheability(HttpCacheability.NoCache);
                Response.Cache.SetNoStore();
                Response.Redirect("Login.aspx?Error=" + Server.UrlEncode("Please Login to continue"));
            }
        }
    }
}