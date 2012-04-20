<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CmsHome1.aspx.cs" Inherits="CmsHome1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<link href="HomePage.css" rel="Stylesheet" type="text/css" />
    <title>CMS Home Page</title>
    <style type="text/css">
        .style1
        {
            height: 169px;
        }
    </style>
    </head>
<body>
    <form id="form1" runat="server">
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
                <tr>
                </tr>
             
                <tr><td class="in">
                <div>
                
                    
                </div></td></tr>
            </tbody></table>
    </td></tr>
	<tr><td class="row_2">
            <table class="width_table bg_table height_100" align="center" border="0" cellpadding="0" cellspacing="0">
    			<tbody><tr><td><!-- header_eof //-->

<!-- body //-->
<table class="main_table" border="0" cellpadding="0" cellspacing="0">
<tbody><tr>
    
<!-- body_text //-->

     
         <td class="content_width_td" style="padding:0 0 0 5px;
width:700px;">
          
                                
                                
                                
                                
                                
                            <div class="title" style="width:740px;">
<div class="titletxt">Welcome To CMS,<br /></div>
</div>    
                                <p>
                                The primary purpose of Computerized maintenance system is to manage, capture, 
                                and track inspection, maintenance and repair activities of an organization. It 
                                performs the basic function of providing work orders to cover repairs and 
                                maintenance of buildings, plant and equipment. The Computerized Maintenance 
                                System can be used by any clients ranging from large multi site companies to 
                                small ones. Moreover, it minimizes data entry time as default information is 
                                supplied on screen automatically, reduces maintenance cost, improves 
                                productivity by providing required assistance on time depending on the priority 
                                levels of the task, reduces delays and overtime due to anticipated shutdowns and 
                                increases efficiency and effectiveness of maintenance tasks by identifying the 
                                appropriate technicians. The system is also responsible for scheduling periodic 
                                Annual Maintenance Contracts (AMC), generating maintenance work orders to 
                                effectively manage workflow during planned downtime, accounting for completion 
                                of tasks and generating daily job lists</p>
                            
         </td>
    <td rowspan="3" style="background-color:#DDDDDD;float:right;margin-right:10px;width:225px;" >
                           
                            <table>
                           

                                       <caption >
                                           LOGIN
                                           <br />
                                           <tr class="table_tr" >
                                               <td class="style4">
                                                   <asp:Label ID="lblusername" runat="server" CssClass="ajxtxt" Text="User Name"></asp:Label>
                                               </td>
                                               <td>
                                                   <asp:TextBox ID="txtusername" runat="server" CssClass="ajxtxt" ></asp:TextBox>
                                                   &nbsp;&nbsp;
                                               </td>
                                           </tr>
                                           <tr class="table_tr">
                                               <td class="style4">
                                                   &nbsp;</td>
                                               <td>
                                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                                       ControlToValidate="txtusername" ErrorMessage="*Username cannot be empty."></asp:RequiredFieldValidator>
                                               </td>
                                           </tr>
                                           <tr class="table_tr">
                                               <td class="style4">
                                                   <asp:Label ID="lblpassword" runat="server" CssClass="ajxtxt" Text="Password"></asp:Label>
                                               </td>
                                               <td>
                                                   <asp:TextBox ID="txtpassword"   runat="server" CssClass="ajxtxt" TextMode="Password"></asp:TextBox>
                                               </td>
                                           </tr>
                                           <tr class="table_tr">
                                               <td class="style4">
                                                   &nbsp;</td>
                                               <td>
                                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                                       ControlToValidate="txtpassword" ErrorMessage="*Password cannot be empty."></asp:RequiredFieldValidator>
                                               </td>
                                           </tr>
                                           <tr class="table_tr">
                                               <td class="style4">
                                                   &nbsp;</td>
                                               <td>
                                                   &nbsp;</td>
                                           </tr>
                                           <tr class="table_tr">
                                               <td colspan="2" class="table_tr">
                                                   &nbsp;&nbsp;
                                                   <asp:Label ID="lblerrmsg" runat="server" CssClass="ajxtxt" ForeColor="Red" 
                                                       Text="*Invalid Username/Password." Visible="False"></asp:Label>
                                                   &nbsp;</td>
                                           </tr>
                                           <tr>
                                               <td class="style6" colspan="2">

                                                   <asp:Button ID="btnsignin" runat="server" CssClass="btnstyle" 
                                                       OnClick="btnsignin_Click" Text="Sign In" />
                                                   &nbsp;</td>
                                           </tr>
                                           <tr class="table_tr">
                                               <td class="table_tr" colspan="2">
                                                   &nbsp;</td>
                                           </tr>
                                           <tr class="table_tr">
                                               <td colspan="2">
                                                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                   <asp:HyperLink ID="http4gtpwd" runat="server" CssClass="link" NavigateUrl ="~/forgotpwd.aspx" >Forgot your password?</asp:HyperLink>
                                                   &nbsp;
                                                   <br />
                                                   <br />
                                                   <br />
                                                   <br />
                                                   <br />
                                                   </td>
                                           </tr>
                                       </caption>
                                           </table>
                                    
                     
                                    </td>
                                    
	
	
<!-- body_text_eof //-->
	
  </tr>
</tbody></table>

<!-- body_eof //-->
<div class="tab">
        <div id="CanIHelpTop">
        </div>
        <div id="CanIHelpBody">
            WE SERVE
        </div>
        <div class="clearfloat">
        </div>
        <div style="margin-bottom: 0px;" class="tabFooter">
        </div>
        <div class="qualitypracticemain">
          <div class="tab">
        
        <div class="clearfloat">
        </div>
        <div class="tabFooter">
        </div>
        <div class="style3">
            <iframe src="rotate.htm" scrolling="no" frameborder="0" width="100%" height="400px">
            </iframe>
        </div>
        </div>
        <br>
        <!--end of tab-->
        <div class="clearfloat">
        </div>
        <div class="tab">
            <div id="CanIHelpTop">
            </div>
            <div id="CanIHelpBody">
                Our Group Companies
            </div>
            <div class="clearfloat">
            </div>
            <div style="margin-bottom: 0px;" class="tabFooter">
            </div>
        </div>
        <!--end of tab-->
        <div class="clearfloat">
        </div>
        <div class="grpmain">
            <a target="_blank" href="http://www.qitsusa.com"><span style="background-image: url(images/logoQitsUSA.jpg); width: 223px;" class="grpcontent"></span></a>
            <div class="grptext">
                International management consulting, specializing in quality integrated solutions.</div>
            <a target="_blank" href="http://www.iflcm.com"><span style="background-image: url(images/logoiFLCM.jpg);" class="grpcontent">
            </span></a>
            <div class="grptext">
                Premier facility management service provider.</div>
            <div style="background-image:url(images/logoTG.jpg);" class="grpcontent">
            </div>
            <div class="grptext">
                Providing a comprehensive range of Security Management Services.</div>
        </div>
    </div></div>
<!-- footer //-->
                    
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
