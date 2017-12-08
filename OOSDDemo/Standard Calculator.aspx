<%@ Page Title="Standard Calculator" Language="C#" MasterPageFile="~/Simple.Master" AutoEventWireup="true" CodeBehind="Standard Calculator.aspx.cs" Inherits="OOSDDemo.Standard_Calculator" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .BigButtonBR {
            background-color: green;
            border: 1px solid darkgreen;
            padding: -1px 15px;
            border-radius: 5px;
            color: white;
            margin-top: 5px;
            border-radius: 25px;
            margin-left: 1px;
        }

            .BigButtonBR:hover {
                background-color: white;
                border: 1px solid darkgreen;
                padding: -1px 15px;
                border-radius: 0px;
                color: darkgreen;
                cursor: pointer;
            }

        .ASPPanel {
            border-color: white;
            border-style: solid;
            height: 509px;
            width: 341px;
            margin-left: 520px;
            background-color: blanchedalmond;
            margin-top: 42px;
        }

        .NoResize {
            resize: none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:Panel ID="Panel1" runat="server" CssClass="ASPPanel">
                <asp:Label ID="LabelName" runat="server" Text="Standard Calculator" Font-Bold="True" Font-Italic="True" Font-Names="Arial" Font-Size="XX-Large" Font-Underline="True" ForeColor="Black"></asp:Label>
                <br />
                <br />
                <asp:Label ID="LabelMessage" runat="server" Font-Bold="True" ForeColor="#006600" Text="."></asp:Label>
                <br />
                <asp:TextBox ID="TextBoxLabel" runat="server" BackColor="BlanchedAlmond" TextMode="MultiLine" Height="55px" Width="321px" BorderStyle="None" CssClass="NoResize" ReadOnly="True"></asp:TextBox>
                <br />
                <asp:TextBox ID="TextBox1" runat="server" BorderColor="#3333FF" BorderStyle="Solid" Font-Bold="True" Height="55px" Width="335px" TextMode="MultiLine" ReadOnly="True" BackColor="White" ForeColor="Black" CssClass="NoResize , form-control" Font-Size="Large"></asp:TextBox>
                <br />
                <asp:Button ID="ButtonMclear" runat="server" Font-Bold="True" Font-Size="Larger" Height="44px" OnClick="ButtonMclear_Click" Text="MC" Width="58px" CssClass="BigButtonBR" />
                &nbsp;<asp:Button ID="ButtonMresult" runat="server" Font-Bold="True" Font-Size="Larger" Height="44px" OnClick="ButtonMresult_Click" Text="MR" Width="58px" CssClass="BigButtonBR" />
                &nbsp;<asp:Button ID="ButtonMstore" runat="server" Font-Bold="True" Font-Size="Larger" Height="44px" OnClick="ButtonMstore_Click" Text="MS" Width="58px" CssClass="BigButtonBR" />
                &nbsp;<asp:Button ID="ButtonMminus" runat="server" Font-Bold="True" Font-Size="Larger" Height="44px" OnClick="ButtonMminus_Click" Text="M-" Width="58px" CssClass="BigButtonBR" />
                &nbsp;<asp:Button ID="ButtonMplus" runat="server" Font-Bold="True" Font-Size="Larger" Height="44px" OnClick="ButtonMplus_Click" Text="M+" Width="58px" CssClass="BigButtonBR" />
                <br />
                <asp:Button ID="ButtonBack" runat="server" Font-Bold="True" Font-Size="Larger" Height="44px" OnClick="ButtonBack_Click" Text="←" Width="58px" CssClass="BigButtonBR" />
                &nbsp;<asp:Button ID="ButtonClearentry" runat="server" Font-Bold="True" Font-Size="Larger" Height="44px" OnClick="ButtonClearentry_Click" Text="CE" Width="58px" CssClass="BigButtonBR" />
                &nbsp;<asp:Button ID="ButtonClear" runat="server" Font-Bold="True" Font-Size="Larger" Height="44px" OnClick="ButtonClear_Click" Text="C" Width="58px" CssClass="BigButtonBR" />
                &nbsp;<asp:Button ID="ButtonSS" runat="server" Font-Bold="True" Font-Size="Larger" Height="44px" OnClick="ButtonSS_Click" Text="±" Width="58px" CssClass="BigButtonBR" />
                &nbsp;<asp:Button ID="ButtonRoot" runat="server" Font-Bold="True" Font-Size="Larger" Height="44px" OnClick="ButtonRoot_Click" Text="√ " Width="58px" CssClass="BigButtonBR" />
                <br />
                <asp:Button ID="Button7" runat="server" Font-Bold="True" Font-Size="Larger" Height="44px" OnClick="Button7_Click" Text="7" Width="58px" CssClass="BigButtonBR" />
                &nbsp;<asp:Button ID="Button8" runat="server" Font-Bold="True" Font-Size="Larger" Height="44px" OnClick="Button8_Click" Text="8" Width="58px" CssClass="BigButtonBR" />
                &nbsp;<asp:Button ID="Button9" runat="server" Font-Bold="True" Font-Size="Larger" Height="44px" OnClick="Button9_Click" Text="9" Width="58px" CssClass="BigButtonBR" />
                &nbsp;<asp:Button ID="ButtonDiv" runat="server" Font-Bold="True" Font-Size="Larger" Height="44px" Text="/" Width="58px" OnClick="ButtonDiv_Click" CssClass="BigButtonBR" />
                &nbsp;<asp:Button ID="ButtonParcent" runat="server" Font-Bold="True" Font-Size="Larger" Height="44px" Text="%" Width="58px" CssClass="BigButtonBR" OnClick="ButtonParcent_Click" />
                <br />
                <asp:Button ID="Button4" runat="server" Font-Bold="True" Font-Size="Larger" Height="44px" OnClick="Button4_Click" Text="4" Width="58px" CssClass="BigButtonBR" />
                &nbsp;<asp:Button ID="Button5" runat="server" Font-Bold="True" Font-Size="Larger" Height="44px" OnClick="Button5_Click" Text="5" Width="58px" CssClass="BigButtonBR" />
                &nbsp;<asp:Button ID="Button6" runat="server" Font-Bold="True" Font-Size="Larger" Height="44px" OnClick="Button6_Click" Text="6" Width="58px" CssClass="BigButtonBR" />
                &nbsp;<asp:Button ID="ButtonMul" runat="server" Font-Bold="True" Font-Size="Larger" Height="44px" Text="*" Width="58px" OnClick="ButtonMul_Click" CssClass="BigButtonBR" />
                &nbsp;<asp:Button ID="ButtonInverse" runat="server" Font-Bold="True" Font-Size="Larger" Height="44px" Text="1/x" Width="58px" OnClick="ButtonInverse_Click" CssClass="BigButtonBR" />
                <br />
                <asp:Button ID="Button1" runat="server" Font-Bold="True" Font-Size="Larger" Height="44px" OnClick="Button1_Click" Text="1" Width="58px" CssClass="BigButtonBR" />
                &nbsp;<asp:Button ID="Button2" runat="server" Font-Bold="True" Font-Size="Larger" Height="44px" OnClick="Button2_Click" Text="2" Width="58px" CssClass="BigButtonBR" />
                &nbsp;<asp:Button ID="Button3" runat="server" Font-Bold="True" Font-Size="Larger" Height="44px" OnClick="Button3_Click" Text="3" Width="58px" CssClass="BigButtonBR" />
                &nbsp;<asp:Button ID="ButtonSub" runat="server" Font-Bold="True" Font-Size="Larger" Height="44px" Text="-" Width="58px" OnClick="ButtonSub_Click" CssClass="BigButtonBR" />
                &nbsp;<asp:Button ID="ButtonEqual" runat="server" Font-Bold="True" Font-Size="Larger" Height="44px" OnClick="ButtonEqual_Click" Text="=" Width="58px" CssClass="BigButtonBR" />
                <br />
                <asp:Button ID="Button0" runat="server" Font-Bold="True" Font-Size="Larger" Height="44px" OnClick="Button0_Click" Text="0" Width="124px" CssClass="BigButtonBR" />
                &nbsp;<asp:Button ID="ButtonDot" runat="server" Font-Bold="True" Font-Size="Larger" Height="44px" Text="." Width="58px" CssClass="BigButtonBR" OnClick="ButtonDot_Click" />
                &nbsp;<asp:Button ID="ButtonSum" runat="server" Font-Bold="True" Font-Size="Larger" Height="44px" OnClick="ButtonSum_Click" Text="+" Width="58px" CssClass="BigButtonBR" />
                &nbsp;<asp:Button ID="ButtonReload" runat="server" Font-Bold="True" Font-Size="Larger" Height="44px" OnClick="ButtonReload_Click" Text="↩ " Width="58px" CssClass="BigButtonBR" />
            </asp:Panel>

        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="Button1" EventName="Click" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
