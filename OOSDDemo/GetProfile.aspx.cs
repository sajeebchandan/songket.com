using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Controller;
using Model;
using System.Configuration;
using System.Data;

namespace OOSDDemo
{
    public partial class GetProfile : System.Web.UI.Page
    {
        Model_User _Users = new Model_User();
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            string _username = Server.UrlDecode(Request.QueryString["username"]);

            string connectionString = "Data Source=.\\SQLEXPRESS; Initial Catalog=TEST; Integrated Security=True";
            string sqlCommand = "SELECT name FROM Users WHERE username = @username";

            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand com = new SqlCommand(sqlCommand, con);

            com.Parameters.AddWithValue("@username", _username);

            con.Open();
            SqlDataReader r = com.ExecuteReader();

            if (r.Read())
            {
                LabelName.Text = r["name"].ToString();
            }
            com.Dispose();
            con.Close();
            FillDataList(_username);
        }


        private void FillDataList(string username)
        {
            //string _username = Request.QueryString["username"];
            string sqlCommand = "SELECT name, username, email, gender, country, dob, photo FROM Users WHERE username = @username";
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter(sqlCommand, con);
            da.SelectCommand.Parameters.Add("@username", SqlDbType.VarChar).Value=username;
            DataSet ds = new DataSet();
            da.Fill(ds);
            DataList1.DataSource = ds;
            DataList1.DataBind();
            con.Close();
        }
    }
}