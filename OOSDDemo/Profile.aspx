<%@ Page Title="Profile" Language="C#" MasterPageFile="~/Profile.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="OOSDDemo.Profile1" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 600px;
        }

        .auto-style2 {
            text-align: right;
            width: 133px;
        }

        .auto-style3 {
            width: 133px;
        }

        .auto-style5 {
            text-align: right;
            width: 133px;
            height: 26px;
        }

        .auto-style6 {
            height: 26px;
        }

        .ImageStyle {
            object-fit: cover;
            border-radius: 200px;
        }

        .auto-style7 {
            text-align: center;
        }

        .auto-style8 {
            text-align: right;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:Label ID="LabelMessage" runat="server" Text="."></asp:Label>
    <div style="margin-left: 315px; float: left">
        <asp:DataList ID="DataList1" runat="server" OnItemCommand="DataList1_ItemCommand">
            <EditItemTemplate>
                <table class="auto-style1">
                    <tr>
                        <td class="auto-style3">
                            <br />
                        </td>
                        <td>
                            <br />
                            <asp:Image ID="Image2" runat="server" ImageUrl='<%# "GetImage.aspx?username=" + Eval("username") %>' Width="250px" Height="250px" CssClass="ImageStyle" />
                            <asp:Label ID="LabelUsernameHidden" runat="server" Text='<%# Eval("username") %>' Visible="False"></asp:Label>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style2">Name➜</td>
                        <td>
                            <asp:TextBox ID="TextBoxName" runat="server" CssClass="form-control" Text='<%# Eval("name") %>' Width="250px"></asp:TextBox>
                        </td>
                        <td><strong>
                            <em>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidatorName" runat="server" ControlToValidate="TextBoxName" Display="Dynamic" ErrorMessage="Name Must Contain Alphabate(A-z) With or Without Space" Style="color: #FF3300" ValidationExpression="^[a-zA-Z][a-zA-Z]*[ ]{0,1}[a-zA-Z][a-zA-Z ]*[a-zA-Z]$"></asp:RegularExpressionValidator>
                            </em>
                        </strong>
                            <br />
                            <strong><em>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorName" runat="server" ControlToValidate="TextBoxName" Display="Dynamic" ErrorMessage="*Required" Style="color: #FF3300"></asp:RequiredFieldValidator>
                                <br />
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBoxName" ErrorMessage="Name should be between (7-26) characters" Style="color: #FF3300" ValidationExpression="^[\s\S]{7,26}$"></asp:RegularExpressionValidator>
                            </em></strong></td>
                    </tr>
                    <tr>
                        <td class="auto-style2">Email➜</td>
                        <td>
                            <asp:TextBox ID="TextBoxEmail" runat="server" Text='<%# Eval("email") %>'  CssClass="form-control" Width="250px"></asp:TextBox>
                        </td>
                        <td><strong>
                            <em>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server" ControlToValidate="TextBoxEmail" Display="Dynamic" ErrorMessage="*Required" Style="color: #FF3300"></asp:RequiredFieldValidator>
                                <br />
                                <asp:RegularExpressionValidator ID="RegularExpressionValidatorEmail" runat="server" ControlToValidate="TextBoxEmail" Display="Dynamic" ErrorMessage="*Invalid E-mail" Style="color: #FF3300" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                            </em>
                        </strong></td>
                    </tr>
                    <tr>
                        <td class="auto-style2">Gender➜</td>
                        <td>
                            <asp:RadioButtonList ID="RadioButtonListGender" runat="server" SelectedValue='<%# Eval("gender") %>'>
                                <asp:ListItem>Male</asp:ListItem>
                                <asp:ListItem>Female</asp:ListItem>
                                <asp:ListItem>Others</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                        <td><strong>
                            <em>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="RadioButtonListGender" CssClass="auto-style4" ErrorMessage="*Required" Style="color: #FF0000"></asp:RequiredFieldValidator>
                            </em>
                        </strong></td>
                    </tr>
                    <tr>
                        <td class="auto-style5">Country➜</td>
                        <td class="auto-style6">
                            <asp:DropDownList ID="DropDownListCountry" runat="server" SelectedValue='<%# Eval("country") %>' Width="250px">
                                <asp:ListItem>Choose</asp:ListItem>
                                <asp:ListItem>Bangladesh</asp:ListItem>
                                <asp:ListItem>India</asp:ListItem>
                                <asp:ListItem>Pakistan</asp:ListItem>
                                <asp:ListItem>Maldives</asp:ListItem>
                                <asp:ListItem>Nepal</asp:ListItem>
                                <asp:ListItem>Afganistan</asp:ListItem>
                                <asp:ListItem>Sri Lanka</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td class="auto-style6"><strong>
                            <em>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="DropDownListCountry" CssClass="auto-style4" ErrorMessage="*Required" InitialValue="Choose" Style="color: #FF0000"></asp:RequiredFieldValidator>
                            </em>
                        </strong></td>
                    </tr>
                    <tr>
                        <td class="auto-style2">Date Of Birth➜</td>
                        <td>
                            <asp:TextBox ID="TextBoxDOB" runat="server" Text='<%# Eval("dob") %>' Width="250px"  CssClass="form-control" ></asp:TextBox>
                            <asp:CalendarExtender ID="TextBoxDOB_CalendarExtender" runat="server" Enabled="True" TargetControlID="TextBoxDOB">
                            </asp:CalendarExtender>
                        </td>
                        <td><strong>
                            <em>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBoxDOB" CssClass="auto-style4" ErrorMessage="*Required" Style="color: #FF0000"></asp:RequiredFieldValidator>
                            </em>
                        </strong></td>
                    </tr>
                    <tr>
                        <td class="auto-style2">Security Question➜</td>
                        <td>
                            <asp:DropDownList ID="DropDownListSecurityQuestion" runat="server" SelectedValue='<%# Eval("securityquestion") %>' Width="250px">
                                <asp:ListItem>Choose</asp:ListItem>
                                <asp:ListItem>What is your Pet&#39;s name?</asp:ListItem>
                                <asp:ListItem>Who is your Favourite Player?</asp:ListItem>
                                <asp:ListItem>Who is your Favourite Heroine?</asp:ListItem>
                                <asp:ListItem Value="Who is your favourite Writer?">Who is your Favourite Writer?</asp:ListItem>
                                <asp:ListItem>When you did your First Date?</asp:ListItem>
                                <asp:ListItem>Who was your First Love?</asp:ListItem>
                                <asp:ListItem>Which is your Favourite Novel?</asp:ListItem>
                                <asp:ListItem>Who is your Favourite Teacher?</asp:ListItem>
                                <asp:ListItem>Who is your Best Friend?</asp:ListItem>
                                <asp:ListItem>Which is your First Mobile?</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td><strong>
                            <em>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="DropDownListSecurityQuestion" CssClass="auto-style4" ErrorMessage="*Required" InitialValue="Choose" Style="color: #FF0000"></asp:RequiredFieldValidator>
                            </em>
                        </strong></td>
                    </tr>
                    <tr>
                        <td class="auto-style2">Security Answer➜</td>
                        <td>
                            <asp:TextBox ID="TextBoxSecurityAnswer" runat="server" Width="250px" CssClass="form-control" ></asp:TextBox>
                        </td>
                        <td><strong>
                            <em>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidatorSecurityAnswer" runat="server" ControlToValidate="TextBoxSecurityAnswer" Display="Dynamic" ErrorMessage="Answar Must Contain Alphabate(A-z) With or Without Space and numbers(0-9)" Style="color: #FF3300" ValidationExpression="^[a-zA-Z][a-zA-Z]*[ ]{0,1}[a-zA-Z][a-zA-Z ]*[a-zA-Z0-9]*$"></asp:RegularExpressionValidator>
                                <br />
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TextBoxSecurityAnswer" ErrorMessage="Answer should be between (3-20) characters" Style="color: #FF3300" ValidationExpression="^[\s\S]{3,20}$"></asp:RegularExpressionValidator>
                            </em>
                        </strong></td>
                    </tr>
                    <tr>
                        <td class="auto-style2">&nbsp;</td>
                        <td>
                            <asp:FileUpload ID="FileUpload1" runat="server" />
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style2">&nbsp;</td>
                        <td>

                            <br />
                            <br />
                        </td>
                        <td class="auto-style8">
                            <asp:LinkButton ID="LinkButtonUpdate" runat="server" CommandName="update">Update Profile</asp:LinkButton>
                            <br />
                            <asp:LinkButton ID="LinkButtonCancel" runat="server" CommandName="cancel">Cancel</asp:LinkButton>
                        </td>
                    </tr>
                </table>
            </EditItemTemplate>
            <ItemTemplate>
                <table class="auto-style1">
                    <tr>
                        <td class="auto-style7">
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# "GetImage.aspx?username=" + Eval("username") %>' Width="250px" CssClass="ImageStyle" Height="250px" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table class="auto-style1">
                                <tr>
                                    <td class="auto-style8">Name➜</td>
                                    <td>
                                        &nbsp;&nbsp;&nbsp;<asp:Label ID="LabelName" runat="server" Text='<%# Eval("name") %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style8">Username➜</td>
                                    <td>
                                        &nbsp;&nbsp;&nbsp;<asp:Label ID="LabelUsername" runat="server" Text='<%# Eval("username") %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style8">Email➜</td>
                                    <td>
                                        &nbsp;&nbsp;&nbsp;<asp:Label ID="LabelEmail" runat="server" Text='<%# Eval("email") %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style8">Gender➜</td>
                                    <td>
                                        &nbsp;&nbsp;&nbsp;<asp:Label ID="LabelGender" runat="server" Text='<%# Eval("gender") %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style8">Country➜</td>
                                    <td>
                                        &nbsp;&nbsp;&nbsp;<asp:Label ID="LabelCountry" runat="server" Text='<%# Eval("country") %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style8">Date Of Birth➜</td>
                                    <td>
                                        &nbsp;&nbsp;&nbsp;<asp:Label ID="LabelDOB" runat="server" Text='<%# Eval("dob") %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style8">Security Question➜</td>
                                    <td>
                                        &nbsp;&nbsp;&nbsp;<asp:Label ID="LabelSquestion" runat="server" Text='<%# Eval("securityquestion") %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style8">
                                        &nbsp;</td>
                                    <td class="auto-style8">
                                        <asp:LinkButton ID="LinkButtonEdit" runat="server" CommandName="edit">Edit Your Profile</asp:LinkButton>
                                        <br />
                                        <asp:LinkButton ID="LinkButtonChangePassword" runat="server" CommandName="cp">Change Password</asp:LinkButton>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>

            </ItemTemplate>
        </asp:DataList>
        <br />
        <br />
        <br />

    </div>
</asp:Content>
