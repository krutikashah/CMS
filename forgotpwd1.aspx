<%@ Page Language="C#" MasterPageFile="~/MasterHomePage.master" AutoEventWireup="true" CodeFile="forgotpwd1.aspx.cs" Inherits="forgotpwd" Title="Forgot Password" %>

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
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table class="style1">
                <tr>
                    <td>
                        <asp:Label ID="Label4" runat="server" CssClass="ajxtxt" Text="Username"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtuname" runat="server" CssClass="ajxtxt"></asp:TextBox>
                    </td>
                </tr>
                <tr class="table_tr">
                    <td>
                        <asp:Label ID="Label2" runat="server" CssClass="ajxtxt" 
                            Text="Security Question"></asp:Label>
                    </td>
                    <td>
                        <cc2:ComboBox ID="cbsecques" runat="server" AutoCompleteMode="SuggestAppend" 
                            AutoPostBack="True" CssClass="ajxtxt" DropDownStyle="DropDownList" 
                            ForeColor="Black">
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
                        <asp:Button ID="btnsubmit" runat="server" CssClass="btnstyle" Text="Submit" 
                            onclick="btnsubmit_Click" />
                    </td>
                </tr>
                <tr class="table_tr">
                    <td colspan="2">
                        <asp:Label ID="lblresult" runat="server" CssClass="ajxtxt" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

