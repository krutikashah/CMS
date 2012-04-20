<%@ Page Language="C#" MasterPageFile="~/MasterHomePage.master" AutoEventWireup="true" CodeFile="AMC.aspx.cs" Inherits="AMC" Title="AMC " %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <div class="title">
<div class="titletxt">AMC</div>
</div>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
        
            <table class="table_tr" >
                <tr class="table_tr">
                    <td >
                        <asp:Label ID="Label1" runat="server" Text="Select Company name:" 
                            CssClass="ajxtxt"></asp:Label>
                    </td>
                    <td>
                        
                        <cc1:ComboBox ID="cbselcmpname0" runat="server" AutoCompleteMode="SuggestAppend" 
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
                        <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource2">
                            <HeaderStyle BackColor="#FC950A" Font-Bold="True" ForeColor="White" />
                        </asp:GridView>
                    </td>
                </tr>
                <tr>
                    <td >
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:assetdbConnectionString %>" 
                            
                            
                            SelectCommand="SELECT [vendor_id], [cmpname], [address], [phoneno], [emailid], [servingarea] FROM [vendor3_details] WHERE ([cmpname] = @cmpname)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="cbselcmpname0" Name="cmpname" 
                                    PropertyName="SelectedValue" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td  colspan="2">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="table_tr" colspan="2" >
                        <asp:Label ID="Label3" runat="server" CssClass="ajxtxt" Font-Size="Medium" 
                            Text="Details for Help Desk Personnel"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="table_tr">
                        <asp:Label ID="Label2" runat="server" CssClass="ajxtxt" 
                            Text="Task Description for Help Desk "></asp:Label>
                    </td>
                    <td class="table_tr">
                        <asp:TextBox ID="txttaskdesc" runat="server" CssClass="ajxtxt" 
                            TextMode="MultiLine"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="table_tr">
                        <asp:Label ID="Label4" runat="server" CssClass="ajxtxt" Text="Vendor ID"></asp:Label>
                    </td>
                    <td class="table_tr">
                        <asp:TextBox ID="txtvendorid" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="table_tr" colspan="2">
                        <asp:Button ID="Button1" runat="server" CssClass="btnstyle" 
                            onclick="Button1_Click" Text="Assign Task" />
                    </td>
                </tr>
                <tr>
                    <td class="table_tr" colspan="2">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2">
                        &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br />
                        <br />
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

