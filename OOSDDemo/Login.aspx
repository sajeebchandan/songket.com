<%@ Page Title="Login" Language="C#" MasterPageFile="~/SiteAuth.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="OOSDDemo.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
        <ProgressTemplate>
            <div id="Background"></div>
            <div id="Progress" >
                <h3>
                    <p style="text-align: center;">
                        <b class="UpdateProgress">Logging in ...<br />
                        </b>
                    </p>
                </h3>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>













    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div style="width: 700px; height: auto; margin-left: auto; margin-right: auto;">
                <table style="width: 100%">
                    <tr>
                        <td class="w3-right-align" style="width: 157px">&nbsp;</td>
                        <td style="width: 249px">
                            <asp:Label ID="LabelMessage" runat="server" Text="."></asp:Label>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="w3-right-align" style="width: 157px; height: 136px;"><strong>Username::</strong></td>
                        <td style="width: 249px; height: 136px;">
                            <asp:TextBox ID="TextBoxUsername" runat="server" Width="205px" CssClass="form-control"></asp:TextBox>
                        </td>
                        <td style="height: 136px"><strong><em>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorUsername" runat="server" ControlToValidate="TextBoxUsername" Display="Dynamic" ErrorMessage="*Required" Style="color: #FF0000"></asp:RequiredFieldValidator>
                        </em></strong>
                            <br />
                            <strong><em>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidatorUsername1" runat="server" ControlToValidate="TextBoxUsername" Display="Dynamic" ErrorMessage="Username Must Contain Alphanumaric With Dot(.) Only" Style="color: #FF0000" ValidationExpression="^[a-zA-Z][a-zA-Z]*[.]{0,1}[a-zA-Z][a-zA-Z]*[0-9]*$"></asp:RegularExpressionValidator>
                            </em></strong>
                            <br />
                            <strong><em>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidatorUsername2" runat="server" ControlToValidate="TextBoxUsername" Display="Dynamic" ErrorMessage="Username should be between (5-25) characters" Style="color: #FF0000" ValidationExpression="^[\s\S]{5,25}$"></asp:RegularExpressionValidator>
                            </em></strong></td>
                    </tr>
                    <tr>
                        <td class="w3-right-align" style="width: 157px"><strong>Password::</strong></td>
                        <td style="width: 249px">
                            <asp:TextBox ID="TextBoxPassword" runat="server" Width="205px" TextMode="Password" CssClass="form-control"></asp:TextBox>
                        </td>
                        <td><strong><em>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorPassword" runat="server" ControlToValidate="TextBoxPassword" Display="Dynamic" ErrorMessage="*Required" Style="color: #FF0000"></asp:RequiredFieldValidator>
                        </em></strong>
                            <br />
                            <strong><em>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TextBoxPassword" Display="Dynamic" ErrorMessage="Password Must Contains 2 Uppercase letters, 1 Special Character, 2 Digits, 3 Lowercase Letters" Style="color: #FF0000" ValidationExpression="^(?=.*[A-Z].*[A-Z])(?=.*[!@#$&amp;*])(?=.*[0-9].*[0-9])(?=.*[a-z].*[a-z].*[a-z]).{8}$" ToolTip="Password Must Contains 2 Uppercase letters, 1 Special Character, 2 Digits, 3 Lowercase Letters"></asp:RegularExpressionValidator>
                            </em></strong></td>
                    </tr>
                    <tr>
                        <td class="w3-right-align" style="width: 157px">&nbsp;</td>
                        <td style="width: 249px">
                            <asp:HyperLink ID="HyperLinkForgottenAccount" runat="server" Font-Italic="True" ForeColor="#3366FF" NavigateUrl="~/Forgotten Account/Check Username.aspx">Forgotten Account?</asp:HyperLink>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 157px">&nbsp;</td>
                        <td style="width: 249px">
                            <asp:Button ID="ButtonLogin" runat="server" Text="Login" ToolTip="Login as Normal User" OnClick="ButtonLogin_Click" CssClass="BigButton" />
                            <br />
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 157px">&nbsp;</td>
                        <td style="width: 249px">&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 157px">&nbsp;</td>
                        <td style="width: 249px">
                            <input id="Reset1" type="reset" value="Reset" class="BigButton" /></td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 157px">&nbsp;</td>
                        <td style="width: 249px">Don&#39;t have an account?<br />
                            <asp:HyperLink ID="HyperLinkRegister" runat="server" Font-Italic="True" ForeColor="#3366FF" NavigateUrl="~/Register.aspx">Click here</asp:HyperLink>
                            &nbsp;to Register!</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 157px">&nbsp;</td>
                        <td style="width: 249px">&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 157px">&nbsp;</td>
                        <td style="width: 249px">&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="ButtonLogin" EventName="Click" />
        </Triggers>
    </asp:UpdatePanel>

</asp:Content>
