using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Model;
using Controller;
using System.Text;

namespace OOSDDemo
{
    public partial class Anonymous_Message : System.Web.UI.Page
    {
        Model_Message message = new Model_Message();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Request.QueryString != null)
                {
                    HyperLinkName.Visible = false;
                    string username = Decrypt(HttpUtility.UrlDecode(Request.QueryString["Username"]));
                    Image1.ImageUrl = "data:Image/jpg;base64," + ActionController.GetImage(username);
                }
                else if (Request.QueryString == null)
                {
                    HyperLinkName.Visible = false;
                    LabelMessage.Text = "No Username Found";
                    LabelMessage.ForeColor = System.Drawing.Color.Red;
                }
            }
            catch (Exception ex)
            {
                HyperLinkName.Visible = false;
                LabelMessage.Text = "Username not found";
                LabelMessage.ForeColor = System.Drawing.Color.Red;
            }
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

        protected void ButtonSend_Click(object sender, EventArgs e)
        {
            System.Threading.Thread.Sleep(2000);
            message.Username = Decrypt(HttpUtility.UrlDecode(Request.QueryString["Username"]));
            message.Message = TextBoxAmessage.Text;
            message.Senttime = DateTime.Now.ToString();
            message.Sender = TextBoxAname.Text;

            if (ActionController.SendMessage(message) >= 0)
            {
                LabelMessage.Text = "Message Sent to ";
                HyperLinkName.Visible = true;
                HyperLinkName.Text = ActionController.GetName(Decrypt(HttpUtility.UrlDecode(Request.QueryString["Username"])));
                HyperLinkName.NavigateUrl = "~/GetProfile.aspx?username=" + Decrypt(HttpUtility.UrlDecode(Request.QueryString["Username"]));
                TextBoxAmessage.Text = string.Empty;
                TextBoxAname.Text = string.Empty;
                LabelMessage.ForeColor = System.Drawing.Color.Blue;
            }
        }
    }
}