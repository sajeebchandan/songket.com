using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Model;
using Controller;
using System.Security.Cryptography;
using System.Text;
using System.IO;
using System.Drawing;

namespace OOSDDemo
{
    public partial class Check_Recipient : System.Web.UI.Page
    {
        Model_User user = new Model_User();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonCheck_Click(object sender, EventArgs e)
        {
            System.Threading.Thread.Sleep(2000);
            user.Username = TextBoxCheckUsername.Text;
            if (ActionController.UserAvailability(user.Username) > 0)
            {
                Response.Redirect("~/Anonymous Message/Anonymous Message.aspx?Username=" + HttpUtility.UrlEncode(Encrypt(user.Username)));
            }
            else
            {
                LabelMessage.Text = "User " + user.Username + " doesn't exists";
                LabelMessage.ForeColor = Color.Red;
            }
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
    }
}