<%@ Page Title="" Language="C#" MasterPageFile="~/SiteAuth.Master" AutoEventWireup="true" CodeBehind="Enter Recipient.aspx.cs" Inherits="OOSDDemo.Check_Recipient" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width: 700px; height: auto; margin-left: auto; margin-right: auto">
        <h1 style="color: #0000FF">Enter Recipient&#39;s Username</h1>
        <p style="color: #0000FF">
            <asp:Label ID="LabelMessage" runat="server" Text="?"></asp:Label>
        </p>
        <table style="width: 100%">
            <tr>
                <td class="w3-right-align" style="width: 127px"><strong>Username::</strong></td>
                <td style="width: 226px">
                    <asp:TextBox ID="TextBoxCheckUsername" runat="server" Width="205px"></asp:TextBox>
                </td>
                <td><strong><em>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" Display="Dynamic" ErrorMessage="Username Must Contain Alphanumaric With Dot(.) Only" Style="color: #FF0000" ValidationExpression="^[a-zA-Z][a-zA-Z]*[.]{0,1}[a-zA-Z][a-zA-Z]*[0-9]*$" ControlToValidate="TextBoxCheckUsername"></asp:RegularExpressionValidator>
                        <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxCheckUsername" Display="Dynamic" ErrorMessage="*Required" Style="color: #FF0000"></asp:RequiredFieldValidator>
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBoxCheckUsername" ErrorMessage="Username should be between (5-25) characters" Style="color: #FF0000" ValidationExpression="^[\s\S]{5,25}$"></asp:RegularExpressionValidator>
                    </em></strong></td>
            </tr>
            <tr>
                <td style="width: 127px">&nbsp;</td>
                <td style="width: 226px">
                    <asp:Button ID="ButtonCheck" runat="server" Text="Check" OnClick="ButtonCheck_Click" />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 127px">&nbsp;</td>
                <td style="width: 226px">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 127px">&nbsp;</td>
                <td style="width: 226px">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </div>
</asp:Content>
