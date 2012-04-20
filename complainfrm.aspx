<%@ Page Language="C#" MasterPageFile="~/MasterHomePage.master" AutoEventWireup="true" CodeFile="complainfrm.aspx.cs" Inherits="complainfrm" Title="Complaint Registration" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 534px;
        }
        </style>
        <%--<script type="text/javascript">
function validateCombo(source, args)
{
var combo = $find("<%= cbclientnme.ClientID %>");
   var text = combo.get_text();
   var node = combo.findItemByText(text);
 if (node)
       {
           var value = node.get_value();
//           if (value.length > 0 && value % 2 == 0)
        if(value=="")
           {
           alert ("empty");
            //   args.IsValid = true;
           }
       }--%>

<%--
</script>--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <div class="title">
    <div class="titletxt">Insert New Complaint</div>
    </div>
    
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <cc1:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" 
                            Height="480px" style="margin-right: 60px" Width="640px" 
                            AutoPostBack="True" 
    onactivetabchanged="TabContainer1_ActiveTabChanged">
                <cc1:TabPanel ID="TabPanel1" runat="server" HeaderText="TabPanel1"><HeaderTemplate>General Details</HeaderTemplate><ContentTemplate><br /><br /><table><tr><td class="style3"><asp:Label ID="lblclientname9" runat="server" CssClass="ajxtxt" 
                                            Text="Name of Client"></asp:Label></td><td 
                                        colspan="3"><cc1:ComboBox ID="cbclientnme" runat="server" AutoCompleteMode="SuggestAppend" 
                                            AutoPostBack="True" CssClass="ajxtxt" DataSourceID="SqlDataSource1" 
                                            DataTextField="org_name" DataValueField="client_id" 
                                            DropDownStyle="DropDownList" ForeColor="Black" MaxLength="0" 
                                            onselectedindexchanged="cbclientnme_SelectedIndexChanged1" 
                                            style="display: inline;" AppendDataBoundItems="True"><asp:ListItem 
                                            Selected="True"></asp:ListItem></cc1:ComboBox><asp:SqlDataSource 
                                            ID="SqlDataSource1" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:assetdbConnectionString %>" 
                                            SelectCommand="SELECT [client_id], [org_name] FROM [client_details]"></asp:SqlDataSource></td></tr><tr><td class="style2"><asp:Label 
                                            ID="lblclientname10" runat="server" CssClass="ajxtxt" 
                                            Text="Customer name"></asp:Label></td><td 
                                        colspan="3"><cc1:ComboBox ID="cbclientcont" 
                                            runat="server" AutoCompleteMode="SuggestAppend" 
                                            AutoPostBack="True" CssClass="ajxtxt" DataSourceID="SqlDataSource2" 
                                            DataTextField="name" DataValueField="cc_id" DropDownStyle="DropDownList" 
                                            ForeColor="Black" MaxLength="0" style="display: inline;"><asp:ListItem Selected="True"></asp:ListItem></cc1:ComboBox><asp:SqlDataSource 
                                            ID="SqlDataSource2" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:assetdbConnectionString %>" 
                                            
                                            
                                            
                                        SelectCommand="SELECT [cc_id], [name], [client_id] FROM [clientcontact_details] WHERE ([client_id] = @client_id)"><SelectParameters><asp:ControlParameter 
                                                    ControlID="cbclientnme" Name="client_id" 
                                                    PropertyName="SelectedValue" Type="Int32" /></SelectParameters></asp:SqlDataSource></td></tr><tr 
                                class="table_tr"><td class="style3">&#160;</td><td>&#160;</td><td>&#160;</td><td>&#160;</td></tr><tr 
                                class="table_tr"><td class="style3">&#160;</td><td 
                                        colspan="3">&#160;</td></tr><tr><td colspan="4">&#160;&#160;&#160;&#160;&#160;&#160;</td></tr></table></ContentTemplate></cc1:TabPanel>
                <cc1:TabPanel ID="TabPanel2" runat="server" HeaderText="TabPanel2"><HeaderTemplate>Task Details</HeaderTemplate><ContentTemplate><br /><br /><br /><br /><table><tr class="table_tr"><td class="style2"><asp:Label ID="Label1" runat="server" CssClass="ajxtxt" Text="Date of Complain"></asp:Label></td><td><asp:TextBox ID="txtdoc" runat="server" CssClass="ajxtxt" Enabled="False"></asp:TextBox></td></tr><tr class="table_tr"><td class="style2"><asp:Label ID="Label2" runat="server" CssClass="ajxtxt" Text="Problem Type"></asp:Label></td><td><cc1:ComboBox ID="cbprobtype" runat="server" AutoCompleteMode="SuggestAppend" 
                                                AutoPostBack="True" CssClass="ajxtxt" DataSourceID="SqlDataSource7" 
                                                DataTextField="eqp_type" DataValueField="eqp_type" DropDownStyle="DropDownList" 
                                                MaxLength="0" style="display: inline;" ForeColor="Black"><asp:ListItem Selected="True"></asp:ListItem></cc1:ComboBox><asp:SqlDataSource ID="SqlDataSource7" runat="server" 
                                                ConnectionString="<%$ ConnectionStrings:assetdbConnectionString %>" 
                                                SelectCommand="SELECT DISTINCT [eqp_type] FROM [equipment_details] WHERE ([client_id] = @client_id)"><SelectParameters><asp:SessionParameter Name="client_id" SessionField="combosel" Type="Int32" /></SelectParameters></asp:SqlDataSource></td></tr><tr class="table_tr"><td class="style2"><asp:Label ID="lblprobsub" runat="server" CssClass="ajxtxt" 
                                                Text="Problem Subtype"></asp:Label></td><td><cc1:ComboBox ID="cbprobtype0" runat="server" AutoCompleteMode="SuggestAppend" 
                                                AutoPostBack="True" CssClass="ajxtxt" DataSourceID="SqlDataSource8" 
                                                DataTextField="eqp_subtype" DataValueField="eqp_subtype" DropDownStyle="DropDownList" 
                                                MaxLength="0" style="display: inline;" ForeColor="Black"><asp:ListItem Selected="True"></asp:ListItem></cc1:ComboBox><asp:SqlDataSource ID="SqlDataSource8" runat="server" 
                                                ConnectionString="<%$ ConnectionStrings:assetdbConnectionString %>" 
                                                SelectCommand="SELECT DISTINCT [eqp_subtype] FROM [equipment_details] WHERE (([eqp_type] = @eqp_type) AND ([client_id] = @client_id))"><SelectParameters><asp:ControlParameter ControlID="cbprobtype" Name="eqp_type" 
                                                        PropertyName="SelectedValue" Type="String" /><asp:SessionParameter Name="client_id" SessionField="combosel" Type="Int32" /></SelectParameters></asp:SqlDataSource></td></tr><tr class="table_tr"><td class="style4"><asp:Label ID="Label13" runat="server" CssClass="ajxtxt" Text="Priority"></asp:Label></td><td><asp:DropDownList ID="ddlpriority" runat="server" CssClass="ajxtxt" 
                                                ForeColor="Black"><asp:ListItem></asp:ListItem><asp:ListItem>Critical</asp:ListItem><asp:ListItem>Regular</asp:ListItem></asp:DropDownList></td></tr><tr class="table_tr"><td class="style4"><asp:Label ID="Label21" runat="server" CssClass="ajxtxt" 
                                                Text="Task Description"></asp:Label></td><td><asp:TextBox ID="txtxtaskdesc" runat="server" CssClass="ajxtxt" 
                                                ForeColor="Black" TextMode="MultiLine"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ErrorMessage="Task Desc cannot be empty" ControlToValidate="txtxtaskdesc"></asp:RequiredFieldValidator></td></tr><tr class="table_tr"><td class="style4"><asp:Label ID="Label22" runat="server" CssClass="ajxtxt" Text="Others"></asp:Label></td><td><asp:TextBox ID="txtothers" runat="server" CssClass="ajxtxt" 
                                                TextMode="MultiLine"></asp:TextBox></td></tr>
                    <tr class="table_tr">
                        <td class="style4">
                            <asp:Label ID="Label23" runat="server" CssClass="ajxtxt" Text="ETA"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txteta" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    </table></ContentTemplate></cc1:TabPanel>
                <cc1:TabPanel ID="TabPanel3" runat="server" HeaderText="TabPanel3"><HeaderTemplate>Additional Details</HeaderTemplate><ContentTemplate><br /><asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder><br /><br /><br /><br /></ContentTemplate></cc1:TabPanel>
            </cc1:TabContainer>
        </ContentTemplate>
    </asp:UpdatePanel>
    <div style="background-image:url(images/bgStripe.png); float:left; width:700px;  background-repeat:repeat-x;">
    <table class="style1">
        <tr class="table_tr">
            <td class="style2">
                
                        &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr class="table_tr">
            <td class="style2">
                <asp:Button runat="server" Text="Insert" CssClass="btnstyle" ID="btninsert" OnClick="Button1_Click1">
                </asp:Button>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button runat="server" Text="Reset" CssClass="btnstyle" ID="btninsert0" 
                    OnClick="btninsert0_Click">
                </asp:Button>
                <br />
                <br />
                <asp:Label ID="lblretticketid" runat="server" CssClass="ajxtxt" ForeColor="Red"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        </table>
    </div>
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
<asp:Content ContentPlaceHolderID ="ContentPlaceHolder2" runat ="server" ID="complain1">
    <asp:HyperLink ID="HyperLink1" runat="server" Enabled ="false" >Insert</asp:HyperLink>&nbsp;  &nbsp;  &nbsp;  &nbsp;|    &nbsp;  &nbsp;  &nbsp;  &nbsp;
    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl ="~/complainupd.aspx" >Update</asp:HyperLink>

</asp:Content>

