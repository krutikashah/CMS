<%@ Page Language="C#" MasterPageFile="~/MasterHomePage.master" AutoEventWireup="true" CodeFile="amcdetails.aspx.cs" Inherits="amcdetails" Title="AMC Details" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

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
<div class="titletxt">AMC Details</div>
</div>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
        <div style="background-image:url(images/bgStripe.png); width:700px; float:left; background-repeat:repeat-x;">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table class="style1">
                <tr class="table_tr">
                    <td colspan="2">
                        <asp:Label ID="Label1" runat="server" Text="Client Details" Font-Size="Large"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblorgname0" runat="server" CssClass="ajxtxt" 
                            Text="Organisation Name"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtorgnameup" runat="server" CssClass="ajxtxt"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                            ControlToValidate="txtorgnameup" 
                            ErrorMessage="Organisation Name cannot be empty"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lbladrs0" runat="server" CssClass="ajxtxt" Text="Address"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtadrsup" runat="server" CssClass="ajxtxt"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                            ControlToValidate="txtadrsup" ErrorMessage="Address cannot be empty"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblphoneno0" runat="server" CssClass="ajxtxt" Text="Phone No."></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtphonenoup" runat="server" CssClass="ajxtxt"></asp:TextBox>
                        <cc1:FilteredTextBoxExtender ID="txtphonenoup_FilteredTextBoxExtender" 
                            runat="server" Enabled="True" FilterType="Numbers" 
                            TargetControlID="txtphonenoup">
                        </cc1:FilteredTextBoxExtender>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                            ControlToValidate="txtphonenoup" ErrorMessage="Phone No cannot be empty"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="table_tr">
                        <asp:Label ID="lblemaidid0" runat="server" CssClass="ajxtxt" Text="Email ID"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtemaildidup" runat="server" CssClass="ajxtxt"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                            ControlToValidate="txtemaildidup" ErrorMessage="Email ID cannot be empty"></asp:RequiredFieldValidator>
                        &nbsp;
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                            ControlToValidate="txtemaildidup" ErrorMessage="Enter valid Email ID" 
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblorgtype0" runat="server" CssClass="ajxtxt" 
                            Text="Serving Area"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtorgtypeup" runat="server" CssClass="ajxtxt"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                            ControlToValidate="txtorgtypeup" ErrorMessage="Serving Area cannot be empty"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr class="table_tr">
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr class="table_tr">
                    <td colspan="2"><hr style="background-color: #0000FF; color: #0000FF;" />
                        &nbsp;</td>
                </tr>
                <tr class="table_tr">
                    <td colspan="2">
                        <asp:Label ID="Label2" runat="server" CssClass="ajxtxt" ForeColor="Black" 
                            Text="Vendor  Details" Font-Size="Large"></asp:Label>
                    </td>
                </tr>
                <tr class="table_tr">
                    <td colspan="2">
                        <cc1:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="1" 
                            Height="254px" Visible="False" Width="700px">
                            <cc1:TabPanel ID="TabPanel1" runat="server" HeaderText="Equipment Information">
                                <HeaderTemplate>
                                    Organizatin details
                                </HeaderTemplate>
                                <ContentTemplate>
                                    <br />
                                    <br />
                                    <table>
                                        <tr class="table_tr">
                                            <td>
                                                <asp:Label ID="lblvendorid" runat="server" CssClass="ajxtxt" Text="Vendor ID"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtvendorid" runat="server" CssClass="ajxtxt" Enabled="False"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr class="table_tr">
                                            <td>
                                                <asp:Label ID="lblcmpname0" runat="server" CssClass="ajxtxt" 
                                                    Text="Company name"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtcmpname" runat="server" CssClass="ajxtxt" Enabled="False"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                                    ControlToValidate="txtcmpname" ErrorMessage="Company Name cannot be empty"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr class="table_tr">
                                            <td>
                                                <asp:Label ID="lbladrs" runat="server" CssClass="ajxtxt" Text="Address"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtadrs" runat="server" CssClass="ajxtxt" TextMode="MultiLine"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                                    ControlToValidate="txtadrs" ErrorMessage="Address cannot be empty"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr class="table_tr">
                                            <td>
                                                <asp:Label ID="lblphoneno" runat="server" CssClass="ajxtxt" Text="Phone no."></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtphoneno" runat="server" CssClass="ajxtxt"></asp:TextBox>
                                                <cc1:FilteredTextBoxExtender ID="txtphoneno_FilteredTextBoxExtender" 
                                                    runat="server" Enabled="True" FilterType="Numbers" TargetControlID="txtphoneno">
                                                </cc1:FilteredTextBoxExtender>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                                    ControlToValidate="txtphoneno" ErrorMessage="Phone No cannot be empty"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr class="table_tr">
                                            <td>
                                                <asp:Label ID="lblempemailid" runat="server" CssClass="ajxtxt" Text="Email ID"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtemailid" runat="server" CssClass="ajxtxt"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                                    ControlToValidate="txtemailid" ErrorMessage="Email ID cannot be empty"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr class="table_tr">
                                            <td>
                                                <asp:Label ID="lblservingarea" runat="server" CssClass="ajxtxt" 
                                                    Text="Serving Area"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtservingarea" runat="server" CssClass="ajxtxt"></asp:TextBox>
                                                &nbsp;&nbsp;&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                                    ControlToValidate="txtservingarea" ErrorMessage="Serving Area cannot be empty"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
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
                                        <tr>
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
                                        <tr>
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
                                        <tr>
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
                                        <tr>
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
                                        <tr>
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
                                        <tr>
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
                                        <tr>
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
                                        <tr>
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
                                        <tr>
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
                                        <tr>
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
                                </ContentTemplate>
                            </cc1:TabPanel>
                            <cc1:TabPanel ID="TabPanel2" runat="server" 
                                HeaderText="Contact person 1 Details">
                                <ContentTemplate>
                                    <br />
                                    <br />
                                    <br />
                                    <br />
                                    <table>
                                        <tr class="table_tr">
                                            <td>
                                                <asp:Label ID="lblname" runat="server" CssClass="ajxtxt" Text="Name"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtname1" runat="server" CssClass="ajxtxt"></asp:TextBox>
                                                <cc1:FilteredTextBoxExtender ID="txtname1_FilteredTextBoxExtender" 
                                                    runat="server" Enabled="True" 
                                                    FilterType="Custom, UppercaseLetters, LowercaseLetters" 
                                                    TargetControlID="txtname1" ValidChars=" ">
                                                </cc1:FilteredTextBoxExtender>
                                            </td>
                                        </tr>
                                        <tr class="table_tr">
                                            <td>
                                                <asp:Label ID="lblcontpersonphone" runat="server" CssClass="ajxtxt" 
                                                    Text="Phone no."></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtphoneno1" runat="server" CssClass="ajxtxt"></asp:TextBox>
                                                <cc1:FilteredTextBoxExtender ID="txtphoneno1_FilteredTextBoxExtender" 
                                                    runat="server" Enabled="True" FilterType="Numbers" 
                                                    TargetControlID="txtphoneno1">
                                                </cc1:FilteredTextBoxExtender>
                                            </td>
                                        </tr>
                                        <tr class="table_tr">
                                            <td>
                                                <asp:Label ID="lbldesc" runat="server" CssClass="ajxtxt" Text="Description"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtdesc1" runat="server" CssClass="ajxtxt" 
                                                    TextMode="MultiLine"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
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
                                        <tr>
                                            <td>
                                                <br />
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
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
                                        <tr>
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
                                        <tr>
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
                                        <tr>
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
                                </ContentTemplate>
                            </cc1:TabPanel>
                            <cc1:TabPanel ID="TabPanel3" runat="server" 
                                HeaderText="Contact persong 2 details">
                                <ContentTemplate>
                                    <br />
                                    <br />
                                    <br />
                                    <br />
                                    <table>
                                        <tr class="table_tr">
                                            <td>
                                                <asp:Label ID="lblname2" runat="server" CssClass="ajxtxt" Text="Name"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtname2" runat="server" CssClass="ajxtxt"></asp:TextBox>
                                                <cc1:FilteredTextBoxExtender ID="txtname2_FilteredTextBoxExtender" 
                                                    runat="server" Enabled="True" 
                                                    FilterType=" UppercaseLetters , LowercaseLetters,custom " 
                                                    TargetControlID="txtname2" ValidChars=" ">
                                                </cc1:FilteredTextBoxExtender>
                                            </td>
                                        </tr>
                                        <tr class="table_tr">
                                            <td>
                                                <asp:Label ID="lblphoneno2" runat="server" CssClass="ajxtxt" Text="Phone no."></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtphoneno2" runat="server" CssClass="ajxtxt"></asp:TextBox>
                                                <cc1:FilteredTextBoxExtender ID="txtphoneno2_FilteredTextBoxExtender" 
                                                    runat="server" Enabled="True" FilterType="Numbers" 
                                                    TargetControlID="txtphoneno2">
                                                </cc1:FilteredTextBoxExtender>
                                            </td>
                                        </tr>
                                        <tr class="table_tr">
                                            <td>
                                                <asp:Label ID="lbldesc2" runat="server" CssClass="ajxtxt" Text="Description"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtdesc2" runat="server" CssClass="ajxtxt" 
                                                    TextMode="MultiLine"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
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
                                        <tr>
                                            <td>
                                                <br />
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
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
                                        <tr>
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
                                        <tr>
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
                                        <tr>
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
                                </ContentTemplate>
                            </cc1:TabPanel>
                            <cc1:TabPanel ID="TabPanel4" runat="server" 
                                HeaderText="Contact person 3 details">
                                <ContentTemplate>
                                    <br />
                                    <br />
                                    <br />
                                    <br />
                                    <table>
                                        <tr class="table_tr">
                                            <td>
                                                <asp:Label ID="lblname3" runat="server" CssClass="ajxtxt" Text="Name"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtname3" runat="server" CssClass="ajxtxt"></asp:TextBox>
                                                <cc1:FilteredTextBoxExtender ID="txtname3_FilteredTextBoxExtender" 
                                                    runat="server" Enabled="True" 
                                                    FilterType=" UppercaseLetters , LowercaseLetters,custom " 
                                                    TargetControlID="txtname3" ValidChars=" ">
                                                </cc1:FilteredTextBoxExtender>
                                            </td>
                                        </tr>
                                        <tr class="table_tr">
                                            <td>
                                                <asp:Label ID="Label5" runat="server" CssClass="ajxtxt" Text="Phone no."></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtphoneno3" runat="server" CssClass="ajxtxt"></asp:TextBox>
                                                <cc1:FilteredTextBoxExtender ID="txtphoneno3_FilteredTextBoxExtender" 
                                                    runat="server" Enabled="True" FilterType="Numbers" 
                                                    TargetControlID="txtphoneno3">
                                                </cc1:FilteredTextBoxExtender>
                                            </td>
                                        </tr>
                                        <tr class="table_tr">
                                            <td>
                                                <asp:Label ID="Label6" runat="server" CssClass="ajxtxt" Text="Description"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtdesc3" runat="server" CssClass="ajxtxt" 
                                                    TextMode="MultiLine"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
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
                                        <tr>
                                            <td>
                                                <br />
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
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
                                        <tr>
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
                                        <tr>
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
                                        <tr>
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
                                </ContentTemplate>
                            </cc1:TabPanel>
                        </cc1:TabContainer>
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
                        <asp:Button ID="Button1" runat="server" CssClass="btnstyle" 
                            Text="AMC Notified" onclick="Button1_Click" />
                    </td>
                </tr>
                <tr class="table_tr">
                    <td colspan="2">
                        <asp:Label ID="Label7" runat="server" ForeColor="Red" Visible="False"></asp:Label>
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
  
       
      
      
           
   <cc1:AlwaysVisibleControlExtender ID="AlwaysVisibleControlExtender1" runat="server"
    TargetControlID="UpdateProgress1"  HorizontalSide="Center"  VerticalSide="Middle"  HorizontalOffset="0">
</cc1:AlwaysVisibleControlExtender>
</div>
</asp:Content>

