<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AssetDetails.aspx.cs" Inherits="AssetDetails" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title> Asset Details</title>
    <link href="HomePage.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
    
 
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
        <div style="background-image:url(images/bgStripe.png); width:700px; float:left; background-repeat:repeat-x;">

                  
                        <cc1:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" 
                            Height="652px" style="margin-right: 60px" 
        Width="640px" Visible="False" 
                            AutoPostBack="True">
                            
                            
                            
                            <cc1:TabPanel ID="TabPanel1" runat="server" HeaderText="TabPanel1"><HeaderTemplate>
                                
                                Equipment Information
                                </HeaderTemplate>
                                <ContentTemplate><br /><br /><table><tr 
                                class="table_tr"><td><asp:Label ID="lblassetid" CssClass="ajxtxt" runat="server" Enabled="False" Text="Asset ID"></asp:Label></td><td><asp:TextBox 
                                ID="txtassetid" runat="server" Enabled="False" CssClass="ajxtxt"></asp:TextBox></td></tr><tr 
                                class="table_tr"><td style="width:128px;"><asp:Label ID="lbleqptype" runat="server" CssClass="ajxtxt" Text="Asset Type"></asp:Label><br /><br /><br /><br /><br /><br /><br /></td><td><br />&#160;&#160;&#160;&#160;&#160;<br />
                                        <cc1:ComboBox 
                                    ID="cbtype" runat="server" AutoCompleteMode="SuggestAppend" 
                                                    AutoPostBack="True" DataSourceID="SqlDataSource7" DataTextField="type" 
                                                    DataValueField="type" DropDownStyle="DropDownList" MaxLength="0" 
                                                    style="display: inline;" 
                                    CssClass="ajxtxt"></cc1:ComboBox>&#160;&#160;&#160;&#160; <asp:Label ID="lbltype" runat="server" Enabled="False" 
                                                    Text="Other(please mention)"></asp:Label><asp:TextBox 
                                    ID="txttype" runat="server" Enabled="False" CssClass="ajxtxt"></asp:TextBox><asp:SqlDataSource ID="SqlDataSource7" runat="server" 
                                                    ConnectionString="<%$ ConnectionStrings:assetdbConnectionString %>" 
                                                    SelectCommand="SELECT DISTINCT [type] FROM [equipment_type]"></asp:SqlDataSource>
                                        <cc1:ComboBox 
                                    ID="cbsubtype" runat="server" AutoCompleteMode="SuggestAppend" 
                                                    AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="name" 
                                                    DataValueField="name" DropDownStyle="DropDownList" MaxLength="0" 
                                                    style="display: inline;" 
                                    CssClass="ajxtxt"></cc1:ComboBox>&#160;&#160;&#160;&#160; <asp:Label ID="lblsubtype" runat="server" Enabled="False" 
                                                    Text="Other(please mention)"></asp:Label><asp:TextBox 
                                    ID="txtsubtype" runat="server" Enabled="False" CssClass="ajxtxt"></asp:TextBox>&#160;<asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                                                    ConnectionString="<%$ ConnectionStrings:assetdbConnectionString %>" 
                                                    SelectCommand="SELECT [name] FROM [equipment_type] WHERE ([type] = @type)"><SelectParameters><asp:ControlParameter ControlID="cbtype" Name="type" 
                                                            PropertyName="SelectedValue" Type="String" /></SelectParameters></asp:SqlDataSource><br /></td></tr><tr><td colspan="2"><asp:UpdatePanel ID="upeqpdetshow" runat="server" Visible="False"><ContentTemplate><table><tr 
                                    style="height:20px;" class="table_tr"><td><asp:Label ID="lblmfg" runat="server" Text="Manufacturer" CssClass="ajxtxt"></asp:Label></td><td><asp:TextBox 
                                    ID="txtmfg" runat="server" CssClass="ajxtxt"></asp:TextBox></td></tr><tr 
                                    style="height:20px;" class="table_tr"><td><asp:Label ID="lbldofmfg" runat="server" Text="Date of manufacturing" 
                                        CssClass="ajxtxt"></asp:Label></td><td><asp:TextBox ID="txtdofmfg" 
                                            runat="server" CssClass="ajxtxt"></asp:TextBox>
                                                <cc1:CalendarExtender ID="CalendarExtender3" runat="server" Enabled="True" 
                                                                        PopupButtonID="img" TargetControlID="txtdofmfg"></cc1:CalendarExtender>&#160;&#160;&#160;&#160;&#160; <img ID="img" alt="" src="images/calendar_icon.jpg" 
                                                                        style="width: 28px; height: 21px" /><asp:RegularExpressionValidator 
                                                ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtdofmfg" 
                                                ErrorMessage="Enter valid Date of Manufacturing" 
                                                ValidationExpression="(([1-9]|1[012])[ /]([1-9]|[12][0-9]|3[01])[ /](19|20|18|17|16|15)\d\d)|( )"></asp:RegularExpressionValidator>
                                        </td></tr><tr 
                                    style="height:20px;" class="table_tr"><td><asp:Label ID="Lbldoinst" runat="server" Text="Date of installment" 
                                            CssClass="ajxtxt"></asp:Label></td><td><asp:TextBox ID="txtdoinst" 
                                            runat="server" CssClass="ajxtxt"></asp:TextBox>
                                                <cc1:CalendarExtender ID="CalendarExtender4" runat="server" Enabled="True" 
                                                                        PopupButtonID="img1" TargetControlID="txtdoinst"></cc1:CalendarExtender>&#160;&#160;&#160;&#160;&#160;&#160;<img ID="img1" alt="" src="images/calendar_icon.jpg" 
                                                                        style="width: 28px; height: 24px" /><asp:RegularExpressionValidator 
                                                ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtdoinst" 
                                                ErrorMessage="Enter valid Date of Installment" 
                                                ValidationExpression="(([1-9]|1[012])[ /]([1-9]|[12][0-9]|3[01])[ /](19|20|18|17|16|15)\d\d)|( )"></asp:RegularExpressionValidator>
                                        </td></tr><tr 
                                    style="height:20px;" class="table_tr"><td>
                                            <asp:Label ID="lbllenwarranty" runat="server" Text="Length of warranty(in months)" 
                                            CssClass="ajxtxt"></asp:Label></td><td><asp:TextBox ID="txtlenwarranty" 
                                            runat="server" CssClass="ajxtxt"></asp:TextBox>
                                            <cc1:FilteredTextBoxExtender ID="txtlenwarranty_FilteredTextBoxExtender0" 
                                                runat="server" Enabled="True" TargetControlID="txtlenwarranty" 
                                                    FilterType ="Numbers" >
                                            </cc1:FilteredTextBoxExtender>
                                        </td></tr><tr 
                                    style="height:20px;" class="table_tr"><td>
                                            <asp:Label ID="lblextwarranty" runat="server" Text="Extended warranty(in months)" 
                                        CssClass="ajxtxt"></asp:Label></td><td><asp:TextBox ID="txtextwarranty" 
                                            runat="server" CssClass="ajxtxt"></asp:TextBox>
                                            <cc1:FilteredTextBoxExtender ID="txtextwarranty_FilteredTextBoxExtender0" 
                                                runat="server" Enabled="True" TargetControlID="txtextwarranty" 
                                                    FilterType ="Numbers" >
                                            </cc1:FilteredTextBoxExtender>
                                        </td></tr><tr 
                                    style="height:20px;" class="table_tr"><td><asp:Label ID="lblmake" runat="server" Text="Make" CssClass="ajxtxt"></asp:Label></td><td><asp:TextBox 
                                        ID="txtmake" runat="server" CssClass="ajxtxt"></asp:TextBox></td></tr><tr 
                                    class="table_tr"><td class="style1"><asp:Label ID="lblmodel" runat="server" Text="Model" CssClass="ajxtxt"></asp:Label></td><td 
                                        class="style1"><asp:TextBox ID="txtmodel" runat="server" CssClass="ajxtxt"></asp:TextBox></td></tr><tr><td><asp:Label ID="lblserial" runat="server" Text="Serial#" CssClass="ajxtxt"></asp:Label></td><td><asp:TextBox 
                                        ID="txtserial" runat="server" CssClass="ajxtxt"></asp:TextBox></td></tr><tr style="height:20px;"><td><asp:Label ID="lbltonnage" runat="server" Text="Tonnage" CssClass="ajxtxt"></asp:Label></td><td><asp:TextBox 
                                        ID="txttonnage" runat="server" CssClass="ajxtxt"></asp:TextBox>
                                        <cc1:FilteredTextBoxExtender ID="txttonnage_FilteredTextBoxExtender0" 
                                            runat="server" Enabled="True" TargetControlID="txttonnage" 
                                                FilterType ="Numbers,Custom" ValidChars ="." >
                                        </cc1:FilteredTextBoxExtender>
                                        </td></tr><tr style="height:20px;"><td><asp:Label ID="lblage" runat="server" Text="Age" CssClass="ajxtxt"></asp:Label></td><td><asp:TextBox 
                                        ID="txtage" runat="server" CssClass="ajxtxt"></asp:TextBox>
                                        <cc1:FilteredTextBoxExtender ID="txtage_FilteredTextBoxExtender0" runat="server" 
                                            Enabled="True" TargetControlID="txtage" FilterType ="Numbers" >
                                        </cc1:FilteredTextBoxExtender>
                                        </td></tr><tr style="height:20px;"><td><asp:Label ID="lblservingarea" runat="server" Text="Serving Area" 
                                        CssClass="ajxtxt"></asp:Label></td><td><asp:TextBox ID="txtservingarea" 
                                            runat="server" CssClass="ajxtxt"></asp:TextBox></td></tr><tr style="height:20px;"><td><asp:Label ID="lbloptcrt" runat="server" Text="Operating Current" 
                                        CssClass="ajxtxt"></asp:Label></td><td><asp:TextBox ID="txtoptcrt" 
                                            runat="server" CssClass="ajxtxt"></asp:TextBox>
                                            <cc1:FilteredTextBoxExtender ID="txtoptcrt_FilteredTextBoxExtender0" 
                                                runat="server" Enabled="True" TargetControlID="txtoptcrt" 
                                                    FilterType ="Numbers,Custom" ValidChars =".">
                                            </cc1:FilteredTextBoxExtender>
                                        </td></tr><tr><td><asp:Label ID="lbloptvol" runat="server" Text="Operating Voltage" 
                                        CssClass="ajxtxt"></asp:Label></td><td><asp:TextBox ID="txtoptvol" 
                                            runat="server" CssClass="ajxtxt"></asp:TextBox>
                                            <cc1:FilteredTextBoxExtender ID="txtoptvol_FilteredTextBoxExtender0" 
                                                runat="server" Enabled="True" TargetControlID="txtoptvol" 
                                                    FilterType ="Numbers,Custom" ValidChars =".">
                                            </cc1:FilteredTextBoxExtender>
                                        </td></tr><tr style="height:20px;"><td><asp:Label ID="lblamcperiod" runat="server" Text="AMC period" CssClass="ajxtxt"></asp:Label></td><td>
                                        <asp:TextBox ID="txtamcperiod" runat="server" CssClass="ajxtxt"></asp:TextBox>
                                        <cc1:FilteredTextBoxExtender ID="txtamcperiod_FilteredTextBoxExtender0" 
                                            runat="server" Enabled="True" TargetControlID="txtamcperiod" 
                                                FilterType ="Numbers" >
                                        </cc1:FilteredTextBoxExtender>
                                        </td></tr><tr style="height:20px;"><td>&#160;</td><td>&#160;</td></tr><tr style="height:20px;"><td>&#160;</td><td>&#160;</td></tr></table></ContentTemplate></asp:UpdatePanel></td></tr></table></ContentTemplate>
                                
                            </cc1:TabPanel>
                            <cc1:TabPanel ID="TabPanel2" runat="server" HeaderText="TabPanel2"><HeaderTemplate>
                                
                                Location Information
                                </HeaderTemplate>
                                <ContentTemplate><br /><br /><br /><br /><table><tr class="table_tr"><td><asp:Label ID="lblbldgname" runat="server" Text="Building Name" CssClass="ajxtxt"></asp:Label></td><td><asp:TextBox 
                                ID="txtbldgname" runat="server" CssClass="ajxtxt"></asp:TextBox></td></tr><tr class="table_tr"><td><asp:Label ID="lblbldgno" runat="server" Text="Building#" CssClass="ajxtxt"></asp:Label></td><td><asp:TextBox 
                                    ID="txtbldgno" runat="server" CssClass="ajxtxt"></asp:TextBox></td></tr><tr class="table_tr"><td><asp:Label ID="lblblockno" runat="server" Text="Block#" CssClass="ajxtxt"></asp:Label></td><td><asp:TextBox 
                                    ID="txtblockno" runat="server" CssClass="ajxtxt"></asp:TextBox></td></tr><tr class="table_tr"><td><asp:Label ID="lblwing" runat="server" Text="Wing#" CssClass="ajxtxt"></asp:Label></td><td><asp:TextBox 
                                    ID="txtwing" runat="server" CssClass="ajxtxt"></asp:TextBox></td></tr><tr class="table_tr"><td>
                                    <asp:Label ID="lblaptno" runat="server" Text="Apartment#" CssClass="ajxtxt"></asp:Label></td><td><asp:TextBox 
                                    ID="txtaptno" runat="server" CssClass="ajxtxt"></asp:TextBox></td></tr><tr class="table_tr"><td><asp:Label ID="lblfloor" runat="server" Text="Floor#" CssClass="ajxtxt"></asp:Label></td><td><asp:TextBox 
                                    ID="txtfloor" runat="server" CssClass="ajxtxt"></asp:TextBox></td></tr><tr class="table_tr"><td><asp:Label ID="lblzone" runat="server" Text="Zone" CssClass="ajxtxt"></asp:Label></td><td><asp:TextBox 
                                    ID="txtzone" runat="server" CssClass="ajxtxt"></asp:TextBox></td></tr><tr class="table_tr"><td><asp:Label ID="lblroomtype" runat="server" Text="Room Type" CssClass="ajxtxt"></asp:Label></td><td><asp:TextBox 
                                    ID="txtroomtype" runat="server" CssClass="ajxtxt"></asp:TextBox></td></tr><tr class="table_tr"><td><asp:Label ID="lblroomdetails" runat="server" Text="Room Details" 
                                    CssClass="ajxtxt"></asp:Label></td><td><asp:TextBox ID="txtroomdetails" 
                                        runat="server" CssClass="ajxtxt"></asp:TextBox></td></tr><tr><td>&#160;</td><td>&#160;</td></tr><tr><td>&#160;</td><td>&#160;</td></tr><tr><td>&#160;</td><td>&#160;</td></tr><tr><td>&#160;</td><td>&#160;</td></tr><tr><td>&#160;</td><td>&#160;</td></tr><tr><td>&#160;</td><td>&#160;</td></tr><tr><td>&#160;</td><td>&#160;</td></tr><tr><td>&#160;</td><td>&#160;</td></tr></table></ContentTemplate>
                                
                            </cc1:TabPanel>
                            <cc1:TabPanel ID="TabPanel3" runat="server" HeaderText="TabPanel3"><HeaderTemplate>
                                
                                Additional Details
                                </HeaderTemplate>
                                <ContentTemplate><br /><table class=""><tr><td><asp:Label ID="lblotherdetails" runat="server" Text="Other details" 
                                    CssClass="ajxtxt"></asp:Label></td><td><asp:TextBox ID="txtotherdetails" 
                                    runat="server" TextMode="MultiLine" CssClass="ajxtxt"></asp:TextBox></td></tr><tr><td>&#160;</td><td>&#160;</td></tr><tr><td>&#160;</td><td>&#160;</td></tr></table></ContentTemplate>
                                
                            </cc1:TabPanel>
                            
                        </cc1:TabContainer>
        </div>                
    </form>
</body>
</html>
