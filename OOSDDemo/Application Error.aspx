<%@ Page Title="" Language="C#" MasterPageFile="~/Error.Master" AutoEventWireup="true" CodeBehind="Application Error.aspx.cs" Inherits="OOSDDemo.Application_Error" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="border: 1px solid black">
        <tr style="color: red">
            <td>
                <h2>Application Error!
                </h2>
            </td>
        </tr>

        <tr>
            <td>
                <h3>An Error has been occured. We are already aware of this. Our IT team is working on this.
                </h3>
            </td>
        </tr>

        <tr>
            <td>
                <h5>Sorry about that.
                </h5>
            </td>
        </tr>
    </table>
</asp:Content>
