<%@ Page Title="" Language="C#" MasterPageFile="~/Profile.Master" AutoEventWireup="true" CodeBehind="Discussions.aspx.cs" Inherits="OOSDDemo.Users" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }

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
        }

            .auto-style2:hover {
                background-color: white;
                border: 1px solid darkgreen;
                padding: 7px 25px;
                border-radius: 35px;
                color: darkgreen;
                cursor: pointer;
            }

        .auto-style3 {
            background-color: green;
            border: 1px solid darkgreen;
            /*padding: 7px 25px;*/
            border-radius: 5px;
            color: white;
            float: right;
            margin-top: 8px;
            margin-right: 81px;
        }

            .auto-style3:hover {
                background-color: white;
                border: 1px solid darkgreen;
                /*padding: 7px 25px;*/
                border-radius: 35px;
                color: darkgreen;
                cursor: pointer;
            }

        .NoResize {
            resize: none;
            background-color: white;
        }

        .auto-style4 {
            height: 20px;
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
                        <b class="UpdateProgress">Please Wait...<br />
                        </b>
                    </p>
                </h3>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>























    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:TextBox ID="txtQuestion" runat="server" TextMode="MultiLine" Width="1230px" Height="150px" EnableViewState="True"></asp:TextBox>
            <asp:HtmlEditorExtender ID="txtQuestion_HtmlEditorExtender" EnableSanitization="false" runat="server" Enabled="True" TargetControlID="txtQuestion" EnableViewState="False">
            </asp:HtmlEditorExtender>
            <%--<asp:Image ID="Image1" runat="server" ImageUrl='<%# "GetImage.aspx?username=" + Session["New"].ToString() %>' Style="width: 100px; height: 100px; border-radius: 50%;" />--%>
            <br />
            <asp:Button ID="btnCommentPublish" Text="Ask Quest" runat="server" CssClass="auto-style2" OnClick="btnCommentPublish_Click" />
            <asp:GridView ID="GridViewQuestion" runat="server" GridLines="None" OnRowDataBound="GridViewQuestion_RowDataBound" AutoGenerateColumns="False" Width="1240px" BorderStyle="None" EmptyDataText="No Discussion">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <div style="width: 100%;">
                                <table style="margin: 3px 5px; width: 100%;" onload="closedivreply()">
                                    <tr>
                                        <td style="width: 55px;">
                                            <asp:Image ID="ImageParent" runat="server" CssClass="ImageStyle" ImageUrl='<%# "GetImage.aspx?username=" + Eval("username") %>' Width="150px" />
                                            <br />
                                            <table class="auto-style1">
                                                <tr>
                                                    <td>
                                                        <asp:HyperLink ID="HyperLinkAskedBy" runat="server" ForeColor="#51990F" NavigateUrl='<%# "GetProfile.aspx?username=" + Eval("username") %>' Text='<%# Eval("Name") %>' Font-Bold="True"></asp:HyperLink>
                                                        <asp:Label ID="lblQ_ID" runat="server" Text='<%# Eval("Q_ID") %>' Visible="False"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Label1" runat="server" ForeColor="#7E7E76" Text='<%# Eval("q_date") %>' ToolTip="Asked On"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td <%--style="/*border: solid; border-color: lightgreen; border-width: 1px*/ background-color:#fbfbfb"--%> class="auto-style4">
                                                        <asp:Label ID="lblQuestion" runat="server" Text='<%# Eval("question") %>'></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <a class="link" id='lnkAnswer<%# Eval("Q_ID") %>' href="javascript:void(0)" onclick="showReply(<%# Eval("Q_ID") %>); return false;">Reply</a>&nbsp;
                                                <a class="link" id='lnkCancel<%# Eval("Q_ID") %>' href="javascript:void(0)" onclick="closeReply(<%# Eval("Q_ID") %>); return false;">Cancel</a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div id='divReply<%# Eval("Q_ID") %>' style="display: block; margin-top: 5px;">
                                                            <asp:TextBox ID="TextBoxAnswer" runat="server" Height="150px" TextMode="MultiLine" Width="1060px" CssClass="NoResize" placeholder="Write Your Reply Here" MaxLength="900" BorderStyle="None" ToolTip="Write Your Reply Here"></asp:TextBox>
                                                            <asp:HtmlEditorExtender ID="TextBoxAnswer_HtmlEditorExtender" EnableSanitization="false" runat="server" Enabled="True" TargetControlID="TextBoxAnswer">
                                                            </asp:HtmlEditorExtender>
                                                            <asp:Button ID="ButtonSubmit" runat="server" OnClick="ButtonSubmit_Click" CssClass="auto-style3" Text="Reply" />
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div>
                                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                    <ContentTemplate>
                                        <asp:GridView ID="GridViewChild" runat="server" GridLines="None" AutoGenerateColumns="False" Width="75%" BackColor="#fbfbff" EmptyDataText="No Reply. Be first to reply the question">
                                            <Columns>
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <div style="width: 100%;">
                                                            <table style="margin: 3px 5px; width: 100%;">
                                                                <tr>
                                                                    <td style="width: 55px; vertical-align: text-top;">
                                                                        <asp:Image ID="ImageChild" runat="server" CssClass="ImageStyle" ImageUrl='<%# "GetImage.aspx?username=" + Eval("username") %>' Width="100px" />
                                                                        <table class="auto-style1">
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:HyperLink ID="HyperLinkNameAnswer" runat="server" Text='<%# Eval("Name") %>' ForeColor="#6B75C9" NavigateUrl='<%# "GetProfile.aspx?username=" + Eval("username") %>'></asp:HyperLink>
                                                                                    <%--<asp:Label ID="LabelUsernameAnswerer" runat="server" Text='<%# Eval("Name") %>'></asp:Label>--%>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                    <td style="padding: 0px 5px; text-align: left; vertical-align: top;">
                                                                        <asp:Label ID="lblQ_ID" runat="server" Visible="False" Text='<%# Eval("Q_Id") %>'></asp:Label>
                                                                        <asp:Label ID="lblA_ID" runat="server" Visible="False" Text='<%# Eval("A_ID") %>'></asp:Label>
                                                                        <asp:Label ID="Label2" runat="server" ForeColor="#7E7E76" Text='<%# Eval("a_date") %>' ToolTip="Replied On"></asp:Label>
                                                                        <br />
                                                                        <asp:Label ID="lblAnswer" runat="server" Text='<%# Eval("Answer") %>'></asp:Label><br />
                                                                    </td>
                                                                </tr>

                                                            </table>
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </ContentTemplate>

                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="ButtonSubmit" EventName="Click" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </div>
                            <br />
                            <hr style="color: #ccc" />
                            <hr style="color: #ccc" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <br />
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btnCommentPublish" EventName="Click" />
        </Triggers>

    </asp:UpdatePanel>

</asp:Content>
