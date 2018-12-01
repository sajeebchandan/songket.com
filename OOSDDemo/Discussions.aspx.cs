using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Controller;
using System.Configuration;
using System.Data;
using System.Security.Cryptography;
using System.IO;
using System.Text;

namespace OOSDDemo
{
    public partial class Q : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["New"] != null && !IsPostBack)
            {
                if (Session["New"].ToString() != "")
                {
                    QuestionBind();

                }
                else
                {
                    Response.Redirect("Login.aspx?Error="+Server.UrlEncode("Please Login to Continue"));
                }
            }
            else if (Session["New"] == null)
            {
                Response.Redirect("Login.aspx?Error=" + Server.UrlEncode("Please Login to Continue"));
            }
        }

        protected void btnQuestionPublish_Click(object sender, EventArgs e)
        {
            System.Threading.Thread.Sleep(1500);
            string _name = ActionController.GetName(Session["New"].ToString());
            SqlCommand cmd = new SqlCommand("INSERT INTO QuestionTable(Username, Name, question, q_date) VALUES (@username, @name, @question, @date)", con);
            cmd.Parameters.AddWithValue("@Username", Session["New"].ToString());
            cmd.Parameters.AddWithValue("@name", _name);
            cmd.Parameters.AddWithValue("@question", txtQuestion.Text);
            cmd.Parameters.AddWithValue("@date", DateTime.Now);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            QuestionBind();
            txtQuestion.Text = string.Empty;
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "reply")
            {
                string q_hold = ((Label)DataList1.Items[e.Item.ItemIndex].FindControl("lblQ_ID")).Text;
                string q = HttpUtility.UrlEncode(Encrypt(q_hold.Trim()));
                Response.Redirect("Discussion Details.aspx?Q=" + q);
            }
        }

        private void QuestionBind()
        {
            string sqlCommand = "SELECT  QuestionTable.Q_ID, QuestionTable.Username, QuestionTable.Name, QuestionTable.question, QuestionTable.q_date, COUNT( AnswerTable.A_ID) AS 'Total Answer' FROM QuestionTable  INNER JOIN AnswerTable ON QuestionTable.Q_ID=AnswerTable.Q_Id GROUP BY QuestionTable.Q_ID, QuestionTable.Username, QuestionTable.Name, QuestionTable.question, QuestionTable.q_date ORDER BY QuestionTable.Q_ID DESC";
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter(sqlCommand, con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            DataList1.DataSource = ds;
            DataList1.DataBind();
            con.Close();
        }

        private string Encrypt(string clearText)
        {
            string EncryptionKey = "MAKV2SPBNI99212";
            byte[] clearBytes = Encoding.Unicode.GetBytes(clearText);
            using (Aes encryptor = Aes.Create())
            {
                Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
                encryptor.Key = pdb.GetBytes(32);
                encryptor.IV = pdb.GetBytes(16);
                using (MemoryStream ms = new MemoryStream())
                {
                    using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateEncryptor(), CryptoStreamMode.Write))
                    {
                        cs.Write(clearBytes, 0, clearBytes.Length);
                        cs.Close();
                    }
                    clearText = Convert.ToBase64String(ms.ToArray());
                }
            }
            return clearText;
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

        public string GetImageStringBase64(string _username)
        {
            //string _username = Server.UrlDecode(Request.QueryString["username"]);

            string connectionString = "Data Source=.\\SQLEXPRESS; Initial Catalog=TEST; Integrated Security=True";
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