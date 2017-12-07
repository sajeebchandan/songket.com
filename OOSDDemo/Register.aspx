<%@ Page Title="" Language="C#" MasterPageFile="~/SiteAuth.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="OOSDDemo.Register" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            bottom: 234px;
        }

        .captchabutton {
            border: none;
            background-color: white;
            color: blue;
        }

            .captchabutton:hover {
                color: #CACE73;
                text-decoration: none;
                border-bottom: dotted 1px;
                cursor: pointer;
            }

        .auto-style2 {
            text-align: right;
        }
        .auto-style3 {
            color: #FF0000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <%--<asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>--%>

    <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanelCaptcha" DisplayAfter="300">
        <ProgressTemplate>
            <div id="Background"></div>
            <div id="Progress" class="auto-style1">
                <h3>
                    <p style="text-align: center; color: black">
                        <b>Loading New Captcha...<br />
                        </b>
                    </p>
                </h3>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>











    <div style="width: 700px; height: auto; margin-left: auto; margin-right: auto;">
        <table style="width: 100%">
            <tr>
                <td class="w3-right-align" style="width: 161px">
                    <h1 style="color: #0000FF">Register</h1>
                </td>
                <td style="width: 110px">
                    <asp:Label ID="LabelMessage" runat="server" Text="."></asp:Label>
                </td>
                <td style="width: 228px">&nbsp;</td>
            </tr>
            <tr>
                <td class="w3-right-align" style="width: 161px"><strong>Name::</strong></td>
                <td style="width: 110px">
                    <asp:TextBox ID="TextBoxName" runat="server" Width="205px"></asp:TextBox>
                </td>
                <td style="width: 228px">
                    <strong><em>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidatorName" runat="server" ControlToValidate="TextBoxName" Display="Dynamic" ErrorMessage="Name Must Contain Alphabate(A-z) With or Without Space" Style="color: #FF3300" ValidationExpression="^[a-zA-Z][a-zA-Z]*[ ]{0,1}[a-zA-Z][a-zA-Z ]*[a-zA-Z]$"></asp:RegularExpressionValidator>
                    </em></strong>
                    <br />
                    <strong><em>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorName" runat="server" ControlToValidate="TextBoxName" Display="Dynamic" ErrorMessage="*Required" Style="color: #FF3300"></asp:RequiredFieldValidator>
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBoxName" ErrorMessage="Name should be between (7-26) characters" Style="color: #FF3300" ValidationExpression="^[\s\S]{7,26}$"></asp:RegularExpressionValidator>
                    </em></strong></td>
            </tr>
            <tr>
                <td class="w3-right-align" style="width: 161px"><strong>Username::</strong></td>
                <td style="width: 110px">
                    <asp:UpdatePanel ID="UpdatePanelUsernameChecker" runat="server">
                        <ContentTemplate>
                            <asp:TextBox ID="TextBoxUsername" runat="server" Width="205px" AutoPostBack="True" ValidateRequestMode="Enabled"></asp:TextBox><br />
                            <asp:Label ID="LabelUsername" runat="server" Text="."></asp:Label>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="TextBoxUsername" />
                        </Triggers>
                    </asp:UpdatePanel>
                </td>
                <td style="width: 228px">
                    <strong><em>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidatorUsername" runat="server" ControlToValidate="TextBoxUsername" ErrorMessage="Username Must Contain Alphanumaric With Dot(.) Only" Style="color: #FF3300" ValidationExpression="^[a-zA-Z][a-zA-Z]*[.]{0,1}[a-zA-Z][a-zA-Z]*[0-9]*$"></asp:RegularExpressionValidator>
                    </em></strong>
                    <br />
                    <strong><em>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorUsername" runat="server" ControlToValidate="TextBoxUsername" Display="Dynamic" ErrorMessage="*Required" Style="color: #FF3300"></asp:RequiredFieldValidator>
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBoxUsername" ErrorMessage="Username should be between (5-25) characters" Style="color: #FF3300" ValidationExpression="^[\s\S]{5,25}$"></asp:RegularExpressionValidator>
                    </em></strong></td>
            </tr>
            <tr>
                <td class="w3-right-align" style="width: 161px"><strong>E-mail::</strong></td>
                <td style="width: 110px">
                    <asp:TextBox ID="TextBoxEmail" runat="server" Width="205px"></asp:TextBox>
                </td>
                <td style="width: 228px"><strong><em>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server" ControlToValidate="TextBoxEmail" Display="Dynamic" ErrorMessage="*Required" Style="color: #FF3300"></asp:RequiredFieldValidator>
                </em></strong>
                    <br />
                    <strong><em>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidatorEmail" runat="server" ControlToValidate="TextBoxEmail" Display="Dynamic" ErrorMessage="*Invalid E-mail" Style="color: #FF3300" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </em></strong></td>
            </tr>
            <tr>
                <td class="w3-right-align" style="width: 161px"><strong>Sex::</strong></td>
                <td style="width: 110px">
                    <asp:RadioButtonList ID="RadioButtonListGender" runat="server" Width="205px">
                        <asp:ListItem>Male</asp:ListItem>
                        <asp:ListItem>Female</asp:ListItem>
                        <asp:ListItem>Other</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
                <td style="width: 228px"><strong><em>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorSex" runat="server" ControlToValidate="RadioButtonListGender" Display="Dynamic" ErrorMessage="*Required" Style="color: #FF3300"></asp:RequiredFieldValidator>
                </em></strong></td>
            </tr>
            <tr>
                <td class="w3-right-align" style="width: 161px; height: 26px"><strong>Choose Country::</strong></td>
                <td style="width: 110px; height: 26px">
                    <asp:DropDownList ID="DropDownListCountry" runat="server" Width="209px">
                        <asp:ListItem>Choose</asp:ListItem>
                        <asp:ListItem>Bangladesh</asp:ListItem>
                        <asp:ListItem>India</asp:ListItem>
                        <asp:ListItem>Pakistan</asp:ListItem>
                        <asp:ListItem>Maldives</asp:ListItem>
                        <asp:ListItem>Nepal</asp:ListItem>
                        <asp:ListItem>Afganistan</asp:ListItem>
                        <asp:ListItem>Sri Lanka</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td style="width: 228px; height: 26px"><strong><em>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorCountry" runat="server" ControlToValidate="DropDownListCountry" Display="Dynamic" ErrorMessage="*Required" Style="color: #FF3300" InitialValue="Choose"></asp:RequiredFieldValidator>
                </em></strong></td>
            </tr>
            <tr>
                <td class="w3-right-align" style="width: 161px; height: 92px;"><strong>Date Of Birth</strong></td>
                <td style="width: 110px; height: 92px;">
                    <br />
                    <asp:TextBox ID="TextBoxDOB" runat="server" Width="205px"></asp:TextBox>
                    <asp:CalendarExtender ID="TextBoxDOB_CalendarExtender" runat="server" Enabled="True" TargetControlID="TextBoxDOB" ViewStateMode="Enabled" Format="dd/MM/yyyy">
                    </asp:CalendarExtender>

                </td>
                <td style="width: 228px; height: 92px;">
                    <strong><em>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorMonth" runat="server" ControlToValidate="TextBoxDOB" Display="Dynamic" ErrorMessage="*Required" Style="color: #FF3300" InitialValue="Month"></asp:RequiredFieldValidator>
                    <br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="TextBoxDOB" CssClass="auto-style3" ErrorMessage="Give date in dd/MM/yyyy Format" ValidationExpression="^(((((0[1-9])|(1\d)|(2[0-8]))\/((0[1-9])|(1[0-2])))|((31\/((0[13578])|(1[02])))|((29|30)\/((0[1,3-9])|(1[0-2])))))\/((20[0-9][0-9])|(19[0-9][0-9])))|((29\/02\/(19|20)(([02468][048])|([13579][26]))))$ "></asp:RegularExpressionValidator>
                    </em></strong>
                </td>
            </tr>
            <tr>
                <td class="w3-right-align" style="width: 161px"><strong>Password::</strong></td>
                <td style="width: 110px">
                    <asp:TextBox ID="TextBoxPassword" runat="server" Width="205px" ToolTip="Password Must Contains 2 Uppercase letters, 1 Special Character, 2 Digits, 3 Lowercase Letters" TextMode="Password"></asp:TextBox>
                </td>
                <td style="width: 228px">
                    <strong><em>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidatorPassword" runat="server" ControlToValidate="TextBoxPassword" Display="Dynamic" ErrorMessage="Password Must Contains 2 Uppercase letters, 1 Special Character, 2 Digits, 3 Lowercase Letters" Style="color: #FF3300" ValidationExpression="^(?=.*[A-Z].*[A-Z])(?=.*[!@#$&amp;*])(?=.*[0-9].*[0-9])(?=.*[a-z].*[a-z].*[a-z]).{8}$"></asp:RegularExpressionValidator>
                    </em></strong>
                    <br />
                    <strong><em>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorPassword" runat="server" ControlToValidate="TextBoxPassword" Display="Dynamic" ErrorMessage="*Required" Style="color: #FF3300"></asp:RequiredFieldValidator>
                        <br />
                        <asp:PasswordStrength ID="PasswordStrength1" runat="server" MinimumLowerCaseCharacters="3" MinimumNumericCharacters="2" MinimumSymbolCharacters="1" MinimumUpperCaseCharacters="2" PreferredPasswordLength="8" Enabled="True" TargetControlID="TextBoxPassword"></asp:PasswordStrength>
                    </em></strong></td>
            </tr>
            <tr>
                <td class="w3-right-align" style="width: 161px"><strong>Confirm Password::</strong></td>
                <td style="width: 110px">
                    <asp:TextBox ID="TextBoxConfirmpassword" runat="server" Width="205px" TextMode="Password"></asp:TextBox>
                </td>
                <td style="width: 228px"><strong><em>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorConfirmPassword" runat="server" ControlToValidate="TextBoxConfirmpassword" Display="Dynamic" ErrorMessage="*Required" Style="color: #FF3300"></asp:RequiredFieldValidator>
                </em></strong>
                    <br />
                    <strong><em>
                        <asp:CompareValidator ID="CompareValidatorConfirmPassword" runat="server" ControlToCompare="TextBoxPassword" ControlToValidate="TextBoxConfirmpassword" Display="Dynamic" ErrorMessage="*Password is not matched" Style="color: #FF3300"></asp:CompareValidator>
                    </em></strong></td>
            </tr>
            <tr>
                <td class="w3-right-align" style="width: 161px; height: 26px;"><strong>Profile Picture::</strong></td>
                <td style="width: 110px; height: 26px;">
                    <asp:FileUpload ID="FileUpload1" runat="server" Width="205px" onchange="showimagepreview(this)" ValidateRequestMode="Enabled" />
                    <img alt="Preview" height="200" src="" style="background-color: #FF0000" width="200" id="img" />Preview</td>
                <td style="width: 228px; height: 26px;"><strong><em>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorProfilePicture" runat="server" ControlToValidate="FileUpload1" Display="Dynamic" ErrorMessage="*Required" Style="color: #FF3300"></asp:RequiredFieldValidator>
                </em></strong></td>
            </tr>

            <tr>
                <td class="w3-right-align" style="width: 161px; height: 26px;"><strong>Security Question::</strong></td>
                <td style="width: 110px; height: 26px;">
                    <asp:DropDownList ID="DropDownListSecurityQuestion" runat="server">
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
                <td style="width: 228px; height: 26px;"><strong><em>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorSecurityQuestion" runat="server" ControlToValidate="DropDownListSecurityQuestion" Display="Dynamic" ErrorMessage="*Required" Style="color: #FF3300" InitialValue="Choose"></asp:RequiredFieldValidator>
                </em></strong></td>
            </tr>
            <tr>
                <td style="width: 161px">&nbsp;</td>
                <td style="width: 110px">
                    <span style="text-decoration: underline">Answer::</span><br />
                    <asp:TextBox ID="TextBoxSecurityQuestion" runat="server" Width="205px"></asp:TextBox>
                </td>
                <td style="width: 228px">
                    <strong><em>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidatorSecurityAnswer" runat="server" ControlToValidate="TextBoxSecurityQuestion" Display="Dynamic" ErrorMessage="Answar Must Contain Alphabate(A-z) With or Without Space and numbers(0-9)" Style="color: #FF3300" ValidationExpression="^[a-zA-Z][a-zA-Z]*[ ]{0,1}[a-zA-Z][a-zA-Z ]*[a-zA-Z0-9]*$"></asp:RegularExpressionValidator>
                    </em></strong>
                    <br />
                    <strong><em>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorSecurityAnswer" runat="server" ControlToValidate="TextBoxSecurityQuestion" Display="Dynamic" ErrorMessage="*Required" Style="color: #FF3300"></asp:RequiredFieldValidator>
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TextBoxSecurityQuestion" ErrorMessage="Answer should be between (3-20) characters" Style="color: #FF3300" ValidationExpression="^[\s\S]{3,20}$"></asp:RegularExpressionValidator>
                    </em></strong></td>
            </tr>
            <tr>
                <td class="w3-right-align" style="width: 161px"><strong>Captcha::</strong></td>
                <td style="width: 110px">
                    <asp:UpdatePanel ID="UpdatePanelCaptcha" runat="server">
                        <ContentTemplate>
                            <asp:Image ID="ImageCaptcha" runat="server" />
                            <asp:TextBox ID="TextBoxCaptcha" runat="server" Width="205px"></asp:TextBox>
                            <br />
                            <asp:Button ID="ButtonCaptcha" runat="server" OnClick="ButtonCaptcha_Click" Text="Try Another Captcha" CssClass="captchabutton" />
                            <br />
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="ButtonCaptcha" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
                </td>
                <td style="width: 228px">
                    <asp:Label ID="LabelCaptcha" runat="server" Text="?"></asp:Label>
                    <br />
                    <strong><em>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorCaptcha" runat="server" ControlToValidate="TextBoxCaptcha" Display="Dynamic" ErrorMessage="*Required" Style="color: #FF3300"></asp:RequiredFieldValidator>
                    </em></strong>
                    <br />
                    <strong><em>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidatorCaptcha" runat="server" ControlToValidate="TextBoxCaptcha" Display="Dynamic" ErrorMessage="Captcha only contains Alphanumaric value" Style="color: #FF3300" ValidationExpression="^[0-9a-zA-Z]+$"></asp:RegularExpressionValidator>
                    </em></strong>
                </td>
            </tr>
            <%--<tr>
                <td style="width: 161px" class="auto-style2">
                    <asp:CheckBox ID="CheckBoxTerms" runat="server" />
                </td>
                <td style="width: 110px">I accept the
                    <asp:LinkButton ID="LinkButtonTerms" runat="server">Terms &amp; Conditions</asp:LinkButton>
                    <asp:Panel ID="Panel1" runat="server" CssClass="modalPopup">
                        <asp:TextBox ID="TextBox1" runat="server" Height="430px" TextMode="MultiLine" Width="622px" BorderStyle="None" ReadOnly="True">1.	Introduction 

1.1	These terms and conditions shall govern your use of our website.
1.2	By using our website, you accept these terms and conditions in full; accordingly, if you disagree with these terms and conditions or any part of these terms and conditions, you must not use our website.
1.3	If you [register with our website, submit any material to our website or use any of our website services], we will ask you to expressly agree to these terms and conditions.
1.4	You must be at least [18] years of age to use our website; by using our website or agreeing to these terms and conditions, you warrant and represent to us that you are at least [18] years of age.
1.5	Our website uses cookies; by using our website or agreeing to these terms and conditions, you consent to our use of cookies in accordance with the terms of our [privacy and cookies policy].




2.	Credit

2.1	This document is an SEQ Legal document from Website Contracts (&lt;http://www.website-contracts.co.uk&gt;).
You must retain the above credit. Use of this document without the credit is an infringement of copyright. However, you can purchase from us an equivalent document that does not include the credit.




3.	Copyright notice

3.1	Copyright (c) [year(s) of first publication] [full name].
3.2	Subject to the express provisions of these terms and conditions:
(a)	we, together with our licensors, own and control all the copyright and other intellectual property rights in our website and the material on our website; and
(b)	all the copyright and other intellectual property rights in our website and the material on our website are reserved.&lt;br /&gt;




4.	Licence to use website

4.1	You may:
(a)	view pages from our website in a web browser;
(b)	download pages from our website for caching in a web browser;
(c)	print pages from our website;
(d)	[stream audio and video files from our website]; and
(e)	[use [our website services] by means of a web browser],
	subject to the other provisions of these terms and conditions.

4.2	Except as expressly permitted by Section 4.1 or the other provisions of these terms and conditions, you must not download any material from our website or save any such material to your computer.
4.3	You may only use our website for [your own personal and business purposes], and you must not use our website for any other purposes.
4.4	Except as expressly permitted by these terms and conditions, you must not edit or otherwise modify any material on our website.
4.5	Unless you own or control the relevant rights in the material, you must not:
(a)	republish material from our website (including republication on another website);
(b)	sell, rent or sub-license material from our website;
(c)	show any material from our website in public;
(d)	exploit material from our website for a commercial purpose; or
(e)	redistribute material from our website.

4.6	Notwithstanding Section 4.5, you may redistribute [our newsletter] in [print and electronic form] to [any person].
4.7	We reserve the right to restrict access to areas of our website, or indeed our whole website, at our discretion; you must not circumvent or bypass, or attempt to circumvent or bypass, any access restriction measures on our website.




5.	Acceptable use
5.1	You must not:
(a)	use our website in any way or take any action that causes, or may cause, damage to the website or impairment of the performance, availability or accessibility of the website;
(b)	use our website in any way that is unlawful, illegal, fraudulent or harmful, or in connection with any unlawful, illegal, fraudulent or harmful purpose or activity;
(c)	use our website to copy, store, host, transmit, send, use, publish or distribute any material which consists of (or is linked to) any spyware, computer virus, Trojan horse, worm, keystroke logger, rootkit or other malicious computer software;
(d)	[conduct any systematic or automated data collection activities (including without limitation scraping, data mining, data extraction and data harvesting) on or in relation to our website without our express written consent];
(e)	[access or otherwise interact with our website using any robot, spider or other automated means[, except for the purpose of [search engine indexing]]];
(f)	[violate the directives set out in the robots.txt file for our website]; or
(g)	[use data collected from our website for any direct marketing activity (including without limitation email marketing, SMS marketing, telemarketing and direct mailing)].
[additional list items]

5.2	You must not use data collected from our website to contact individuals, companies or other persons or entities.
5.3	You must ensure that all the information you supply to us through our website, or in relation to our website, is [true, accurate, current, complete and non-misleading].</asp:TextBox>
                        <br />
                        <br />
                        <asp:Button ID="ButtonOK" runat="server" Text="Okay" />
                    </asp:Panel>
                    <asp:ModalPopupExtender ID="LinkButtonTerms_ModalPopupExtender" runat="server" Enabled="True" BackgroundCssClass="modalBackground" OkControlID="ButtonOK" PopupControlID="Panel1" TargetControlID="LinkButtonTerms">
                    </asp:ModalPopupExtender>
                </td>
                <td style="width: 228px">
                    <asp:Label ID="LabelTerms" runat="server" Text="."></asp:Label>
                </td>
            </tr>--%>
            <tr>
                <td style="width: 161px">&nbsp;</td>
                <td style="width: 110px">
                    <asp:Button ID="ButtonRegister" runat="server" Text="Register" OnClick="ButtonRegister_Click" CssClass="BigButton" Height="38px" />
                </td>
                <td style="width: 228px">&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 161px" class="auto-style2">&nbsp;</td>
                <td style="width: 110px">&nbsp;</td>
                <td style="width: 228px">&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 161px">&nbsp;</td>
                <td style="width: 110px">
                    <input id="Reset1" type="reset" value="Reset" class="BigButton" /></td>
                <td style="width: 228px">&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 161px">
                    <%--<asp:AsyncPostBackTrigger ControlID="DropDownListYear"></asp:AsyncPostBackTrigger>
                            <asp:AsyncPostBackTrigger ControlID="DropDownListDate"></asp:AsyncPostBackTrigger>--%>
                </td>
                <td style="width: 110px">Already have an account? Please
                <asp:HyperLink ID="HyperLinkLogin" runat="server" Font-Italic="True" ForeColor="Blue" NavigateUrl="~/Login.aspx">Login</asp:HyperLink>
                    &nbsp;here.</td>
                <td style="width: 228px">&nbsp;</td>
            </tr>
        </table>
    </div>

</asp:Content>
