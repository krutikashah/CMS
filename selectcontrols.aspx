<%@ Page Language="C#" MasterPageFile="~/MasterHomePage.master" AutoEventWireup="true" CodeFile="selectcontrols.aspx.cs" Inherits="selectcontrols" Title="Customized Controls" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="title">
<div class="titletxt">Add Customized Controls</div>
</div>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
        <div style="background-image:url(images/bgStripe.png); width:700px; float:left; background-repeat:repeat-x;">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table class="style1">
                <tr>
                    <td>
                        <asp:Label ID="lblclient" runat="server" CssClass="ajxtxt" Text="Client Name"></asp:Label>
                    </td>
                    <td>
                        <cc1:ComboBox ID="cbclientnme" runat="server" AutoPostBack="True" 
                            DataSourceID="SqlDataSource1" DataTextField="org_name" 
                            DataValueField="client_id" MaxLength="0" style="display: inline;" 
                            AppendDataBoundItems="True" AutoCompleteMode="SuggestAppend" 
                            DropDownStyle="DropDownList">
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
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr class="table_tr">
                    <td align="left" colspan="2">
                        <asp:Label ID="lblcontrol" runat="server" CssClass="ajxtxt" 
                            Text="Click On The Required Control"></asp:Label>
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
                        <asp:ImageButton ID="imgtxtbox" runat="server" Height="23px" 
                            ImageUrl="~/images/txtbox.JPG" Width="175px" onclick="imgtxtbox_Click" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:ImageButton ID="imgcombobox" runat="server" Height="23px" 
                            ImageUrl="~/images/combobox.JPG" Width="175px" 
                            onclick="imgcombobox_Click" />
                    </td>
                </tr>
                <tr class="table_tr">
                    <td colspan="2">
                        <asp:Label ID="Label5" runat="server" CssClass="ajxtxt" Text="Label" 
                            Visible="False"></asp:Label>
                    </td>
                </tr>
                <tr class="table_tr">
                    <td colspan="2">
                        <asp:UpdatePanel ID="updetails" runat="server" Visible="False">
                            <ContentTemplate>
                                <table class="style1">
                                    <tr class="table_tr">
                                        <td>
                                            <asp:Label ID="lblname" runat="server" Text="Text For Label" CssClass="ajxtxt" ></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtlabelname" runat="server" CssClass="ajxtxt" ></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr class="table_tr">
                                        <td>
                                            <asp:Label ID="lblvalue" runat="server" 
                                                Text="Default Values (Sepearate by commas or if to be fetched from database enter get)" 
                                                CssClass="ajxtxt"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtdefvalues" runat="server" CssClass="ajxtxt"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr class="table_tr">
                                        <td>
                                            <asp:Label ID="lblmethodname" runat="server" Text="Method Name" 
                                                CssClass="ajxtxt"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtmethodname" runat="server" CssClass="ajxtxt"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr class="table_tr">
                                        <td>
                                            <asp:Label ID="lbldesc" runat="server" Text="Description" CssClass="ajxtxt"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtdesc" runat="server" CssClass="ajxtxt"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr class="table_tr">
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr class="table_tr">
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
                <tr class="table_tr">
                    <td colspan="2">
                        <asp:Button ID="btninsert" runat="server" CssClass="btnstyle" 
                            onclick="btninsert_Click" Text="Insert" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btninsert0" runat="server" CssClass="btnstyle" 
                            onclick="btninsert0_Click" Text="Reset" />
                    </td>
                </tr>
                <tr class="table_tr">
                    <td colspan="2">
                        <asp:Label ID="lblretid" runat="server" CssClass="ajxtxt" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
                <tr class="table_tr">
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr class="table_tr">
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


<asp:Content ContentPlaceHolderID ="ContentPlaceHolder2" ID="proflie" runat ="server" >
    <asp:HyperLink ID="HyperLink1" runat="server" Enabled ="false" >Insert</asp:HyperLink>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl ="~/updcontrols.aspx"  >Update</asp:HyperLink>
    
   
</asp:Content>
