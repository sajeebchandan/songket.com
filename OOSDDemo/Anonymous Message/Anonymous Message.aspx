<%@ Page Title="Anonymous Message" Language="C#" MasterPageFile="~/SiteAuth.Master" AutoEventWireup="true" CodeBehind="Anonymous Message.aspx.cs" Inherits="OOSDDemo.Anonymous_Message" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }

        .auto-style2 {
            width: 164px;
        }

        .auto-style3 {
            width: 348px;
        }

        .auto-style4 {
            color: #FF0000;
        }

        .auto-style5 {
            text-align: center;
        }


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

        .image {
            height: 300px;
            width: 300px;
            border-radius: 160px;
        }

        .noresize {
            resize: none;
        }

        .form-control {
            /*display: block;*/
            /*padding: 6px 12px;*/
            font-size: 14px;
            line-height: 1.428571429;
            color: #555555;
            vertical-align: middle;
            background-color: #ffffff;
            border: 1px solid #cccccc;
            border-radius: 4px;
            -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
            box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
            -webkit-transition: border-color ease-in-out 0.15s, box-shadow ease-in-out 0.15s;
            transition: border-color ease-in-out 0.15s, box-shadow ease-in-out 0.15s;
        }

            .form-control:focus {
                border-color: #66afe9;
                outline: 0;
                -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 8px rgba(102, 175, 233, 0.6);
                box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 8px rgba(102, 175, 233, 0.6);
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
                        <b class="UpdateProgress">Sending Message ...<br />
                        </b>
                    </p>
                </h3>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>















    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div style="margin-left: auto; margin-right: auto; width: 300px;" class="auto-style5">
                <asp:Image ID="Image1" runat="server" CssClass="image" />
            </div>
            <br />
            <div style="width: 700px; height: auto; margin-left: auto; margin-right: auto">
                <table class="auto-style1">
                    <tr>
                        <td class="auto-style2">&nbsp;</td>
                        <td class="auto-style3">&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style2">Your Message::</td>
                        <td class="auto-style3">
                            <asp:TextBox ID="TextBoxAmessage" runat="server" Height="200px" TextMode="MultiLine" Width="355px" CssClass="noresize , form-control"></asp:TextBox>
                        </td>
                        <td><strong><em>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorAmessage" runat="server" ControlToValidate="TextBoxAmessage" CssClass="auto-style4" ErrorMessage="*Required"></asp:RequiredFieldValidator>
                        </em></strong></td>
                    </tr>
                    <tr>
                        <td class="auto-style2">Your Name (Optional)::</td>
                        <td class="auto-style3">
                            <asp:TextBox ID="TextBoxAname" runat="server" Width="180px" CssClass="form-control"></asp:TextBox>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style2">&nbsp;</td>
                        <td class="auto-style3">
                            <asp:Label ID="LabelMessage" runat="server" Text="."></asp:Label>
                            &nbsp;<asp:HyperLink ID="HyperLinkName" runat="server">HyperLink</asp:HyperLink>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style2">&nbsp;</td>
                        <td class="auto-style3">
                            <asp:Button ID="ButtonSend" runat="server" Text="Send Message" OnClick="ButtonSend_Click" />
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style2">&nbsp;</td>
                        <td class="auto-style3">&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="ButtonSend" EventName="Click" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
