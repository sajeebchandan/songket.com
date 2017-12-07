<%@ Page Title="" Language="C#" MasterPageFile="~/Profile.Master" AutoEventWireup="true" CodeBehind="Change Password.aspx.cs" Inherits="OOSDDemo.Change_Password" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            text-align: right;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin-left:315px; float:left">
        <h1>Change Password</h1>
        <p>
            <asp:Label ID="LabelMessage" runat="server" ForeColor="#3333FF" Text="?"></asp:Label>
        </p>
        <table style="width: 600px">
            <tr>
                <td style="width: 197px; height: 114px;" class="auto-style1"><strong>Current Password→ <mark class="unicode" data-char-info="U+2191: UPWARDS ARROW" style="color: black;"></mark></strong></td>
                <td style="width: 224px; height: 114px;">
                    <asp:TextBox ID="TextBoxCurrentPassword" runat="server" Width="205px" TextMode="Password"></asp:TextBox>
                </td>
                <td style="height: 114px"><strong><em>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic" ErrorMessage="*Required" Style="color: #FF0000" ControlToValidate="TextBoxCurrentPassword"></asp:RequiredFieldValidator>
                </em></strong>
                    <br />
                    <strong><em>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBoxCurrentPassword" Display="Dynamic" ErrorMessage="Password Must Contains 2 Uppercase letters, 1 Special Character, 2 Digits, 3 Lowercase Letters" Style="color: #FF0000" ValidationExpression="^(?=.*[A-Z].*[A-Z])(?=.*[!@#$&amp;*])(?=.*[0-9].*[0-9])(?=.*[a-z].*[a-z].*[a-z]).{8}$"></asp:RegularExpressionValidator>
                    </em></strong></td>
            </tr>
            <tr>
                <td style="width: 197px" class="auto-style1"><strong>New Password→</strong></td>
                <td style="width: 224px">
                    <asp:TextBox ID="TextBoxNewPassword" runat="server" Width="205px" TextMode="Password"></asp:TextBox>
                </td>
                <td><strong><em>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic" ErrorMessage="*Required" Style="color: #FF0000" ControlToValidate="TextBoxNewPassword"></asp:RequiredFieldValidator>
                </em></strong>
                    <br />
                    <strong><em>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBoxNewPassword" Display="Dynamic" ErrorMessage="Password Must Contains 2 Uppercase letters, 1 Special Character, 2 Digits, 3 Lowercase Letters" Style="color: #FF0000" ValidationExpression="^(?=.*[A-Z].*[A-Z])(?=.*[!@#$&amp;*])(?=.*[0-9].*[0-9])(?=.*[a-z].*[a-z].*[a-z]).{8}$"></asp:RegularExpressionValidator>
                    </em></strong></td>
            </tr>
            <tr>
                <td style="width: 197px" class="auto-style1"><strong>Confirm New Password→</strong></td>
                <td style="width: 224px">
                    <asp:TextBox ID="TextBoxConfirmNewPassword" runat="server" Width="205px" TextMode="Password"></asp:TextBox>
                </td>
                <td><strong><em>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Display="Dynamic" ErrorMessage="*Required" Style="color: #FF0000" ControlToValidate="TextBoxConfirmNewPassword"></asp:RequiredFieldValidator>
                </em></strong>
                    <br />
                    <strong><em>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBoxNewPassword" ControlToValidate="TextBoxConfirmNewPassword" Display="Dynamic" ErrorMessage="*Password is not matched" Style="color: #FF0000"></asp:CompareValidator>
                    </em></strong>
                    <br />
                    <strong><em>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TextBoxConfirmNewPassword" Display="Dynamic" ErrorMessage="Password Must Contains 2 Uppercase letters, 1 Special Character, 2 Digits, 3 Lowercase Letters" Style="color: #FF0000" ValidationExpression="^(?=.*[A-Z].*[A-Z])(?=.*[!@#$&amp;*])(?=.*[0-9].*[0-9])(?=.*[a-z].*[a-z].*[a-z]).{8}$"></asp:RegularExpressionValidator>
                    </em></strong></td>
            </tr>
            <tr>
                <td style="width: 197px">&nbsp;</td>
                <td style="width: 224px">
                    <asp:Button ID="ButtonChangePassword" runat="server" CssClass="BigButton" OnClick="ButtonChangePassword_Click" Text="Change Password" />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 197px">&nbsp;</td>
                <td style="width: 224px">
                    <input id="Reset1" type="reset" value="Reset" class="BigButton" /></td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 197px">&nbsp;</td>
                <td style="width: 224px">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </div>
</asp:Content>
