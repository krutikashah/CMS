<%@ Page Language="C#" MasterPageFile="~/MasterHomePage.master" AutoEventWireup="true" CodeFile="report.aspx.cs" Inherits="report" Title="Report Generation" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style3
        {
            width: 282px;
        }
        .style4
        {
            height: 30px;
            width: 283px;
        }
        .style5
        {
            width: 284px;
        }
        .style6
        {
            width: 286px;
        }
        .style7
        {
            width: 280px;
        }
        .style8
        {
            height: 30px;
            width: 280px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="title">
<div class="titletxt">Reports</div>
</div>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
        <div style="background-image:url(images/bgStripe.png); width:700px; float:left; background-repeat:repeat-x;">

   <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table class="table_tr">
                <tr class="table_tr">
                    <td>
                        &nbsp;</td>
                    <td colspan="2">
                        &nbsp;</td>
                </tr>
                <tr class="table_tr">
                    <td colspan="3">
                        <asp:Label ID="Label1" runat="server" CssClass="ajxtxt" Text="Filter Complain"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:ListBox ID="lbfilter" runat="server" CssClass="ajxtxt" ForeColor="Black" 
                            onselectedindexchanged="lbfilter_SelectedIndexChanged" SelectionMode="Multiple">
                            <asp:ListItem>Client Name</asp:ListItem>
                            <asp:ListItem>Head</asp:ListItem>
                            <asp:ListItem>Technician</asp:ListItem>
                            <asp:ListItem>Shift Engg</asp:ListItem>
                            <asp:ListItem>Help Desk Personnel</asp:ListItem>
                            <asp:ListItem>Date Of Complain</asp:ListItem>
                            <asp:ListItem>Problem Type</asp:ListItem>
                            <asp:ListItem>Problem Subtype</asp:ListItem>
                            <asp:ListItem>Priority</asp:ListItem>
                            <asp:ListItem>Ticket Status</asp:ListItem>
                        </asp:ListBox>
                        &nbsp;&nbsp;
                        <asp:LinkButton ID="lband" runat="server" CssClass="ajxtxt" Enabled="False" 
                            ForeColor="Black" onclick="lband_Click">AND</asp:LinkButton>
                        <br />
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:LinkButton ID="LinkButton1" runat="server" CssClass="ajxtx" 
                            ForeColor="Black" onclick="LinkButton1_Click">Advance Search</asp:LinkButton>
                        <br />
                    </td>
                </tr>
                <tr class="table_tr">
                    <td colspan="3">
                        &nbsp;</td>
                </tr>
                <tr class="table_tr">
                    <td colspan="2">
                        <asp:UpdatePanel ID="upclient" runat="server" Visible="False">
                            <ContentTemplate>
                                <table class="style1">
                                    <tr class="table_tr">
                                        <td class="style6">
                                            <asp:Label ID="lblclientname" runat="server" CssClass="ajxtxt" 
                                                Text="Select Client Name" Visible="False"></asp:Label>
                                        </td>
                                        <td>
                                            <cc1:ComboBox ID="cbclientname" runat="server" AppendDataBoundItems="True" 
                                                AutoCompleteMode="SuggestAppend" AutoPostBack="True" CssClass="ajxtxt" 
                                                DataSourceID="dsclientname" DataTextField="org_name" DataValueField="client_id" 
                                                DropDownStyle="DropDownList" ForeColor="Black" MaxLength="0" 
                                                onselectedindexchanged="cbclientname_SelectedIndexChanged" 
                                                style="display: inline;" Visible="False">
                                                <asp:ListItem Value="%">All</asp:ListItem>
                                            </cc1:ComboBox>
                                            <asp:SqlDataSource ID="dsclientname" runat="server" 
                                                ConnectionString="<%$ ConnectionStrings:assetdbConnectionString %>" 
                                                SelectCommand="SELECT [client_id], [org_name] FROM [client_details]">
                                            </asp:SqlDataSource>
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <asp:UpdatePanel ID="uphead" runat="server" Visible="False">
                            <ContentTemplate>
                                <table class="style1">
                                    <tr class="table_tr">
                                        <td class="style5">
                                            <asp:Label ID="lblhead" runat="server" CssClass="ajxtxt" Text="Select Head " 
                                                Visible="False"></asp:Label>
                                        </td>
                                        <td>
                                            <cc1:ComboBox ID="cbemphead" runat="server" AppendDataBoundItems="True" 
                                                AutoCompleteMode="SuggestAppend" AutoPostBack="True" CssClass="ajxtxt" 
                                                DataSourceID="dshead" DataTextField="emp_id" DataValueField="emp_id" 
                                                DropDownStyle="DropDownList" ForeColor="Black" MaxLength="0" 
                                                onselectedindexchanged="cbemphead_SelectedIndexChanged" 
                                                style="display: inline;" Visible="False">
                                                <asp:ListItem Value="%">All</asp:ListItem>
                                            </cc1:ComboBox>
                                            <asp:SqlDataSource ID="dshead" runat="server" 
                                                ConnectionString="<%$ ConnectionStrings:assetdbConnectionString %>" 
                                                SelectCommand="SELECT [emp_id], [name] FROM [emp_details] WHERE ([designation] = @designation)">
                                                <SelectParameters>
                                                    <asp:Parameter DefaultValue="Head" Name="designation" Type="String" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <asp:UpdatePanel ID="upshift" runat="server" Visible="False">
                            <ContentTemplate>
                                <table class="style1">
                                    <tr>
                                        <td class="style4">
                                            <asp:Label ID="lblshiftengg" runat="server" CssClass="ajxtxt" 
                                                Text="Select Shift Engg" Visible="False"></asp:Label>
                                        </td>
                                        <td>
                                            <cc1:ComboBox ID="cbshiftengg" runat="server" AppendDataBoundItems="True" 
                                                AutoCompleteMode="SuggestAppend" AutoPostBack="True" CssClass="ajxtxt" 
                                                DataSourceID="dsshiftengg" DataTextField="name" DataValueField="emp_id" 
                                                DropDownStyle="DropDownList" ForeColor="Black" MaxLength="0" 
                                                onselectedindexchanged="cbshiftengg_SelectedIndexChanged" 
                                                style="display: inline;" Visible="False">
                                                <asp:ListItem Value="%">All</asp:ListItem>
                                            </cc1:ComboBox>
                                            <asp:SqlDataSource ID="dsshiftengg" runat="server" 
                                                ConnectionString="<%$ ConnectionStrings:assetdbConnectionString %>" 
                                                SelectCommand="SELECT [emp_id], [name] FROM [emp_details] WHERE ([designation] = @designation)">
                                                <SelectParameters>
                                                    <asp:Parameter DefaultValue="Shift engg" Name="designation" Type="String" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <asp:UpdatePanel ID="uptechnician" runat="server" Visible="False">
                            <ContentTemplate>
                                <table class="style1">
                                    <tr class="table_tr">
                                        <td class="style3">
                                            <asp:Label ID="lbltechnician" runat="server" CssClass="ajxtxt" 
                                                Text="Select Technician" Visible="False"></asp:Label>
                                        </td>
                                        <td>
                                            <cc1:ComboBox ID="cbtechnician" runat="server" AppendDataBoundItems="True" 
                                                AutoCompleteMode="SuggestAppend" AutoPostBack="True" CssClass="ajxtxt" 
                                                DataSourceID="dstechnician" DataTextField="name" DataValueField="emp_id" 
                                                DropDownStyle="DropDownList" ForeColor="Black" MaxLength="0" 
                                                onselectedindexchanged="cbtechnician_SelectedIndexChanged" 
                                                style="display: inline;" Visible="False">
                                                <asp:ListItem Value="%">All</asp:ListItem>
                                            </cc1:ComboBox>
                                            <asp:SqlDataSource ID="dstechnician" runat="server" 
                                                ConnectionString="<%$ ConnectionStrings:assetdbConnectionString %>" 
                                                SelectCommand="SELECT [emp_id], [name] FROM [emp_details] WHERE ([designation] = @designation)">
                                                <SelectParameters>
                                                    <asp:Parameter DefaultValue="Technician" Name="designation" Type="String" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <asp:UpdatePanel ID="uphelpdesk" runat="server" Visible="False">
                            <ContentTemplate>
                                <table class="style1">
                                    <tr>
                                        <td class="table_tr">
                                            <asp:Label ID="lblhelpdesk" runat="server" CssClass="ajxtxt" 
                                                Text="Select Help Desk Personnel" Visible="False"></asp:Label>
                                        </td>
                                        <td>
                                            <cc1:ComboBox ID="cbhelpdeskper" runat="server" AppendDataBoundItems="True" 
                                                AutoCompleteMode="SuggestAppend" AutoPostBack="True" CssClass="ajxtxt" 
                                                DataSourceID="dsHelpdeskpersonnel" DataTextField="name" DataValueField="emp_id" 
                                                DropDownStyle="DropDownList" ForeColor="Black" MaxLength="0" 
                                                onselectedindexchanged="cbhelpdeskper_SelectedIndexChanged" 
                                                style="display: inline;" Visible="False">
                                                <asp:ListItem Value="%">All</asp:ListItem>
                                            </cc1:ComboBox>
                                            <asp:SqlDataSource ID="dsHelpdeskpersonnel" runat="server" 
                                                ConnectionString="<%$ ConnectionStrings:assetdbConnectionString %>" 
                                                SelectCommand="SELECT [emp_id], [name] FROM [emp_details] WHERE ([designation] = @designation)">
                                                <SelectParameters>
                                                    <asp:Parameter DefaultValue="Help desk personnel" Name="designation" 
                                                        Type="String" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <asp:UpdatePanel ID="upprobtype" runat="server" Visible="False">
                            <ContentTemplate>
                                <table class="style1">
                                    <tr class="table_tr">
                                        <td class="style7">
                                            <asp:Label ID="lblprobtype" runat="server" CssClass="ajxtxt" 
                                                Text="Select Problem Type" Visible="False"></asp:Label>
                                        </td>
                                        <td>
                                            <cc1:ComboBox ID="cbprobtype" runat="server" AppendDataBoundItems="True" 
                                                AutoCompleteMode="SuggestAppend" AutoPostBack="True" CssClass="ajxtxt" 
                                                DataSourceID="dsprobtype" DataTextField="probtype" DataValueField="probtype" 
                                                DropDownStyle="DropDownList" ForeColor="Black" MaxLength="0" 
                                                onselectedindexchanged="cbprobtype_SelectedIndexChanged" 
                                                style="display: inline;" Visible="False">
                                                <asp:ListItem Value="%">All</asp:ListItem>
                                                <asp:ListItem>Head</asp:ListItem>
                                                <asp:ListItem>Shift engg</asp:ListItem>
                                                <asp:ListItem>Technician</asp:ListItem>
                                                <asp:ListItem>Help desk personnel</asp:ListItem>
                                            </cc1:ComboBox>
                                            <asp:SqlDataSource ID="dsprobtype" runat="server" 
                                                ConnectionString="<%$ ConnectionStrings:assetdbConnectionString %>" 
                                                SelectCommand="SELECT DISTINCT [probtype] FROM [complain]">
                                            </asp:SqlDataSource>
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <asp:UpdatePanel ID="uprpbsubtype" runat="server" Visible="False">
                            <ContentTemplate>
                                <table class="style1">
                                    <tr>
                                        <td class="style8">
                                            <asp:Label ID="lblprobsubtype" runat="server" CssClass="ajxtxt" 
                                                Text="Select Problem Subtype" Visible="False"></asp:Label>
                                        </td>
                                        <td>
                                            <cc1:ComboBox ID="cbprobsubtype" runat="server" AppendDataBoundItems="True" 
                                                AutoCompleteMode="SuggestAppend" AutoPostBack="True" CssClass="ajxtxt" 
                                                DataSourceID="dsprobsubtype" DataTextField="probsubtype" 
                                                DataValueField="probsubtype" DropDownStyle="DropDownList" ForeColor="Black" 
                                                MaxLength="0" onselectedindexchanged="cbprobsubtype_SelectedIndexChanged" 
                                                style="display: inline;" Visible="False">
                                                <asp:ListItem Value="%">All</asp:ListItem>
                                            </cc1:ComboBox>
                                            <asp:SqlDataSource ID="dsprobsubtype" runat="server" 
                                                ConnectionString="<%$ ConnectionStrings:assetdbConnectionString %>" 
                                                SelectCommand="SELECT DISTINCT [probsubtype] FROM [complain]">
                                            </asp:SqlDataSource>
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <asp:UpdatePanel ID="uppriority" runat="server" Visible="False">
                            <ContentTemplate>
                                <table class="style1">
                                    <tr class="table_tr">
                                        <td class="style3">
                                            <asp:Label ID="lblpriority" runat="server" CssClass="ajxtxt" 
                                                Text="Select Priority" Visible="False"></asp:Label>
                                        </td>
                                        <td>
                                            <cc1:ComboBox ID="cbpriority" runat="server" AppendDataBoundItems="True" 
                                                AutoCompleteMode="SuggestAppend" AutoPostBack="True" CssClass="ajxtxt" 
                                                DataTextField="type" DataValueField="type" DropDownStyle="DropDownList" 
                                                ForeColor="Black" MaxLength="0" 
                                                onselectedindexchanged="cbpriority_SelectedIndexChanged" 
                                                style="display: inline;" Visible="False">
                                                <asp:ListItem Value="%">All</asp:ListItem>
                                                <asp:ListItem>Critical</asp:ListItem>
                                                <asp:ListItem>Emergency</asp:ListItem>
                                                <asp:ListItem>Regular</asp:ListItem>
                                                <asp:ListItem>Minor Issue</asp:ListItem>
                                            </cc1:ComboBox>
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <asp:UpdatePanel ID="upstatus" runat="server" Visible="False">
                            <ContentTemplate>
                                <table class="style1">
                                    <tr>
                                        <td class="style4">
                                            <asp:Label ID="lblstatus" runat="server" CssClass="ajxtxt" Text="Select Status" 
                                                Visible="False"></asp:Label>
                                        </td>
                                        <td>
                                            <cc1:ComboBox ID="cbstatus" runat="server" AppendDataBoundItems="True" 
                                                AutoCompleteMode="SuggestAppend" AutoPostBack="True" CssClass="ajxtxt" 
                                                DataSourceID="dsstatus" DataTextField="ticket_status" 
                                                DataValueField="ticket_status" DropDownStyle="DropDownList" ForeColor="Black" 
                                                MaxLength="0" onselectedindexchanged="cbstatus_SelectedIndexChanged" 
                                                style="display: inline;" Visible="False">
                                                <asp:ListItem Value="%">All</asp:ListItem>
                                            </cc1:ComboBox>
                                            <asp:SqlDataSource ID="dsstatus" runat="server" 
                                                ConnectionString="<%$ ConnectionStrings:assetdbConnectionString %>" 
                                                SelectCommand="SELECT [ticket_status] FROM [complain]"></asp:SqlDataSource>
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <asp:UpdatePanel ID="updocomplain" runat="server" Visible="False">
                            <ContentTemplate>
                                <table class="style1">
                                    <tr class="table_tr">
                                        <td class="style6">
                                            <asp:Label ID="lbldate" runat="server" CssClass="ajxtxt" 
                                                Text="Select Date of Complain" Visible="False"></asp:Label>
                                        </td>
                                        <td>
                                            &nbsp;&nbsp;
                                            <asp:TextBox ID="txtcompreg" runat="server" AutoPostBack="True" 
                                                CssClass="ajxtxt" ontextchanged="txtcompreg_TextChanged" Visible="False"></asp:TextBox>
                                            <cc1:CalendarExtender ID="CalendarExtender1" runat="server" Enabled="True" 
                                                PopupButtonID="img" TargetControlID="txtcompreg">
                                            </cc1:CalendarExtender>
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <img ID="img" alt="" src="images/calendar_icon.jpg" 
                                                style="width: 28px; height: 21px" /></td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr class="table_tr">
                    <td colspan="3">
                        <asp:Button ID="btnsearch" runat="server" CssClass="btnstyle" 
                            onclick="Button1_Click" Text="Search" Visible="False" />
                    </td>
                </tr>
                <tr class="table_tr">
                    <td colspan="3">
                        &nbsp;</td>
                </tr>
                <tr class="table_tr" >
              
                    <td colspan="3">
                        <asp:GridView ID="GridView2" runat="server" CssClass="ajxtxt slct grdview">
                             <HeaderStyle BackColor="#FC950A"  CssClass="grdhead" Font-Bold="True" 
                                 ForeColor="White" />
                        </asp:GridView>
                    </td>
                 
               
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
    
    <asp:Button ID="btnexport" runat="server" onclick="Button1_Click2" 
                            Text="Export to Excel" CssClass="btnstyle" Visible="False" />
                    <br /><br />
 
    <br />
    <br />
    <asp:Button ID="btnpdf" runat="server" CssClass="btnstyle" 
        onclick="btncsv_Click" Text="Export to PDF" Visible="False" />
                    &nbsp; 
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

