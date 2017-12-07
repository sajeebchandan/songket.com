using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace OOSDDemo
{
    public partial class GetBlogImage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string _BlogTitle = Request.QueryString["B_Title"];

            string connectionString = "Data Source=.; Initial Catalog=TEST; Integrated Security=True";
            string sqlCommand = "SELECT B_Image FROM BlogTable WHERE B_Title = @B_Title";

            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand com = new SqlCommand(sqlCommand, con);

            com.Parameters.AddWithValue("@B_Title", Server.UrlDecode( _BlogTitle));

            con.Open();
            SqlDataReader r = com.ExecuteReader();

            if (r.Read())
            {
                byte[] imgData = (byte[])r["B_Image"];
                string strBase64 = Convert.ToBase64String(imgData);
                //Image1.ImageUrl = "data:Image/jpg;base64," + strBase64;
                Response.BinaryWrite(imgData);
            }
            con.Close();
        }
    }
}