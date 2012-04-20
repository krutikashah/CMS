<%@ Page Language="C#" MasterPageFile="~/MasterHomePage.master" AutoEventWireup="true" CodeFile="firsttimelogin.aspx.cs" Inherits="firsttimelogin" Title="First Time Login" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    \<p>
    </p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="title">
<div class="titletxt">First Time Login</div>
</div>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
        <div style="background-image:url(images/bgStripe.png); width:700px; float:left; background-repeat:repeat-x;">

    <table class="style1">
        <tr class="table_tr">
            <td>
                <asp:Label ID="Label1" runat="server" CssClass="ajxtxt" Text="Password"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtpwd" runat="server" CssClass="ajxtxt" TextMode="Password"></asp:TextBox>
                <cc2:PasswordStrength ID="txtpwd_PasswordStrength" Enabled="True" TargetControlID="txtpwd" StrengthIndicatorType ="BarIndicator" PreferredPasswordLength ="8" RequiresUpperAndLowerCaseCharacters ="true" CalculationWeightings ="50;15;15;20" runat ="server" DisplayPosition="RightSide " >
                </cc2:PasswordStrength>
                <br />
                <asp:Label ID="Label5" runat="server" 
                    Text="Password should be 8 characters long and requires both lowecase and uppercase letters."></asp:Label>
            </td>
        </tr>
        <tr class="table_tr">
            <td>
                <asp:Label ID="Label4" runat="server" CssClass="ajxtxt" Text="Confirm Password"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtconfpwd" runat="server" CssClass="ajxtxt" 
                    TextMode="Password"></asp:TextBox>
                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                    ControlToCompare="txtpwd" ControlToValidate="txtconfpwd" 
                    ErrorMessage="Both passwords should match"></asp:CompareValidator>
            </td>
        </tr>
        <tr class="table_tr">
            <td>
                <asp:Label ID="Label2" runat="server" CssClass="ajxtxt" 
                    Text="Security Question"></asp:Label>
            </td>
            <td>
                                        <cc2:ComboBox ID="cbsecques" runat="server" AutoPostBack="True" 
                                            CssClass="ajxtxt" ForeColor="Black" AutoCompleteMode="SuggestAppend" 
                                            DropDownStyle="DropDownList">
                                            <asp:ListItem Selected="True"></asp:ListItem>
                                            <asp:ListItem>Favourite teacher name</asp:ListItem>
                                            <asp:ListItem>First school name</asp:ListItem>
                                            <asp:ListItem>Color of your eyes</asp:ListItem>
                                        </cc2:ComboBox>
                                    </td>
        </tr>
        <tr class="table_tr">
            <td>
                <asp:Label ID="Label3" runat="server" CssClass="ajxtxt" Text="Security Answer"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtsecans" runat="server" CssClass="ajxtxt"></asp:TextBox>
            </td>
        </tr>
        <tr class="table_tr">
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr class="table_tr">
            <td colspan="2">
                <asp:Button ID="btninsert" runat="server" CssClass="btnstyle" 
                    onclick="btninsert_Click" Text="Change" />
            </td>
        </tr>
        <tr class="table_tr">
            <td colspan="2">
                <asp:Label ID="lblmes" runat="server" CssClass="ajxtxt" ForeColor="Red"></asp:Label>
            </td>
        </tr>
    </table>
    </div>
</asp:Content>

