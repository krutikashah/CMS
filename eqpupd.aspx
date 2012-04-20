<%@ Page Language="C#" MasterPageFile="~/MasterHomePage.master" AutoEventWireup="true" CodeFile="eqpupd.aspx.cs" Inherits="eqpupd" Title="Update Equipment" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
   
    
    <style type="text/css">
        .style1
        {
            height: 22px;
        }
    </style>
    
   
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


<div class="title">
<div class="titletxt">Update Asset Details</div>
</div>

    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div style="background-image:url(images/bgStripe.png); background-repeat:repeat-x; float:left; width:700px;">
        
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
        
            <table>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" CssClass="ajxtxt" Text="Client ID"></asp:Label>
                    </td>
                    <td>
                        <cc1:ComboBox ID="cbclientid" runat="server" AppendDataBoundItems="True" 
                            AutoCompleteMode="SuggestAppend" AutoPostBack="True" 
                            DataSourceID="SqlDataSource1" DataTextField="org_name" 
                            DataValueField="client_id" DropDownStyle="DropDownList" MaxLength="0" 
                            style="display: inline;" 
                            onselectedindexchanged="cbclientid_SelectedIndexChanged" CssClass="ajxtxt" 
                            Font-Italic="False" ForeColor="Black">
                        </cc1:ComboBox>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:assetdbConnectionString %>" 
                            
                            SelectCommand="SELECT DISTINCT [client_id], [org_name] FROM [client_details]">
                        </asp:SqlDataSource>
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
                        <asp:Label ID="Label2" runat="server" CssClass="ajxtxt" Text="Type"></asp:Label>
                    </td>
                    <td>
                        <cc1:ComboBox ID="cbtypesel" runat="server" AutoCompleteMode="SuggestAppend" 
                            AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="eqp_type" 
                            DataValueField="eqp_type" DropDownStyle="DropDownList" MaxLength="0" 
                            style="display: inline;" 
                            onselectedindexchanged="cbtypesel_SelectedIndexChanged" ForeColor="Black">
                        </cc1:ComboBox>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:assetdbConnectionString %>" 
                            
                            SelectCommand="SELECT DISTINCT  [eqp_type] FROM [equipment_details] WHERE ([client_id] = @client_id)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="cbclientid" Name="client_id" 
                                    PropertyName="SelectedValue" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2" class="gridtxt">
                        <asp:GridView ID="GridView2" Width="700px" runat="server" AutoGenerateColumns="False" 
                            DataKeyNames="equipment_id" DataSourceID="SqlDataSource6" 
                            CssClass="ajxtxt slct grdview" AlternatingRowStyle-BackColor="#CCCCCC" 
                            AlternatingRowStyle-ForeColor="Black">
                            <Columns>
                                <asp:TemplateField ShowHeader="False" ControlStyle-Height="18px" ControlStyle-CssClass="slct">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False"
                                            CommandName="Select" onclick="LinkButton1_Click1" Text="Select" PostBackUrl= '<%# "~/eqpupd.aspx?EQid="+Eval("equipment_id") %>' ForeColor="#3399FF"></asp:LinkButton>
                                    </ItemTemplate>
                                    <ControlStyle CssClass="slct" Height="18px" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="equipment_id" HeaderText="Asset ID" 
                                    InsertVisible="False" ReadOnly="True" SortExpression="equipment_id" 
                                    HeaderStyle-CssClass="ajxtxt" >
                                    <HeaderStyle CssClass="ajxtxt" />
                                </asp:BoundField>
                                <asp:BoundField DataField="eqp_type" HeaderText="Asset Type" 
                                    SortExpression="eqp_type" HeaderStyle-CssClass="ajxtxt" >
                                    <HeaderStyle CssClass="ajxtxt" />
                                </asp:BoundField>
                                <asp:BoundField DataField="buildingname" HeaderText="Building Name" 
                                    SortExpression="buildingname" HeaderStyle-CssClass="ajxtxt" >
                                    <HeaderStyle CssClass="ajxtxt" />
                                </asp:BoundField>
                                
                            </Columns>
                           <HeaderStyle BackColor="#FC950A"  CssClass="grdhead" Font-Bold="True" 
                                Font-Italic="False" ForeColor="White" />
                            
                            <AlternatingRowStyle BackColor="#CCCCCC" ForeColor="Black" />
                              <HeaderStyle BackColor="#E28F20"  CssClass="grdhead" Font-Bold="True" />
                        <EditRowStyle Font-Bold="False" />
                            <AlternatingRowStyle BackColor="#CCCCCC" ForeColor="Black" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource6" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:assetdbConnectionString %>" 
                            SelectCommand="SELECT [equipment_id], [eqp_type], [buildingname] FROM [equipment_details] WHERE (([client_id] = @client_id) AND ([eqp_type] = @eqp_type))">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="cbclientid" Name="client_id" 
                                    PropertyName="SelectedValue" Type="Int32" />
                                <asp:ControlParameter ControlID="cbtypesel" Name="eqp_type" 
                                    PropertyName="SelectedValue" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td style="height:528px;" colspan="2">
                  
                        <cc1:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" 
                            Height="652px" style="margin-right: 60px" Width="640px" Visible="False" 
                            AutoPostBack="True">
                            
                            
                            
                            <cc1:TabPanel ID="TabPanel1" runat="server" HeaderText="TabPanel1"><HeaderTemplate>
