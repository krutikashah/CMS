<%@ Page Language="C#" MasterPageFile="~/MasterHomePage.master" AutoEventWireup="true" CodeFile="changepwd.aspx.cs" Inherits="changepwd" Title="Change Password" %>

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
    <div class="title">
<div class="titletxt">Change Password</div>
</div>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
        <div style="background-image:url(images/bgStripe.png); width:700px; float:left; background-repeat:repeat-x;">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table class="style1">
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" CssClass="ajxtxt" Text="Password"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtpwd" runat="server" TextMode ="Password" CssClass="ajxtxt"></asp:TextBox>
                        <cc2:PasswordStrength ID="PasswordStrength1" runat="server" 
                            CalculationWeightings="50;15;15;20" DisplayPosition="RightSide" 
                            PreferredPasswordLength="8" RequiresUpperAndLowerCaseCharacters="true " 
                            StrengthIndicatorType="BarIndicator" TargetControlID="txtpwd" 
                            TextStrengthDescriptions="Very Poor;Weak;Average;Strong;Excellent">
                        </cc2:PasswordStrength>
                        <br />
                        <asp:Label ID="Label5" runat="server" 
                            Text="Password should be 8 characters long and requires both lowecase and uppercase letters."></asp:Label>
                    </td>
                </tr>
                <tr>
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
                        <asp:Label ID="lblres" runat="server" CssClass="ajxtxt" ForeColor="Red" 
                            Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdateProgress ID="UpdateProgress1" runat="server" DynamicLayout ="false" >
<ProgressTemplate >
 <div class="Progress">
  <img src="images/loading.gif" alt="Loading" />
            
        </div>
 
</ProgressTemplate>                
                </asp:UpdateProgress>
  
       
      
      
           
   <cc2:AlwaysVisibleControlExtender ID="AlwaysVisibleControlExtender1" runat="server"
    TargetControlID="UpdateProgress1"  HorizontalSide="Center"  VerticalSide="Middle"  HorizontalOffset="0">
</cc2:AlwaysVisibleControlExtender>
</div>
</asp:Content>

