<%@ Page Language="C#" MasterPageFile="~/MasterHomePage.master" AutoEventWireup="true" CodeFile="inseqpdetails.aspx.cs" Inherits="eqpdetails" Title="Add Equipment Details" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
  
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="title">
<div class="titletxt">Insert Asset Details</div>
</div>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
     <div style="background-image:url(images/bgStripe.png); float:left; width:700px;  background-repeat:repeat-x;">
    <asp:UpdatePanel ID="upwhole" runat="server" >
    
        <ContentTemplate>
        <br />
            <table >
                <tr class="table_tr">
                    <td>
                        <asp:Label ID="lblclientid" runat="server" Text="Client Name" CssClass="ajxtxt"></asp:Label>
                    </td>
                    <td>
                        <cc1:ComboBox ID="cborgname" runat="server" DataSourceID="SqlDataSource3" 
                            DataTextField="org_name" DataValueField="client_id" MaxLength="0" 
                            style="display: inline;" AutoCompleteMode="SuggestAppend" 
                            AutoPostBack="True" DropDownStyle="DropDownList" CssClass="ajxtxt" 
                            ForeColor="Black" AppendDataBoundItems="True" 
                            onselectedindexchanged="cborgname_SelectedIndexChanged">
                            <asp:ListItem Selected="True"></asp:ListItem>
                        </cc1:ComboBox>
                        &nbsp;<asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:assetdbConnectionString %>" 
                            SelectCommand="SELECT [client_id], [org_name] FROM [client_details]">
                        </asp:SqlDataSource>
                    &nbsp;
                    </td>
                </tr>
            </table>
                    <asp:Button ID="btnaddneweqp" runat="server" onclick="Button2_Click" 
                Text="ADD NEW EQUIPMENT" CssClass="btnstyle" Visible="False" />
            <br />
            <br />
&nbsp;<cc1:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" 
                style="margin-right: 60px " Width ="700px" Height ="671px" 
                Visible="False" AutoPostBack="True" >
                <cc1:TabPanel ID="TabPanel1" runat="server" HeaderText="TabPanel1" >
                      <HeaderTemplate>
                                        Equipment Information
                                    
                                    
                
                                    
                                    
                
                </HeaderTemplate>
                                    

