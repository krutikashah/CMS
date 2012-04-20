<%@ Page Language="C#" MasterPageFile="~/MasterHomePage.master" AutoEventWireup="true" CodeFile="insclientdet.aspx.cs" Inherits="insclientdet" Title="Add Client Details" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <div class="title">
<div class="titletxt">Add Client Details</div>
</div>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table style="float: left" >
                <tr class="table_tr">
                    <td>
                        <asp:Label runat="server" Text="Organisation Name" CssClass="ajxtxt" 
                ID="lblorgname"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" CssClass="ajxtxt" ID="txtorgname"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtorgname" 
                ErrorMessage="Organisation Name cannot be empty" ID="RequiredFieldValidator1"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr class="table_tr">
                    <td>
                        <asp:Label runat="server" Text="Address" CssClass="ajxtxt" ID="lbladrs"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" CssClass="ajxtxt" ID="txtadrs"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtadrs" 
                ErrorMessage="Address cannot be empty" ID="RequiredFieldValidator2"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr class="table_tr">
                    <td>
                        <asp:Label runat="server" Text="Phone No.(M)" CssClass="ajxtxt" ID="lblphoneno"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" CssClass="ajxtxt" ID="txtphoneno" MaxLength="10"></asp:TextBox>
                        <cc1:FilteredTextBoxExtender runat="server" FilterType="Numbers" Enabled="True" 
                TargetControlID="txtphoneno" ID="txtphoneno_FilteredTextBoxExtender">
                        </cc1:FilteredTextBoxExtender>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtphoneno" 
                ErrorMessage="Phone No cannot be empty" ID="RequiredFieldValidator3"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                            ControlToValidate="txtphoneno" ErrorMessage="Number not in proper format" 
                            ValidationExpression="^([8-9]{1})([012346789]{1})([0-9]{8})$"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="table_tr">
                        <asp:Label runat="server" Text="Email ID" CssClass="ajxtxt" ID="lblemaidid"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" CssClass="ajxtxt" ID="txtemaildid"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtemaildid" 
                ErrorMessage="Email ID cannot be empty" ID="RequiredFieldValidator4"></asp:RequiredFieldValidator>
                        &nbsp;
                        <asp:RegularExpressionValidator runat="server" 
                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                ControlToValidate="txtemaildid" ErrorMessage="Enter valid Email ID" 
                ID="RegularExpressionValidator1"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr class="table_tr">
                    <td>
                        <asp:Label runat="server" Text="Serving Area" CssClass="ajxtxt" ID="lblorgtype"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" CssClass="ajxtxt" ID="txtorgtype"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtorgtype" 
                ErrorMessage="Serving Area cannot be empty" ID="RequiredFieldValidator5"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr class="table_tr">
                    <td colspan="2">
                        <asp:Button ID="btninsclientdetails" runat="server" class="btnstyle" 
                            OnClick="btninsclientdetails_Click" Text="Insert" />
                        &nbsp;
                        <asp:Button ID="btninsclientdetails0" runat="server" class="btnstyle" 
                            OnClick="btninsclientdetails0_Click" Text="Reset" />
                        <br />
                        <br />
                        <asp:Label ID="lblretclientid" runat="server" CssClass="ajxtxt" ForeColor="Red"></asp:Label>
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
<asp:Content ContentPlaceHolderID ="ContentPlaceHolder2"  runat ="server" ID ="client1">
    <asp:HyperLink ID="HyperLink1" runat="server" Enabled ="false">Insert</asp:HyperLink>    &nbsp;  &nbsp;  &nbsp;  &nbsp;|    &nbsp;  &nbsp;  &nbsp;  &nbsp;
    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl ="~/updclietndet.aspx" >Update</asp:HyperLink>
</asp:Content>
