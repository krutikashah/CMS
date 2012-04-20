<%@ Page Language="C#" MasterPageFile="~/MasterHomePage.master" AutoEventWireup="true" CodeFile="chartdate.aspx.cs" Inherits="chartdate" Title="Comparision of Ticket Date wise" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <div class="title" style="width:740px;">
<div class="titletxt">Comparision of Open Tickets By Date of Complaint Registration<br /></div>
</div>    
<asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table class="style1">
        <tr class="table_tr">
            <td>
                <asp:Label ID="Label1" runat="server" CssClass="ajxtxt" 
                    Text="Select Start Date"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtstartdate" runat="server" CssClass="ajxtxt" 
                    ontextchanged="txtstartdate_TextChanged"></asp:TextBox>
                <cc1:CalendarExtender ID="txtstartdate_CalendarExtender" runat="server" 
                    Enabled="True" TargetControlID="txtstartdate" PopupButtonID ="img" >
                </cc1:CalendarExtender>
                        <img ID="img" alt="" src="images/calendar_icon.jpg" 
                            style="width: 28px; height: 21px" __designer:mapid="198" /></td>
        </tr>
        <tr class="table_tr">
            <td>
                <asp:Label ID="Label2" runat="server" CssClass="ajxtxt" Text="Select End Date"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtenddate" runat="server" CssClass="ajxtxt" 
                    ontextchanged="txtenddate_TextChanged"></asp:TextBox>
                <cc1:CalendarExtender ID="txtenddate_CalendarExtender" runat="server" 
                    Enabled="True" TargetControlID="txtenddate" PopupButtonID ="img0">
                </cc1:CalendarExtender>
                        <img ID="img0" alt="" src="images/calendar_icon.jpg" 
                            style="width: 28px; height: 21px" __designer:mapid="198" /></td>
        </tr>
        <tr class="table_tr">
            <td colspan="2">
                <asp:Button ID="Button1" runat="server" CssClass="btnstyle" 
                    onclick="Button1_Click" Text="Show Chart" />
            </td>
        </tr>
        <tr class="table_tr">
            <td colspan="2">
                <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource1">
                    <Series>
                        <asp:Series Name="Series1" XValueMember ="docomplain" YValueMembers ="Column1" 
                            IsValueShownAsLabel="True" >
                        </asp:Series>
                    </Series>
                    <ChartAreas>
                        <asp:ChartArea Name="ChartArea1">
                        </asp:ChartArea>
                    </ChartAreas>
                </asp:Chart>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:assetdbConnectionString %>" 
                    
                    SelectCommand="SELECT [docomplain],count(*) FROM [complain] WHERE [docomplain] BETWEEN @docomplain AND @docomplain2 GROUP BY [docomplain]">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtstartdate" DbType="DateTime" Name="docomplain" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtenddate" DbType="DateTime" Name="docomplain2" 
                            PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        </table>
</asp:Content>

