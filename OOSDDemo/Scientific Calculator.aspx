<%@ Page Title="" Language="C#" MasterPageFile="~/Simple.Master" AutoEventWireup="true" CodeBehind="Scientific Calculator.aspx.cs" Inherits="OOSDDemo.Scientific_Calculator" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .BigButtonBR {
            background-color: green;
            border: 1px solid darkgreen;
            padding: 0px 0px;
            border-radius: 5px;
            color: white;
            margin-top: 5px;
            border-radius: 25px;
            margin-left: 1px;
        }

            .BigButtonBR:hover {
                background-color: white;
                border: 1px solid darkgreen;
                padding: 1px 0px;
                border-radius: 0px;
                color: darkgreen;
                cursor: pointer;
            }

        .ASPPanel {
            border-color: white;
            border-style: solid;
            height: 530px;
            width: 696px;
            margin-left: 315px;
            background-color: blanchedalmond;
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
                &nbsp;<asp:Label ID="LabelName" runat="server" Text="Scientific Calculator" Font-Bold="True" Font-Italic="True" Font-Names="Arial" Font-Size="XX-Large" Font-Underline="True" ForeColor="Black"></asp:Label>
                <br />
                <br />
                <asp:Label ID="LabelMessage" runat="server" Font-Bold="True" ForeColor="#009900" Text="No Warning!"></asp:Label>
                <br />
                <asp:TextBox ID="TextBoxLabel" runat="server" BackColor="BlanchedAlmond" TextMode="MultiLine" Height="55px" Width="649px" BorderStyle="None" CssClass="NoResize" ReadOnly="True"></asp:TextBox>
                <br />
                <asp:TextBox ID="TextBox1" runat="server" BorderColor="#3333FF" BorderStyle="Solid" Font-Bold="True" Height="55px" Width="690px" TextMode="MultiLine" Font-Size="Large" ReadOnly="True"></asp:TextBox>
                <br />
                <div style="margin-left: 348px">
                    <asp:RadioButton ID="RadioButtonDegrees" runat="server" Checked="True" Text="Degrees" />
                    &nbsp;&nbsp;<asp:RadioButton ID="RadioButtonRadians" runat="server" Text="Radians" />
                    &nbsp;&nbsp;<asp:RadioButton ID="RadioButtonGrads" runat="server" Text="Grads" />
                </div>
                <asp:Button ID="ButtonMclear" runat="server" Font-Bold="True" Font-Size="Larger" Height="44px" OnClick="ButtonMclear_Click" Text="MC" Width="58px" CssClass="BigButtonBR" />
                &nbsp;<asp:Button ID="ButtonMresult" runat="server" Font-Bold="True" Font-Size="Larger" Height="44px" OnClick="ButtonMresult_Click" Text="MR" Width="58px" CssClass="BigButtonBR" />
                &nbsp;<asp:Button ID="ButtonMstore" runat="server" Font-Bold="True" Font-Size="Larger" Height="44px" OnClick="ButtonMstore_Click" Text="MS" Width="58px" CssClass="BigButtonBR" />
                &nbsp;<asp:Button ID="ButtonMminus" runat="server" Font-Bold="True" Font-Size="Larger" Height="44px" OnClick="ButtonMminus_Click" Text="M-" Width="58px" CssClass="BigButtonBR" />
                &nbsp;<asp:Button ID="ButtonMplus" runat="server" Font-Bold="True" Font-Size="Larger" Height="44px" OnClick="ButtonMplus_Click" Text="M+" Width="58px" CssClass="BigButtonBR" />
                &nbsp;&nbsp;&nbsp;<asp:Button ID="ButtonBin" runat="server" Font-Bold="True" Font-Size="Larger" Height="44px" OnClick="ButtonBin_Click" Text="Bin" Width="58px" CssClass="BigButtonBR" />
                &nbsp;<asp:Button ID="Button1ln" runat="server" Font-Bold="True" Font-Size="Larger" Height="44px" OnClick="Button1ln_Click" Text="ln" Width="58px" CssClass="BigButtonBR" />
                &nbsp;<asp:Button ID="ButtonHex" runat="server" Font-Bold="True" Font-Size="Larger" Height="44px" OnClick="ButtonHex_Click" Text="Hex" Width="58px" CssClass="BigButtonBR" />
                &nbsp;<asp:Button ID="ButtonOct" runat="server" Font-Bold="True" Font-Size="Larger" Height="44px" OnClick="ButtonOct_Click" Text="Oct" Width="58px" CssClass="BigButtonBR" />
                &nbsp;<asp:Button ID="ButtonPowern" runat="server" Font-Bold="True" Font-Size="Larger" Height="44px" OnClick="ButtonPowern_Click" Text="xⁿ" Width="58px" CssClass="BigButtonBR" />
                <br />
                <asp:Button ID="ButtonBack" runat="server" Font-Bold="True" Font-Size="Larger" Height="44px" OnClick="ButtonBack_Click" Text="←" Width="58px" CssClass="BigButtonBR" />
                &nbsp;<asp:Button ID="ButtonClearentry" runat="server" Font-Bold="True" Font-Size="Larger" Height="44px" OnClick="ButtonClearentry_Click" Text="CE" Width="58px" CssClass="BigButtonBR" />
                &nbsp;<asp:Button ID="ButtonClear" runat="server" Font-Bold="True" Font-Size="Larger" Height="44px" OnClick="ButtonClear_Click" Text="C" Width="58px" CssClass="BigButtonBR" />
                &nbsp;<asp:Button ID="ButtonSS" runat="server" Font-Bold="True" Font-Size="Larger" Height="44px" OnClick="ButtonSS_Click" Text="±" Width="58px" CssClass="BigButtonBR" />
                &nbsp;<asp:Button ID="ButtonRoot" runat="server" Font-Bold="True" Font-Size="Larger" Height="44px" OnClick="ButtonRoot_Click" Text="√ " Width="58px" CssClass="BigButtonBR" />
                &nbsp;&nbsp;&nbsp;<asp:Button ID="ButtonInt" runat="server" Font-Bold="True" Font-Size="Larger" Height="44px" OnClick="ButtonInt_Click" Text="Int" Width="58px" CssClass="BigButtonBR" />
                &nbsp;<asp:Button ID="ButtongSin" runat="server" Font-Bold="True" Font-Size="Larger" Height="44px" Text="Sin" Width="58px" OnClick="ButtongSin_Click" CssClass="BigButtonBR" />
                &nbsp;<asp:Button ID="ButtonSininv" runat="server" Font-Bold="True" Font-Size="Larger" Height="44px" Text="sin⁻ⁱ" Width="58px" OnClick="ButtonSininv_Click" CssClass="BigButtonBR" />
                &nbsp;<asp:Button ID="ButtonSinh" runat="server" Font-Bold="True" Font-Size="Medium" Height="44px" Text="Sinh" Width="58px" OnClick="ButtonSinh_Click" CssClass="BigButtonBR" />
                &nbsp;<asp:Button ID="ButtonSinhinv" runat="server" Font-Bold="True" Font-Size="Medium" Height="44px" Text="sinh⁻ⁱ" Width="58px" OnClick="ButtonSinhinv_Click" CssClass="BigButtonBR" />
                <br />
                <asp:Button ID="Button7" runat="server" Font-Bold="True" Font-Size="Larger" Height="44px" OnClick="Button7_Click" Text="7" Width="58px" CssClass="BigButtonBR" />
                &nbsp;<asp:Button ID="Button8" runat="server" Font-Bold="True" Font-Size="Larger" Height="44px" OnClick="Button8_Click" Text="8" Width="58px" CssClass="BigButtonBR" />
                &nbsp;<asp:Button ID="Button9" runat="server" Font-Bold="True" Font-Size="Larger" Height="44px" OnClick="Button9_Click" Text="9" Width="58px" CssClass="BigButtonBR" />
                &nbsp;<asp:Button ID="ButtonDiv" runat="server" Font-Bold="True" Font-Size="Larger" Height="44px" Text="/" Width="58px" OnClick="ButtonDiv_Click" CssClass="BigButtonBR" />
                &nbsp;<asp:Button ID="ButtonParcent" runat="server" Font-Bold="True" Font-Size="Larger" Height="44px" Text="%" Width="58px" CssClass="BigButtonBR" />
                &nbsp;&nbsp;&nbsp;<asp:Button ID="ButtonPi" runat="server" Font-Bold="True" Font-Size="Larger" Height="44px" Text="π" Width="58px" OnClick="ButtonPi_Click" CssClass="BigButtonBR" />
                &nbsp;<asp:Button ID="ButtonCos" runat="server" Font-Bold="True" Font-Size="Larger" Height="44px" Text="Cos" Width="58px" OnClick="ButtonCos_Click" CssClass="BigButtonBR" />
                &nbsp;<asp:Button ID="ButtonCosinv" runat="server" Font-Bold="True" Font-Size="Larger" Height="44px" Text="cos⁻ⁱ" Width="58px" OnClick="ButtonCosinv_Click" CssClass="BigButtonBR" />
                &nbsp;<asp:Button ID="ButtonCosh" runat="server" Font-Bold="True" Font-Size="Medium" Height="44px" Text="Cosh" Width="58px" OnClick="ButtonCosh_Click" CssClass="BigButtonBR" />
                &nbsp;<asp:Button ID="ButtonCoshinv" runat="server" Font-Bold="True" Font-Size="Medium" Height="44px" Text="cosh⁻ⁱ" Width="58px" OnClick="ButtonCoshinv_Click" CssClass="BigButtonBR" />
                <br />
                <asp:Button ID="Button4" runat="server" Font-Bold="True" Font-Size="Larger" Height="44px" OnClick="Button4_Click" Text="4" Width="58px" CssClass="BigButtonBR" />
                &nbsp;<asp:Button ID="Button5" runat="server" Font-Bold="True" Font-Size="Larger" Height="44px" OnClick="Button5_Click" Text="5" Width="58px" CssClass="BigButtonBR" />
                &nbsp;<asp:Button ID="Button6" runat="server" Font-Bold="True" Font-Size="Larger" Height="44px" OnClick="Button6_Click" Text="6" Width="58px" CssClass="BigButtonBR" />
                &nbsp;<asp:Button ID="ButtonMul" runat="server" Font-Bold="True" Font-Size="Larger" Height="44px" Text="*" Width="58px" OnClick="ButtonMul_Click" CssClass="BigButtonBR" />
                &nbsp;<asp:Button ID="ButtonInverse" runat="server" Font-Bold="True" Font-Size="Larger" Height="44px" Text="1/x" Width="58px" CssClass="BigButtonBR" />
                &nbsp;&nbsp;&nbsp;<asp:Button ID="ButtonLog" runat="server" Font-Bold="True" Font-Size="Larger" Height="44px" OnClick="ButtonLog_Click" Text="Log" Width="58px" CssClass="BigButtonBR" />
                &nbsp;<asp:Button ID="ButtonTan" runat="server" Font-Bold="True" Font-Size="Larger" Height="44px" Text="Tan" Width="58px" OnClick="ButtonTan_Click" CssClass="BigButtonBR" />
                &nbsp;<asp:Button ID="ButtonTaninv" runat="server" Font-Bold="True" Font-Size="Larger" Height="44px" Text="tan⁻ⁱ" Width="58px" OnClick="ButtonTaninv_Click" CssClass="BigButtonBR" />
                &nbsp;<asp:Button ID="ButtonTanh" runat="server" Font-Bold="True" Font-Size="Medium" Height="44px" Text="Tanh" Width="58px" OnClick="ButtonTanh_Click" CssClass="BigButtonBR" />
                &nbsp;<asp:Button ID="ButtonTanhinv" runat="server" Font-Bold="True" Font-Size="Medium" Height="44px" Text="tanh⁻ⁱ" Width="58px" OnClick="ButtonTanhinv_Click" CssClass="BigButtonBR" />
                <br />
                <asp:Button ID="Button1" runat="server" Font-Bold="True" Font-Size="Larger" Height="44px" OnClick="Button1_Click" Text="1" Width="58px" CssClass="BigButtonBR" />
                &nbsp;<asp:Button ID="Button2" runat="server" Font-Bold="True" Font-Size="Larger" Height="44px" OnClick="Button2_Click" Text="2" Width="58px" CssClass="BigButtonBR" />
                &nbsp;<asp:Button ID="Button3" runat="server" Font-Bold="True" Font-Size="Larger" Height="44px" OnClick="Button3_Click" Text="3" Width="58px" CssClass="BigButtonBR" />
                &nbsp;<asp:Button ID="ButtonSub" runat="server" Font-Bold="True" Font-Size="Larger" Height="44px" OnClick="ButtonSub_Click" Text="-" Width="58px" CssClass="BigButtonBR" />
                &nbsp;<asp:Button ID="ButtonEqual" runat="server" Font-Bold="True" Font-Size="Larger" Height="44px" OnClick="ButtonEqual_Click" Text="=" Width="58px" CssClass="BigButtonBR" />
                &nbsp;&nbsp;&nbsp;<asp:Button ID="ButtonFe" runat="server" Font-Bold="True" Font-Size="Larger" Height="44px" OnClick="ButtonFe_Click" Text="F-E" Width="58px" CssClass="BigButtonBR" />
                &nbsp;<asp:Button ID="ButtonExp" runat="server" Font-Bold="True" Font-Size="Larger" Height="44px" OnClick="ButtonExp_Click" Text="Exp" Width="58px" CssClass="BigButtonBR" />
                &nbsp;<asp:Button ID="ButtonMod" runat="server" Font-Bold="True" Font-Size="Larger" Height="44px" OnClick="ButtonMod_Click" Text="Mod" Width="58px" CssClass="BigButtonBR" />
                &nbsp;<asp:Button ID="ButtonPowerten" runat="server" Font-Bold="True" Font-Size="Larger" Height="44px" OnClick="ButtonPowerten_Click" Text="10ⁿ" Width="58px" CssClass="BigButtonBR" />
                &nbsp;<asp:Button ID="ButtonRootn" runat="server" Font-Bold="True" Font-Size="Larger" Height="44px" OnClick="ButtonRootn_Click" Text="ⁿ√x" Width="58px" CssClass="BigButtonBR" />
                <br />
                <asp:Button ID="Button0" runat="server" Font-Bold="True" Font-Size="Larger" Height="44px" OnClick="Button0_Click" Text="0" Width="124px" CssClass="BigButtonBR" />
                &nbsp;<asp:Button ID="ButtonDot" runat="server" Font-Bold="True" Font-Size="Larger" Height="44px" OnClick="ButtonDot_Click" Text="." Width="58px" CssClass="BigButtonBR" />
                &nbsp;<asp:Button ID="ButtonSum" runat="server" Font-Bold="True" Font-Size="Larger" Height="44px" Text="+" Width="58px" OnClick="ButtonSum_Click" CssClass="BigButtonBR" />
                &nbsp;<asp:Button ID="ButtonReload" runat="server" Font-Bold="True" Font-Size="Larger" Height="44px" OnClick="ButtonReload_Click" Text="↩ " Width="58px" CssClass="BigButtonBR" />
                &nbsp;&nbsp;&nbsp;<asp:Button ID="ButtonFactorial" runat="server" Font-Bold="True" Font-Size="Larger" Height="44px" OnClick="ButtonFactorial_Click" Text="n!" Width="58px" CssClass="BigButtonBR" />
                &nbsp;<asp:Button ID="ButtonSquare" runat="server" Font-Bold="True" Font-Size="Larger" Height="44px" OnClick="ButtonSquare_Click" Text="x²" Width="58px" CssClass="BigButtonBR" />
                &nbsp;<asp:Button ID="ButtonSquarecube" runat="server" Font-Bold="True" Font-Size="Larger" Height="44px" OnClick="ButtonSquarecube_Click" Text="x³" Width="58px" CssClass="BigButtonBR" />
                &nbsp;<asp:Button ID="ButtonCubicroot" runat="server" Font-Bold="True" Font-Size="Larger" Height="44px" OnClick="ButtonCubicroot_Click" Text="³√x" Width="58px" CssClass="BigButtonBR" />
                &nbsp;<asp:Button ID="ButtonExit" runat="server" Font-Bold="True" Font-Size="Larger" Height="44px" OnClick="ButtonExit_Click" Text="Exit" Width="58px" CssClass="BigButtonBR" />
            </asp:Panel>

        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="Button1" EventName="Click" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
