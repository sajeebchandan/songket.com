using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Controller;
using DataAccessLayer;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using Model;
using System.IO;
using System.Text;

namespace OOSDDemo
{
    public partial class Profile1 : System.Web.UI.Page
    {
        Model_User update_user = new Model_User();
        private void FillDataList(string username)
        {
            string _username = Session["New"].ToString();
            DataList1.DataSource = ActionController.DataSet_Profile(_username);
            DataList1.DataBind();
        }

        public void RegisterTrigger(Control ct)
        {
            ScriptManager1.RegisterPostBackControl(ct);
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["New"] != null)
                {
                    string _username = Session["New"].ToString();
                    FillDataList(_username);
                }
                else if (Session["New"] == null)
                {
                    Response.Redirect("Home.aspx");
                    //Response.Redirect("Login.aspx?Error=Please Login to Continue");
                }
            }
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "edit")
            {
                DataList1.EditItemIndex = e.Item.ItemIndex;
                string _username = Session["New"].ToString();
                FillDataList(_username);
            }
            else if (e.CommandName == "cancel")
            {
                DataList1.EditItemIndex = -1;
                string _username = Session["New"].ToString();
                FillDataList(_username);
            }
            else if (e.CommandName=="cp")
            {
                Response.Redirect("Change Password.aspx");
            }
            else if (e.CommandName == "update")
            {
                System.Threading.Thread.Sleep(2000);
                #region Set values in Model Class(update_user)
                //SET Values For Model
                update_user.Username = ((Label)DataList1.Items[e.Item.ItemIndex].FindControl("LabelUsernameHidden")).Text;
                update_user.Name = ((TextBox)DataList1.Items[e.Item.ItemIndex].FindControl("TextBoxName")).Text;
                update_user.Email = ((TextBox)DataList1.Items[e.Item.ItemIndex].FindControl("TextBoxEmail")).Text;
                update_user.Gender = ((RadioButtonList)DataList1.Items[e.Item.ItemIndex].FindControl("RadioButtonListGender")).SelectedValue;
                update_user.Country = ((DropDownList)DataList1.Items[e.Item.ItemIndex].FindControl("DropDownListCountry")).SelectedValue;
                update_user.DOB = ((TextBox)DataList1.Items[e.Item.ItemIndex].FindControl("TextBoxDOB")).Text;
                update_user.Squestion = ((DropDownList)DataList1.Items[e.Item.ItemIndex].FindControl("DropDownListSecurityQuestion")).SelectedValue;
                update_user.Sanswer = ((TextBox)DataList1.Items[e.Item.ItemIndex].FindControl("TextBoxSecurityAnswer")).Text;
                
                #region Image File Processor
                HttpPostedFile postedfile = ((FileUpload)DataList1.Items[e.Item.ItemIndex].FindControl("FileUpload1")).PostedFile;
                string fileName = Path.GetFileName(postedfile.FileName);
                string fileExtension = Path.GetExtension(fileName);
                int fileSize = postedfile.ContentLength;
                Stream stream = postedfile.InputStream;
                BinaryReader binaryReader = new BinaryReader(stream);
                #endregion
                update_user.photo = binaryReader.ReadBytes((int)stream.Length);
                #endregion

                if (update_user.Sanswer != "")
                {
                    if (fileName != "")
                    {
                        if (fileExtension.ToLower() == ".jpg" || fileExtension.ToLower() == ".png" || fileExtension.ToLower() == ".bmp" ||
                                fileExtension.ToLower() == ".gif")
                        {
                            if (fileSize <= 1048576)
                            {
                                int outputupdate = ActionController.UpdateRegister(update_user);
                                if (outputupdate > 0)
                                {
                                    LabelMessage.Visible = true;
                                    LabelMessage.Text = "Profile Has been updated successfully";
                                    LabelMessage.ForeColor = System.Drawing.Color.Green;
                                    DataList1.EditItemIndex = -1;
                                    FillDataList(update_user.Username);
                                }
                                else
                                {
                                    LabelMessage.Visible = true;
                                    LabelMessage.Text = "This name '" + update_user.Name + "' is already associated with an username.\nPlease try with some different name";
                                    LabelMessage.ForeColor = System.Drawing.Color.Red;
                                }
                            }
                            else
                            {
                                LabelMessage.Visible = true;
                                LabelMessage.Text = "Image size (1MB) exceeded";
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
                    else
                    {
                        update_user.photo = ActionController.GetImageByte(update_user.Username);
                        int outputupdate = ActionController.UpdateRegister(update_user);
                        if (outputupdate > 0)
                        {
                            LabelMessage.Visible = true;
                            LabelMessage.Text = "Profile Has been updated successfully";
                            LabelMessage.ForeColor = System.Drawing.Color.Green;
                            DataList1.EditItemIndex = -1;
                            FillDataList(update_user.Username);
                        }
                        else
                        {
                            LabelMessage.Visible = true;
                            LabelMessage.Text = "This name '" + update_user.Name + "' is already associated with an username.\nPlease try with some different name";
                            LabelMessage.ForeColor = System.Drawing.Color.Red;
                        }
                    }
                }
                else
                {
                    LabelMessage.Visible = true;
                    LabelMessage.Text = "Please answer to your security question";
                    LabelMessage.ForeColor = System.Drawing.Color.Red;
                }
            }
        }
    }
}