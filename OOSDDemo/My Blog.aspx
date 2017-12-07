<%@ Page Title="" Language="C#" MasterPageFile="~/Profile.Master" AutoEventWireup="true" CodeBehind="My Blog.aspx.cs" Inherits="OOSDDemo.My_Blog1" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }

        .auto-style4 {
            text-align: justify;
        }

        .auto-style5 {
            text-align: center;
            height: 32px;
        }

        .ImageStyle {
            width: 640px;
        }

            .ImageStyle:hover {
                transform: scale(1.4);
                transition: all 1s ease-in-out;
                filter: brightness(.5);
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
            margin-left: 19px;
        }

            .linkbuttonUpdate:hover {
                background-color: white;
                border: 1px solid darkgreen;
                padding: 7px 25px;
                border-radius: 35px;
                color: darkgreen;
                cursor: pointer;
            }

        .linkbuttonCancel {
            background-color: green;
            border: 1px solid darkgreen;
            padding: 7px 25px;
            border-radius: 5px;
            color: white;
            float: left;
            margin-bottom: 25px;
            margin-top: 10px;
            font-weight: bolder;
            margin-left: 19px;
        }

            .linkbuttonCancel:hover {
                background-color: white;
                border: 1px solid darkgreen;
                padding: 7px 25px;
                border-radius: 35px;
                color: darkgreen;
                cursor: pointer;
            }

        .auto-style6 {
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>









    <div class="auto-style4">
        <asp:Label ID="LabelMessage" runat="server" Text="."></asp:Label>
        <asp:DataList ID="DataList1" runat="server" Width="1252px" OnItemCommand="DataList1_ItemCommand">
            <ItemTemplate>
                <table class="auto-style1">
                    <tr>
                        <td class="auto-style5">
                            <asp:LinkButton ID="LinkButtonTitle" runat="server" Font-Bold="True" Font-Names="Consolas" Font-Size="X-Large" Font-Underline="True" Text='<%# Eval("B_Title") %>' CommandName="view"></asp:LinkButton>
                        </td>
                    </tr>
                    <tr>
                        <td><strong>Added on</strong>
                            <asp:Label ID="LabelDate" runat="server" Text='<%# Eval("B_Date") %>' Font-Underline="False"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td><strong>Categorized As</strong>
                            <asp:Label ID="LabelCategory" runat="server" Text='<%# Eval("B_Category") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td><strong>Total Comment</strong>
                            <asp:Label ID="Label1" runat="server" Font-Underline="False" Text='<%# Eval("Total Comment") %>'></asp:Label>
                            &nbsp;</td>
                    </tr>

                    <tr>
                        <td class="auto-style4"><span class="auto-style5"><strong>Attachment</strong></span>&nbsp;&nbsp;
                                                        <asp:LinkButton ID="LinkButtonFile" runat="server" Text='<%# Eval("B_FileName") %>'></asp:LinkButton>
                        </td>
                    </tr>

                    <tr>
                        <td class="auto-style4" style="background-color: #fbfbfb">
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("B_Post") %>'></asp:Label>
                        </td>
                    </tr>

                    <tr>
                        <td class="auto-style4">
                            <br />
                            <asp:LinkButton ID="LinkButtonView" runat="server" CommandName="viewblog" CssClass="linkbutton">View</asp:LinkButton>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style4">
                            <asp:LinkButton ID="LinkButtonViewAndEdit" runat="server" CommandName="edit" CssClass="linkbutton">Edit</asp:LinkButton>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style3">
                            <hr />
                            &nbsp;</td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:DataList>

    </div>
</asp:Content>
