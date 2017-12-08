<%@ Page Title="Check Recipient" Language="C#" MasterPageFile="~/SiteAuth.Master" AutoEventWireup="true" CodeBehind="Enter Recipient.aspx.cs" Inherits="OOSDDemo.Check_Recipient" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        #BackgroundER {
            position: fixed;
            top: 0px;
            bottom: 0px;
            right: 0px;
            left: 0px;
            overflow: hidden;
            padding: 0;
            margin: 0;
            background-color: #F0F0F0;
            filter: alpha(opacity=80);
            opacity: 0.8;
            z-index: 100000;
        }

        #ProgressER {
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

        .UpdateProgressER {
            color: red;
            -webkit-animation-name: example; /* Safari 4.0 - 8.0 */
            -webkit-animation-duration: 4s; /* Safari 4.0 - 8.0 */
            animation-name: example;
            animation-duration: 4s;
        }
        /* Safari 4.0 - 8.0 */
        @-webkit-keyframes example {
            0% {
                color: red;
            }

            10% {
                color: blue;
            }

            20% {
                color: blueviolet;
            }

            30% {
                color: brown;
            }

            40% {
                color: crimson;
            }

            50% {
                color: darkblue;
            }

            60% {
                color: darkgreen;
            }

            70% {
                color: darkorchid;
            }

            80% {
                color: darkmagenta;
            }

            90% {
                color: greenyellow;
            }

            100% {
                color: green;
            }
        }

        /* Standard syntax */
        @keyframes example {
            0% {
                color: red;
            }

            10% {
                color: blue;
            }

            20% {
                color: blueviolet;
            }

            30% {
                color: brown;
            }

            40% {
                color: crimson;
            }

            50% {
                color: darkblue;
            }

            60% {
                color: darkgreen;
            }

            70% {
                color: darkorchid;
            }

            80% {
                color: darkmagenta;
            }

            90% {
                color: greenyellow;
            }

            100% {
                color: green;
            }
        }

        .modalBackground {
            background-color: black;
            filter: alpha(opacity=80);
            opacity: 0.8;
        }

        .modalPopup {
            background-color: #FFFFFF;
            border-width: 3px;
            border-color: black;
            border-style: solid;
            padding-top: 10px;
            padding-left: 10px;
            width: 640px;
            height: 480px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
        <ProgressTemplate>
            <div id="BackgroundER"></div>
            <div id="ProgressER">
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
                <h1 style="color: #0000FF">Enter Recipient&#39;s Username</h1>
                <p style="color: #0000FF">
                    <asp:Label ID="LabelMessage" runat="server" Text="?"></asp:Label>
                </p>
                <table style="width: 100%">
                    <tr>
                        <td class="w3-right-align" style="width: 127px"><strong>Username::</strong></td>
                        <td style="width: 226px">
                            <asp:TextBox ID="TextBoxCheckUsername" runat="server" Width="205px" CssClass="form-control"></asp:TextBox>
                        </td>
                        <td><strong><em>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" Display="Dynamic" ErrorMessage="Username Must Contain Alphanumaric With Dot(.) Only" Style="color: #FF0000" ValidationExpression="^[a-zA-Z][a-zA-Z]*[.]{0,1}[a-zA-Z][a-zA-Z]*[0-9]*$" ControlToValidate="TextBoxCheckUsername"></asp:RegularExpressionValidator>
                            <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxCheckUsername" Display="Dynamic" ErrorMessage="*Required" Style="color: #FF0000"></asp:RequiredFieldValidator>
                            <br />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBoxCheckUsername" ErrorMessage="Username should be between (5-25) characters" Style="color: #FF0000" ValidationExpression="^[\s\S]{5,25}$"></asp:RegularExpressionValidator>
                        </em></strong></td>
                    </tr>
                    <tr>
                        <td style="width: 127px">&nbsp;</td>
                        <td style="width: 226px">
                            <asp:Button ID="ButtonCheck" runat="server" Text="Check" OnClick="ButtonCheck_Click" />
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 127px">&nbsp;</td>
                        <td style="width: 226px">&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 127px">&nbsp;</td>
                        <td style="width: 226px">&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="ButtonCheck" EventName="Click" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
