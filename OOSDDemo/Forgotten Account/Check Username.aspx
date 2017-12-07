<%@ Page Title="" Language="C#" MasterPageFile="~/SiteAuth.Master" AutoEventWireup="true" CodeBehind="Check Username.aspx.cs" Inherits="OOSDDemo.Forgotten_Account.Check_Username" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        #ProgressFA {
            position: fixed;
            top: 40%;
            left: 40%;
            height: 20%;
            width: 20%;
            z-index: 100001;
            background-color: #FFFFFF;
            border: 1px solid Gray;
            background-image: url('../Supported%20Files/ajax-load.gif');
            background-repeat: no-repeat;
            background-position: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
        <ProgressTemplate>
            <div id="Background"></div>
            <div id="ProgressFA">
                <h3>
                    <p style="text-align: center;">
                        <b class="UpdateProgress">Checking ...<br />
                        </b>
                    </p>
                </h3>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>












    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div style="width: 700px; height: auto; margin-left: auto; margin-right: auto">
                <h1 style="color: #0000FF">Check your username</h1>
                <p style="color: #0000FF">
                    &nbsp;
                </p>
                <table style="width: 100%">
                    <tr>
                        <td class="w3-right-align" style="width: 127px"><strong>Username::</strong></td>
                        <td style="width: 226px">
                            <asp:TextBox ID="TextBoxCheckUsername" runat="server" Width="205px"></asp:TextBox>
                        </td>
                        <td><strong><em>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxCheckUsername" Display="Dynamic" ErrorMessage="*Required" Style="color: #FF0000"></asp:RequiredFieldValidator>
                        </em></strong>
                            <br />
                            <strong><em>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" Display="Dynamic" ErrorMessage="Username Must Contain Alphanumaric With Dot(.) Only" Style="color: #FF0000" ValidationExpression="^[a-zA-Z][a-zA-Z]*[.]{0,1}[a-zA-Z][a-zA-Z]*[0-9]*$" ControlToValidate="TextBoxCheckUsername"></asp:RegularExpressionValidator>
                                <br />
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBoxCheckUsername" ErrorMessage="Username should be between (5-25) characters" Style="color: #FF0000" ValidationExpression="^[\s\S]{5,25}$"></asp:RegularExpressionValidator>
                            </em></strong></td>
                    </tr>
                    <tr>
                        <td style="width: 127px">&nbsp;</td>
                        <td style="width: 226px">
                            <asp:Button ID="ButtonCheck" runat="server" Text="Check" CssClass="BigButton" OnClick="ButtonCheck_Click" />
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 127px">&nbsp;</td>
                        <td style="width: 226px">
                            <asp:Label ID="LabelMessage" runat="server" Text="?"></asp:Label>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 127px">&nbsp;</td>
                        <td style="width: 226px">
                            <asp:Button ID="ButtonNext" runat="server" CssClass="BigButton" OnClick="ButtonNext_Click" Text="&gt;&gt;" />
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="ButtonCheck" EventName="Click" />
        </Triggers>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="ButtonNext" EventName="Click" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
