<%@ Page Language="C#" AutoEventWireup="true" CodeFile="empdet.aspx.cs" Inherits="empdet" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Employee Details</title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
    <link href="HomePage.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <div class="title">
<div class="titletxt">Update Employee Details</div>
</div>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
        <div style="background-image:url(images/bgStripe.png); width:700px; float:left; background-repeat:repeat-x;">

        <table class="style1">
            <tr class="table_tr">
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                    <td colspan="2" class="table_tr">
                        <asp:Label ID="Label19" runat="server" Text="Personal Details" Font-Bold="True" 
                            Font-Size="Large"></asp:Label>
                    </td>
                </tr>
            <tr class="table_tr">
                    <td>
                        <asp:Label ID="Label1" runat="server" CssClass="ajxtxt " Text="Employee ID"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblempid" runat="server" CssClass="ajxtxt "></asp:Label>
                    </td>
                </tr>
            <tr class="table_tr">
                    <td>
                        <asp:Label ID="Label7" runat="server" CssClass="ajxtxt " Text="Name"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblname" runat="server" CssClass="ajxtxt "></asp:Label>
                    </td>
                </tr>
            <tr class="table_tr">
                    <td>
                        <asp:Label ID="Label3" runat="server" CssClass="ajxtxt " Text="Date of Birth"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lbldob" runat="server" CssClass="ajxtxt "></asp:Label>
                    </td>
                </tr>
            <tr class="table_tr">
                    <td>
                        <asp:Label ID="Label4" runat="server" CssClass="ajxtxt " Text="Address"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lbladdress" runat="server" CssClass="ajxtxt "></asp:Label>
                    </td>
                </tr>
            <tr class="table_tr">
                    <td>
                        <asp:Label ID="Label5" runat="server" CssClass="ajxtxt " Text="Phone Number"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblphoneno" runat="server" CssClass="ajxtxt "></asp:Label>
                    </td>
                </tr>
            <tr class="table_tr">
                    <td>
                        <asp:Label ID="Label6" runat="server" CssClass="ajxtxt " Text="Email ID"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblemailid" runat="server" CssClass="ajxtxt "></asp:Label>
                    </td>
                </tr>
            <tr class="table_tr">
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr class="table_tr">
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr class="table_tr">
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr class="table_tr">
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr class="table_tr">
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr class="table_tr">
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    
    </div>
    </div>
    </form>
</body>
</html>
