using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OOSDDemo
{
    public partial class GetImage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string _username =Server.UrlDecode(Request.QueryString["username"]);

            string connectionString = "Data Source=.; Initial Catalog=TEST; Integrated Security=True";
            string sqlCommand = "SELECT photo FROM Users WHERE username = @username";

            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand com = new SqlCommand(sqlCommand, con);

            com.Parameters.AddWithValue("@username", _username);

            con.Open();
            SqlDataReader r = com.ExecuteReader();

            if (r.Read())
            {
                byte[] imgData= (byte[])r["photo"];
                string strBase64 = Convert.ToBase64String(imgData);
                Image1.ImageUrl = "data:Image/jpg;base64," + strBase64;
                Response.BinaryWrite(imgData);
            }
            con.Close();
        }
    }
}