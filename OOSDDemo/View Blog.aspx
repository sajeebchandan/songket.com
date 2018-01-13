<%@ Page Title="View Blog" Language="C#" MasterPageFile="~/Blog.Master" AutoEventWireup="true" CodeBehind="View Blog.aspx.cs" Inherits="OOSDDemo.View_Blog1" %>

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
        .ForLabel {
            background-color: #fbfbfb;
            border-radius: 18px;
            display: block;
            /*line-height: 16px;*/
            padding: 9px 12px;
            word-break: break-word;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="LabelMessage" runat="server" Text="." Font-Bold="True" Font-Size="Large"></asp:Label>
    <asp:DataList ID="DataList1" runat="server" Width="1210px">
        <ItemTemplate>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style5">
                        <asp:Label ID="LabelTitle" runat="server" Font-Bold="True" Font-Names="Consolas" Font-Size="X-Large" Text='<%# Eval("B_Title") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Image ID="Image2" runat="server" CssClass="ImageStyle" Height="150px" Width="150px" ImageUrl='<%# "data:Image/jpg;base64," + GetImageStringBase64(Eval("username").ToString()) %>' />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;Categorized as
                        <asp:Label ID="LabelCategory" runat="server" Text='<%# Eval("B_Category") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;Posted on
                        <asp:Label ID="LabelDate" runat="server" Text='<%# Eval("B_Date") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;Posted By
                        <asp:LinkButton ID="LinkButtonName" runat="server" NavigateUrl='<%# "GetProfile.aspx?username=" + Eval("username") %>' Text='<%# Eval("Name") %>' PostBackUrl='<%# "GetProfile.aspx?username=" + Eval("Username") %>'></asp:LinkButton>
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
                    <td>Please
                        <asp:HyperLink ID="HyperLink1" runat="server" Font-Italic="True" NavigateUrl="~/Login.aspx">Login</asp:HyperLink>
                        &nbsp;to comment</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:DataList>
</asp:Content>
