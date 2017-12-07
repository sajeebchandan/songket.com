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
    public partial class Blogs : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FillDataList();
            }
        }

        private void FillDataList()
        {
            //string _username = Request.QueryString["username"];
            string sqlCommand = "SELECT  BlogTable.B_ID, BlogTable.Username, BlogTable.Name, BlogTable.B_Category, BlogTable.B_Title, BlogTable.B_Post, BlogTable.B_Image, BlogTable.B_File, BlogTable.B_FileName, BlogTable.B_Date, COUNT(DISTINCT BlogComment.C_ID) AS 'Total Comment' FROM BlogTable  INNER JOIN BlogComment ON BlogTable.B_ID=BlogComment.B_Id GROUP BY BlogTable.B_ID, BlogTable.Username, BlogTable.Name, BlogTable.B_Category, BlogTable.B_Title, BlogTable.B_Post, BlogTable.B_Image, BlogTable.B_File, BlogTable.B_FileName, BlogTable.B_Date";
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter(sqlCommand, con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            DataList1.DataSource = ds;
            DataList1.DataBind();
            con.Close();
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "view")
            {
                if (Session["New"] == null)
                {
                    string bTitle = ((LinkButton)DataList1.Items[e.Item.ItemIndex].FindControl("LinkButtonTitle")).Text;
                    Response.Redirect("View Blog Details.aspx?Title=" + Server.UrlEncode(bTitle));
                }
                else if (Session["New"] != null)
                {
                    string bTitle = ((LinkButton)DataList1.Items[e.Item.ItemIndex].FindControl("LinkButtonTitle")).Text;
                    Response.Redirect("View Blog Details.aspx?Title=" + Server.UrlEncode(bTitle));
                }

            }
            else if (e.CommandName == "viewbyimage")
            {
                if (Session["New"] == null)
                {
                    string bTitle = ((LinkButton)DataList1.Items[e.Item.ItemIndex].FindControl("LinkButtonTitle")).Text;
                    Response.Redirect("View Blog Details.aspx?Title=" + Server.UrlEncode(bTitle));
                }
                else if (Session["New"] != null)
                {
                    string bTitle = ((LinkButton)DataList1.Items[e.Item.ItemIndex].FindControl("LinkButtonTitle")).Text;
                    Response.Redirect("View Blog Details.aspx?Title=" + Server.UrlEncode(bTitle));
                }
            }
        }
    }
}