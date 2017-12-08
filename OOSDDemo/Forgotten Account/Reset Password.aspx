<%@ Page Title="Reset Password" Language="C#" MasterPageFile="~/SiteAuth.Master" AutoEventWireup="true" CodeBehind="Reset Password.aspx.cs" Inherits="OOSDDemo.Forgotten_Account.Reset_Password" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        #ProgressFA {
            position: fixed;
            top: 40%;
            left: 40%;
            height: 20%;
            width: 20%;
            z-index: 100001;
            background-color: #FFFFFF;
            border: 1px solid Gray;
            background-image: url('../Supported%20Files/ajax-load.gif');
            background-repeat: no-repeat;
            background-position: center;
        }

        .form-control {
            /*display: block;*/
            /*padding: 6px 12px;*/
            font-size: 14px;
            line-height: 1.428571429;
            color: #555555;
            vertical-align: middle;
            background-color: #ffffff;
            border: 1px solid #cccccc;
            border-radius: 4px;
            -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
            box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
            -webkit-transition: border-color ease-in-out 0.15s, box-shadow ease-in-out 0.15s;
            transition: border-color ease-in-out 0.15s, box-shadow ease-in-out 0.15s;
        }

            .form-control:focus {
                border-color: #66afe9;
                outline: 0;
                -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 8px rgba(102, 175, 233, 0.6);
                box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 8px rgba(102, 175, 233, 0.6);
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
        <ProgressTemplate>
            <div id="Background"></div>
            <div id="ProgressFA" class="auto-style1">
                <h3>
                    <p style="text-align: center;">
                        <b class="UpdateProgress">Resetting Password ...<br />
                        </b>
                    </p>
                </h3>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>










    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div style="width: 700px; height: auto; margin-left: auto; margin-right: auto">
                <h1 style="color: #0000FF">Reset Password</h1>
                <p>
                    <asp:Label ID="LabelMessage" runat="server" ForeColor="#3333FF" Text="?"></asp:Label>
                </p>
                <table style="width: 100%">
                    <tr>
                        <td style="width: 207px"><strong>New Password::</strong></td>
                        <td style="width: 218px">
                            <asp:TextBox ID="TextBoxNewPassword" runat="server" CssClass="form-control" Width="205px" TextMode="Password"></asp:TextBox>
                        </td>
                        <td><strong><em>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxNewPassword" Display="Dynamic" ErrorMessage="*Required" Style="color: #FF0000"></asp:RequiredFieldValidator>
                        </em></strong>
                            <br />
                            <strong><em>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBoxNewPassword" Display="Dynamic" ErrorMessage="Password Must Contains 2 Uppercase letters, 1 Special Character, 2 Digits, 3 Lowercase Letters" Style="color: #FF0000" ToolTip="Password Must Contains 2 Uppercase letters, 1 Special Character, 2 Digits, 3 Lowercase Letters" ValidationExpression="^(?=.*[A-Z].*[A-Z])(?=.*[!@#$&amp;*])(?=.*[0-9].*[0-9])(?=.*[a-z].*[a-z].*[a-z]).{8}$"></asp:RegularExpressionValidator>
                            </em></strong></td>
                    </tr>
                    <tr>
                        <td style="width: 207px; height: 26px"><strong>Confirm New Password::</strong></td>
                        <td style="width: 218px; height: 26px">
                            <asp:TextBox ID="TextBoxConfirmNewPassword" runat="server" CssClass="form-control" Width="205px" TextMode="Password"></asp:TextBox>
                        </td>
                        <td style="height: 26px"><strong><em>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBoxConfirmNewPassword" Display="Dynamic" ErrorMessage="*Required" Style="color: #FF0000"></asp:RequiredFieldValidator>
                        </em></strong>
                            <br />
                            <strong><em>
                                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBoxNewPassword" ControlToValidate="TextBoxConfirmNewPassword" Display="Dynamic" ErrorMessage="Password did not match" Style="color: #FF0000"></asp:CompareValidator>
                            </em></strong>
                            <br />
                            <strong><em>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TextBoxConfirmNewPassword" Display="Dynamic" ErrorMessage="Password Must Contains 2 Uppercase letters, 1 Special Character, 2 Digits, 3 Lowercase Letters" Style="color: #FF0000" ToolTip="Password Must Contains 2 Uppercase letters, 1 Special Character, 2 Digits, 3 Lowercase Letters" ValidationExpression="^(?=.*[A-Z].*[A-Z])(?=.*[!@#$&amp;*])(?=.*[0-9].*[0-9])(?=.*[a-z].*[a-z].*[a-z]).{8}$"></asp:RegularExpressionValidator>
                            </em></strong></td>
                    </tr>
                    <tr>
                        <td style="width: 207px">&nbsp;</td>
                        <td style="width: 218px">
                            <asp:Button ID="ButtonResetPassword" runat="server" Text="Reset Password" CssClass="BigButton" OnClick="ButtonResetPassword_Click" />
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 207px">&nbsp;</td>
                        <td style="width: 218px">&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 207px">&nbsp;</td>
                        <td style="width: 218px">&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 207px">&nbsp;</td>
                        <td style="width: 218px">&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="ButtonResetPassword" EventName="Click" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
