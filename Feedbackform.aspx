<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Feedbackform.aspx.cs" Inherits="Feedbackform" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <link href="HomePage.css" rel="stylesheet" type="text/css" />
    <title>Feedback Form</title>
    <style type="text/css">
        .style1
        {
        	float:left; 
            width: 100%;
        }
    </style>
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

<!-- body //-->

    
<!-- body_text //-->

     
         

<!-- body_eof //-->
<!-- footer //-->
                   <div class="title">
<div class="titletxt">Feedback Form</div>
</div> 
                    <asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager>        
                    <br />
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <table class="style1">
                                <tr class="table_tr">
                                    <td>
                                        <asp:Label ID="lblsatisfied" runat="server" 
                                            Text="Were you satisfied by our service?"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:RadioButton ID="rbyes" runat="server" GroupName="a" Text="Yes" />
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:RadioButton ID="rbno" runat="server" GroupName="a" Text="No" />
                                    </td>
                                </tr>
                                <tr class="table_tr">
                                    <td>
                                        <asp:Label ID="lblcomment" runat="server" Text="Comments"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtcomment" runat="server" TextMode="MultiLine"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr class="table_tr">
                                    <td colspan="2">
                                        <asp:Button ID="Button1" runat="server" CssClass="btnstyle" 
                                            onclick="Button1_Click" Text="Submit" />
                                    </td>
                                </tr>
                                <tr class="table_tr">
                                    <td colspan="2">
                                        <asp:Label ID="lblthnx" runat="server" CssClass="ajxtxt" ForeColor="Red" 
                                            Text="Thank you for providing feedback!!!" Visible="False"></asp:Label>
                                    </td>
                                </tr>
                                <tr class="table_tr">
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
                </tr>
            </tbody></table>
    </td></tr>
	<tr></tr></tbody></table>


</div>
<div class="row_4">
   <div class="footer">
   <div class="footertxt"></br>Copyright &copy; 2010 IFLCM &nbsp;&nbsp; <b><a href="#">Privacy Notice</a> &nbsp;&nbsp;&nbsp;| &nbsp;&nbsp;&nbsp;<a href="#">Conditions of Use</a></b></div>
   </div>
   </div>
    </form>
  
</body>
</html>