<ContentTemplate>
                                        <br />
                                        <br />
                                        <table >
                                            <tr class="table_tr">
                                                <td >
                                                    <asp:Label ID="lbleqptype" runat="server" Text="Asset Type" CssClass="ajxtxt"></asp:Label>
                                                    <br />
                                                    <br />
                                                    <br />
                                                    <br />
                                                    <br />
                                                    <br />
                                                    <br />
                                                </td>
                                                <td >
                                                    <br />
                                                  
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
                                                    <cc1:ComboBox ID="cbtype" runat="server" DataSourceID="SqlDataSource1" DataTextField="type" 
                                                        DataValueField="type" MaxLength="0" style="display: inline;" 
                                                        AutoCompleteMode ="SuggestAppend" DropDownStyle ="DropDownList" 
                                                        AutoPostBack="True" onselectedindexchanged="cbtype_SelectedIndexChanged" 
                                                        CssClass="ajxtxt" ForeColor="Black" >
                                                    </cc1:ComboBox>
                                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                                    <asp:Label ID="lbltype" runat="server" Text="Other(please mention)" 
                                                        Enabled="False" CssClass="ajxtxt"></asp:Label>
                                                    <asp:TextBox ID="txttype" runat="server" Enabled="False" CssClass="ajxtxt"></asp:TextBox>
                                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                                        ConnectionString="<%$ ConnectionStrings:assetdbConnectionString %>" 
                                                        SelectCommand="SELECT DISTINCT [type] FROM [equipment_type]"></asp:SqlDataSource>
                                                    <cc1:ComboBox ID="cbsubtype" runat="server" 
                                                        DataSourceID="SqlDataSource2" DataTextField="name" DataValueField="name" 
                                                        MaxLength="0" style="display: inline;" AutoCompleteMode ="SuggestAppend" 
                                                        DropDownStyle ="DropDownList" AutoPostBack="True" 
                                                        onselectedindexchanged="cbsubtype_SelectedIndexChanged" CssClass="ajxtxt" 
                                                        ForeColor="Black" >
                                                    </cc1:ComboBox>
                                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                                    <asp:Label ID="lblsubtype" runat="server" Text="Other(please mention)" 
                                                        Enabled="False" CssClass="ajxtxt"></asp:Label>
                                                    <asp:TextBox ID="txtsubtype" runat="server" Enabled="False" CssClass="ajxtxt"></asp:TextBox>
                                                    &nbsp;<asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                                                        ConnectionString="<%$ ConnectionStrings:assetdbConnectionString %>" 
                                                        SelectCommand="SELECT [name] FROM [equipment_type] WHERE ([type] = @type)">
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="cbtype" Name="type" 
                                                                PropertyName="SelectedValue" Type="String" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                    <br />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td  colspan="2">
                                                    <asp:UpdatePanel ID="upeqpdetshow" runat="server" Visible="False">
                                                        <ContentTemplate>
                                                            <table >
                                                                <tr class="table_tr">
                                                                    <td >
                                                                        <asp:Label ID="lblmfg" runat="server" Text="Manufacturer" CssClass="ajxtxt"></asp:Label>
                                                                    </td>
                                                                    <td >
                                                                        <asp:TextBox ID="txtmfg" runat="server" CssClass="ajxtxt"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr class="table_tr">
                                                                    <td >
                                                                        <asp:Label ID="lbldofmfg" runat="server" Text="Date of manufacturing" 
                                                                            CssClass="ajxtxt"></asp:Label>
                                                                    </td>
                                                                    <td >
                                                                        <asp:TextBox ID="txtdofmfg" runat="server" CssClass="ajxtxt"></asp:TextBox>
                                                                        <cc1:CalendarExtender ID="CalendarExtender1" runat="server" Enabled="True" 
                                                                            PopupButtonID="img" TargetControlID="txtdofmfg">
                                                                        </cc1:CalendarExtender>
                                                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                        <img ID="img" alt="" src="images/calendar_icon.jpg" 
                                                                            style="width: 28px; height: 21px" />&nbsp;
                                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                                                            ControlToValidate="txtdofmfg" ErrorMessage="Enter valid Date of Manufacturing" 
                                                                            
                                                                            ValidationExpression="(([1-9]|1[012])[ /]([1-9]|[12][0-9]|3[01])[ /](19|20|18|17|16|15)\d\d)|( )"></asp:RegularExpressionValidator>
                                                                    </td>
                                                                </tr>
                                                                <tr class="table_tr">
                                                                    <td >
                                                                        <asp:Label ID="Lbldoinst" runat="server" Text="Date of installment" 
                                                                            CssClass="ajxtxt"></asp:Label>
                                                                    </td>
                                                                    <td >
                                                                        <asp:TextBox ID="txtdoinst" runat="server" CssClass="ajxtxt"></asp:TextBox>
                                                                        <cc1:CalendarExtender ID="CalendarExtender2" runat="server" Enabled="True" 
                                                                            PopupButtonID="img1" TargetControlID="txtdoinst">
                                                                        </cc1:CalendarExtender>
                                                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img ID="img1" alt="" src="images/calendar_icon.jpg" 
                                                                            style="width: 28px; height: 24px" />
                                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                                                                            ControlToValidate="txtdoinst" ErrorMessage="Enter valid Date of Installment" 
                                                                            
                                                                            ValidationExpression="(([1-9]|1[012])[ /]([1-9]|[12][0-9]|3[01])[ /](19|20|18|17|16|15)\d\d)|( )"></asp:RegularExpressionValidator>
                                                                    </td>
                                                                </tr>
                                                                <tr class="table_tr">
                                                                    <td >
                                                                        <asp:Label ID="lbllenwarranty" runat="server" Text="Length of warranty(in months)" 
                                                                            CssClass="ajxtxt"></asp:Label>
                                                                    </td>
                                                                    <td >
                                                                        <asp:TextBox ID="txtlenwarranty" runat="server" CssClass="ajxtxt"></asp:TextBox>
                                                                        <cc1:FilteredTextBoxExtender ID="txtlenwarranty_FilteredTextBoxExtender" 
                                                                          FilterType="Numbers"   runat="server" Enabled="True" TargetControlID="txtlenwarranty">
                                                                        </cc1:FilteredTextBoxExtender>
                                                                    </td>
                                                                </tr>
                                                                <tr class="table_tr">
                                                                    <td >
                                                                        <asp:Label ID="lblextwarranty" runat="server" Text="Extended warranty(in months)" 
                                                                            CssClass="ajxtxt"></asp:Label>
                                                                    </td>
                                                                    <td >
                                                                        <asp:TextBox ID="txtextwarranty" runat="server" CssClass="ajxtxt"></asp:TextBox>
                                                                        <cc1:FilteredTextBoxExtender ID="txtextwarranty_FilteredTextBoxExtender" 
                                                                            runat="server" Enabled="True" TargetControlID="txtextwarranty" FilterType="Numbers" >
                                                                        </cc1:FilteredTextBoxExtender>
                                                                    </td>
                                                                </tr>
                                                                <tr class="table_tr">
                                                                    <td >
                                                                        <asp:Label ID="lblmake" runat="server" Text="Make" CssClass="ajxtxt"></asp:Label>
                                                                    </td>
                                                                    <td >
                                                                        <asp:TextBox ID="txtmake" runat="server" CssClass="ajxtxt"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr class="table_tr">
                                                                    <td >
                                                                        <asp:Label ID="lblmodel" runat="server" Text="Model" CssClass="ajxtxt"></asp:Label>
                                                                    </td>
                                                                    <td >
                                                                        <asp:TextBox ID="txtmodel" runat="server" CssClass="ajxtxt"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr class="table_tr">
                                                                    <td >
                                                                        <asp:Label ID="lblserial" runat="server" Text="Serial#" CssClass="ajxtxt"></asp:Label>
                                                                    </td>
                                                                    <td >
                                                                        <asp:TextBox ID="txtserial" runat="server" CssClass="ajxtxt"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr class="table_tr">
                                                                    <td class="table_tr" >
                                                                        <asp:Label ID="lbltonnage" runat="server" Text="Tonnage" CssClass="ajxtxt"></asp:Label>
                                                                    </td>
                                                                    <td >
                                                                        <asp:TextBox ID="txttonnage" runat="server" CssClass="ajxtxt"></asp:TextBox>
                                                                        <cc1:FilteredTextBoxExtender ID="txttonnage_FilteredTextBoxExtender" 
                                                                            runat="server" Enabled="True" TargetControlID="txttonnage" FilterType="Numbers,Custom" ValidChars ="." >
                                                                        </cc1:FilteredTextBoxExtender>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td >
                                                                        <asp:Label ID="lblage" runat="server" Text="Age" CssClass="ajxtxt"></asp:Label>
                                                                    </td>
                                                                    <td >
                                                                        <asp:TextBox ID="txtage" runat="server" CssClass="ajxtxt"></asp:TextBox>
                                                                        <cc1:FilteredTextBoxExtender ID="txtage_FilteredTextBoxExtender" runat="server" 
                                                                            Enabled="True" FilterType="Numbers"  TargetControlID="txtage">
                                                                        </cc1:FilteredTextBoxExtender>
                                                                    </td>
                                                                </tr>
                                                                <tr class="table_tr">
                                                                    <td >
                                                                        <asp:Label ID="lblservingarea" runat="server" Text="Serving Area" 
                                                                            CssClass="ajxtxt"></asp:Label>
                                                                    </td>
                                                                    <td >
                                                                        <asp:TextBox ID="txtservingarea" runat="server" CssClass="ajxtxt"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr class="table_tr">
                                                                    <td >
                                                                        <asp:Label ID="lbloptcrt" runat="server" Text="Operating Current" 
                                                                            CssClass="ajxtxt"></asp:Label>
                                                                    </td>
                                                                    <td >
                                                                        <asp:TextBox ID="txtoptcrt" runat="server" CssClass="ajxtxt"></asp:TextBox>
                                                                        <cc1:FilteredTextBoxExtender ID="txtoptcrt_FilteredTextBoxExtender" 
                                                                           FilterType="Numbers,Custom" ValidChars ="." runat="server" Enabled="True" TargetControlID="txtoptcrt">
                                                                        </cc1:FilteredTextBoxExtender>
                                                                    </td>
                                                                </tr>
                                                                <tr class="table_tr">
                                                                    <td >
                                                                        <asp:Label ID="lbloptvol" runat="server" Text="Operating Voltage" 
                                                                            CssClass="ajxtxt"></asp:Label>
                                                                    </td>
                                                                    <td >
                                                                        <asp:TextBox ID="txtoptvol" runat="server" CssClass="ajxtxt"></asp:TextBox>
                                                                        <cc1:FilteredTextBoxExtender ID="txtoptvol_FilteredTextBoxExtender" 
                                                                            runat="server" FilterType="Numbers,Custom" ValidChars ="." Enabled="True" TargetControlID="txtoptvol">
                                                                        </cc1:FilteredTextBoxExtender>
                                                                    </td>
                                                                </tr>
                                                                <tr class="table_tr">
                                                                    <td >
                                                                        <asp:Label ID="lblamcperiod" runat="server" Text="AMC period(in months)" 
                                                                            CssClass="ajxtxt"></asp:Label>
                                                                    </td>
                                                                    <td >
                                                                        <asp:TextBox ID="txtamcperiod" runat="server" CssClass="ajxtxt"></asp:TextBox>
                                                                        <cc1:FilteredTextBoxExtender ID="txtamcperiod_FilteredTextBoxExtender" 
                                                                            runat="server" Enabled="True" TargetControlID="txtamcperiod" FilterType="Numbers">
                                                                        </cc1:FilteredTextBoxExtender>
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
                                                            </table>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </td>
                                            </tr>
                                            
                                           
                                        </table>
                                    </ContentTemplate>
                                

