using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Controller;

namespace OOSDDemo
{
    public partial class QD : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["New"] != null)
                {
                    string Q = Decrypt(HttpUtility.UrlDecode(Request.QueryString["Q"]));
                    QuestionBind();
                }
                else
                {
                    Response.Redirect("Login.aspx?Error="+ Server.UrlEncode("Please Login to Continue"));
                }
            }
        }



        private void QuestionBind()
        {
            string Q = Decrypt(HttpUtility.UrlDecode(Request.QueryString["Q"]));
            SqlDataAdapter da = new SqlDataAdapter("SELECT QuestionTable.Q_ID, QuestionTable.Username, QuestionTable.Name, QuestionTable.question, QuestionTable.q_date, COUNT(AnswerTable.A_ID) AS 'Total Answer' FROM QuestionTable  INNER JOIN AnswerTable ON QuestionTable.Q_ID = AnswerTable.Q_Id WHERE QuestionTable.Q_ID=@Q_ID GROUP BY QuestionTable.Q_ID, QuestionTable.Username, QuestionTable.Name, QuestionTable.question, QuestionTable.q_date ORDER BY QuestionTable.Q_ID DESC", con);
            da.SelectCommand.Parameters.AddWithValue("@Q_ID",Convert.ToInt32(Q));
            DataSet ds = new DataSet();
            da.Fill(ds);
            GridViewQuestion.DataSource = ds;
            GridViewQuestion.DataBind();
        }

        private void AnswerBind()
        {
            //SELECT QuestionTable.Q_ID, QuestionTable.Username, QuestionTable.Name, QuestionTable.question, QuestionTable.q_date, COUNT(AnswerTable.A_ID) AS 'Total Answer' FROM QuestionTable  INNER JOIN AnswerTable ON QuestionTable.Q_ID = AnswerTable.Q_Id GROUP BY QuestionTable.Q_ID, QuestionTable.Username, QuestionTable.Name, QuestionTable.question, QuestionTable.q_date ORDER BY QuestionTable.Q_ID DESC
            SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM QuestionTable ORDER BY Q_ID DESC", con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            GridViewQuestion.DataSource = ds;
            GridViewQuestion.DataBind();
        }
        private string Decrypt(string cipherText)
        {
            string EncryptionKey = "MAKV2SPBNI99212";
            cipherText = cipherText.Replace(" ", "+");
            byte[] cipherBytes = Convert.FromBase64String(cipherText);
            using (Aes encryptor = Aes.Create())
            {
                Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
                encryptor.Key = pdb.GetBytes(32);
                encryptor.IV = pdb.GetBytes(16);
                using (MemoryStream ms = new MemoryStream())
                {
                    using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateDecryptor(), CryptoStreamMode.Write))
                    {
                        cs.Write(cipherBytes, 0, cipherBytes.Length);
                        cs.Close();
                    }
                    cipherText = Encoding.Unicode.GetString(ms.ToArray());
                }
            }
            return cipherText;
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
            QuestionBind();
        }

        protected void GridViewQuestion_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            foreach (GridViewRow row in GridViewQuestion.Rows)
            {
                Label lblQ_ID = (Label)row.FindControl("lblQ_ID");
                GridView GridChild = (GridView)row.FindControl("GridViewChild");
                //SELECT AnswerTable.A_ID, AnswerTable.Username, AnswerTable.Name, AnswerTable.answer, AnswerTable.a_date, COUNT(AnswerTableReply.R_ID) AS 'Total Reply' FROM AnswerTable  INNER JOIN AnswerTableReply ON AnswerTable.A_ID = AnswerTableReply.A_Id WHERE AnswerTable.A_ID = 16 GROUP BY AnswerTable.A_ID, AnswerTable.Username, AnswerTable.Name, AnswerTable.answer, AnswerTable.a_date ORDER BY AnswerTable.A_ID DESC
                string sqlcommand = "SELECT * FROM AnswerTable WHERE Q_Id=@qid ORDER BY A_ID DESC";
                SqlCommand cmd = new SqlCommand(sqlcommand, con);
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

        protected void ButtonReply_Click(object sender, EventArgs e)
        {
            string bTitle = Request["Title"];
            System.Threading.Thread.Sleep(750);
            string _name = ActionController.GetName(Session["New"].ToString());
            string _username = Session["New"].ToString();
            GridViewRow row = (sender as Button).NamingContainer as GridViewRow;
            Label a_id = (Label)row.FindControl("lblA_ID");
            TextBox txtReply = (TextBox)row.FindControl("TextBoxReply");

            string SQLinsert = "INSERT INTO AnswerTableReply (Username, Name, reply, r_date, A_Id) VALUES(@username, @name, @reply, @date, @a_id)";
            SqlCommand cmd = new SqlCommand(SQLinsert, con);
            cmd.Parameters.AddWithValue("@username", _username.ToString());
            cmd.Parameters.AddWithValue("@name", _name);
            cmd.Parameters.AddWithValue("@reply", txtReply.Text);
            cmd.Parameters.AddWithValue("@date", DateTime.Now);
            cmd.Parameters.AddWithValue("@a_id", a_id.Text);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            QuestionBind();
            txtReply.Text = "";
        }

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
    }
}