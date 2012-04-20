<%@ Page Language="C#" MasterPageFile="~/MasterHomePage.master" AutoEventWireup="true" CodeFile="complainupd.aspx.cs" Inherits="complainupd" Title="Complaint Updation" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            height: 18px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="title">
<div class="titletxt">Update Complaint</div>
</div>
<asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
        <div style="background-image:url(images/bgStripe.png); background-repeat:repeat-x; float:left; width:700px;">
            <table class="style1">
                <tr class="table_tr">
                    <td>
                        <asp:Label ID="lblclientname" runat="server" CssClass="ajxtxt" 
                            Text="Enter Ticket#"></asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="txtticketid" runat="server" CssClass="ajxtxt"></asp:TextBox>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="Button1" runat="server" CssClass="btnstyle" 
                            onclick="Button1_Click1" Text="View" />
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr class="table_tr">
                    <td colspan="2">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
                </tr>
                <tr class="table_tr">
                    <td>
                        <cc1:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" 
                            AutoPostBack="True" Height="550px" style="margin-right: 60px" 
                            Width="640px" Visible="False">
                            <cc1:TabPanel ID="TabPanel1" runat="server" HeaderText="TabPanel1"><HeaderTemplate>General Details</HeaderTemplate><ContentTemplate><br /><br /><table><tr><td class="style3"><table><tr><td class="style3"><asp:Label ID="lblticketid" runat="server" CssClass="ajxtxt" Text="Ticket ID"></asp:Label></td><td>&#160;</td></tr></table></td><td><asp:TextBox ID="txtticket_id" runat="server" CssClass="ajxtxt"></asp:TextBox></td></tr><tr><td class="style3"><asp:Label ID="lblclientname9" runat="server" CssClass="ajxtxt" 
                                                    Text="Name of Client"></asp:Label></td><td><asp:TextBox ID="txtclientname" runat="server" CssClass="ajxtxt"></asp:TextBox></td></tr><tr><td class="style2"><asp:Label ID="lblclientname10" runat="server" CssClass="ajxtxt" 
                                                    Text="Customer name"></asp:Label></td><td><asp:TextBox ID="txtcustomername" runat="server" CssClass="ajxtxt"></asp:TextBox></td></tr><tr class="table_tr"><td class="style3"><asp:Label ID="lblempreg" runat="server" CssClass="ajxtxt" 
                                                    Text="Complain Registered By"></asp:Label></td><td><asp:TextBox ID="txtempreg" runat="server" CssClass="ajxtxt"></asp:TextBox></td></tr><tr class="table_tr"><td class="style3">&#160;</td><td>&#160;</td></tr><tr><td colspan="2">&#160;&#160;&#160;&#160;&#160;&#160;</td></tr></table></ContentTemplate></cc1:TabPanel>
                             <cc1:TabPanel ID="TabPanel2" runat="server" HeaderText="TabPanel2"><HeaderTemplate>Task Details</HeaderTemplate><ContentTemplate><br /><table><tr class="table_tr"><td class="style2"><asp:Label ID="lblstatus" runat="server" CssClass="ajxtxt" Text="Ticket Status"></asp:Label></td><td>
                                 <cc1:ComboBox ID="cbstatus" runat="server" AutoCompleteMode="SuggestAppend" 
                                                    AutoPostBack="True" CssClass="ajxtxt" DropDownStyle="DropDownList" 
                                                    ForeColor="Black" MaxLength="0" style="display: inline;" 
                                     onselectedindexchanged="cbstatus_SelectedIndexChanged"><asp:ListItem Selected="True">Escalate 
                                 to Help Desk</asp:ListItem><asp:ListItem>Open</asp:ListItem><asp:ListItem>Submit for client approval</asp:ListItem><asp:ListItem>Escalate 
                                 to Head</asp:ListItem><asp:ListItem>Escalate to shift engineer</asp:ListItem><asp:ListItem>Submit to store</asp:ListItem>
                                 <asp:ListItem>AMC vendor notified</asp:ListItem>
                                 <asp:ListItem>Parts Received</asp:ListItem>
                                 <asp:ListItem>Close</asp:ListItem>
                                 </cc1:ComboBox></td></tr><tr class="table_tr"><td class="style2"><asp:Label ID="Label1" runat="server" CssClass="ajxtxt" Text="Date of Complain"></asp:Label></td><td><asp:TextBox ID="txtdoc" runat="server" CssClass="ajxtxt" Enabled="False"></asp:TextBox></td></tr><tr class="table_tr"><td class="style2"><asp:Label ID="lbldorepair" runat="server" CssClass="ajxtxt" 
                                                    Text="Date of Repair"></asp:Label></td><td>
                                     <asp:TextBox ID="txtdorepair" runat="server" CssClass="ajxtxt"></asp:TextBox>
  
                                     <cc1:MaskedEditExtender ID="txtdorepair_MaskedEditExtender" runat="server" 
                                         CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" 
                                         CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                                         CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" 
                                         TargetControlID="txtdorepair" MaskType ="DateTime" 
                                         Mask ="99/99/9999 99:99:99" AcceptAMPM ="True" ErrorTooltipEnabled ="True" 
                                         MessageValidatorTip="true" 
   
   
    InputDirection="RightToLeft" 
    AcceptNegative="Left" 
    DisplayMoney="Left"
   />
                                         
                                         
                                         <cc1:MaskedEditValidator
    ControlExtender="txtdorepair_MaskedEditExtender"
    ControlToValidate="txtdorepair" 
    IsValidEmpty="False" 
    MaximumValue="12000" 
    EmptyValueMessage="Number is required"
    InvalidValueMessage="Number is invalid"
     runat ="server" 
    EmptyValueBlurredText="*" 
    InvalidValueBlurredMessage="*" 
    MaximumValueBlurredMessage="*" 
    MinimumValueBlurredText="*"
    Display="Dynamic" 
    TooltipMessage="Input a number: -100 up to 12.000"/>
    
                                         
                                     </cc1:MaskedEditExtender>
  
                                     <br />
                                 </td></tr><tr class="table_tr"><td class="style2"><asp:Label ID="Label2" runat="server" CssClass="ajxtxt" Text="Problem Type"></asp:Label></td><td><asp:TextBox ID="txtprobtype" runat="server" CssClass="ajxtxt"></asp:TextBox></td></tr><tr class="table_tr"><td class="style2"><asp:Label ID="lblprobsub" runat="server" CssClass="ajxtxt" 
                                                    Text="Problem Subtype"></asp:Label></td><td><asp:TextBox ID="txtprobsubtype" runat="server" CssClass="ajxtxt"></asp:TextBox></td></tr><tr class="table_tr"><td class="style4"><asp:Label ID="Label13" runat="server" CssClass="ajxtxt" Text="Priority"></asp:Label></td><td><asp:TextBox ID="txtpriority" runat="server" CssClass="ajxtxt"></asp:TextBox></td></tr><tr class="table_tr">
                                 <td><asp:Label ID="Label21" runat="server" CssClass="ajxtxt" 
                                                    Text="Task Description"></asp:Label></td><td><asp:TextBox ID="txtxtaskdesc" runat="server" CssClass="ajxtxt" 
                                                    ForeColor="Black" TextMode="MultiLine"></asp:TextBox></td></tr><tr class="table_tr"><td class="style4"><asp:Label ID="Label22" runat="server" CssClass="ajxtxt" Text="Others"></asp:Label></td><td><asp:TextBox ID="txtothers" runat="server" CssClass="ajxtxt" 
                                                    TextMode="MultiLine"></asp:TextBox></td></tr><tr class="table_tr"><td class="style4"><asp:Label ID="lblempassignd0" runat="server" CssClass="ajxtxt" 
                                            Text="Head Assigned"></asp:Label></td><td><asp:TextBox ID="txthead" 
                                        runat="server" CssClass="ajxtxt"></asp:TextBox></td></tr><tr class="table_tr"><td class="style4"><asp:Label ID="lblempassignd1" runat="server" CssClass="ajxtxt" 
                                            Text="Shift Engineer Assigned"></asp:Label></td><td><asp:TextBox 
                                        ID="txtshift" runat="server" CssClass="ajxtxt"></asp:TextBox></td></tr><tr class="table_tr"><td class="style4"><asp:Label ID="lblempassignd2" runat="server" CssClass="ajxtxt" 
                                            Text="Technician Assigned"></asp:Label></td><td><asp:TextBox 
                                        ID="txttechnician" runat="server" CssClass="ajxtxt"></asp:TextBox></td></tr><tr 
                                class="table_tr"><td class="style4"><asp:Label ID="lblempassignd3" runat="server" 
                                        CssClass="ajxtxt" Text="Expected Time of Arrival"></asp:Label></td><td><asp:TextBox 
                                        ID="txteta" runat="server" CssClass="ajxtxt"></asp:TextBox></td></tr><tr 
                                class="table_tr"><td class="style4"><asp:Label ID="lblempassignd4" runat="server" 
                                        CssClass="ajxtxt" Text="Actual Time of Arrival"></asp:Label></td><td><asp:TextBox 
                                        ID="txtata" runat="server" CssClass="ajxtxt"></asp:TextBox></td></tr><tr><td 
                                    class="ajxtxt">
                                     <asp:Label ID="Label3" runat="server" Text="Work Done By technician" 
                                    CssClass="ajxtxt"></asp:Label></td><td>
                                         <asp:TextBox ID="txtworkdonetech" runat="server" 
                                        CssClass="ajxtxt"></asp:TextBox></td></tr>
                                 <tr class="table_tr">
                                     <td class="ajxtxt">
                                         <asp:Label ID="Label24" runat="server" CssClass="ajxtxt" Text="Actual Asset ID"></asp:Label>
                                     </td>
                                     <td>
                                         <asp:TextBox ID="txtassetid" runat="server" CssClass="ajxtxt"></asp:TextBox>
                                     </td>
                                 </tr>
                                 </table></ContentTemplate></cc1:TabPanel>
                            <cc1:TabPanel ID="TabPanel3" runat="server" HeaderText="TabPanel3"><HeaderTemplate>Additional Details</HeaderTemplate><ContentTemplate><br /><asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder><br /><br /><br /><br /></ContentTemplate></cc1:TabPanel>
                        </cc1:TabContainer>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr class="table_tr">
                    <td colspan="2">
                        &nbsp;</td>
                </tr>
                <tr class="table_tr">
                    <td>
                        <asp:Button ID="btnupd" runat="server" onclick="Button2_Click" Text="Update" 
                            CssClass="btnstyle" />
                            <br />
                            <br />
                        <asp:Label ID="Label23" runat="server" ForeColor="Red"></asp:Label>
                    </td>
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
            </table>
    </div>     </ContentTemplate>
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
    
</asp:Content>
<%--<asp:Content ContentPlaceHolderID ="ContentPlaceHolder2" runat ="server" ID="complain2">
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl ="~/complainfrm.aspx" >Insert</asp:HyperLink>&nbsp;  &nbsp;  &nbsp;  &nbsp;|    &nbsp;  &nbsp;  &nbsp;  &nbsp;
    <asp:HyperLink ID="HyperLink2" runat="server" Enabled ="false" >Update</asp:HyperLink>

</asp:Content>
--%>