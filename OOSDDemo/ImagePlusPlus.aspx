<%@ Page Title="Image++" Language="C#" MasterPageFile="~/Simple.Master" AutoEventWireup="true" CodeBehind="ImagePlusPlus.aspx.cs" Inherits="OOSDDemo.Editro" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 1030px;
            float: left;
        }

        .auto-style2 {
            text-align: right;
        }

        .tablestyle {
            margin-left: 20px;
            width: 146px;
            float: right;
        }

        .auto-style3 {
            width: 800px;
            float: left;
        }

        .auto-style4 {
            text-align: center;
        }

        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width: 1250px">
        <div class="auto-style1">
            <table>
                <tr>
                    <td>
                        <input id="load" type="file" /><img id="image" class="img" src="Supported Files/windows_xp_bliss-wide.jpg" /><br />
                        <br />
                        <br />
                        <input id="save" type="button" value="Save" class="BigButton" />&nbsp;&nbsp;&nbsp;
                <input id="reset" type="button" value="Reset" class="BigButton" />
                        <asp:ImageButton ID="ImageButton1" runat="server" Width="40px" Height="40px" ImageUrl="~/Supported Files/refresh-525698_960_720.png" ToolTip="Reload This page" />
                    </td>
                </tr>
            </table>
        </div>
        <div class="tablestyle">
            <table class="tablestyle">
                <tr>
                    <td>
                        <h3>Controls</h3>
                        <label for="brightness">Brightness</label>
                        &nbsp &nbsp
    <input id="brightness" name="brightness" type="range" min="-100" max="100" value="0" />
                        <label for="vibrance">Vibrance</label>
                        &nbsp &nbsp
    <input id="vibrance" name="vibrance" type="range" min="-100" max="100" value="0" />
                        <label for="hue">Hue (YUV)</label>
                        &nbsp &nbsp
    <input id="hue" name="hue" type="range" min="-100" max="100" value="0" />
                        <label for="gamma">Gamma</label>
                        &nbsp &nbsp
    <input id="gamma" name="gamma" type="range" min="0" max="10" value="0" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <h3 class="w3-left-align">Blurs</h3>
                        &nbsp;&nbsp;&nbsp;
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">

                        <input id="boxBlur" class="filter" type="button" value="Box Blur" /></td>
                </tr>
                <tr>
                    <td class="auto-style2">

                        <input id="heavyRadialBlur" class="filter" type="button" value="Heavy Raial Blur" /></td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;
                        <input id="gaussianBlur" class="filter" type="button" value="Gaussian Blur" /></td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;
                        <input id="motionBlur" class="filter" type="button" value="Motion Blur" /></td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;
                        <input id="radialBlur" class="filter" type="button" value="Radial Blur" /></td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;
                        <input id="stackBlur" class="filter" type="button" value="Stack Blur" /></td>
                </tr>
            </table>

        </div>
    </div>
    <br />
    <br />
    <div style="width: 1250px;">
        <div style="width: 820px; float: left">
            <table class="auto-style3">
                <thead>
                    <tr>
                        <td>
                            <h2 class="auto-style4">Filters</h2>
                        </td>
                    </tr>
                </thead>
                <tr>
                    <td>
                        <input type="button" id="vintage" class="filter" value="Vintage" /></td>
                    <td>
                        <input id="herMajesty" class="filter" type="button" value="Her Majesty" /></td>
                    <td>
                        <input id="hazyDays" class="filter" type="button" value="Hazy Days" /></td>
                    <td>
                        <input id="oldBoot" class="filter" type="button" value="Old Boot" /></td>
                    <td>
                        <input id="pinhole" class="filter" type="button" value="Pinhole" /></td>
                </tr>
                <tr>
                    <td>
                        <input type="button" id="lomo" class="filter" value="Lomo" /></td>
                    <td>
                        <input id="jarques" class="filter" type="button" value="Jarques" /></td>
                    <td>
                        <input id="grungy" class="filter" type="button" value="Grungy" /></td>
                    <td>
                        <input id="love" class="filter" type="button" value="Love" /></td>
                    <td>
                        <input id="crossProcess" class="filter" type="button" value="Cross Process" /></td>
                </tr>
                <tr>
                    <td>
                        <input id="concentrate" class="filter" type="button" value="Concentrate" /></td>
                    <td>
                        <input id="sunrise" class="filter" type="button" value="Sunrise" /></td>
                    <td>
                        <input id="sinCity" class="filter" type="button" value="Sin City" /></td>
                    <td>
                        <input id="emboss" class="filter" type="button" value="Emboss" /></td>
                    <td>
                        <input id="edgeDetect" class="filter" type="button" value="Edge Detect" /></td>
                </tr>
                <tr>
                    <td>
                        <input id="hemingway" class="filter" type="button" value="Hemingway" /></td>
                    <td>

                        <input id="edgeEnhance" class="filter" type="button" value="Edge Enhance" /></td>
                    <td>
                        <input type="button" id="tiltShift" class="filter" value="Tilt Shift" /></td>
                    <td>
                        <input type="button" id="sharpen" class="filter" value="Sharpen" /></td>
                    <td>

                        <input id="sepia" class="filter" type="button" value="Sepia" /></td>
                </tr>
                <tr>
                    <td>
                        <input id="nostalgia" class="filter" type="button" value="Nostalgia" /></td>
                    <td>
                        <input id="invert" class="filter" type="button" value="Invert" /></td>
                    <td>
                        <input id="greyscale" class="filter" type="button" value="Grey" /></td>
                    <td>
                        <input id="orangePeel" class="filter" type="button" value="Orange Peel" /></td>
                    <td>
                        <input type="button" id="clarity" class="filter" value="Clarity" /></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>

        </div>
        <div style="float: left;">


            <h2>Crop Image</h2>
            <br />
            <div>
                <input type="text" id="width" placeholder="Enter a Width For Your Image" class="form-control" /><br />

                <input type="text" id="height" placeholder="Enter a Height For Your Image" class="form-control" /><br />

                <input type="text" id="x" placeholder="Enter a starting X loc For Your Image" class="form-control" /><br />

                <input type="text" id="y" placeholder="Enter a starting Y loc For Your Image" class="form-control" /><br />

                <input type="button" id="preview" value="Preview" class="filter" />
                <input type="button" id="crop" value="Crop" class="filter" />
                <br />
                <br />
                <h3>Write Message Over your Photo</h3>
                <input type="text" id="message" placeholder="Type ypur message" class="form-control">
                <input type="button" id="submit" value="Add Message" />

            </div>





        </div>
    </div>
</asp:Content>
