using Controller;
using DataAccessLayer;
using Model;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OOSDDemo
{
    public partial class Register : System.Web.UI.Page
    {
        Model_User register = new Model_User();
        protected void Page_Load(object sender, EventArgs e)
        {
            #region USer Availability Checker
            if (IsPostBack)
            {
                
                    if (ActionController.UserAvailability(TextBoxUsername.Text) == 1)
                    {
                        LabelUsername.Visible = true;
                        LabelUsername.Text = "User Already Exists";
                        LabelUsername.ForeColor = Color.Red;
                    }
                    else
                    {
                        LabelUsername.Visible = true;
                        LabelUsername.Text = "username Available";
                        LabelUsername.ForeColor = Color.Green;
                        TextBoxEmail.Focus();
                    }
               
            }
            #endregion


            #region Captcha Loader
            string text = (Guid.NewGuid().ToString()).Substring(0, 5);
            Response.Cookies["Captcha"]["value"] = text;
            ImageCaptcha.ImageUrl = "Captcha.aspx?" + DateTime.Now.Ticks.ToString();
            LabelCaptcha.Visible = false;
            #endregion

            #region Hide upon Initial GET request
            if (!IsPostBack)
            {
                LabelCaptcha.Visible = false;
                LabelUsername.Visible = false;
                LabelMessage.Visible = false;
            }
            #endregion
        }

        protected void ButtonRegister_Click(object sender, EventArgs e)
        {
            #region Set values in Model Class(User_Model)
            #region Image File Processor
            HttpPostedFile postedFile = FileUpload1.PostedFile;
            string fileName = Path.GetFileName(postedFile.FileName);
            string fileExtension = Path.GetExtension(fileName);
            int fileSize = FileUpload1.PostedFile.ContentLength;
            #endregion

           
                Stream stream = postedFile.InputStream;
                BinaryReader binaryReader = new BinaryReader(stream);
                byte[] bytes = binaryReader.ReadBytes((int)stream.Length);

                register.Name = TextBoxName.Text;
                register.Username = TextBoxUsername.Text;
                register.Email = TextBoxEmail.Text;
                register.Gender = RadioButtonListGender.SelectedItem.Text;
                register.Country = DropDownListCountry.SelectedItem.Text;
                register.DOB = TextBoxDOB.Text;
                register.Password = TextBoxPassword.Text;
                register.photo = bytes;
                register.Squestion = DropDownListSecurityQuestion.SelectedItem.Text;
                register.Sanswer = TextBoxSecurityQuestion.Text;

           
            #endregion

            #region Server Side Validation and verification
            

            if (fileExtension.ToLower() == ".jpg" || fileExtension.ToLower() == ".png" || fileExtension.ToLower() == ".bmp" ||
                fileExtension.ToLower() == ".gif")
            {
                if (fileSize <= 1048576)
                {
                    if (TextBoxCaptcha.Text.ToString() == Request.Cookies["Captcha"]["value"])
                    {
                        int output = ActionController.SaveRegister(register);
                        if (output > 0)
                        {
                            Response.Redirect("Login.aspx?Message="+ Server.UrlEncode("You have been sucessfully registered with us. Please login to continue"));
                        }
                        else
                        {
                            LabelMessage.Visible = true;
                            LabelMessage.Text = "An error occurred! Please check all the fields";
                            LabelMessage.ForeColor = System.Drawing.Color.Red;
                        }  
                    }
                    else
                    {
                        LabelMessage.Visible = false;
                        LabelCaptcha.Visible = true;
                        LabelCaptcha.Text = "Invalid Captcha";
                        LabelCaptcha.ForeColor = System.Drawing.Color.Red;
                        ImageCaptcha.Focus();
                    }
                }
                else
                {
                    LabelCaptcha.Visible = false;
                    LabelMessage.Visible = true;
                    LabelMessage.Text = "Image size (1MB) exceeded";
                    LabelMessage.ForeColor = System.Drawing.Color.Red;
                }
            }
            else
            {
                LabelCaptcha.Visible = false;
                LabelMessage.Visible = true;
                LabelMessage.Text = "Image is not in correct format! Only (.jpg, .png, .bmp, gif files are supported!)\nPlease don't try to upload any file having extension of <b>"+fileExtension.ToLower().ToString()+"</b>";
                LabelMessage.ForeColor = System.Drawing.Color.Red;
            }   
            #endregion
        }

        protected void ButtonCaptcha_Click(object sender, EventArgs e)
        {
            System.Threading.Thread.Sleep(2000);
            Response.Cookies["Captcha"]["value"] = (Guid.NewGuid().ToString().Substring(0, 5));
            ImageCaptcha.ImageUrl = "Captcha.aspx?" + DateTime.Now.Ticks.ToString();
            ImageCaptcha.Focus();
        }
    }
}