Equipment Information
                            </HeaderTemplate>
<ContentTemplate><br /><br /><table><tr 
                                class="table_tr"><td><asp:Label ID="lblassetid" CssClass="ajxtxt" runat="server" Enabled="False" Text="Asset ID"></asp:Label></td><td><asp:TextBox 
                                ID="txtassetid" runat="server" Enabled="False" CssClass="ajxtxt"></asp:TextBox></td></tr><tr 
                                class="table_tr"><td style="width:128px;"><asp:Label ID="lbleqptype" runat="server" CssClass="ajxtxt" Text="Asset Type"></asp:Label><br /><br /><br /><br /><br /><br /><br /></td><td><br />&#160;&#160;&#160;&#160;&#160;<br /><cc1:ComboBox 
                                    ID="cbtype" runat="server" AutoCompleteMode="SuggestAppend" 
                                                    AutoPostBack="True" DataSourceID="SqlDataSource7" DataTextField="type" 
                                                    DataValueField="type" DropDownStyle="DropDownList" MaxLength="0" 
                                                    style="display: inline;" 
                                                    onselectedindexchanged="cbtype_SelectedIndexChanged" 
                                    CssClass="ajxtxt"></cc1:ComboBox>&#160;&#160;&#160;&#160; <asp:Label ID="lbltype" runat="server" Enabled="False" 
                                                    Text="Other(please mention)"></asp:Label><asp:TextBox 
                                    ID="txttype" runat="server" Enabled="False" CssClass="ajxtxt"></asp:TextBox><asp:SqlDataSource ID="SqlDataSource7" runat="server" 
                                                    ConnectionString="<%$ ConnectionStrings:assetdbConnectionString %>" 
                                                    SelectCommand="SELECT DISTINCT [type] FROM [equipment_type]"></asp:SqlDataSource><cc1:ComboBox 
                                    ID="cbsubtype" runat="server" AutoCompleteMode="SuggestAppend" 
                                                    AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="name" 
                                                    DataValueField="name" DropDownStyle="DropDownList" MaxLength="0" 
                                                    style="display: inline;" 
                                                    onselectedindexchanged="cbsubtype_SelectedIndexChanged" 
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
                                            runat="server" CssClass="ajxtxt"></asp:TextBox><cc1:CalendarExtender ID="CalendarExtender1" runat="server" Enabled="True" 
                                                                        PopupButtonID="img" TargetControlID="txtdofmfg"></cc1:CalendarExtender>&#160;&#160;&#160;&#160;&#160; <img ID="img" alt="" src="images/calendar_icon.jpg" 
                                                                        style="width: 28px; height: 21px" /><asp:RegularExpressionValidator 
                                                ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtdofmfg" 
                                                ErrorMessage="Enter valid Date of Manufacturing" 
                                                ValidationExpression="(([1-9]|1[012])[ /]([1-9]|[12][0-9]|3[01])[ /](19|20|18|17|16|15)\d\d)|( )"></asp:RegularExpressionValidator>
                                        </td></tr><tr 
                                    style="height:20px;" class="table_tr"><td><asp:Label ID="Lbldoinst" runat="server" Text="Date of installment" 
                                            CssClass="ajxtxt"></asp:Label></td><td><asp:TextBox ID="txtdoinst" 
                                            runat="server" CssClass="ajxtxt"></asp:TextBox><cc1:CalendarExtender ID="CalendarExtender2" runat="server" Enabled="True" 
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
                                            <cc1:FilteredTextBoxExtender ID="txtlenwarranty_FilteredTextBoxExtender" 
                                                runat="server" Enabled="True" TargetControlID="txtlenwarranty" FilterType ="Numbers" >
                                            </cc1:FilteredTextBoxExtender>
                                        </td></tr><tr 
                                    style="height:20px;" class="table_tr"><td>
                                            <asp:Label ID="lblextwarranty" runat="server" Text="Extended warranty(in months)" 
                                        CssClass="ajxtxt"></asp:Label></td><td><asp:TextBox ID="txtextwarranty" 
                                            runat="server" CssClass="ajxtxt"></asp:TextBox>
                                            <cc1:FilteredTextBoxExtender ID="txtextwarranty_FilteredTextBoxExtender" 
                                                runat="server" Enabled="True" TargetControlID="txtextwarranty" FilterType ="Numbers" >
                                            </cc1:FilteredTextBoxExtender>
                                        </td></tr><tr 
                                    style="height:20px;" class="table_tr"><td><asp:Label ID="lblmake" runat="server" Text="Make" CssClass="ajxtxt"></asp:Label></td><td><asp:TextBox 
                                        ID="txtmake" runat="server" CssClass="ajxtxt"></asp:TextBox></td></tr><tr 
                                    class="table_tr"><td class="style1"><asp:Label ID="lblmodel" runat="server" Text="Model" CssClass="ajxtxt"></asp:Label></td><td 
                                        class="style1"><asp:TextBox ID="txtmodel" runat="server" CssClass="ajxtxt"></asp:TextBox></td></tr><tr><td><asp:Label ID="lblserial" runat="server" Text="Serial#" CssClass="ajxtxt"></asp:Label></td><td><asp:TextBox 
                                        ID="txtserial" runat="server" CssClass="ajxtxt"></asp:TextBox></td></tr><tr style="height:20px;"><td><asp:Label ID="lbltonnage" runat="server" Text="Tonnage" CssClass="ajxtxt"></asp:Label></td><td><asp:TextBox 
                                        ID="txttonnage" runat="server" CssClass="ajxtxt"></asp:TextBox>
                                        <cc1:FilteredTextBoxExtender ID="txttonnage_FilteredTextBoxExtender" 
                                            runat="server" Enabled="True" TargetControlID="txttonnage" FilterType ="Numbers,Custom" ValidChars ="." >
                                        </cc1:FilteredTextBoxExtender>
                                        </td></tr><tr style="height:20px;"><td><asp:Label ID="lblage" runat="server" Text="Age" CssClass="ajxtxt"></asp:Label></td><td><asp:TextBox 
                                        ID="txtage" runat="server" CssClass="ajxtxt"></asp:TextBox>
                                        <cc1:FilteredTextBoxExtender ID="txtage_FilteredTextBoxExtender" runat="server" 
                                            Enabled="True" TargetControlID="txtage" FilterType ="Numbers" >
                                        </cc1:FilteredTextBoxExtender>
                                        </td></tr><tr style="height:20px;"><td><asp:Label ID="lblservingarea" runat="server" Text="Serving Area" 
                                        CssClass="ajxtxt"></asp:Label></td><td><asp:TextBox ID="txtservingarea" 
                                            runat="server" CssClass="ajxtxt"></asp:TextBox></td></tr><tr style="height:20px;"><td><asp:Label ID="lbloptcrt" runat="server" Text="Operating Current" 
                                        CssClass="ajxtxt"></asp:Label></td><td><asp:TextBox ID="txtoptcrt" 
                                            runat="server" CssClass="ajxtxt"></asp:TextBox>
                                            <cc1:FilteredTextBoxExtender ID="txtoptcrt_FilteredTextBoxExtender" 
                                                runat="server" Enabled="True" TargetControlID="txtoptcrt" FilterType ="Numbers,Custom" ValidChars =".">
                                            </cc1:FilteredTextBoxExtender>
                                        </td></tr><tr><td><asp:Label ID="lbloptvol" runat="server" Text="Operating Voltage" 
                                        CssClass="ajxtxt"></asp:Label></td><td><asp:TextBox ID="txtoptvol" 
                                            runat="server" CssClass="ajxtxt"></asp:TextBox>
                                            <cc1:FilteredTextBoxExtender ID="txtoptvol_FilteredTextBoxExtender" 
                                                runat="server" Enabled="True" TargetControlID="txtoptvol" FilterType ="Numbers,Custom" ValidChars =".">
                                            </cc1:FilteredTextBoxExtender>
                                        </td></tr><tr style="height:20px;"><td><asp:Label ID="lblamcperiod" runat="server" Text="AMC period" CssClass="ajxtxt"></asp:Label></td><td>
                                        <asp:TextBox ID="txtamcperiod" runat="server" CssClass="ajxtxt"></asp:TextBox>
                                        <cc1:FilteredTextBoxExtender ID="txtamcperiod_FilteredTextBoxExtender" 
                                            runat="server" Enabled="True" TargetControlID="txtamcperiod" FilterType ="Numbers" >
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
                       
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                    <asp:Button class="btnstyle" ID="btnupdate" runat="server" Text="Update" 
                    onclick="btnupdate_Click" Visible="False" />
                    
                       
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btndelete" runat="server" CssClass="btnstyle" 
                            onclick="btndelete_Click" Text="Delete" Visible="False" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btndelete0" runat="server" CssClass="btnstyle" 
                            onclick="btndelete0_Click" Text="Reset" Visible="False" />
                        <br />
                        <br />
                        <asp:Label ID="lblupdmes" runat="server" CssClass="ajxtxt" ForeColor="Red"></asp:Label>
                    
                       
                    </td>
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
<asp:Content ContentPlaceHolderID ="ContentPlaceHolder2"  runat ="server" ID ="equipment2">
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl ="~/inseqpdetails.aspx" >Insert</asp:HyperLink>  &nbsp;  &nbsp;  &nbsp;  &nbsp;|    &nbsp;  &nbsp;  &nbsp;  &nbsp;
    <asp:HyperLink ID="HyperLink2" runat="server" Enabled ="false" >Update</asp:HyperLink>
</asp:Content>

