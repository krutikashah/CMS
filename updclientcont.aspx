<%@ Page Language="C#" MasterPageFile="~/MasterHomePage.master" AutoEventWireup="true" CodeFile="updclientcont.aspx.cs" Inherits="updclientcont" Title="Update Client Details" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="title">
<div class="titletxt">Update Client Contact Details</div>
</div>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
        <div style="background-image:url(images/bgStripe.png); float:left; width:700px; background-repeat:repeat-x;">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table >
                <tr class="table_tr">
                    <td>
                        <asp:Label ID="lblselectbyorgname" runat="server" Text="By Client Name" 
                            CssClass="ajxtxt"></asp:Label>
                    </td>
                    <td>
                        <cc1:ComboBox ID="cbclientname" runat="server" DataSourceID="SqlDataSource1" 
                            DataTextField="org_name" DataValueField="client_id" MaxLength="0" 
                            style="display: inline;" AutoCompleteMode="SuggestAppend" 
                            AutoPostBack="True" DropDownStyle="DropDownList" 
                            AppendDataBoundItems="True" CssClass="ajxtxt" ForeColor="Black">
                            <asp:ListItem Selected="True"></asp:ListItem>
                        </cc1:ComboBox>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:assetdbConnectionString %>" 
                            SelectCommand="SELECT [client_id], [org_name] FROM [client_details]">
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr class="table_tr">
                    <td>
                        <asp:Label ID="lblcontact" runat="server" Text="By Client Contacts" 
                            CssClass="ajxtxt"></asp:Label>
                    </td>
                    <td>
                        <cc1:ComboBox ID="cbclientcont" runat="server" DataSourceID="SqlDataSource2" 
                            DataTextField="name" DataValueField="cc_id" MaxLength="0" 
                            style="display: inline;" AutoCompleteMode="SuggestAppend" 
                            AutoPostBack="True" DropDownStyle="DropDownList" 
                            AppendDataBoundItems="True" CssClass="ajxtxt" ForeColor="Black">
                            <asp:ListItem Selected="True"></asp:ListItem>
                        </cc1:ComboBox>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:assetdbConnectionString %>" 
                            SelectCommand="SELECT [name], [cc_id] FROM [clientcontact_details] WHERE ([client_id] = @client_id)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="cbclientname" Name="client_id" 
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
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                            DataKeyNames="cc_id" DataSourceID="SqlDataSource3" 
                            CssClass="ajxtxt slct grdview">
                            <Columns>
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                            CommandName="Select" onclick="LinkButton1_Click1" Text="Select" PostBackUrl ='<%# "~/updclientcont.aspx?ccid="+Eval("cc_id") %>' ForeColor="#3399FF"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="cc_id" HeaderText="Client Contact ID" InsertVisible="False" 
                                    ReadOnly="True" SortExpression="cc_id"  HeaderStyle-CssClass="ajxtxt" >
                                    <HeaderStyle CssClass="ajxtxt" />
                                </asp:BoundField>
                                <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name"   
                                    HeaderStyle-CssClass="ajxtxt">
                                    <HeaderStyle CssClass="ajxtxt" />
                                </asp:BoundField>
                                <asp:BoundField DataField="phoneno" HeaderText="Phone No." 
                                    SortExpression="phoneno"  HeaderStyle-CssClass="ajxtxt" >
                                    <HeaderStyle CssClass="ajxtxt" />
                                </asp:BoundField>
                            </Columns>
                              <HeaderStyle BackColor="#FC950A"  CssClass="grdhead" Font-Bold="True" 
                                ForeColor="White" />
                       <EditRowStyle Font-Bold="False" />
                            <AlternatingRowStyle BackColor="#CCCCCC" ForeColor="Black" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:assetdbConnectionString %>" 
                            
                            SelectCommand="SELECT [cc_id], [name], [phoneno] FROM [clientcontact_details] WHERE (([client_id] = @client_id) AND ([cc_id] = @cc_id))">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="cbclientname" Name="client_id" 
                                    PropertyName="SelectedValue" Type="Int32" />
                                <asp:ControlParameter ControlID="cbclientcont" Name="cc_id" 
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
                    <td >
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td  colspan="2">
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server" Visible="False">
                            <ContentTemplate>
                                <table >
                                    <tr class="table_tr">
                                        <td class="ajxtxt" >
                                            <asp:Label ID="lblccid" runat="server" Text="Client Contact ID" 
                                                CssClass="ajxtxt"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtclientcont" runat="server" Enabled="False" 
                                                CssClass="ajxtxt"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr class="table_tr">
                                        <td >
                                            <asp:Label ID="lblaptno" runat="server" Text="Apartment No." CssClass="ajxtxt"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtaptno" runat="server" Enabled="False" CssClass="ajxtxt"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr class="table_tr">
                                        <td >
                                            <asp:Label ID="lblname" runat="server" Text="Name" CssClass="ajxtxt"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtname" runat="server" CssClass="ajxtxt"></asp:TextBox>
                                            <cc1:FilteredTextBoxExtender ID="txtname_FilteredTextBoxExtender" 
                                                runat="server" Enabled="True" TargetControlID="txtname"  FilterType ="LowercaseLetters,UppercaseLetters,custom" ValidChars =" ">
                                            </cc1:FilteredTextBoxExtender>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                                ControlToValidate="txtname" ErrorMessage="Name cannot be empty"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr class="table_tr">
                                        <td >
                                            <asp:Label ID="lblphoneno" runat="server" Text="Phone No." CssClass="ajxtxt"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtphoneno" runat="server" CssClass="ajxtxt"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                                ControlToValidate="txtphoneno" ErrorMessage="Phone No cannot be empty"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr class="table_tr">
                                        <td >
                                            <asp:Label ID="lblemailid" runat="server" Text="E-mail ID" CssClass="ajxtxt"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtemailid" runat="server" CssClass="ajxtxt"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                                ControlToValidate="txtemailid" ErrorMessage="Email ID cannot be empty"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                                ControlToValidate="txtemailid" ErrorMessage="Enter valid Email ID" 
                                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                        </td>
                                    </tr>
                                    <tr class="table_tr">
                                        <td >
                                            <asp:Label ID="lbldesg" runat="server" Text="Designation" CssClass="ajxtxt"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtdesg" runat="server" CssClass="ajxtxt"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                                ControlToValidate="txtdesg" ErrorMessage="Designation cannot be empty"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr class="table_tr">
                                        <td >
                                            <asp:Label ID="lbldesc" runat="server" Text="Description" CssClass="ajxtxt"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtdesc" runat="server" TextMode="MultiLine" CssClass="ajxtxt"></asp:TextBox>
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
                <tr class="table_trs">
                    <td colspan="2">
                         <asp:Button class="btnstyle" ID="btnupdate" runat="server" Text="Update" 
                    onclick="btnupdate_Click" Visible="False" />
                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                         <asp:Button ID="btndel" runat="server" CssClass="btnstyle" 
                             onclick="btndel_Click" Text="Delete" Visible="False" />
                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                         <asp:Button ID="btndel0" runat="server" CssClass="btnstyle" 
                             onclick="btndel0_Click" Text="Reset" Visible="False" />
                         <br />
                         <br />
                         <asp:Label ID="lblclientupd" runat="server" CssClass="ajxtxt" ForeColor="Red"></asp:Label>
                         <br />
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

<asp:Content ContentPlaceHolderID ="ContentPlaceHolder2" runat= "server" ID ="contact2">
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl ="~/ins3vendordet.aspx"  >Insert</asp:HyperLink> &nbsp;  &nbsp;  &nbsp;  &nbsp;|    &nbsp;  &nbsp;  &nbsp;  &nbsp;
    <asp:HyperLink ID="HyperLink2" runat="server"  Enabled ="false" >Update</asp:HyperLink>

</asp:Content>
