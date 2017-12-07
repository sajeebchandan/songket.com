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
    public partial class Edit_Blog : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["New"]!=null)
            {
                LabelMessage.Visible = false;
                if (!IsPostBack)
                {
                    string _title = Request.QueryString["Title"].ToString();

                    FillDataList(Server.UrlDecode(_title)); 
                } 
            }
            else
            {
                string msg = "Please Login to continue";
                Response.Redirect("Login.aspx?Error=" + HttpUtility.UrlEncode(msg));
            }
        }

        private void FillDataList(string title)
        {
            //string _username = Request.QueryString["username"];
            try
            {
                string sqlCommand = "SELECT B_ID, Username, Name, B_Category, B_Title, B_Post, B_Image, B_File, B_FileName, B_Date FROM BlogTable WHERE B_Title = @B_Title";
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
                LabelMessage.Text = ex.Message;
                LabelMessage.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "edit")
            {
                string bTitle = ((Label)DataList1.Items[e.Item.ItemIndex].FindControl("LabelTitleEdit")).Text;
                Response.Redirect("Edit Blog.aspx?Title=" + Server.UrlEncode(bTitle));
                FillDataList(Server.UrlDecode(bTitle));
            }
            else if (e.CommandName == "update")
            {
                string btitle = ((Label)DataList1.Items[e.Item.ItemIndex].FindControl("LabelTitleEdit")).Text;
                //string bid = ((Label)e.Item.FindControl("Label1")).Text;
                //string bTitle = ((Label)DataList1.Items[e.Item.ItemIndex].FindControl("LabelTitle")).Text;
                string updatedbox = ((TextBox)DataList1.Items[e.Item.ItemIndex].FindControl("TextBoxPost")).Text;
                string SQL = "UPDATE BlogTable SET BlogTable.B_Post=@bpost WHERE BlogTable.B_Title=@btitle";
                SqlCommand cmd = new SqlCommand(SQL, con);
                cmd.Parameters.AddWithValue("@bpost", updatedbox);
                cmd.Parameters.AddWithValue("@btitle", btitle);
                con.Open();

                int i = cmd.ExecuteNonQuery();
                if (i > 0)
                {
                    LabelMessage.Visible = true;
                    LabelMessage.Text = "Your Blog has been updated successfully";  
                    con.Close();
                    DataList1.EditItemIndex = e.Item.ItemIndex;
                    FillDataList(Server.UrlDecode(btitle));
                    //Response.Redirect("My Blog.aspx");

                }
                else
                {
                    LabelMessage.Visible = true;
                    LabelMessage.Text = "An error occurred!";
                    con.Close();
                }
            }
            else if (e.CommandName == "cancel")
            {
                DataList1.EditItemIndex = e.Item.ItemIndex;


                string btitle = ((Label)e.Item.FindControl("LabelTitleEdit")).Text;
                FillDataList(Server.UrlDecode(btitle));
            }
        }
    }
}