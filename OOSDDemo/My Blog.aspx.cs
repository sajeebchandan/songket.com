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
    public partial class My_Blog1 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["New"] != null)
            {
                if (!IsPostBack)
                {
                    FillDataList();
                }
            }
            else
            {
                Response.Redirect("Login.aspx?Error=" + HttpUtility.UrlEncode("Please Login to continue"));
            }
        }

        private void FillDataList()
        {
            //string _username = Request.QueryString["username"];
            string sqlCommand = "SELECT  BlogTable.B_ID, BlogTable.Username, BlogTable.Name, BlogTable.B_Category, BlogTable.B_Title, BlogTable.B_Post, BlogTable.B_Image, BlogTable.B_File, BlogTable.B_FileName, BlogTable.B_Date, COUNT(DISTINCT BlogComment.C_ID) AS 'Total Comment' FROM BlogTable  INNER JOIN BlogComment ON BlogTable.B_ID=BlogComment.B_Id WHERE BlogTable.Username=@username GROUP BY BlogTable.B_ID, BlogTable.Username, BlogTable.Name, BlogTable.B_Category, BlogTable.B_Title, BlogTable.B_Post, BlogTable.B_Image, BlogTable.B_File, BlogTable.B_FileName, BlogTable.B_Date";
            con.Open();
            SqlCommand cmd = new SqlCommand(sqlCommand, con);
            cmd.Parameters.AddWithValue("@username", Session["New"].ToString());
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            DataList1.DataSource = ds;
            DataList1.DataBind();
            con.Close();
        }
        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "edit")
            {
                string bTitle = ((LinkButton)DataList1.Items[e.Item.ItemIndex].FindControl("LinkButtonTitle")).Text;
                Response.Redirect("Edit Blog.aspx?Title=" + Server.UrlEncode(bTitle));
            }
            else if (e.CommandName == "view")
            {
                string bTitle = ((LinkButton)DataList1.Items[e.Item.ItemIndex].FindControl("LinkButtonTitle")).Text;
                Response.Redirect("View Blog Details.aspx?Title=" + Server.UrlEncode(bTitle));
            }
            else if (e.CommandName == "viewblog")
            {
                string bTitle = ((LinkButton)DataList1.Items[e.Item.ItemIndex].FindControl("LinkButtonTitle")).Text;
                Response.Redirect("View Blog Details.aspx?Title=" + Server.UrlEncode(bTitle));
            }
            //else if (e.CommandName == "update")
            //{
            //    string bid = ((Label)e.Item.FindControl("LabelID")).Text;
            //    TextBox TextBoxPost = ((TextBox)e.Item.FindControl("TextBoxPost"));
            //    string SQL = "UPDATE BlogTable SET BlogTable.B_Post=@bpost WHERE BlogTable.B_ID=@BID";
            //    SqlCommand cmd = new SqlCommand(SQL, con);
            //    cmd.Parameters.AddWithValue("@bpost", TextBoxPost.Text.ToString());
            //    cmd.Parameters.AddWithValue("@BID", Convert.ToInt32(bid));
            //    con.Open();

            //    int i = cmd.ExecuteNonQuery();
            //    if (i > 0)
            //    {
            //        LabelMessage.Visible = true;
            //        LabelMessage.Text = "Your Blog has been updated successfully";
            //        DataList1.EditItemIndex = -1;
            //        con.Close();
            //        FillDataList();

            //    }
            //    else
            //    {
            //        LabelMessage.Visible = true;
            //        LabelMessage.Text = "An error occurred!";
            //        con.Close();
            //    }
            //}

        }
    }
}