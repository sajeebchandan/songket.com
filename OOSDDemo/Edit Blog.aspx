<%@ Page Title="Edit Blog" Language="C#" MasterPageFile="~/Profile.Master" AutoEventWireup="true" CodeBehind="Edit Blog.aspx.cs" Inherits="OOSDDemo.Edit_Blog" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }

        .auto-style2 {
            text-align: justify;
        }

        .auto-style3 {
            text-align: center;
        }

        .auto-style4 {
            text-decoration: underline;
        }

        .auto-style5 {
            text-align: center;
            height: 32px;
        }

        .ImageStyle {
            object-fit: cover;
            border-radius: 100px;
        }

        .linkbutton {
            background-color: green;
            border: 1px solid darkgreen;
            padding: 7px 25px;
            border-radius: 5px;
            color: white;
            float: left;
            margin-bottom: 25px;
            font-weight: bolder;
        }

            .linkbutton:hover {
                background-color: white;
                border: 1px solid darkgreen;
                padding: 7px 25px;
                border-radius: 35px;
                color: darkgreen;
                cursor: pointer;
            }

        .linkbuttonUpdate {
            background-color: green;
            border: 1px solid darkgreen;
            padding: 7px 25px;
            border-radius: 5px;
            color: white;
            float: left;
            margin-bottom: 25px;
            margin-top: 10px;
            font-weight: bolder;
        }

            .linkbuttonUpdate:hover {
                background-color: white;
                border: 1px solid darkgreen;
                padding: 7px 25px;
                border-radius: 35px;
                color: darkgreen;
                cursor: pointer;
            }
            .NoResize
            {
                resize:none;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:Label ID="LabelMessage" runat="server" Text="." Font-Bold="True" Font-Size="Large"></asp:Label>
    <asp:DataList ID="DataList1" runat="server" Width="1210px" OnItemCommand="DataList1_ItemCommand">
        <EditItemTemplate>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style5">
                        <asp:Label ID="LabelTitleEdit" runat="server" Font-Bold="True" Font-Names="Consolas" Font-Size="X-Large" Text='<%# Eval("B_Title") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Image ID="Image2" runat="server" CssClass="ImageStyle" Height="150px" ImageUrl='<%# "data:Image/jpg;base64," + GetImageStringBase64(Eval("username").ToString()) %>' Width="150px" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;Categorized as
                        <asp:Label ID="LabelCategory" runat="server" Text='<%# Eval("B_Category") %>'></asp:Label>
                        &nbsp;
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("B_ID") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;Posted on
                        <asp:Label ID="LabelDate" runat="server" Text='<%# Eval("B_Date") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;Posted By
                        <asp:LinkButton ID="LinkButtonName" runat="server" NavigateUrl='<%# "GetProfile.aspx?username=" + Eval("username") %>' PostBackUrl='<%# "GetProfile.aspx?username=" + Eval("Username") %>' Text='<%# Eval("Name") %>'></asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# "data:Image/jpg;base64," + GetBlogImageString64(HttpUtility.UrlEncode( Eval("B_Title").ToString())) %>' Width="640px" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <hr />
                        <asp:Label ID="LabelPost" runat="server" Text='<%# Eval("B_Post") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:LinkButton ID="LinkButtonEdit" runat="server" CommandName="edit" CssClass="linkbutton">Update</asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <hr />
                        <span class="auto-style4"><strong>Attachment</strong></span>
                        <asp:LinkButton ID="LinkButtonFile" runat="server" Text='<%# Eval("B_FileName") %>'></asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;
                        <hr />
                        <hr />
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </EditItemTemplate>
        <ItemTemplate>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style5">
                        <asp:Label ID="LabelTitleEdit" runat="server" Font-Bold="True" Font-Names="Consolas" Font-Size="X-Large" Text='<%# Eval("B_Title") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">
                        <asp:Label ID="LabelID" runat="server" Text='<%# Eval("B_ID") %>' Visible="False"></asp:Label>
                    </td>
                </tr>
                <%--<tr>
                    <td class="auto-style6">
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# "GetBlogImage.aspx?B_Title=" + HttpUtility.UrlEncode( Eval("B_Title").ToString()) %>' Width="640px" />
                    </td>
                </tr>--%>
                <tr>
                    <td class="auto-style4">
                        <hr />
                        <asp:TextBox ID="TextBoxPost" runat="server" Height="360px" Text='<%# Eval("B_Post") %>' TextMode="MultiLine" Width="1200px" CssClass="form-control , NoResize"></asp:TextBox>
                        <asp:HtmlEditorExtender ID="TextBoxPost_HtmlEditorExtender" runat="server" Enabled="True" EnableSanitization="False" TargetControlID="TextBoxPost" DisplaySourceTab="True">
                        </asp:HtmlEditorExtender>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:LinkButton ID="LinkButtonUpdate" runat="server" CommandName="update" CssClass="linkbuttonUpdate">Update</asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:LinkButton ID="LinkButtonCancel" runat="server" CommandName="cancel" CssClass="linkbuttonUpdate">Cancel</asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <hr />
                        <span class="auto-style4"><strong>Attachment</strong></span>
                        <asp:LinkButton ID="LinkButtonFile" runat="server" Text='<%# Eval("B_FileName") %>'></asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;
                            <hr />
                        <hr />
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:DataList>
</asp:Content>
