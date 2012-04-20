<%@ Page Language="C#" MasterPageFile="~/MasterHomePage.master" AutoEventWireup="true" CodeFile="partreplacement.aspx.cs" Inherits="partreplacement" Title="Parts Replacement" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="title">

    <div class="title">
<div class="titletxt">Parts Replacement</div>
</div>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
        <div style="background-image:url(images/bgStripe.png); width:700px; float:left; background-repeat:repeat-x;">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
        
            <table class="table_tr" >
                <tr class="table_tr">
                    <td >
                        <asp:Label ID="Label1" runat="server" Text="Select Company name:" 
                            CssClass="ajxtxt"></asp:Label>
                    </td>
                    <td>
                        
                        <cc1:ComboBox ID="cbselcmpname1" runat="server" AutoCompleteMode="SuggestAppend" 
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
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                            CommandName="Select" onclick="LinkButton1_Click" Text="Select" PostBackUrl= '<%# "~/partreplacement.aspx?vdid="+Eval("vendor_id") %>' ></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="vendor_id" HeaderText="vendor_id" 
                                    SortExpression="vendor_id"  HeaderStyle-CssClass="ajxtxt slct" 
                                    InsertVisible="False" ReadOnly="True" >
                                    <HeaderStyle CssClass="ajxtxt slct" />
                                </asp:BoundField>
                                <asp:BoundField DataField="cmpname" HeaderText="cmpname" 
                                    SortExpression="cmpname"  HeaderStyle-CssClass="ajxtxt" >
                                    <HeaderStyle CssClass="ajxtxt" />
                                </asp:BoundField>
                                <asp:BoundField DataField="address" HeaderText="address" 
                                    SortExpression="address"   
                                    HeaderStyle-CssClass="ajxtxt">
                                    <HeaderStyle CssClass="ajxtxt" />
                                </asp:BoundField>
                                <asp:BoundField DataField="phoneno" HeaderText="phoneno" 
                                    SortExpression="phoneno"  HeaderStyle-CssClass="ajxtxt" >
                                    <HeaderStyle CssClass="ajxtxt" />
                                </asp:BoundField>
                                <asp:BoundField DataField="emailid" HeaderText="emailid" 
                                    SortExpression="emailid" />
                                <asp:BoundField DataField="servingarea" HeaderText="servingarea" 
                                    SortExpression="servingarea" />
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
                            
                            
                            SelectCommand="SELECT [vendor_id], [cmpname], [address], [phoneno], [emailid], [servingarea] FROM [vendor3_details] WHERE ([cmpname] = @cmpname)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="cbselcmpname1" Name="cmpname" 
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
                        <asp:Label ID="lblmsg" runat="server" ForeColor="Red"></asp:Label>
                    </td>
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
  </div>
        </asp:Content>

