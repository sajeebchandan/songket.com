using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccessLayer;
using Model;
using Controller;

namespace OOSDDemo
{
    public partial class View_Blog_Details1 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["New"] == null)
                {
                    string bTitle = Request.QueryString["Title"];
                    Response.Redirect("View Blog.aspx?Title=" + Server.UrlEncode(bTitle));
                }

                else if (Session["New"] != null || Session["New"].ToString() != "")
                {
                    string bTitle = Request.QueryString["Title"];
                    BlogBind();
                }
            }
        }


        private void BlogBind()
        {
            string bTitle = Request.QueryString["Title"];
            //string SQL = "";
            //SqlCommand cmd = new SqlCommand(SQL, con);
            //cmd.Parameters.AddWithValue("@B_Title", bTitle);
            SqlDataAdapter da = new SqlDataAdapter("SELECT  BlogTable.B_ID, BlogTable.Username, BlogTable.Name, BlogTable.B_Category, BlogTable.B_Title, BlogTable.B_Post, BlogTable.B_Image, BlogTable.B_File, BlogTable.B_FileName, BlogTable.B_Date, COUNT(BlogComment.C_ID) AS 'Total Comment' FROM BlogTable INNER JOIN BlogComment ON BlogTable.B_ID=BlogComment.B_Id WHERE BlogTable.B_Title=@B_Title GROUP BY BlogTable.B_ID, BlogTable.Username, BlogTable.Name, BlogTable.B_Category, BlogTable.B_Title, BlogTable.B_Post, BlogTable.B_Image, BlogTable.B_File, BlogTable.B_FileName, BlogTable.B_Date", con);
            da.SelectCommand.Parameters.AddWithValue("@B_Title", Server.UrlDecode( bTitle));
            DataSet ds = new DataSet();
            da.Fill(ds);
            GridViewBlog.DataSource = ds;
            GridViewBlog.DataBind();
        }


        protected void ButtonSubmit_Click(object sender, EventArgs e)
        {
            string bTitle = Request.QueryString["Title"];
            System.Threading.Thread.Sleep(750);
            string _name = ActionController.GetName(Session["New"].ToString());
            string _username = Session["New"].ToString();
            GridViewRow row = (sender as Button).NamingContainer as GridViewRow;
            Label b_id = (Label)row.FindControl("lblB_ID");
            TextBox txtComment = (TextBox)row.FindControl("TextBoxComment");

            string SQLinsert = "INSERT INTO BlogComment (Username, Name, comment, c_date, B_Id) VALUES(@username, @name, @comment, @date, @b_id)";
            SqlCommand cmd = new SqlCommand(SQLinsert, con);
            cmd.Parameters.AddWithValue("@username", _username.ToString());
            cmd.Parameters.AddWithValue("@name", _name);
            cmd.Parameters.AddWithValue("@comment", txtComment.Text);
            cmd.Parameters.AddWithValue("@date", DateTime.Now);
            cmd.Parameters.AddWithValue("@b_id", b_id.Text);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            BlogBind();
            txtComment.Text = "";
        }

        protected void GridViewBlog_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            foreach (GridViewRow row in GridViewBlog.Rows)
            {
                Label lblB_ID = (Label)row.FindControl("lblB_ID");
                GridView GridChild = (GridView)row.FindControl("GridViewChild");
                string sqlcommand = "SELECT * FROM BlogComment WHERE B_Id=@bid ORDER BY C_ID DESC";
                SqlCommand cmd = new SqlCommand(sqlcommand, con);
                //cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@bid", lblB_ID.Text);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet dschild = new DataSet();
                da.Fill(dschild);
                if (dschild.Tables[0].Rows.Count > 0)
                {
                    GridChild.DataSource = dschild;
                    GridChild.DataBind();
                }
                else
                {
                    GridChild.DataSource = null;
                    GridChild.DataBind();
                }
            }
        }

        protected void ButtonReply_Click(object sender, EventArgs e)
        {
            string bTitle = Request["Title"];
            System.Threading.Thread.Sleep(750);
            string _name = ActionController.GetName(Session["New"].ToString());
            string _username = Session["New"].ToString();
            GridViewRow row = (sender as Button).NamingContainer as GridViewRow;
            Label c_id = (Label)row.FindControl("lblC_ID");
            TextBox txtReply = (TextBox)row.FindControl("TextBoxReply");

            string SQLinsert = "INSERT INTO BlogCommentReply (Username, Name, reply, r_date, C_Id) VALUES(@username, @name, @reply, @date, @c_id)";
            SqlCommand cmd = new SqlCommand(SQLinsert, con);
            cmd.Parameters.AddWithValue("@username", _username.ToString());
            cmd.Parameters.AddWithValue("@name", _name);
            cmd.Parameters.AddWithValue("@reply", txtReply.Text);
            cmd.Parameters.AddWithValue("@date", DateTime.Now);
            cmd.Parameters.AddWithValue("@c_id", c_id.Text);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            BlogBind();
            txtReply.Text = "";
        }

        protected void LinkButtonComment_Click(object sender, EventArgs e)
        {
            GridViewRow row = (sender as Button).NamingContainer as GridViewRow;
            Label LabelComment = (Label)row.FindControl("lblComment");
            LabelComment.Focus();
        }

        //protected void GridViewChild_RowDataBound(object sender, GridViewRowEventArgs e)
        //{

        //    GridViewRow row = (sender as Button).NamingContainer as GridViewRow;
        //    GridView GridChild = (GridView)row.FindControl("GridViewChild");

        //    foreach (GridViewRow rowChild in GridChild.Rows)
        //    {
        //        Label lblC_ID = (Label)rowChild.FindControl("lblC_ID");
        //        GridView GridReply = (GridView)rowChild.FindControl("GridViewReply");
        //        string sqlcommand = "SELECT * FROM BlogCommentReply WHERE C_Id=@cid ORDER BY R_ID DESC";
        //        SqlCommand cmd = new SqlCommand(sqlcommand, con);
        //        //cmd.CommandType = CommandType.StoredProcedure;
        //        cmd.Parameters.AddWithValue("@cid", lblC_ID.Text);
        //        SqlDataAdapter da = new SqlDataAdapter(cmd);
        //        DataSet dschild = new DataSet();
        //        da.Fill(dschild);
        //        if (dschild.Tables[0].Rows.Count > 0)
        //        {
        //            GridReply.DataSource = dschild;
        //            GridReply.DataBind();
        //        }
        //        else
        //        {
        //            GridReply.DataSource = null;
        //            GridReply.DataBind();
        //        }
        //    }
        //}

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