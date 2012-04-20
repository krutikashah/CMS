<%@ Page Language="C#" MasterPageFile="~/MasterHomePage.master" AutoEventWireup="true" CodeFile="insclientcontactdet.aspx.cs" Inherits="clientcontactdetails" Title="Insert Contact Details" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style3 {
            width: 100%;
        }
        .style4
        {
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <div class="title">
<div class="titletxt">Add Client Contact Details</div>
</div>
      <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
        <div style="background-image:url(images/bgStripe.png); float:left; width:700px; background-repeat:repeat-x;">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table class="style3">
                <tr>
                    <td class="style4">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr class="table_tr">
                    <td class="style4">
                        <asp:Label ID="lblclientname" runat="server" Text="Client Name" 
                            CssClass="ajxtxt"></asp:Label>
                    </td>
                    <td>
                        <cc1:ComboBox ID="cbclientname" runat="server" AutoCompleteMode="SuggestAppend" 
                            AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="org_name" 
                            DataValueField="client_id" MaxLength="0" 
                            style="display: inline;" CssClass="ajxtxt" AppendDataBoundItems="True" 
                            ForeColor="Black">
                            <asp:ListItem Selected="True"></asp:ListItem>
                        </cc1:ComboBox>
                        &nbsp;<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:assetdbConnectionString %>" 
                            SelectCommand="SELECT [org_name], [client_id] FROM [client_details]">
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr class="table_tr">
                    <td class="style4">
                        <asp:Label ID="lblaptno" runat="server" Text="Apartment No." CssClass="ajxtxt"></asp:Label>
                    </td>
                    <td>
                        <cc1:ComboBox ID="cbaptno" runat="server" AutoCompleteMode="SuggestAppend" 
                            AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="aptno" 
                            DataValueField="equipment_id" DropDownStyle="DropDownList" MaxLength="0" 
                            style="display: inline;" CssClass="ajxtxt" ForeColor="Black">
                        </cc1:ComboBox>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:assetdbConnectionString %>" 
                            SelectCommand="SELECT [equipment_id], [aptno] FROM [equipment_details] WHERE ([client_id] = @client_id) and eqp_type='Housing'">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="cbclientname" Name="client_id" 
                                    PropertyName="SelectedValue" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr class="table_tr">
                    <td class="style4">
                        <asp:Label ID="lblname" runat="server" Text="Name" CssClass="ajxtxt"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtname" runat="server" CssClass="ajxtxt"></asp:TextBox>
                        <cc1:FilteredTextBoxExtender ID="txtname_FilteredTextBoxExtender" 
                            runat="server" Enabled="True"  FilterType ="LowercaseLetters,UppercaseLetters,custom" ValidChars =" "  TargetControlID="txtname">
                        </cc1:FilteredTextBoxExtender>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ControlToValidate="txtname" ErrorMessage="Name cannot be empty"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr class="table_tr">
                    <td class="style4">
                        <asp:Label ID="lblphoneno" runat="server" Text="Phone No." CssClass="ajxtxt"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtphoneno" runat="server" CssClass="ajxtxt"></asp:TextBox>
                        <cc1:FilteredTextBoxExtender ID="txtphoneno_FilteredTextBoxExtender" 
                            runat="server" Enabled="True" FilterType ="Numbers" TargetControlID="txtphoneno">
                        </cc1:FilteredTextBoxExtender>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                            ControlToValidate="txtphoneno" ErrorMessage="Phone No cannot be empty"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr class="table_tr">
                    <td class="style4">
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
                    <td class="style4">
                        <asp:Label ID="lbldesg" runat="server" Text="Designation" CssClass="ajxtxt"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtdesg" runat="server" CssClass="ajxtxt"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                            ControlToValidate="txtdesg" ErrorMessage="Designation cannot be empty"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr class="table_tr">
                    <td class="style4">
                        <asp:Label ID="lbldesc" runat="server" Text="Description" CssClass="ajxtxt"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtdesc" runat="server" TextMode="MultiLine" CssClass="ajxtxt"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style4">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr class="table_tr">
                    <td class="style4" colspan="2">
                        <asp:Button ID="btninsert" runat="server" onclick="btninsert_Click" 
                            Text="Insert" CssClass="btnstyle" />
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btninsert0" runat="server" CssClass="btnstyle" 
                            onclick="btninsert0_Click" Text="Reset" />
                        <br />
                        <br />
                        <asp:Label ID="lblretccid" runat="server" CssClass="ajxtxt" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style4">
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
<asp:Content ContentPlaceHolderID ="ContentPlaceHolder2" runat= "server" ID ="contact1">
    <asp:HyperLink ID="HyperLink1" runat="server" Enabled ="false" >Insert</asp:HyperLink> &nbsp;  &nbsp;  &nbsp;  &nbsp;|    &nbsp;  &nbsp;  &nbsp;  &nbsp;
    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl ="~/updclientcont.aspx" >Update</asp:HyperLink>

</asp:Content>

