<%@ Page Title="" Language="C#" MasterPageFile="~/SiteAuth.Master" AutoEventWireup="true" CodeBehind="Security Answer.aspx.cs" Inherits="OOSDDemo.Forgotten_Account.Security_Answer" %>

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
                <h1 style="color: #0000FF">Select your security question and answer it</h1>
                <p style="color: #0000FF">
                    <asp:Label ID="LabelMessage" runat="server" Text="?"></asp:Label>
                </p>
                <table style="width: 100%">
                    <tr>
                        <td style="width: 163px; height: 26px;"><strong>Security Question::</strong></td>
                        <td style="width: 216px; height: 26px">
                            <asp:DropDownList ID="DropDownListSecurityQuestion" runat="server" Width="209px">
                                <asp:ListItem>Choose</asp:ListItem>
                                <asp:ListItem>What is your Pet&#39;s name?</asp:ListItem>
                                <asp:ListItem>Who is your Favourite Player?</asp:ListItem>
                                <asp:ListItem>Who is your Favourite Heroine?</asp:ListItem>
                                <asp:ListItem Value="Who is your favourite Writer?">Who is your Favourite Writer?</asp:ListItem>
                                <asp:ListItem>When you did your First Date?</asp:ListItem>
                                <asp:ListItem>Who was your First Love?</asp:ListItem>
                                <asp:ListItem>Which is your Favourite Novel?</asp:ListItem>
                                <asp:ListItem>Who is your Favourite Teacher?</asp:ListItem>
                                <asp:ListItem>Who is your Best Friend?</asp:ListItem>
                                <asp:ListItem>Which is your First Mobile?</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td style="height: 26px"><strong><em>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DropDownListSecurityQuestion" Display="Dynamic" ErrorMessage="*Required" InitialValue="Choose" Style="color: #FF0000"></asp:RequiredFieldValidator>
                        </em></strong></td>
                    </tr>
                    <tr>
                        <td style="width: 163px">&nbsp;</td>
                        <td style="width: 216px; text-decoration: underline">Answer::</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 163px; height: 26px;"></td>
                        <td style="width: 216px; height: 26px">
                            <asp:TextBox ID="TextBoxSecurityQuestion" runat="server" Width="205px"></asp:TextBox>
                        </td>
                        <td style="height: 26px"><strong><em>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic" ErrorMessage="*Required" Style="color: #FF0000" ControlToValidate="TextBoxSecurityQuestion"></asp:RequiredFieldValidator>
                        </em></strong>
                            <br />
                            <strong><em>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBoxSecurityQuestion" Display="Dynamic" ErrorMessage="Answar Must Contain Alphabate(A-z) With or Without Space and numbers(0-9)" Style="color: #FF0000" ValidationExpression="^[a-zA-Z][a-zA-Z]*[ ]{0,1}[a-zA-Z][a-zA-Z ]*[0-9]*$"></asp:RegularExpressionValidator>
                            </em></strong>
                            <br />
                            <strong><em>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBoxSecurityQuestion" Display="Dynamic" ErrorMessage="Answer should be between (3-20) characters" Style="color: #FF0000" ValidationExpression="^[\s\S]{3,20}$"></asp:RegularExpressionValidator>
                            </em></strong></td>
                    </tr>
                    <tr>
                        <td style="width: 163px">&nbsp;</td>
                        <td style="width: 216px">
                            <asp:Button ID="ButtonSubmit" runat="server" Text="Submit" CssClass="BigButton" OnClick="ButtonSubmit_Click" />
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 163px">&nbsp;</td>
                        <td style="width: 216px">&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="ButtonSubmit" EventName="Click" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
