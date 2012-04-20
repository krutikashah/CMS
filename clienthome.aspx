<%@ Page Language="C#" AutoEventWireup="true" CodeFile="clienthome.aspx.cs" Inherits="clienthome" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="HomePage.css" rel="stylesheet" type="text/css" />
    <title>Client Home Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <div class="bg2_body height_100" align="center">
<table border="0" cellpadding="0" cellspacing="0">
	<tbody><tr><td class="row_1">
            <table class="width_table" align="center" border="0" cellpadding="0" cellspacing="0">
                <tbody><tr><td>
                    <table border="0" cellpadding="0" cellspacing="0">
                    	<tbody><tr>
                        	<td class="logo"><a href="#"><img src="images/CmsLogo3.png" alt="logo" style="float:left; padding-top:34px;" border="0" height="62px" width="260px" /></a></td>
                        	<td class="logo"><a href="http://www.iflcm.com/"><img src="images/iflcm1.png" alt="logo" style="float:right; padding-top:5px;" border="0" height="126px" width="241px" </a></td>
                            
                        </tr>
                    </tbody></table>
                </td></tr>
             
                <tr><td class="in">
                <div>
                
                    
                </div></td></tr>
            </tbody></table>
    </td></tr>
	<tr><td class="row_2">
            <table class="width_table bg_table height_100" align="center" border="0" cellpadding="0" cellspacing="0">
    			<tbody><tr><td><!-- header_eof //-->
<asp:LinkButton ID="LinkButton1" runat="server" Text="Logout" CausesValidation="false" 
                        onclick="LinkButton1_Click">Logout</asp:LinkButton>
<!-- body //-->

    
<!-- body_text //-->

     
         

<!-- body_eof //-->
<!-- footer //-->
   <div class="title">
<div class="titletxt">Client Homepage</div>
</div>
                    <asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager>        
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table class="style1">
                <tr class="table_tr">
                    <td>
                        <asp:Label ID="Label1" runat="server" CssClass="ajxtxt" Text="View Complain By"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label3" runat="server" CssClass="ajxtxt" Text="Date of Complain"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label5" runat="server" CssClass="ajxtxt" Text="Type"></asp:Label>
                    </td>
                </tr>
                <tr class="table_tr">
                    <td>
                        &nbsp;</td>
                    <td>
                        <asp:TextBox ID="txtdob" runat="server" CssClass="ajxtxt" 
                            ontextchanged="txtdob_TextChanged"></asp:TextBox>
                        <cc1:CalendarExtender ID="CalendarExtender2" runat="server" Enabled="True" 
                            PopupButtonID="img" TargetControlID="txtdob">
                        </cc1:CalendarExtender>
                        <img ID="img" alt="" src="images/calendar_icon.jpg" 
                            style="width: 28px; height: 21px" /></td>
                    <td>
                        <cc1:ComboBox ID="cbtype" runat="server" AutoCompleteMode="SuggestAppend" 
                            AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="probtype" 
                            DataValueField="probtype" DropDownStyle="DropDownList" MaxLength="0" 
                            onselectedindexchanged="cbtype_SelectedIndexChanged" style="display: inline;">
                        </cc1:ComboBox>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:assetdbConnectionString %>" 
                            
                            SelectCommand="SELECT DISTINCT [probtype] FROM [complain] WHERE ([client_id] = @client_id)">
                            <SelectParameters>
                                <asp:SessionParameter Name="client_id" SessionField="empid" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr class="table_tr">
                    <td colspan="3">
                        <asp:Button ID="btnsearch" runat="server" CssClass="btnstyle" 
                            onclick="btnsearch_Click" Text="Search" />
                    </td>
                </tr>
                <tr class="table_tr">
                    <td colspan="3">
                        <asp:Label ID="lblresult" runat="server" CssClass="ajxtxt" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
                <tr class="table_tr">
                    <td colspan="3">
                        <asp:GridView ID="GridView1" runat="server" CssClass="ajxtxt slct grdview">
                            <HeaderStyle BackColor="#FC950A" CssClass="grdhead" Font-Bold="True" 
                                ForeColor="White" />
                        </asp:GridView>
                    </td>
                </tr>
                <tr class="table_tr">
                    <td colspan="3">
                        &nbsp;</td>
                </tr>
                <tr class="table_tr">
                    <td colspan="3">
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
  
       
      
      
           
   <cc1:AlwaysVisibleControlExtender ID="AlwaysVisibleControlExtender1" runat="server"
    TargetControlID="UpdateProgress1"  HorizontalSide="Center"  VerticalSide="Middle"  HorizontalOffset="0">
</cc1:AlwaysVisibleControlExtender>
                    
                </td>
                </tr>
            </tbody></table>
    </td></tr>
	</tbody></table>


</div>
    </form>
    </div>
    <div class="row_4">
   <div class="footer">
   <div class="footertxt"></br>Copyright &copy; 2010 IFLCM &nbsp;&nbsp; p;&nbsp; <b><a href="#">Privacy Notice</a> &nbsp;&nbsp;&nbsp;| &nbsp;&nbsp;&nbsp;<a href="#">Conditions of Use</a></b></div>
   </div>
   </div>
    </form>
</body>
</html>
