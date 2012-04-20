<%@ Page Language="C#" MasterPageFile="~/MasterHomePage.master" AutoEventWireup="true" CodeFile="updcontrols.aspx.cs" Inherits="updcontrols" Title="Update Customized Controls" %>

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
<div class="titletxt">Update Customized Controls</div>
</div>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table class="style1">
                <tr class="table_tr">
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr class="table_tr">
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="Select Client" CssClass ="ajxtxt " ></asp:Label>
                    </td>
                    <td>
                        <cc1:ComboBox ID="cbclientname" runat="server" AppendDataBoundItems="True" 
                            AutoCompleteMode="SuggestAppend" AutoPostBack="True" 
                            DataSourceID="SqlDataSource1" DataTextField="org_name" 
                            DataValueField="client_id" DropDownStyle="DropDownList" MaxLength="0" 
                            style="display: inline;">
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
                        <asp:Label ID="Label2" runat="server" Text="Select Control" CssClass ="ajxtxt " ></asp:Label>
                    </td>
                    <td>
                        <cc1:ComboBox ID="cbcontrolname" runat="server" AppendDataBoundItems="True" 
                            AutoCompleteMode="SuggestAppend" AutoPostBack="True" 
                            DataSourceID="SqlDataSource2" DataTextField="label" DataValueField="fields" 
                            DropDownStyle="DropDownList" MaxLength="0" 
                            onselectedindexchanged="cbcontrolname_SelectedIndexChanged" 
                            style="display: inline;">
                            <asp:ListItem Selected="True"></asp:ListItem>
                        </cc1:ComboBox>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:assetdbConnectionString %>" 
                            SelectCommand="SELECT [label], [fields] FROM [customizedcomplain] WHERE ([client_id] = @client_id)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="cbclientname" Name="client_id" 
                                    PropertyName="SelectedValue" Type="Int32" />
                            </SelectParameters>
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
                    <td colspan="2">
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                            <ContentTemplate>
                                <table class="style1">
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblname" runat="server" CssClass="ajxtxt" Text="Text For Label"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtlabelname" runat="server" CssClass="ajxtxt"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblname0" runat="server" CssClass="ajxtxt" Text="Controls"></asp:Label>
                                        </td>
                                        <td>
                                            <cc1:ComboBox ID="cbupdcontrols" runat="server" DataSourceID="SqlDataSource3" 
                                                DataTextField="control" DataValueField="control" MaxLength="0" 
                                                style="display: inline;">
                                            </cc1:ComboBox>
                                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                                                ConnectionString="<%$ ConnectionStrings:assetdbConnectionString %>" 
                                                SelectCommand="SELECT DISTINCT [control] FROM [customizedcomplain] WHERE ([client_id] = @client_id)">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="cbclientname" Name="client_id" 
                                                        PropertyName="SelectedValue" Type="Int32" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblvalue" runat="server" CssClass="ajxtxt" 
                                                Text="Default Values (Sepearate by commas or if to be fetched from database enter get)"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtdefvalues" runat="server" CssClass="ajxtxt"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblmethodname" runat="server" CssClass="ajxtxt" 
                                                Text="Method Name"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtmethodname" runat="server" CssClass="ajxtxt"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lbldesc" runat="server" CssClass="ajxtxt" Text="Description"></asp:Label>
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
                                </table>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
                <tr class="table_tr">
                    <td colspan="2">
                        <asp:Button ID="btnupdate" runat="server" CssClass="btnstyle" 
                            onclick="btnupdate_Click" Text="Update" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btndelete" runat="server" CssClass="btnstyle" 
                            onclick="btndelete_Click" Text="Delete" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btndelete0" runat="server" CssClass="btnstyle" 
                            onclick="btndelete0_Click" Text="Reset" />
                        <br />
                        <br />
                        <asp:Label ID="lblretupdate" runat="server" CssClass="ajxtxt" ForeColor="Red"></asp:Label>
                    </td>
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
</asp:Content>

<asp:Content ContentPlaceHolderID ="ContentPlaceHolder2" ID="proflie" runat ="server" >
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl ="~/selectcontrols.aspx"  >Insert</asp:HyperLink>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:HyperLink ID="HyperLink2" runat="server" Enabled ="false"  >Update</asp:HyperLink>
    
   
</asp:Content>
