using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OOSDDemo
{
    public partial class View_Blog1 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            LabelMessage.Visible = false;
            string _title = Request.QueryString["Title"].ToString();

            FillDataList(Server.UrlDecode(_title));
        }

        private void FillDataList(string title)
        {
            //string _username = Request.QueryString["username"];
            try
            {
                string sqlCommand = "SELECT Username, Name, B_Category, B_Title, B_Post, B_Image, B_File, B_FileName, B_Date FROM BlogTable WHERE B_Title = @B_Title";
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter(sqlCommand, con);
                da.SelectCommand.Parameters.Add("@B_Title", SqlDbType.NVarChar).Value = title;
                DataSet ds = new DataSet();
                da.Fill(ds);
                DataList1.DataSource = ds;
                DataList1.DataBind();
                con.Close();
            }
            catch (Exception ex)
            {
                LabelMessage.Visible = true;
                LabelMessage.Text = "No Blog is selected to view";
                LabelMessage.ForeColor = System.Drawing.Color.Red;
            }
        }

        public string GetImageStringBase64(string _username)
        {
            //string _username = Server.UrlDecode(Request.QueryString["username"]);

            string connectionString = "Data Source=.; Initial Catalog=TEST; Integrated Security=True";
            string sqlCommand = "SELECT photo FROM Users WHERE username = @username";

            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand com = new SqlCommand(sqlCommand, con);

            com.Parameters.AddWithValue("@username", _username);

            con.Open();
            SqlDataReader r = com.ExecuteReader();

            if (r.Read())
            {
                byte[] imgData = (byte[])r["photo"];
                string strBase64 = Convert.ToBase64String(imgData);
                //Image1.ImageUrl = "data:Image/jpg;base64," + strBase64;
                //Response.BinaryWrite(imgData);
                return strBase64;
            }
            else
            {
                con.Close();
                return "";
            }
        }

        public string GetBlogImageString64(string _BlogTitle)
        {

            string connectionString = "Data Source=.; Initial Catalog=TEST; Integrated Security=True";
            string sqlCommand = "SELECT B_Image FROM BlogTable WHERE B_Title = @B_Title";

            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand com = new SqlCommand(sqlCommand, con);

            com.Parameters.AddWithValue("@B_Title", Server.UrlDecode(_BlogTitle));

            con.Open();
            SqlDataReader r = com.ExecuteReader();

            if (r.Read())
            {
                byte[] imgData = (byte[])r["B_Image"];
                string strBase64 = Convert.ToBase64String(imgData);
                return strBase64;
            }
            else
            {
                con.Close();
                return "";
            }
        }
    }
}