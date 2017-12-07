using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
namespace WebApplication11
{
    public partial class Site : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            getAspMenuItems();
            foreach (MenuItem i in MenuBar.Items)
            {
                if (i.NavigateUrl.Equals(Request.AppRelativeCurrentExecutionFilePath, StringComparison.InvariantCultureIgnoreCase))
                {
                    i.Selected = true;
                }
            }
        }

        public void getAspMenuItems()
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            SqlDataAdapter da = new SqlDataAdapter("SELECT TOP 10 B_Title FROm BlogTable ORDER BY B_ID DESC", con);
            DataSet ds = new DataSet();
            da.Fill(ds);

            foreach (DataRow row in ds.Tables[0].Rows) //Table[0] will get the first table from the System.Data.DataSet.
            {
                MenuItem item = new MenuItem();
                item.Text = row["B_Title"].ToString();
                item.NavigateUrl = "View Blog Details.aspx?Title=" + Server.UrlEncode(row["B_Title"].ToString()); /*row["NavigateUrl"].ToString()+"?Category="+row["MenuText"].ToString();*/

                Menu2.Items.Add(item);
            }
        }
    }
}