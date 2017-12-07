<%@ Page Title="" Language="C#" MasterPageFile="~/Profile.Master" AutoEventWireup="true" CodeBehind="Discussions.aspx.cs" Inherits="OOSDDemo.Q" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .ImageStyle {
            object-fit: cover;
            border-radius: 100px;
        }

        .auto-style2 {
            background-color: green;
            border: 1px solid darkgreen;
            padding: 7px 25px;
            border-radius: 5px;
            color: white;
            float: left;
            margin-bottom: 25px;
            font-weight:bolder;
        }

            .auto-style2:hover {
                background-color: white;
                border: 1px solid darkgreen;
                padding: 7px 25px;
                border-radius: 35px;
                color: darkgreen;
                cursor: pointer;
            }

        .NoResize {
            resize: none;
            background-color: white;
        }

        .auto-style5 {
            width: 1260px;
        }

        .auto-style4 {
            width: 115px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
        <ProgressTemplate>
            <div id="Background"></div>
            <div id="Progress" class="auto-style1">
                <h3>
                    <p style="text-align: center">
                        <b class="UpdateProgress">Posting ...<br />
                        </b>
                    </p>
                </h3>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>







    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

            <asp:TextBox ID="txtQuestion" runat="server" TextMode="MultiLine" Width="1230px" Height="150px" EnableViewState="True"></asp:TextBox>
            <asp:HtmlEditorExtender ID="txtQuestion_HtmlEditorExtender" runat="server" EnableSanitization="false" Enabled="True" TargetControlID="txtQuestion">
            </asp:HtmlEditorExtender>
            <br />
            <br />
            <asp:Button ID="btnQuestionPublish" Text="Ask Quest" runat="server" CssClass="auto-style2" OnClick="btnQuestionPublish_Click" />
            <br />


            <asp:DataList ID="DataList1" runat="server" OnItemCommand="DataList1_ItemCommand" Width="1230px">
                <ItemTemplate>
                    <table class="auto-style5">
                        <tr>
                            <td class="auto-style4">
                                <asp:Image ID="Image1" runat="server" Height="100px" Width="100px" ImageUrl='<%# "GetImage.aspx?username=" + Eval("username") %>' CssClass="ImageStyle" />
                            </td>
                            <td>
                                <asp:HyperLink ID="HyperLinkAskedBy" runat="server" Font-Bold="True" ForeColor="#51990F" NavigateUrl='<%# "GetProfile.aspx?username=" + Eval("username") %>' Text='<%# Eval("Name") %>'></asp:HyperLink>
                                <br />
                                <asp:Label ID="Labelq_date" runat="server" Text='<%# Eval("q_date") %>' ForeColor="#7E7E76"></asp:Label>
                                <asp:Label ID="lblQ_ID" runat="server" Text='<%# Eval("Q_ID") %>' Visible="False"></asp:Label>
                                <br />
                                <asp:Label ID="LabelAnswer" runat="server" Text="Total Answer"></asp:Label>
                                &nbsp;<asp:Label ID="LabelAnswerCount" runat="server" Text='<%# Eval("Total Answer") %>'></asp:Label>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <table class="auto-style5">
                        <tr>
                            <td>
                                <asp:Label ID="lblQuestion" runat="server" Text='<%# Eval("question") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:LinkButton ID="LinkButtonReply" runat="server" CommandName="reply" CssClass="auto-style2">Answer</asp:LinkButton>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <hr style="color:blue; font-weight:bolder" />
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
                
            </asp:DataList>
            
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btnQuestionPublish" EventName="Click" />
        </Triggers>
    </asp:UpdatePanel>








</asp:Content>
