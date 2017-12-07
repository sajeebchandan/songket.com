<%@ Page Title="" Language="C#" MasterPageFile="~/BlogWrite.Master" AutoEventWireup="true" CodeBehind="Write Blog.aspx.cs" Inherits="OOSDDemo.Write_Blog1" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }

        .auto-style2 {
            text-align: right;
        }

        .auto-style3 {
            text-align: justify;
        }

        .auto-style4 {
            color: #FF0000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <marquee><h1 style="color: #0000FF; position:center">Write, Share, Learn</h1></marquee>
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:Label ID="LabelMessage" runat="server" Text="."></asp:Label>
            &nbsp;
            <asp:LinkButton ID="LinkButtonHere" runat="server" OnClick="LinkButtonHere_Click">here</asp:LinkButton>
            &nbsp;<table class="auto-style1">
                <tr>
                    <td class="auto-style2">Title::</td>
                    <td class="auto-style3">
                        <asp:TextBox ID="TextBoxTitle" runat="server" Width="1085px" AutoPostBack="True"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxTitle" ErrorMessage="*Required" CssClass="auto-style4"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Category::</td>
                    <td class="auto-style3">
                        <asp:TextBox ID="TextBoxCategory" runat="server" Width="1085px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBoxCategory" ErrorMessage="*Required" CssClass="auto-style4"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3">
                        <asp:Label ID="LabelAvail" runat="server" Text="."></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">Post::</td>
                    <td class="auto-style3">
                        <asp:TextBox ID="TextBoxPost" runat="server" Height="360px" TextMode="MultiLine" Width="1085px"></asp:TextBox>
                        <asp:HtmlEditorExtender ID="TextBoxPost_HtmlEditorExtender" runat="server" EnableSanitization="false" Enabled="True" TargetControlID="TextBoxPost">
                        </asp:HtmlEditorExtender>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBoxPost" ErrorMessage="*Required" CssClass="auto-style4"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Attach Image::</td>
                    <td class="auto-style3">
                        <asp:FileUpload ID="FileUploadImage" runat="server" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">Attach File::</td>
                    <td class="auto-style3">
                        <asp:FileUpload ID="FileUploadFile" runat="server" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <asp:Button ID="ButtonPost" runat="server" OnClick="ButtonPost_Click" CssClass="BigButton" Text="Post Blog" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="TextBoxTitle" />
            <asp:PostBackTrigger ControlID="ButtonPost"></asp:PostBackTrigger>
            <asp:PostBackTrigger ControlID="ButtonPost"></asp:PostBackTrigger>
            <asp:PostBackTrigger ControlID="ButtonPost"></asp:PostBackTrigger>
        </Triggers>
        <Triggers>
            <asp:PostBackTrigger ControlID="ButtonPost" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
