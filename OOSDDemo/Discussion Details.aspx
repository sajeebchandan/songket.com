<%@ Page Title="Discussion Details" Language="C#" MasterPageFile="~/Profile.Master" AutoEventWireup="true" CodeBehind="Discussion Details.aspx.cs" Inherits="OOSDDemo.QD" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .NoResize {
            resize: none;
            background-color: white;
        }

        .ImageStyle {
            object-fit: cover;
            border-radius: 100px;
        }

        .BigButtonQ {
            background-color: green;
            border: 1px solid darkgreen;
            padding: 7px 25px;
            border-radius: 5px;
            color: white;
            float: right;
            margin-top: 10px;
            font-weight: bolder;
            margin-right: 8px;
        }

            .BigButtonQ:hover {
                background-color: white;
                border: 1px solid darkgreen;
                padding: 7px 25px;
                border-radius: 35px;
                color: darkgreen;
                cursor: pointer;
            }

        .ForLabel {
            background-color: #fbfbfb;
            border-radius: 18px;
            display: block;
            /*line-height: 16px;*/
            padding: 9px 12px;
            word-break: break-word;
        }


        .BigButtonQR {
            background-color: green;
            border: 1px solid darkgreen;
            padding: 7px 25px;
            border-radius: 5px;
            color: white;
            float: right;
            margin-top: 5px;
            margin-right: 34px;
            font-weight: bolder;
        }

            .BigButtonQR:hover {
                background-color: white;
                border: 1px solid darkgreen;
                padding: 7px 25px;
                border-radius: 35px;
                color: darkgreen;
                cursor: pointer;
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
                        <b class="UpdateProgress">Adding ...<br />
                        </b>
                    </p>
                </h3>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
















    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:GridView ID="GridViewQuestion" runat="server" OnRowDataBound="GridViewQuestion_RowDataBound" AutoGenerateColumns="False" Width="1240px" BorderStyle="None" EmptyDataText="No Blog" GridLines="None">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <div style="width: 100%;">
                                <table style="margin: 3px 5px; width: 100%;">
                                    <tr>
                                        <td class="auto-style6" style="width: 55px;">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td style="width: 55px;">
                                            <asp:Image ID="ImageParent" runat="server" ImageUrl='<%# "GetImage.aspx?username=" + Eval("Username") %>' Width="150px" Height="150px" CssClass="ImageStyle" />
                                            <br />
                                            <table class="auto-style1">
                                                <tr>
                                                    <td>
                                                        <asp:HyperLink ID="HyperLinkQuestionBy" runat="server" Font-Bold="True" ForeColor="#51990F" NavigateUrl='<%# "GetProfile.aspx?username=" + Eval("Username") %>' Text='<%# Eval("Name") %>'></asp:HyperLink>
                                                        <asp:Label ID="lblQ_ID" runat="server" Text='<%# Eval("Q_ID") %>' Visible="False"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="LabelDate" runat="server" ForeColor="#7E7E76" Text='<%# Eval("q_Date") %>' ToolTip="Asked On"></asp:Label>
                                                    </td>
                                                </tr>


                                                <tr>
                                                    <td>
                                                        <asp:Label ID="LabelAnswer" runat="server" Text="Total Answer"></asp:Label>
                                                        &nbsp;<asp:Label ID="LabelAnswerCount" runat="server" Text='<%# Eval("Total Answer") %>' Font-Bold="true"></asp:Label>
                                                    </td>
                                                </tr>


                                                <tr>
                                                    <td class="auto-style4 , ForLabel">
                                                        <asp:Label ID="lblQuestion" runat="server" Text='<%# Eval("question") %>'></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td><a id='lnkAnswer<%# Eval("Q_ID") %>' class="link" href="javascript:void(0)" onclick='showAnswer(<%# Eval("Q_ID") %>); return false;'>Reply</a>&nbsp; 
                                                <a id='lnkCancelAnswer<%# Eval("Q_ID") %>' class="link" href="javascript:void(0)" onclick='closeAnswer(<%# Eval("Q_ID") %>); return false;'>Cancel</a> </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div id='divAnswer<%# Eval("Q_ID") %>' style="display: block; margin-top: 5px;">
                                                            <asp:TextBox ID="TextBoxAnswer" runat="server" BorderStyle="None" CssClass="NoResize, form-control" Height="150px" MaxLength="900" placeholder="Write Your Comment Here" TextMode="MultiLine" ToolTip="Write Your Comment Here" Width="1206px"></asp:TextBox>
                                                            <asp:HtmlEditorExtender ID="TextBoxAnswer_HtmlEditorExtender" runat="server" EnableSanitization="false" Enabled="True" TargetControlID="TextBoxAnswer" DisplaySourceTab="true">
                                                            </asp:HtmlEditorExtender>
                                                            <asp:Button ID="ButtonSubmit" runat="server" CssClass="BigButtonQ" OnClick="ButtonSubmit_Click" Text="Answer" />
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style5"><strong>Replies</strong></td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div>






                                <asp:GridView ID="GridViewChild" runat="server" AutoGenerateColumns="False" Width="1206px" EmptyDataText="No Replies." GridLines="None">
                                    <Columns>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <div style="width: 100%; background-color: #fbfbfb; border-radius: 18px; display: block; padding: 9px 5px; margin-bottom: 5px">
                                                    <table style="margin: 3px 5px; width: 100%;">
                                                        <tr>
                                                            <td style="width: 55px; vertical-align: text-top;">
                                                                <asp:Image ID="ImageChild" runat="server" ImageUrl='<%# "GetImage.aspx?username=" + Eval("Username") %>' Width="100px" Height="100px" CssClass="ImageStyle" />
                                                                <table class="auto-style1">
                                                                    <tr>
                                                                        <td>
                                                                            <asp:HyperLink ID="HyperLinkNameAnswer" runat="server" Text='<%# Eval("Name") %>' ForeColor="#6B75C9" NavigateUrl='<%# "GetProfile.aspx?username=" + Eval("Username") %>'></asp:HyperLink>
                                                                            <%--<asp:Label ID="LabelUsernameAnswerer" runat="server" Text='<%# Eval("Name") %>'></asp:Label>--%>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                            <td style="padding: 0px 5px; text-align: left; vertical-align: top;">
                                                                <asp:Label ID="lblQ_ID" runat="server" Visible="False" Text='<%# Eval("Q_Id") %>'></asp:Label>
                                                                <asp:Label ID="lblA_ID" runat="server" Visible="False" Text='<%# Eval("A_ID") %>'></asp:Label>
                                                                <asp:Label ID="Label2" runat="server" ForeColor="#7E7E76" Text='<%# Eval("a_date") %>' ToolTip="Commented On"></asp:Label>
                                                                <br />
                                                                <asp:Label ID="lblComment" runat="server" Text='<%# Eval("answer") %>'></asp:Label>
                                                                <br />
                                                                <a class="link" id='lnkAnswerReply<%# Eval("A_ID") %>' href="javascript:void(0)" onclick="showAnswerReply(<%# Eval("A_ID") %>); return false;">Reply</a>&nbsp;
                                                                <a class="link" id='lnkCancelAnswerReply<%# Eval("A_ID") %>' href="javascript:void(0)" onclick="closeAnswerReply(<%# Eval("A_ID") %>); return false;">Cancel</a>
                                                                <br />
                                                                <div id='divAnswerReply<%# Eval("A_ID") %>' style="display: block; margin-top: 5px;">
                                                                    <asp:TextBox ID="TextBoxReply" runat="server" Height="65px" TextMode="MultiLine" Width="1050px" CssClass="NoResize , form-control" placeholder="Write Your Reply Here" MaxLength="900" BorderStyle="None" ToolTip="Write Your Reply Here" Font-Names="Calibri"></asp:TextBox>
                                                                    <%--<asp:HtmlEditorExtender ID="HtmlEditorExtender1" runat="server" EnableSanitization="false" Enabled="True" TargetControlID="TextBoxComment"></asp:HtmlEditorExtender>--%>
                                                                    <asp:Button ID="ButtonReply" runat="server" OnClick="ButtonReply_Click" CssClass="BigButtonQR" Text="Reply" />
                                                                    <br />

                                                                </div>
                                                                <br />
                                                                <br />




                                                                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                                                    <ContentTemplate>

                                                                        <asp:GridView ID="GridViewReply" runat="server" GridLines="None" AutoGenerateColumns="False" Width="78%" EmptyDataText="No Reply. Be first to reply this comment" DataSourceID="SqlDataSourceReply">
                                                                            <Columns>
                                                                                <asp:TemplateField>
                                                                                    <ItemTemplate>
                                                                                        <div style="width: 100%; background-color: #e9ebee; border-radius: 18px; display: block; padding: 9px 5px; margin-bottom: 3px;">
                                                                                            <table style="margin: 3px 5px; width: 100%;">
                                                                                                <tr>
                                                                                                    <td style="width: 55px; vertical-align: text-top;">
                                                                                                        <asp:Image ID="ImageChild" runat="server" ImageUrl='<%# "GetImage.aspx?username=" + Eval("Username") %>' Width="50px" Height="50px" CssClass="ImageStyle" />
                                                                                                        <table class="auto-style1">
                                                                                                            <tr>
                                                                                                                <td>
                                                                                                                    <asp:HyperLink ID="HyperLinkNameAnswer" runat="server" Text='<%# Eval("Name") %>' ForeColor="#6B75C9" NavigateUrl='<%# "GetProfile.aspx?username=" + Eval("Username") %>'></asp:HyperLink>
                                                                                                                    <%--<asp:Label ID="LabelUsernameAnswerer" runat="server" Text='<%# Eval("Name") %>'></asp:Label>--%>
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                        </table>
                                                                                                    </td>
                                                                                                    <td style="padding: 0px 5px; text-align: left; vertical-align: top;">
                                                                                                        <asp:Label ID="lblC_ID" runat="server" Visible="False" Text='<%# Eval("A_Id") %>'></asp:Label>
                                                                                                        <asp:Label ID="lblR_ID" runat="server" Visible="False" Text='<%# Eval("R_ID") %>'></asp:Label>
                                                                                                        <asp:Label ID="LabelReplyDate" runat="server" ForeColor="#7E7E76" Text='<%# Eval("r_date", "{0:d}") %>' ToolTip="Replied On"></asp:Label>
                                                                                                        <br />
                                                                                                        <asp:Label ID="lblReply" runat="server" Text='<%# Eval("reply") %>'></asp:Label><br />

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
                                                                        <asp:AsyncPostBackTrigger ControlID="ButtonReply" EventName="Click" />
                                                                    </Triggers>
                                                                </asp:UpdatePanel>



                                                                <asp:SqlDataSource ID="SqlDataSourceReply" runat="server" ConnectionString="<%$ ConnectionStrings:TESTConnectionString %>" SelectCommand="SELECT * FROM [AnswerTableReply] WHERE ([A_Id] = @A_Id) ORDER BY [R_ID] DESC">
                                                                    <SelectParameters>
                                                                        <asp:ControlParameter ControlID="lblA_ID" Name="A_Id" PropertyName="Text" Type="Int32" />
                                                                    </SelectParameters>
                                                                </asp:SqlDataSource>

                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>









                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </ContentTemplate>

        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="GridViewQuestion" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
