<%@ Page Title="User Profile" Language="C#" MasterPageFile="~/GetProfileMaster.Master" AutoEventWireup="true" CodeBehind="GetProfile.aspx.cs" Inherits="OOSDDemo.GetProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            height: 20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin-left: 500px; float: left">
        <div style="margin-left:0px, auto; float:left">
            <h2>
                <asp:Label ID="LabelName" runat="server" Text="?"></asp:Label>
            </h2>
        </div>
        <asp:DataList ID="DataList1" runat="server">
            <ItemTemplate>
                <table class="auto-style1">
                    <tr>
                        <td class="auto-style3">
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# "GetImage.aspx?username=" + Eval("username") %>' Width="250px" />
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
                <br />
                <table class="auto-style1">
                    <tr>
                        <td>Name::</td>
                        <td>
                            <asp:Label ID="LabelName" runat="server" Text='<%# Eval("name") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">Username::</td>
                        <td class="auto-style2">
                            <asp:Label ID="LabelUsername" runat="server" Text='<%# Eval("username") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>Email::</td>
                        <td>
                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "mailto:"+Eval("email")+"?Subject=Hello%20From%20Quest.com" %>' Text='<%# Eval("email") %>'></asp:HyperLink>
                        </td>
                    </tr>
                    <tr>
                        <td>Gender::</td>
                        <td>
                            <asp:Label ID="LabelGender" runat="server" Text='<%# Eval("gender") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>Country::</td>
                        <td>
                            <asp:Label ID="LabelCountry" runat="server" Text='<%# Eval("country") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>Date Of Birth::</td>
                        <td>
                            <asp:Label ID="LabelDOB" runat="server" Text='<%# Eval("dob") %>'></asp:Label>
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:DataList>
    </div>
</asp:Content>
