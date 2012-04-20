<%@ Page Language="C#" MasterPageFile="~/MasterHomePage.master" AutoEventWireup="true" CodeFile="updclietndet.aspx.cs" Inherits="updclietndet" Title="Update Client Details" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
            float :left ;
            padding :15px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="title">
<div class="titletxt">Update Client Details</div>
</div>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <br />
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table class="style1">
                <tr>
                    <td class="table_tr">
                        <asp:Label ID="Label1" runat="server" CssClass="ajxtxt" Text="Name"></asp:Label>
                    </td>
                    <td class="table_tr">
                        <cc1:ComboBox ID="ComboBox1" runat="server" AppendDataBoundItems="True" 
                            AutoCompleteMode="SuggestAppend" AutoPostBack="True" CssClass="ajxtxt" 
                            DataSourceID="SqlDataSource3" DataTextField="org_name" 
                            DataValueField="client_id" ForeColor="Black" MaxLength="0" 
                            OnSelectedIndexChanged="ComboBox1_SelectedIndexChanged" 
                            style="display: inline;">
                            <asp:ListItem Selected="True"></asp:ListItem>
                        </cc1:ComboBox>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:assetdbConnectionString %>" 
                            SelectCommand="SELECT [org_name], [client_id] FROM [client_details]">
                        </asp:SqlDataSource>
                        <br />
                        <br />
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
                        <asp:TextBox ID="txtphonenoup" runat="server" CssClass="ajxtxt" MaxLength="10"></asp:TextBox>
                        <cc1:FilteredTextBoxExtender ID="txtphonenoup_FilteredTextBoxExtender" 
                            runat="server" Enabled="True" FilterType="Numbers" 
                            TargetControlID="txtphonenoup">
                        </cc1:FilteredTextBoxExtender>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                            ControlToValidate="txtphonenoup" ErrorMessage="Phone No cannot be empty"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                            ControlToValidate="txtphonenoup" ErrorMessage="Number not in proper format" 
                            ValidationExpression="^([8-9]{1})([012346789]{1})([0-9]{8})$"></asp:RegularExpressionValidator>
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
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button ID="btnupdate" runat="server" CssClass="btnstyle" 
                            OnClick="btnupdate_Click" Text="Update" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btndel" runat="server" CssClass="btnstyle" 
                            onclick="btndel_Click" Text="Delete" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btndel0" runat="server" CssClass="btnstyle" 
                            onclick="btndel0_Click" Text="Reset" />
                        <br />
                        <br />
                        <asp:Label ID="lblupclient" runat="server" CssClass="ajxtxt" ForeColor="Red"></asp:Label>
                        <asp:Label ID="lbldelclient" runat="server" CssClass="ajxtxt" ForeColor="Red"></asp:Label>
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
</asp:Content>
<asp:Content ContentPlaceHolderID ="ContentPlaceHolder2"  runat ="server" ID ="client2">
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl ="~/insclientdet.aspx" >Insert</asp:HyperLink>    &nbsp;  &nbsp;  &nbsp;  &nbsp;|    &nbsp;  &nbsp;  &nbsp;  &nbsp;
    <asp:HyperLink ID="HyperLink2" runat="server" Enabled ="false" >Update</asp:HyperLink>
</asp:Content>

