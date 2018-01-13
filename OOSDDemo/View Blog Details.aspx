<%@ Page Title="Blog Details" Language="C#" MasterPageFile="~/Blog Details.Master" AutoEventWireup="true" CodeBehind="View Blog Details.aspx.cs" Inherits="OOSDDemo.View_Blog_Details1" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .BigButtonBR {
            background-color: green;
            border: 1px solid darkgreen;
            padding: 7px 25px;
            border-radius: 5px;
            color: white;
            font-weight: bolder;
            float: right;
            margin-top: 5px;
            margin-right: 34px;
        }

            .BigButtonBR:hover {
                background-color: white;
                border: 1px solid darkgreen;
                padding: 7px 25px;
                border-radius: 35px;
                color: darkgreen;
                cursor: pointer;
            }

        .auto-style1 {
            width: 100%;
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
            padding: 7px 25px;
            border-radius: 5px;
            color: white;
            font-weight: bolder;
            float: right;
            margin-top: 10px;
            margin-right: 8px;
        }

            .auto-style3:hover {
                background-color: white;
                border: 1px solid darkgreen;
                padding: 7px 25px;
                border-radius: 35px;
                color: darkgreen;
                cursor: pointer;
            }

        .auto-style7:hover {
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

        .auto-style4 {
            height: 20px;
        }

        .auto-style5 {
            text-decoration: underline;
        }

        .auto-style6 {
            text-align: center;
        }

        .ImageStyle {
            object-fit: cover;
            border-radius: 100px;
        }
        .ForLabel {
            background-color: #fbfbfb;
            border-radius: 18px;
            /*display: block;*/
            /*line-height: 16px;*/
            padding: 9px 12px;
            word-break: break-word;
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
                        <b class="UpdateProgress">Adding Comment...<br />
                        </b>
                    </p>
                </h3>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>














    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:GridView ID="GridViewBlog" runat="server" OnRowDataBound="GridViewBlog_RowDataBound" AutoGenerateColumns="False" Width="1240px" BorderStyle="None" EmptyDataText="No Blog" GridLines="None">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <div style="width: 100%;">
                                <table style="margin: 3px 5px; width: 100%;">
                                    <tr>
                                        <td style="width: 55px;" class="auto-style6">
                                            <asp:Label ID="LabelBlogTitle" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="XX-Large" Font-Strikeout="False" Font-Underline="True" Text='<%# Eval("B_Title").ToString() %>'></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style6" style="width: 55px;">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td style="width: 55px;">
                                            <asp:Image ID="ImageParent" runat="server" ImageUrl='<%# "data:Image/jpg;base64," + GetImageStringBase64(Eval("username").ToString()) %>' Width="150px" Height="150px" CssClass="ImageStyle" />
                                            <br />
                                            <table class="auto-style1">
                                                <tr>
                                                    <td>
                                                        <asp:HyperLink ID="HyperLinkBlogBy" runat="server" Font-Bold="True" ForeColor="#51990F" NavigateUrl='<%# "GetProfile.aspx?username=" + Eval("Username") %>' Text='<%# Eval("Name") %>'></asp:HyperLink>
                                                        <asp:Label ID="lblB_ID" runat="server" Text='<%# Eval("B_ID") %>' Visible="False"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style4">Categorized as
                                                        <asp:Label ID="LabelCategory" runat="server" Text='<%# Eval("B_Category") %>'></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="LabelDate" runat="server" ForeColor="#7E7E76" Text='<%# Eval("B_Date") %>' ToolTip="Asked On"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="LabelComment" runat="server" Text="Total Comment"></asp:Label>
                                                        &nbsp;<asp:Label ID="LabelCommentCount" runat="server" Text='<%# Eval("Total Comment") %>'></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style4"><span class="auto-style5"><strong>Attachment</strong></span>&nbsp;&nbsp;
                                                        <asp:LinkButton ID="LinkButtonFile" runat="server" Text='<%# Eval("B_FileName") %>'></asp:LinkButton>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style6">
                                                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# "data:Image/jpg;base64," + GetBlogImageString64(HttpUtility.UrlEncode( Eval("B_Title").ToString())) %>' Width="800px" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style4 , ForLabel">
                                                        <asp:Label ID="lblBlog" runat="server" Text='<%# Eval("B_Post") %>'></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td><a id='lnkComment<%# Eval("B_ID") %>' class="link" href="javascript:void(0)" onclick='showComment(<%# Eval("B_ID") %>); return false;'>Comment</a>&nbsp; 
                                                        <a id='lnkCancelComment<%# Eval("B_ID") %>' class="link" href="javascript:void(0)" onclick='closeComment(<%# Eval("B_ID") %>); return false;'>Cancel</a> </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div id='divComment<%# Eval("B_ID") %>' style="display: block; margin-top: 5px;">
                                                            <asp:TextBox ID="TextBoxComment" runat="server" BorderStyle="None" CssClass="NoResize , form-control" Height="150px" MaxLength="900" placeholder="Write Your Comment Here" TextMode="MultiLine" ToolTip="Write Your Comment Here" Width="1206px"></asp:TextBox>
                                                            <asp:HtmlEditorExtender ID="HtmlEditorExtender1" runat="server" Enabled="True" EnableSanitization="false" TargetControlID="TextBoxComment" DisplaySourceTab="true">
                                                            </asp:HtmlEditorExtender>
                                                            <asp:Button ID="ButtonSubmit" runat="server" CssClass="auto-style3" OnClick="ButtonSubmit_Click" Text="Comment" />
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style5"><strong>Comments</strong></td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div>






                                <asp:GridView ID="GridViewChild" runat="server" AutoGenerateColumns="False" Width="1206px" EmptyDataText="No Comments." GridLines="None">
                                    <Columns>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <div style="width: 100%; background-color: #fbfbfb; border-radius: 18px; display: block; padding: 9px 5px; margin-bottom: 5px">
                                                    <table style="margin: 3px 5px; width: 100%;">
                                                        <tr>
                                                            <td style="width: 55px; vertical-align: text-top;">
                                                                <asp:Image ID="ImageChild" runat="server" ImageUrl='<%# "data:Image/jpg;base64," + GetImageStringBase64(Eval("username").ToString()) %>' Width="100px" Height="100px" CssClass="ImageStyle" />
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
                                                                <asp:Label ID="lblB_ID" runat="server" Visible="False" Text='<%# Eval("B_Id") %>'></asp:Label>
                                                                <asp:Label ID="lblC_ID" runat="server" Visible="False" Text='<%# Eval("C_ID") %>'></asp:Label>
                                                                <asp:Label ID="Label2" runat="server" ForeColor="#7E7E76" Text='<%# Eval("c_date") %>' ToolTip="Commented On"></asp:Label>

                                                                <br />
                                                                <asp:Label ID="lblComment" runat="server" Text='<%# Eval("comment") %>'></asp:Label>
                                                                <br />
                                                                <a class="link" id='lnkBlogReply<%# Eval("C_ID") %>' href="javascript:void(0)" onclick="showBlogReply(<%# Eval("C_ID") %>); return false;">Reply</a>&nbsp;
                                                                <a class="link" id='lnkCancelBlogReply<%# Eval("C_ID") %>' href="javascript:void(0)" onclick="closeBlogReply(<%# Eval("C_ID") %>); return false;">Cancel</a>
                                                                <br />
                                                                <div id='divBlogReply<%# Eval("C_ID") %>' style="display: block; margin-top: 5px;">
                                                                    <asp:TextBox ID="TextBoxReply" runat="server" Height="65px" TextMode="MultiLine" Width="1050px" CssClass="NoResize , form-control" placeholder="Write Your Reply Here" MaxLength="900" BorderStyle="None" ToolTip="Write Your Reply Here" Font-Names="Calibri"></asp:TextBox>
                                                                    <%--<asp:HtmlEditorExtender ID="HtmlEditorExtender1" runat="server" EnableSanitization="false" Enabled="True" TargetControlID="TextBoxComment"></asp:HtmlEditorExtender>--%>
                                                                    <asp:Button ID="ButtonReply" runat="server" OnClick="ButtonReply_Click" CssClass="BigButtonBR" Text="Reply" />
                                                                    <br />

                                                                </div>
                                                                <br />
                                                                <br />





                                                                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                                                    <ContentTemplate>

                                                                        <asp:GridView ID="GridViewReply" runat="server" GridLines="None" AutoGenerateColumns="False" Width="75%" EmptyDataText="No Reply. Be first to reply this comment" DataSourceID="SqlDataSourceReply">
                                                                            <Columns>
                                                                                <asp:TemplateField>
                                                                                    <ItemTemplate>
                                                                                        <div style="width: 100%; background-color: #e9ebee; border-radius: 18px; display: block; padding: 9px 5px; margin-bottom: 3px;">
                                                                                            <table style="margin: 3px 5px; width: 100%;">
                                                                                                <tr>
                                                                                                    <td style="width: 55px; vertical-align: text-top;">
                                                                                                        <asp:Image ID="ImageChild" runat="server" ImageUrl='<%# "data:Image/jpg;base64," + GetImageStringBase64(Eval("username").ToString()) %>' Width="50px" Height="50px" CssClass="ImageStyle" />
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
                                                                                                        <asp:Label ID="lblC_ID" runat="server" Visible="False" Text='<%# Eval("C_Id") %>'></asp:Label>
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




                                                                <asp:SqlDataSource ID="SqlDataSourceReply" runat="server" ConnectionString="<%$ ConnectionStrings:TESTConnectionString %>" SelectCommand="SELECT * FROM [BlogCommentReply] WHERE ([C_Id] = @C_Id) ORDER BY [R_ID] DESC">
                                                                    <SelectParameters>
                                                                        <asp:ControlParameter ControlID="lblC_ID" Name="C_Id" PropertyName="Text" Type="Int32" />
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
            <asp:AsyncPostBackTrigger ControlID="GridViewBlog" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