</cc1:TabPanel>
               
                <cc1:TabPanel ID="TabPanel2" runat="server" HeaderText="TabPanel2">
                <HeaderTemplate>
                                      Location Information
                                    
                                    
                
                                    
                                    
                
                </HeaderTemplate>
                  

<ContentTemplate>
                                        <br />
                                        <br />
                                        <br />
                                        <br />
                                        <table >
                                            <tr class="table_tr">
                                                <td >
                                                    <asp:Label ID="lblbldgname" runat="server" Text="Building Name" 
                                                        CssClass="ajxtxt"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtbldgname" runat="server" CssClass="ajxtxt"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr class="table_tr">
                                                <td >
                                                    <asp:Label ID="lblbldgno" runat="server" Text="Building#" CssClass="ajxtxt"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtbldgno" runat="server" CssClass="ajxtxt"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr class="table_tr">
                                                <td >
                                                    <asp:Label ID="lblblockno" runat="server" Text="Block#" CssClass="ajxtxt"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtblockno" runat="server" CssClass="ajxtxt"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr class="table_tr">
                                                <td >
                                                    <asp:Label ID="lblwing" runat="server" Text="Wing#" CssClass="ajxtxt"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtwing" runat="server" CssClass="ajxtxt"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr class="table_tr">
                                                <td >
                                                    <asp:Label ID="lblaptno" runat="server" Text="Appartment#" CssClass="ajxtxt"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtaptno" runat="server" CssClass="ajxtxt"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr class="table_tr">
                                                <td >
                                                    <asp:Label ID="lblfloor" runat="server" Text="Floor#" CssClass="ajxtxt"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtfloor" runat="server" CssClass="ajxtxt"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr class="table_tr">
                                                <td >
                                                    <asp:Label ID="lblzone" runat="server" Text="Zone" CssClass="ajxtxt"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtzone" runat="server" CssClass="ajxtxt"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr class="table_tr">
                                                <td >
                                                    <asp:Label ID="lblroomtype" runat="server" Text="Room Type" CssClass="ajxtxt"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtroomtype" runat="server" CssClass="ajxtxt"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr class="table_tr">
                                                <td >
                                                    <asp:Label ID="lblroomdetails" runat="server" Text="Room Details" 
                                                        CssClass="ajxtxt"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtroomdetails" runat="server" CssClass="ajxtxt"></asp:TextBox>
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
                                        </table>
                                    </ContentTemplate>
                

