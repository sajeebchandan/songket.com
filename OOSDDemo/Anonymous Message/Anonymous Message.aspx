<%@ Page Title="" Language="C#" MasterPageFile="~/SiteAuth.Master" AutoEventWireup="true" CodeBehind="Anonymous Message.aspx.cs" Inherits="OOSDDemo.Anonymous_Message" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .auto-style1 {
        width: 100%;
    }
    .auto-style2 {
        width: 164px;
    }
    .auto-style3 {
        width: 348px;
    }
    .auto-style4 {
        color: #FF0000;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin-left: auto; margin-right: auto; width: 300px;">
        <asp:Image ID="ImageUser" runat="server" BorderColor="#9900FF" BorderStyle="Solid" Height="300px" Width="300px" />
    </div>
    <br />
    <div style="width: 700px; height: auto; margin-left: auto; margin-right: auto">
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">Your Message::</td>
                <td class="auto-style3">
                    <asp:TextBox ID="TextBoxAmessage" runat="server" Height="200px" TextMode="MultiLine" Width="355px"></asp:TextBox>
                </td>
                <td><strong><em>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorAmessage" runat="server" ControlToValidate="TextBoxAmessage" CssClass="auto-style4" ErrorMessage="*Required"></asp:RequiredFieldValidator>
                    </em></strong></td>
            </tr>
            <tr>
                <td class="auto-style2">Your Name (Optional)::</td>
                <td class="auto-style3">
                    <asp:TextBox ID="TextBoxAname" runat="server" Width="180px"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style3">
                    <asp:Button ID="ButtonSend" runat="server" Text="Send Message" />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </div>
</asp:Content>
