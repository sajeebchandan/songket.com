using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Controller;
using Model;
using System.IO;
using System.Drawing;

namespace OOSDDemo
{
    public partial class Write_Blog1 : System.Web.UI.Page
    {
        Model_User _User = new Model_User();
        Model_Blog Blog = new Model_Blog();

        protected void Page_Load(object sender, EventArgs e)
        {
            LabelMessage.Visible = false;
            LabelAvail.Visible = false;
            LinkButtonHere.Visible = false;
            if (Session["New"] == null)
            {
                Response.Redirect("Login.aspx?Error="+ Server.UrlEncode("Please Login to Continue"));
            }
            if (IsPostBack)
            {
                if (ActionController.BlogTitleAvailability(TextBoxTitle.Text) == 1)
                {
                    LabelAvail.Visible = true;
                    LabelAvail.Text = "Thre is already a blog with this title. Please try another title.";
                    LabelAvail.ForeColor = Color.Red;
                }
            }
        }

        protected void ButtonPost_Click(object sender, EventArgs e)
        {
            if (FileUploadImage.HasFile && FileUploadFile.HasFile == false)
            {
                HttpPostedFile postedFile = FileUploadImage.PostedFile;
                string fileName = Path.GetFileName(postedFile.FileName);
                string fileExtension = Path.GetExtension(fileName);
                int fileSize = FileUploadImage.PostedFile.ContentLength;
                Stream stream = postedFile.InputStream;
                BinaryReader binaryReader = new BinaryReader(stream);
                Blog.B_Image = binaryReader.ReadBytes((int)stream.Length);


                _User.Username = Session["New"].ToString();
                _User.Name = ActionController.GetName(_User.Username);
                Blog.B_Cat = TextBoxCategory.Text;
                Blog.B_Title = TextBoxTitle.Text;
                ViewState["Title"] = TextBoxTitle.Text;
                Blog.B_Post = TextBoxPost.Text;
                Blog.B_File = DBNull.Value.ToString();
                Blog.B_FileName = DBNull.Value.ToString();
                Blog.B_Date = DateTime.Now.ToString();

                if (fileExtension.ToLower() == ".jpg" || fileExtension.ToLower() == ".png" || fileExtension.ToLower() == ".bmp" ||
                fileExtension.ToLower() == ".gif")
                {
                    if (fileSize <= 1048576)
                    {
                        int output = ActionController.SaveBlog(_User, Blog);
                        if (output > 0)
                        {
                            LabelMessage.Text = "Successfully Added Your blog. To see click ";
                            LabelMessage.Visible = true;
                            LinkButtonHere.Visible = true;
                            TextBoxTitle.Text = string.Empty;
                            TextBoxCategory.Text = string.Empty;
                            TextBoxPost.Text = string.Empty;
                            LabelMessage.ForeColor = System.Drawing.Color.Blue;
                        }
                        else
                        {
                            LabelMessage.Text = "Something went wrong!";
                            LabelMessage.Visible = true;
                            LabelMessage.ForeColor = System.Drawing.Color.Red;
                        }
                    }
                    else
                    {
                        LabelMessage.Text = "MAX image file size (1MB) exceeded";
                        LabelMessage.Visible = true;
                        LabelMessage.ForeColor = System.Drawing.Color.Red;
                    }
                }
                else
                {
                    LabelMessage.Visible = true;
                    LabelMessage.Text = "Image is not in correct format! Only (.jpg, .png, .bmp, gif files are supported!)\nPlease don't try to upload any file having extension of <b>" + fileExtension.ToLower().ToString() + "</b>";
                    LabelMessage.ForeColor = System.Drawing.Color.Red;
                }
            }

            else if (FileUploadFile.HasFile && FileUploadImage.HasFile == false)
            {
                HttpPostedFile postedFile = FileUploadImage.PostedFile;
                string fileName = Path.GetFileName(postedFile.FileName);
                string fileExtension = Path.GetExtension(fileName);
                int fileSize = FileUploadImage.PostedFile.ContentLength;
                Stream stream = postedFile.InputStream;
                BinaryReader binaryReader = new BinaryReader(stream);
                Blog.B_Image = binaryReader.ReadBytes((int)stream.Length);


                HttpPostedFile postedFiledoc = FileUploadFile.PostedFile;
                string fileNamedoc = Path.GetFileName(postedFiledoc.FileName);
                Guid g = Guid.NewGuid();
                fileNamedoc = g + "_" + Session["New"].ToString() + "_" + fileNamedoc;
                Blog.B_FileName = fileNamedoc;
                string fileExtensiondoc = Path.GetExtension(fileNamedoc);
                int fileSizedoc = FileUploadFile.PostedFile.ContentLength;
                postedFiledoc.SaveAs(Server.MapPath("~/Files/") + fileNamedoc);
                Blog.B_File = Server.MapPath("~/Files/") + fileNamedoc;

                _User.Username = Session["New"].ToString();
                _User.Name = ActionController.GetName(_User.Username);
                Blog.B_Cat = TextBoxCategory.Text;
                Blog.B_Title = TextBoxTitle.Text;
                ViewState["Title"] = TextBoxTitle.Text;
                Blog.B_Post = TextBoxPost.Text;
                Blog.B_Date = DateTime.Now.ToString();

                if (fileExtensiondoc.ToLower() == ".doc" || fileExtensiondoc.ToLower() == ".docx" || fileExtensiondoc.ToLower() == ".pdf" ||
                        fileExtensiondoc.ToLower() == ".txt")
                {
                    if (fileSizedoc <= 2097152)
                    {
                        int output = ActionController.SaveBlog(_User, Blog);
                        if (output > 0)
                        {
                            LabelMessage.Text = "Successfully Added Your blog. To see click ";
                            LabelMessage.Visible = true;
                            LinkButtonHere.Visible = true;
                            TextBoxTitle.Text = string.Empty;
                            TextBoxCategory.Text = string.Empty;
                            TextBoxPost.Text = string.Empty;
                            LabelMessage.ForeColor = System.Drawing.Color.Blue;
                        }
                        else
                        {
                            LabelMessage.Text = "Something went wrong!";
                            LabelMessage.Visible = true;
                            LabelMessage.ForeColor = System.Drawing.Color.Red;
                        }
                    }
                    else
                    {
                        LabelMessage.Text = "MAX document file size (2MB) exceeded";
                        LabelMessage.Visible = true;
                        LabelMessage.ForeColor = System.Drawing.Color.Red;
                    }
                }
                else
                {
                    LabelMessage.Visible = true;
                    LabelMessage.Text = "Document is not in correct format! Only (.doc, .docx, .pdf, .txt files are supported!)\nPlease don't try to upload any file having extension of <b>" + fileExtension.ToLower().ToString() + "</b>";
                    LabelMessage.ForeColor = System.Drawing.Color.Red;
                }

            }
            else if (FileUploadImage.HasFile && FileUploadFile.HasFile)
            {
                HttpPostedFile postedFiledoc = FileUploadFile.PostedFile;
                string fileNamedoc = Path.GetFileName(postedFiledoc.FileName);
                Guid g = Guid.NewGuid();
                fileNamedoc = g + "_" + Session["New"].ToString() + "_" + fileNamedoc;
                Blog.B_FileName = fileNamedoc;
                string fileExtensiondoc = Path.GetExtension(fileNamedoc);
                int fileSizedoc = FileUploadFile.PostedFile.ContentLength;
                postedFiledoc.SaveAs(Server.MapPath("~/Files/") + fileNamedoc);
                Blog.B_File = Server.MapPath("~/Files/") + fileNamedoc;

                HttpPostedFile postedFile = FileUploadImage.PostedFile;
                string fileName = Path.GetFileName(postedFile.FileName);
                string fileExtension = Path.GetExtension(fileName);
                int fileSize = FileUploadImage.PostedFile.ContentLength;
                Stream stream = postedFile.InputStream;
                BinaryReader binaryReader = new BinaryReader(stream);
                Blog.B_Image = binaryReader.ReadBytes((int)stream.Length);


                _User.Username = Session["New"].ToString();
                _User.Name = ActionController.GetName(_User.Username);
                Blog.B_Cat = TextBoxCategory.Text;
                Blog.B_Title = TextBoxTitle.Text;
                ViewState["Title"] = TextBoxTitle.Text;
                Blog.B_Post = TextBoxPost.Text;
                Blog.B_Date = DateTime.Now.ToString();


                if (fileExtension.ToLower() == ".jpg" || fileExtension.ToLower() == ".png" || fileExtension.ToLower() == ".bmp" ||
                fileExtension.ToLower() == ".gif")
                {
                    if (fileExtensiondoc.ToLower() == ".doc" || fileExtensiondoc.ToLower() == ".docx" || fileExtensiondoc.ToLower() == ".pdf" ||
                            fileExtensiondoc.ToLower() == ".txt")
                    {
                        if (fileSizedoc <= 2097152)
                        {
                            if (fileSize <= 1048576)
                            {
                                int output = ActionController.SaveBlog(_User, Blog);
                                if (output > 0)
                                {
                                    LabelMessage.Text = "Successfully Added Your blog. To see click ";
                                    LabelMessage.Visible = true;
                                    LinkButtonHere.Visible = true;
                                    TextBoxTitle.Text = string.Empty;
                                    TextBoxCategory.Text = string.Empty;
                                    TextBoxPost.Text = string.Empty;
                                    LabelMessage.ForeColor = System.Drawing.Color.Blue;
                                }
                                else
                                {
                                    LabelMessage.Text = "Something went wrong!";
                                    LabelMessage.Visible = true;
                                    LabelMessage.ForeColor = System.Drawing.Color.Red;
                                }
                            }
                            else
                            {
                                LabelMessage.Text = "MAX document file size (2MB) exceeded";
                                LabelMessage.Visible = true;
                                LabelMessage.ForeColor = System.Drawing.Color.Red;
                            }
                        }
                        else
                        {
                            LabelMessage.Text = "MAX document file size (2MB) exceeded";
                            LabelMessage.Visible = true;
                            LabelMessage.ForeColor = System.Drawing.Color.Red;
                        }
                    }
                    else
                    {
                        LabelMessage.Visible = true;
                        LabelMessage.Text = "Document is not in correct format! Only (.doc, .docx, .pdf, .txt files are supported!)\nPlease don't try to upload any file having extension of <b>" + fileExtension.ToLower().ToString() + "</b>";
                        LabelMessage.ForeColor = System.Drawing.Color.Red;
                    }
                }
                else
                {
                    LabelMessage.Visible = true;
                    LabelMessage.Text = "Image is not in correct format! Only (.jpg, .png, .bmp, gif files are supported!)\nPlease don't try to upload any file having extension of <b>" + fileExtension.ToLower().ToString() + "</b>";
                    LabelMessage.ForeColor = System.Drawing.Color.Red;
                }

            }


            else if (FileUploadFile.HasFile == false && FileUploadImage.HasFile == false)
            {
                HttpPostedFile postedFile = FileUploadImage.PostedFile;
                string fileName = Path.GetFileName(postedFile.FileName);
                string fileExtension = Path.GetExtension(fileName);
                int fileSize = FileUploadImage.PostedFile.ContentLength;
                Stream stream = postedFile.InputStream;
                BinaryReader binaryReader = new BinaryReader(stream);
                Blog.B_Image = binaryReader.ReadBytes((int)stream.Length);



                _User.Username = Session["New"].ToString();
                _User.Name = ActionController.GetName(_User.Username);
                Blog.B_Cat = TextBoxCategory.Text;
                Blog.B_Title = TextBoxTitle.Text;
                ViewState["Title"] = TextBoxTitle.Text;
                Blog.B_Post = TextBoxPost.Text;
                Blog.B_File = DBNull.Value.ToString();
                Blog.B_FileName = DBNull.Value.ToString();
                Blog.B_Date = DateTime.Now.ToString();


                int output = ActionController.SaveBlog(_User, Blog);
                if (output > 0)
                {
                    LabelMessage.Text = "Successfully Added Your blog. To see click ";
                    LinkButtonHere.Visible = true;
                    LabelMessage.Visible = true;
                    TextBoxTitle.Text = string.Empty;
                    TextBoxCategory.Text = string.Empty;
                    TextBoxPost.Text = string.Empty;
                    LabelMessage.ForeColor = System.Drawing.Color.Blue;
                }
                else
                {
                    LabelMessage.Text = "Something went wrong!";
                    LabelMessage.Visible = true;
                    LabelMessage.ForeColor = System.Drawing.Color.Red;
                }
            }
        }

        protected void LinkButtonHere_Click(object sender, EventArgs e)
        {
            Response.Redirect("View Blog.aspx?Title=" + Server.UrlEncode(ViewState["Title"].ToString()));
        }
    }
}