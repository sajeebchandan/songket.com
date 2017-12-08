<%@ Page Title="Anonymous Inbox" Language="C#" MasterPageFile="~/Profile.Master" AutoEventWireup="true" CodeBehind="Anonymous Inbox.aspx.cs" Inherits="OOSDDemo.Anonymous_Inbox" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }

        .auto-style2 {
            height: 20px;
        }

        

        /*.form-control {
            display: block;
            width: 100%;
            height: 34px;
            padding: 6px 12px;
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
            }*/
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:DataList ID="DataList1" runat="server" Width="1210px">
        <ItemTemplate>
            <table class="auto-style1" style="border-style: solid; border-color: #F3F3F3; border-width: thin thin 5px thin">
                <tr>
                    <td>
                        <asp:Label ID="LabelSender" runat="server" Text='<%# Eval("sender") %>'></asp:Label>
                        <hr style="border-style: solid; border-color: #F3F3F3; border-width: thin" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="LabelDate" runat="server" ForeColor="#7E7E76" Text='<%# Eval("senttime") %>'></asp:Label>
                        <hr style="border-style: solid; border-color: #F3F3F3; border-width: thin" />
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="LabelMessage" runat="server" Text='<%# Eval("textmessage") %>'></asp:Label>
                    </td>
                </tr>
            </table>
            <br />
            <br />
        </ItemTemplate>
    </asp:DataList>
</asp:Content>
