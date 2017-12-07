<%@ Page Title="" Language="C#" MasterPageFile="~/Service.Master" AutoEventWireup="true" CodeBehind="Services.aspx.cs" Inherits="OOSDDemo.Services" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }

        .auto-style2 {
            text-decoration: underline;
        }

        .auto-style3 {
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
        <ProgressTemplate>
            <div id="Background"></div>
            <div id="Progress">
                <h3>
                    <p style="text-align: center;">
                        <b class="UpdateProgress">Loading Service...<br />
                        </b>
                    </p>
                </h3>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>









    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>


            <table class="auto-style1">
                <tr>
                    <td class="auto-style3">
                        <asp:ImageButton ID="ImageButtonImagepp" runat="server" Height="120px" ImageUrl="~/Supported Files/ImageppLogo.JPG" ToolTip="A Dynamic Image Editor" Width="150px" OnClick="ImageButtonImagepp_Click" CssClass="w3-btn" />
                        <br />
                        <span class="auto-style2"><strong>Image++</strong></span></td>
                    <td class="auto-style3">
                        <asp:ImageButton ID="ImageButtonStandardCalculator" runat="server" Height="120px" ImageUrl="~/Supported Files/Calculator.JPG" ToolTip="Complete Standard" Width="150px" OnClick="ImageButtonStandardCalculator_Click" CssClass="w3-btn" />
                        <br />
                        <span class="auto-style2"><strong>Standard Calculator</strong></span></td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:ImageButton ID="ImageButtonScientificCalculator" runat="server" Height="120px" ImageUrl="~/Supported Files/Scirntific Calculator.JPG" ToolTip="Featured Scientific Calculator" Width="150px" OnClick="ImageButtonScientificCalculator_Click" CssClass="w3-btn" />
                        <br />
                        <span class="auto-style2"><strong>Scientific Calculator</strong></span></td>
                    <td class="auto-style3">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        &nbsp;</td>
                    <td class="auto-style3">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        &nbsp;</td>
                    <td class="auto-style3">
                        &nbsp;</td>
                </tr>
            </table>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="ImageButtonImagepp" EventName="Click" />
<asp:AsyncPostBackTrigger ControlID="ImageButtonScientificCalculator" EventName="Click"></asp:AsyncPostBackTrigger>
<asp:AsyncPostBackTrigger ControlID="ImageButtonScientificCalculator" EventName="Click"></asp:AsyncPostBackTrigger>
<asp:AsyncPostBackTrigger ControlID="ImageButtonScientificCalculator" EventName="Click"></asp:AsyncPostBackTrigger>
<asp:AsyncPostBackTrigger ControlID="ImageButtonScientificCalculator" EventName="Click"></asp:AsyncPostBackTrigger>
<asp:AsyncPostBackTrigger ControlID="ImageButtonScientificCalculator" EventName="Click"></asp:AsyncPostBackTrigger>
<asp:AsyncPostBackTrigger ControlID="ImageButtonScientificCalculator" EventName="Click"></asp:AsyncPostBackTrigger>
<asp:AsyncPostBackTrigger ControlID="ImageButtonScientificCalculator" EventName="Click"></asp:AsyncPostBackTrigger>
<asp:AsyncPostBackTrigger ControlID="ImageButtonScientificCalculator" EventName="Click"></asp:AsyncPostBackTrigger>
        </Triggers>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="ImageButtonScientificCalculator" EventName="Click" />
        </Triggers>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="ImageButtonScientificCalculator" EventName="Click" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