</cc1:TabPanel>
               
                <cc1:TabPanel ID="TabPanel3" runat="server" HeaderText="TabPanel3">
                 <HeaderTemplate>
                                        Additional Details
                                              
                                              
                
                                              
                                              
                
                </HeaderTemplate>
                    

<ContentTemplate>
                                        <br />
                                        <table >
                                            <tr class="table_tr">
                                                <td >
                                                    <asp:Label ID="lblotherdetails" runat="server" Text="Other details" 
                                                        CssClass="ajxtxt"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtotherdetails" runat="server" TextMode="MultiLine" 
                                                        CssClass="ajxtxt"></asp:TextBox>
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
                                        </table>
                                    </ContentTemplate>
                                

</cc1:TabPanel>
                          
            </cc1:TabContainer>
            
            <br /><asp:Button ID="btninsert"  runat="server" OnClick="Button1_Click" Text="Insert" 
                Height="29px" Width="55px" Visible="False" CssClass="btnstyle"/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btninsert0" runat="server" CssClass="btnstyle" Height="29px" 
                OnClick="btninsert0_Click" Text="Reset" Visible="False" Width="55px" />
            <br />
            <br />
            <asp:Label ID="lblretassetid" runat="server" CssClass="ajxtxt" ForeColor="Red"></asp:Label>
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
<asp:Content ContentPlaceHolderID ="ContentPlaceHolder2" runat ="server"  ID ="eqp1">

    <asp:HyperLink ID="HyperLink1" runat="server" Enabled ="false" >Insert</asp:HyperLink>  &nbsp;  &nbsp;  &nbsp;  &nbsp;|    &nbsp;  &nbsp;  &nbsp;  &nbsp;
    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl ="~/eqpupd.aspx" >Update</asp:HyperLink>
</asp:Content>

