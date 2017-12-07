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
    }
}