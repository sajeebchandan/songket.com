using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace OOSDDemo
{
    public partial class Anonymous_Inbox : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["New"] != null)
            {
                if (!IsPostBack)
                {
                    FillDataList(Session["New"].ToString());
                }
            }
            else
            {
                string msg = "Please Login to continue";
                Response.Redirect("Login.aspx?Error=" + HttpUtility.UrlEncode(msg));
            }
        }


        private void FillDataList(string username)
        {
            string SQL = "SELECT ID, Username, textmessage, senttime, sender FROM inbox WHERE Username=@username ORDER BY ID DESC";
            SqlDataAdapter da = new SqlDataAdapter(SQL, con);
            da.SelectCommand.Parameters.Add("@username", SqlDbType.VarChar).Value = username;
            DataSet ds = new DataSet();
            da.Fill(ds);
            DataList1.DataSource = ds;
            DataList1.DataBind();
        }
    }
}