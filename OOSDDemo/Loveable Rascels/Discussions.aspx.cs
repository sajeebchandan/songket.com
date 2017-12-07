using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using DataAccessLayer;
using Controller;
using Model;

namespace OOSDDemo
{
    public partial class Users : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            //ScriptManager.RegisterClientScriptBlock(this, GetType(), "closeReplyWrap", "closeReplyWrap(this);", true);
            if (Session["New"] != null && !IsPostBack)
            {
                if (Session["New"].ToString() != "")
                {
                    AnswerBind();
                    
                }
                else
                {
                    Response.Redirect("Login.aspx?Error=Please Login to Continue");
                }
            }
            else if (Session["New"] == null)
            {
                Response.Redirect("Login.aspx?Error=Please Login to Continue");
            }
        }
        private void AnswerBind()
        {
            SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM QuestionTable ORDER BY Q_ID DESC", con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            GridViewQuestion.DataSource = ds;
            GridViewQuestion.DataBind();
        }

        protected void btnCommentPublish_Click(object sender, EventArgs e)
        {
            System.Threading.Thread.Sleep(1000);
            string _name= ActionController.GetName(Session["New"].ToString());
            SqlCommand cmd = new SqlCommand("INSERT INTO QuestionTable(Username, Name, question, q_date) VALUES (@username, @name, @question, @date)", con);
            //cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Username", Session["New"].ToString());
            cmd.Parameters.AddWithValue("@name", _name);
            cmd.Parameters.AddWithValue("@question", txtQuestion.Text);
            cmd.Parameters.AddWithValue("@date", DateTime.Now);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            AnswerBind();
            txtQuestion.Text = string.Empty;
            GridViewQuestion.Focus();
            //txtQuestion_HtmlEditorExtender = string.Empty;
        }

        protected void ButtonSubmit_Click(object sender, EventArgs e)
        {
            System.Threading.Thread.Sleep(1000);
            string _name = ActionController.GetName(Session["New"].ToString());
            string _username = Session["New"].ToString();
            GridViewRow row = (sender as Button).NamingContainer as GridViewRow;
            Label q_id = (Label)row.FindControl("lblQ_ID");
            TextBox txtAnswer = (TextBox)row.FindControl("TextBoxAnswer");

            string SQLinsert = "INSERT INTO AnswerTable (Username, Name, answer, a_date, Q_Id) VALUES(@username, @name, @answer, @date, @q_id)";
            SqlCommand cmd = new SqlCommand(SQLinsert, con);
            cmd.Parameters.AddWithValue("@username", _username.ToString());
            cmd.Parameters.AddWithValue("@name", _name);
            cmd.Parameters.AddWithValue("@answer", txtAnswer.Text);
            cmd.Parameters.AddWithValue("@date", DateTime.Now);
            cmd.Parameters.AddWithValue("@q_id", q_id.Text);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            AnswerBind();
        }

        protected void GridViewQuestion_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            foreach (GridViewRow row in GridViewQuestion.Rows)
            {
                Label lblQ_ID = (Label)row.FindControl("lblQ_ID");
                GridView GridChild = (GridView)row.FindControl("GridViewChild");
                string sqlcommand = "SELECT * FROM AnswerTable WHERE Q_Id=@qid ORDER BY A_ID DESC";
                SqlCommand cmd = new SqlCommand(sqlcommand, con);
                //cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@qid", lblQ_ID.Text);
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
    }
}