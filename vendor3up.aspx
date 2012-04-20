<%@ Page Language="C#" MasterPageFile="~/MasterHomePage.master" AutoEventWireup="true" CodeFile="vendor3up.aspx.cs" Inherits="vendor3up" Title="Vendor Detail Update" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .ajax__combobox_buttoncontainer button
{
    background-image: url(mvwres://AjaxControlToolkit, Version=3.0.30930.28736, Culture=neutral, PublicKeyToken=28f01b0e84b6d53e/AjaxControlToolkit.ComboBox.arrow-down.gif);
    background-position: center;
    background-repeat: no-repeat;
    border-color: ButtonFace;
    height: 15px;
    width: 15px;
}
             </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="title">
<div class="titletxt">Update Third Party Vendor Details</div>
</div>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
            <div style="background-image:url(images/bgStripe.png); float:left; width:700px; background-repeat:repeat-x;">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
        
            <table class="table_tr" >
                <tr class="table_tr">
                    <td >
                        <asp:Label ID="Label1" runat="server" Text="Select Company name:" 
                            CssClass="ajxtxt"></asp:Label>
                    </td>
                    <td>
                        
                        <cc1:ComboBox ID="cbselcmpname" runat="server" AutoCompleteMode="SuggestAppend" 
                            AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="cmpname" 
                            DataValueField="cmpname" DropDownStyle="DropDownList" MaxLength="0" 
                            style="display: inline;" AppendDataBoundItems="True" CssClass="ajxtxt" 
                            ForeColor="Black">
                            <asp:ListItem Selected="True"></asp:ListItem>
                        </cc1:ComboBox>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:assetdbConnectionString %>" 
                            SelectCommand="SELECT DISTINCT [cmpname] FROM [vendor3_details]">
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="go" >
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td  colspan="2" class="gridtxt">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                            DataKeyNames="vendor_id" DataSourceID="SqlDataSource2" CssClass="ajxtxt slct grdview" >
                            <Columns>
                                <asp:TemplateField ShowHeader="False" ControlStyle-CssClass="slct">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                            CommandName="Select" onclick="LinkButton1_Click1" Text="Select" PostBackUrl= '<%# "~/vendor3up.aspx?vdid="+Eval("vendor_id") %>' ForeColor="#3399FF" Height="17px" CssClass="slct"></asp:LinkButton>
                                    </ItemTemplate>
                                    <ControlStyle CssClass="slct" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="cmpname" HeaderText="Company Name" 
                                    SortExpression="cmpname"  HeaderStyle-CssClass="ajxtxt slct" >
                                    <HeaderStyle CssClass="ajxtxt slct" />
                                </asp:BoundField>
                                <asp:BoundField DataField="address" HeaderText="Address" 
                                    SortExpression="address"  HeaderStyle-CssClass="ajxtxt" >
                                    <HeaderStyle CssClass="ajxtxt" />
                                </asp:BoundField>
                                <asp:BoundField DataField="vendor_id" HeaderText="Vendor Id" 
                                    SortExpression="vendor_id" InsertVisible="False" ReadOnly="True"   
                                    HeaderStyle-CssClass="ajxtxt">
                                    <HeaderStyle CssClass="ajxtxt" />
                                </asp:BoundField>
                                <asp:BoundField DataField="servingarea" HeaderText="Serving Area" 
                                    SortExpression="servingarea"  HeaderStyle-CssClass="ajxtxt" >
                                    <HeaderStyle CssClass="ajxtxt" />
                                </asp:BoundField>
                            </Columns>
                              <HeaderStyle BackColor="#FC950A"  CssClass="grdhead" Font-Bold="True" 
                                ForeColor="White" />
                        <EditRowStyle Font-Bold="False" />
                            <AlternatingRowStyle BackColor="#CCCCCC" ForeColor="Black" />
                        </asp:GridView>
                    </td>
                </tr>
                <tr>
                    <td >
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:assetdbConnectionString %>" 
                            
                            SelectCommand="SELECT [cmpname], [address], [vendor_id], [servingarea] FROM [vendor3_details] WHERE ([cmpname] = @cmpname)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="cbselcmpname" Name="cmpname" 
                                    PropertyName="SelectedValue" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td  colspan="2">
                        <cc1:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="2" 
                            Height="254px" Visible="False" Width="700px">
                            <cc1:TabPanel ID="TabPanel1" runat="server" HeaderText="Equipment Information">
                                <HeaderTemplate>
                                    Organizatin details
                                </HeaderTemplate>
                                <ContentTemplate>
                                    <br />
                                    <br />
                                    <table >
                                        <tr class="table_tr">
                                            <td >
                                                <asp:Label ID="lblvendorid" runat="server" Text="Vendor ID" CssClass="ajxtxt"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtvendorid" runat="server" Enabled="False" CssClass="ajxtxt"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr class="table_tr">
                                            <td >
                                                <asp:Label ID="lblcmpname0" runat="server" Text="Company name" 
                                                    CssClass="ajxtxt"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtcmpname" runat="server" Enabled="False" CssClass="ajxtxt"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                                    ControlToValidate="txtcmpname" ErrorMessage="Company Name cannot be empty"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr class="table_tr">
                                            <td >
                                                <asp:Label ID="lbladrs" runat="server" Text="Address" CssClass="ajxtxt"></asp:Label>
                                            </td>
                                            <td >
                                                <asp:TextBox ID="txtadrs" runat="server" TextMode="MultiLine" CssClass="ajxtxt"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                                    ControlToValidate="txtadrs" ErrorMessage="Address cannot be empty"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr class="table_tr">
                                            <td >
                                                <asp:Label ID="lblphoneno" runat="server" Text="Phone no." CssClass="ajxtxt"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtphoneno" runat="server" CssClass="ajxtxt"></asp:TextBox>
                                                <cc1:FilteredTextBoxExtender ID="txtphoneno_FilteredTextBoxExtender" 
                                                    runat="server" Enabled="True" TargetControlID="txtphoneno" FilterType="Numbers" >
                                                </cc1:FilteredTextBoxExtender>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                                    ControlToValidate="txtphoneno" ErrorMessage="Phone No cannot be empty"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr class="table_tr">
                                            <td >
                                                <asp:Label ID="lblempemailid" runat="server" Text="Email ID" CssClass="ajxtxt"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtemailid" runat="server" CssClass="ajxtxt"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                                    ControlToValidate="txtemailid" ErrorMessage="Email ID cannot be empty"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr class="table_tr">
                                            <td >
                                                <asp:Label ID="lblservingarea" runat="server" Text="Serving Area" 
                                                    CssClass="ajxtxt"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtservingarea" runat="server" CssClass="ajxtxt"></asp:TextBox>
                                                &nbsp;&nbsp;&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator5" 
                                                    runat="server" ControlToValidate="txtservingarea" 
                                                    ErrorMessage="Serving Area cannot be empty"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td >
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td >
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td >
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td >
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td >
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td >
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td >
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td >
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td >
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td >
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td >
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td >
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td >
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td >
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td >
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td >
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td >
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td >
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td >
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td >
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td >
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td >
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                    </table>
                                </ContentTemplate>
                            </cc1:TabPanel>
                            <cc1:TabPanel ID="TabPanel2" runat="server" HeaderText="Contact person 1 Details">
                                <ContentTemplate>
                                    <br />
                                    <br />
                                    <br />
                                    <br />
                                    <table >
                                        <tr class="table_tr">
                                            <td >
                                                <asp:Label ID="lblname" runat="server" Text="Name" CssClass="ajxtxt"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtname1" runat="server" CssClass="ajxtxt"></asp:TextBox>
                                                <cc1:FilteredTextBoxExtender ID="txtname1_FilteredTextBoxExtender" 
                                                    runat="server" Enabled="True" TargetControlID="txtname1" 
                                                    FilterType ="Custom, UppercaseLetters, LowercaseLetters" ValidChars=" ">
                                                </cc1:FilteredTextBoxExtender>
                                            </td>
                                        </tr>
                                        <tr class="table_tr">
                                            <td >
                                                <asp:Label ID="lblcontpersonphone" runat="server" Text="Phone no." 
                                                    CssClass="ajxtxt"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtphoneno1" runat="server" CssClass="ajxtxt"></asp:TextBox>
                                                <cc1:FilteredTextBoxExtender ID="txtphoneno1_FilteredTextBoxExtender" 
                                                    runat="server" Enabled="True" TargetControlID="txtphoneno1" FilterType="Numbers" >
                                                </cc1:FilteredTextBoxExtender>
                                            </td>
                                        </tr>
                                        <tr class="table_tr">
                                            <td >
                                                <asp:Label ID="lbldesc" runat="server" Text="Description" CssClass="ajxtxt"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtdesc1" runat="server" TextMode="MultiLine" 
                                                    CssClass="ajxtxt"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td >
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td >
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td >
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
                                    <table >
                                        <tr class="table_tr">
                                            <td >
                                                <asp:Label ID="lblname2" runat="server" Text="Name" CssClass="ajxtxt"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtname2" runat="server" CssClass="ajxtxt"></asp:TextBox>
                                                <cc1:FilteredTextBoxExtender ID="txtname2_FilteredTextBoxExtender" 
                                                    runat="server" Enabled="True" TargetControlID="txtname2" 
                                                    FilterType ="Custom, UppercaseLetters, LowercaseLetters" ValidChars=" ">
                                                </cc1:FilteredTextBoxExtender>
                                            </td>
                                        </tr>
                                        <tr class="table_tr">
                                            <td >
                                                <asp:Label ID="lblphoneno2" runat="server" Text="Phone no." CssClass="ajxtxt"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtphoneno2" runat="server" CssClass="ajxtxt"></asp:TextBox>
                                                <cc1:FilteredTextBoxExtender ID="txtphoneno2_FilteredTextBoxExtender" 
                                                    runat="server" Enabled="True" TargetControlID="txtphoneno2" FilterType="Numbers"  >
                                                </cc1:FilteredTextBoxExtender>
                                            </td>
                                        </tr>
                                        <tr class="table_tr">
                                            <td >
                                                <asp:Label ID="lbldesc2" runat="server" Text="Description" CssClass="ajxtxt"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtdesc2" runat="server" TextMode="MultiLine" 
                                                    CssClass="ajxtxt"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td >
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td >
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td >
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
                                    <table >
                                        <tr class="table_tr">
                                            <td >
                                                <asp:Label ID="lblname3" runat="server" Text="Name" CssClass="ajxtxt"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtname3" runat="server" CssClass="ajxtxt"></asp:TextBox>
                                                <cc1:FilteredTextBoxExtender ID="txtname3_FilteredTextBoxExtender" 
                                                    runat="server" Enabled="True" TargetControlID="txtname3" FilterType =" UppercaseLetters , LowercaseLetters,custom " ValidChars=" "  >
                                                </cc1:FilteredTextBoxExtender>
                                            </td>
                                        </tr>
                                        <tr class="table_tr">
                                            <td >
                                                <asp:Label ID="Label5" runat="server" Text="Phone no." CssClass="ajxtxt"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtphoneno3" runat="server" CssClass="ajxtxt"></asp:TextBox>
                                                <cc1:FilteredTextBoxExtender ID="txtphoneno3_FilteredTextBoxExtender" 
                                                    runat="server" Enabled="True" TargetControlID="txtphoneno3" FilterType="Numbers" >
                                                </cc1:FilteredTextBoxExtender>
                                            </td>
                                        </tr>
                                        <tr class="table_tr">
                                            <td >
                                                <asp:Label ID="Label6" runat="server" Text="Description" CssClass="ajxtxt"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtdesc3" runat="server" TextMode="MultiLine" 
                                                    CssClass="ajxtxt"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td >
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td >
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td >
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
                <tr>
                    <td >
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td >
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2">
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button class="btnstyle" ID="btnupdate" runat="server" Text="Update" 
                    onclick="btnupdate_Click" Visible="False" CssClass="btnstyle" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:Button 
                            ID="btndel" runat="server" CssClass="btnstyle" 
                            onclick="btndel_Click" Text="Delete" Visible="False" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btndel0" runat="server" CssClass="btnstyle" 
                            onclick="btndel0_Click" Text="Reset" Visible="False" />
                        <br />
                        <br />
                        <asp:Label ID="lblupvendor3" runat="server" CssClass="ajxtxt" ForeColor="Red"></asp:Label>
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

<asp:Content ContentPlaceHolderID ="ContentPlaceHolder2" runat ="server" ID ="vendor2">
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl ="~/ins3vendordet.aspx" >Insert</asp:HyperLink>  &nbsp;  &nbsp;  &nbsp;  &nbsp;|    &nbsp;  &nbsp;  &nbsp;  &nbsp;
    <asp:HyperLink ID="HyperLink2" runat="server" Enabled ="false" >Update</asp:HyperLink>
</asp:Content>