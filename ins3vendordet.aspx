<%@ Page Language="C#" MasterPageFile="~/MasterHomePage.master" AutoEventWireup="true" CodeFile="ins3vendordet.aspx.cs" Inherits="ins3vendordet" Title="Insert Vendor Details" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style3
        {
            width: 100%;
        }
        .ajax__combobox_buttoncontainer button
{
    background-image: url(mvwres://AjaxControlToolkit, Version=3.0.30930.28736, Culture=neutral, PublicKeyToken=28f01b0e84b6d53e/AjaxControlToolkit.ComboBox.arrow-down.gif);
    background-position: center;
    background-repeat: no-repeat;
    border-color: ButtonFace;
    height: 15px;
    width: 15px;
}
.ajax__combobox_buttoncontainer button
{
    background-image: url(mvwres://AjaxControlToolkit, Version=3.0.30930.28736, Culture=neutral, PublicKeyToken=28f01b0e84b6d53e/AjaxControlToolkit.ComboBox.arrow-down.gif);
    background-position: center;
    background-repeat: no-repeat;
    border-color: ButtonFace;
    height: 15px;
    width: 15px;
}
.ajax__combobox_buttoncontainer button
{
    background-image: url(mvwres://AjaxControlToolkit, Version=3.0.30930.28736, Culture=neutral, PublicKeyToken=28f01b0e84b6d53e/AjaxControlToolkit.ComboBox.arrow-down.gif);
    background-position: center;
    background-repeat: no-repeat;
    border-color: ButtonFace;
    height: 15px;
    width: 15px;
}
.ajax__combobox_buttoncontainer button
{
    background-image: url(mvwres://AjaxControlToolkit, Version=3.0.30930.28736, Culture=neutral, PublicKeyToken=28f01b0e84b6d53e/AjaxControlToolkit.ComboBox.arrow-down.gif);
    background-position: center;
    background-repeat: no-repeat;
    border-color: ButtonFace;
    height: 15px;
    width: 15px;
}
        .ajax__combobox_buttoncontainer button
{
    background-image: url(mvwres://AjaxControlToolkit, Version=3.0.30930.28736, Culture=neutral, PublicKeyToken=28f01b0e84b6d53e/AjaxControlToolkit.ComboBox.arrow-down.gif);
    background-position: center;
    background-repeat: no-repeat;
    border-color: ButtonFace;
    height: 15px;
    width: 15px;
}
        .style6
        {
            height: 624px;
        }
        .style4
        {
            width: 196px;
        }
        </style>
<script language="javascript" type="text/javascript">
// <!CDATA[

function img_onclick() {
}

// ]]>
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style3">
        <tr>
            <td colspan="2">
            <div class="title">
<div class="titletxt">Add Third Party Vendor Details</div>
</div>
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2">
              <cc1:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" 
                                Width="700px" Height="254px" AutoPostBack="True">
                                <cc1:TabPanel ID="TabPanel1" runat="server" HeaderText="Equipment Information"><HeaderTemplate>Organizatin details 
                                
                                
                                </HeaderTemplate><ContentTemplate><br /><br /><table class="style6">
                                        <tr class="table_tr"><td class="style4">
                                            <asp:Label 
                                        ID="lblcmpname" runat="server" Text="Company name" CssClass="ajxtxt"></asp:Label></td><td>
                                        <asp:TextBox ID="txtcmpname" runat="server" CssClass="ajxtxt"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                                    ControlToValidate="txtcmpname" ErrorMessage="Company Name cannot be empty"></asp:RequiredFieldValidator>
                                            </td></tr>
                                        <tr class="table_tr">
                                            <td class="style7"><asp:Label ID="lbladrs" runat="server" Text="Address" 
                                                    CssClass="ajxtxt"></asp:Label></td>
                                            <td class="style8">
                                            <asp:TextBox ID="txtadrs" runat="server" TextMode="MultiLine" CssClass="ajxtxt"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                                    ControlToValidate="txtadrs" ErrorMessage="Address cannot be empty"></asp:RequiredFieldValidator>
                                            </td></tr>
                                        <tr class="table_tr"><td class="style4">
                                            <asp:Label ID="lblphoneno" runat="server" Text="Phone no." CssClass="ajxtxt"></asp:Label></td><td>
                                                <asp:TextBox ID="txtphoneno" runat="server" CssClass="ajxtxt"></asp:TextBox>
                                                <cc1:FilteredTextBoxExtender ID="txtphoneno_FilteredTextBoxExtender" 
                                                    runat="server" FilterType ="Numbers"  Enabled="True" TargetControlID="txtphoneno">
                                                </cc1:FilteredTextBoxExtender>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                                    ControlToValidate="txtphoneno" ErrorMessage="Phone No cannot be empty"></asp:RequiredFieldValidator>
                                            </td></tr>
                                        <tr class="table_tr"><td class="style4"><asp:Label ID="lblempemailid" 
                                                runat="server" Text="Email ID" CssClass="ajxtxt"></asp:Label></td><td>
                                            <asp:TextBox ID="txtemailid" runat="server" CssClass="ajxtxt"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                                    ControlToValidate="txtemailid" ErrorMessage="Email ID cannot be empty"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                                    ControlToValidate="txtemailid" ErrorMessage="Enter valid Email ID" 
                                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                            </td></tr>
                                        <tr class="table_tr"><td class="style4">
                                            <asp:Label ID="lblservingarea" runat="server" Text="Serving Area" 
                                                CssClass="ajxtxt"></asp:Label>
                                            </td><td>
                                                <asp:TextBox ID="txtservingarea" runat="server" CssClass="ajxtxt"></asp:TextBox>
                                                &nbsp;&nbsp;
                                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                                    ControlToValidate="txtservingarea" ErrorMessage="Serving Area cannot be empty"></asp:RequiredFieldValidator>
                                                 </td></tr><tr><td class="style4">&nbsp;</td><td>&#160;</td></tr><tr><td class="style4">&#160;</td><td>&#160;</td></tr><tr><td class="style4">&#160;</td><td>&#160;</td></tr><tr><td class="style4">&#160;</td><td>&#160;</td></tr><tr><td class="style4">&#160;</td><td>&#160;</td></tr><tr><td class="style4">&#160;</td><td>&#160;</td></tr><tr><td class="style4">&#160;</td><td>&#160;</td></tr><tr><td class="style4">&#160;</td><td>&#160;</td></tr><tr><td class="style4">&#160;</td><td>&#160;</td></tr><tr><td class="style4">&#160;</td><td>&#160;</td></tr><tr><td class="style4">&#160;</td><td>&#160;</td></tr><tr><td class="style4">&#160;</td><td>&#160;</td></tr><tr><td class="style4">&#160;</td><td>&#160;</td></tr><tr><td class="style4">&#160;</td><td>&#160;</td></tr><tr><td class="style4">&#160;</td><td>&#160;</td></tr><tr><td class="style4">&#160;</td><td>&#160;</td></tr><tr><td class="style4">&#160;</td><td>&#160;</td></tr><tr><td class="style4">&#160;</td><td>&#160;</td></tr><tr><td class="style4">&#160;</td><td>&#160;</td></tr><tr><td class="style4">&#160;</td><td>&#160;</td></tr><tr><td class="style4">&#160;</td><td>&#160;</td></tr><tr><td class="style4">&#160;</td><td>&#160;</td></tr></table>
                                    
                                
                                </ContentTemplate></cc1:TabPanel>
                                <cc1:TabPanel ID="TabPanel2" runat="server" HeaderText="Contact person 1 
                                 Details"><ContentTemplate><br /><br /><table class="style6"><tr class="table_tr"><td class="style4">
                                    <asp:Label ID="lblname" runat="server" Text="Name" CssClass="ajxtxt"></asp:Label>
                                    </td><td>
                                        <asp:TextBox ID="txtname1" runat="server" CssClass="ajxtxt"></asp:TextBox>
                                            <cc1:FilteredTextBoxExtender ID="txtname1_FilteredTextBoxExtender" 
                                                runat="server" FilterType =" UppercaseLetters , LowercaseLetters,custom " ValidChars=" "  Enabled="True" 
                                                TargetControlID="txtname1">
                                            </cc1:FilteredTextBoxExtender>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                                ControlToValidate="txtname1" ErrorMessage="Person Name cannot be empty"></asp:RequiredFieldValidator>
                                    </td></tr><tr class="table_tr"><td class="style4">
                                        <asp:Label ID="lblcontpersonphone" runat="server" Text="Phone no." 
                                                CssClass="ajxtxt"></asp:Label>
                                        </td><td>
                                                <asp:TextBox ID="txtp1" runat="server" CssClass="ajxtxt"></asp:TextBox>
                                                <cc1:FilteredTextBoxExtender ID="txtp1_FilteredTextBoxExtender" runat="server" 
                                                    Enabled="True" TargetControlID="txtp1" FilterType ="Numbers" >
                                                </cc1:FilteredTextBoxExtender>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                                                    ControlToValidate="txtp1" ErrorMessage="Phone No cannot be empty"></asp:RequiredFieldValidator>
                                        </td></tr><tr class="table_tr"><td class="style4">
                                        <asp:Label ID="lbldesc" runat="server" 
                                            Text="Description" CssClass="ajxtxt"></asp:Label>
                                        </td><td>
                                            <asp:TextBox ID="txtdesc1" 
                                                runat="server" TextMode="MultiLine" CssClass="ajxtxt"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                                                    ControlToValidate="txtdesc1" ErrorMessage="Person Desc cannot be empty"></asp:RequiredFieldValidator>
                                        </td></tr><tr><td class="style4">&nbsp;</td><td>&nbsp;</td></tr><tr><td class="style4">
                                        &nbsp;</td><td>&nbsp;</td></tr><tr><td class="style4">
                                    <br />
                                    </td><td>&nbsp;</td></tr><tr><td>
                                    &nbsp;</td><td>
                                        &nbsp;</td></tr><tr><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td>
                                    &nbsp;</td><td>&nbsp;</td></tr><tr><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td>
                                    &nbsp;</td><td>&nbsp;</td></tr><tr><td>&nbsp;</td><td>&nbsp;</td></tr></table>
                                </ContentTemplate></cc1:TabPanel>
                               <cc1:TabPanel ID="TabPanel3" runat="server" HeaderText="Contact persong 2 details"><ContentTemplate><br /><br /><table class="style6">
                                   <tr class="table_tr"><td class="style4">
                                    <asp:Label ID="lblname2" runat="server" Text="Name" CssClass="ajxtxt"></asp:Label>
                                    </td><td>
                                        <asp:TextBox ID="txtname2" runat="server" CssClass="ajxtxt"></asp:TextBox>
                                           <cc1:FilteredTextBoxExtender ID="txtname2_FilteredTextBoxExtender" 
                                               runat="server" Enabled="True" 
                                               FilterType =" UppercaseLetters , LowercaseLetters,custom " ValidChars=" " TargetControlID="txtname2">
                                           </cc1:FilteredTextBoxExtender>
                                    </td></tr><tr class="table_tr"><td class="style4">
                                        <asp:Label ID="lblphoneno2" runat="server" Text="Phone no." CssClass="ajxtxt"></asp:Label>
                                        </td><td>
                                            <asp:TextBox ID="txtp2" runat="server" CssClass="ajxtxt"></asp:TextBox>
                                            <cc1:FilteredTextBoxExtender ID="txtp2_FilteredTextBoxExtender" runat="server" 
                                                Enabled="True" TargetControlID="txtp2" FilterType ="Numbers" >
                                            </cc1:FilteredTextBoxExtender>
                                        </td></tr><tr class="table_tr"><td class="style4">
                                        <asp:Label ID="lbldesc2" runat="server" 
                                            Text="Description" CssClass="ajxtxt"></asp:Label>
                                        </td><td>
                                            <asp:TextBox ID="txtdesc2" 
                                                runat="server" TextMode="MultiLine" CssClass="ajxtxt"></asp:TextBox>
                                        </td></tr><tr><td class="style4">&nbsp;</td><td>&nbsp;</td></tr><tr><td class="style4">
                                        &nbsp;</td><td>&nbsp;</td></tr><tr><td class="style4">
                                    <br />
                                    </td><td>&nbsp;</td></tr><tr><td>
                                    &nbsp;</td><td>
                                        &nbsp;</td></tr><tr><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td>
                                    &nbsp;</td><td>&nbsp;</td></tr><tr><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td>
                                    &nbsp;</td><td>&nbsp;</td></tr><tr><td>&nbsp;</td><td>&nbsp;</td></tr></table>
                                </ContentTemplate></cc1:TabPanel>
                               <cc1:TabPanel ID="TabPanel4" runat="server" HeaderText="Contact person 3 details"><ContentTemplate><br /><br /><table class="style6">
                                   <tr class="table_tr"><td class="style4">
                                    <asp:Label ID="lblname3" runat="server" Text="Name" CssClass="ajxtxt"></asp:Label>
                                    </td><td>
                                        <asp:TextBox ID="txtname3" runat="server" CssClass="ajxtxt"></asp:TextBox>
                                           <cc1:FilteredTextBoxExtender ID="txtname3_FilteredTextBoxExtender" 
                                               runat="server" Enabled="True" 
                                              FilterType =" UppercaseLetters , LowercaseLetters,custom " ValidChars=" " TargetControlID="txtname3">
                                           </cc1:FilteredTextBoxExtender>
                                    </td></tr><tr class="table_tr"><td class="style4">
                                        <asp:Label ID="Label5" runat="server" Text="Phone no." CssClass="ajxtxt"></asp:Label>
                                        </td><td>
                                            <asp:TextBox ID="txtp3" runat="server" CssClass="ajxtxt"></asp:TextBox>
                                            <cc1:FilteredTextBoxExtender ID="txtp3_FilteredTextBoxExtender" runat="server" 
                                                Enabled="True"  TargetControlID="txtp3" FilterType ="Numbers" >
                                            </cc1:FilteredTextBoxExtender>
                                        </td></tr><tr class="table_tr"><td class="style4">
                                        <asp:Label ID="Label6" runat="server" 
                                            Text="Description" CssClass="ajxtxt"></asp:Label>
                                        </td><td>
                                            <asp:TextBox ID="txtdesc3" 
                                                runat="server" TextMode="MultiLine" CssClass="ajxtxt"></asp:TextBox>
                                        </td></tr><tr><td class="style4">&nbsp;</td><td>&nbsp;</td></tr><tr><td class="style4">
                                        &nbsp;</td><td>&nbsp;</td></tr><tr><td class="style4">
                                    <br />
                                    </td><td>&nbsp;</td></tr><tr><td>
                                    &nbsp;</td><td>
                                        &nbsp;</td></tr><tr><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td>
                                    &nbsp;</td><td>&nbsp;</td></tr><tr><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td>
                                    &nbsp;</td><td>&nbsp;</td></tr><tr><td>&nbsp;</td><td>&nbsp;</td></tr></table>
                                </ContentTemplate></cc1:TabPanel>
                               
                            </cc1:TabContainer></td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="float:left;"><asp:Button ID="btninsert" runat="server" onclick="btninsert_Click" 
                    Text="Insert" CssClass="btnstyle" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btninsert0" runat="server" onclick="btninsert0_Click" 
                    Text="Reset" CssClass="btnstyle" />
                <br />
                <br />
                <asp:Label ID="lblretvendorid" runat="server" CssClass="ajxtxt" ForeColor="Red"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
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
<asp:Content ContentPlaceHolderID ="ContentPlaceHolder2" runat ="server" ID ="vendor1">
    <asp:HyperLink ID="HyperLink1" runat="server" Enabled ="false" >Insert</asp:HyperLink>  &nbsp;  &nbsp;  &nbsp;  &nbsp;|    &nbsp;  &nbsp;  &nbsp;  &nbsp;
    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl ="~/vendor3up.aspx" >Update</asp:HyperLink>

</asp:Content>

