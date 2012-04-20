<%@ Page Language="C#" MasterPageFile="~/MasterHomePage.master" AutoEventWireup="true" CodeFile="chartemp.aspx.cs" Inherits="chartemp" Title="Comparision of Tickets Assign to Employee" %>

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
<div class="titletxt">Comparision of Tickets By Employee Assigned<br /></div>
</div>    
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table class="style1">
                <tr class="table_tr">
                    <td>
                        <asp:Label ID="Label2" runat="server" CssClass="ajxtxt" Text="HEAD"></asp:Label>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr class="table_tr">
                    <td colspan="2">
                        <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource1">
                            <Series>
                                <asp:Series Name="Series1" XValueMember="emp_head" YValueMembers="Column1">
                                </asp:Series>
                            </Series>
                            <ChartAreas>
                                <asp:ChartArea Name="ChartArea1">
                                </asp:ChartArea>
                            </ChartAreas>
                        </asp:Chart>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:assetdbConnectionString %>" 
                            SelectCommand="SELECT  [emp_head],count(*) FROM [complain] WHERE ([emp_head] IS NOT NULL) GROUP BY [emp_head]">
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr class="table_tr">
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="SHIFT ENGINEER"></asp:Label>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr class="table_tr">
                    <td colspan="2">
                        <asp:Chart ID="Chart2" runat="server" DataSourceID="SqlDataSource2">
                            <Series>
                                <asp:Series Name="Series1" XValueMember="emp_shift" YValueMembers="Column1">
                                </asp:Series>
                            </Series>
                            <ChartAreas>
                                <asp:ChartArea Name="ChartArea1">
                                </asp:ChartArea>
                            </ChartAreas>
                        </asp:Chart>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:assetdbConnectionString %>" 
                            SelectCommand="SELECT [emp_shift],count(*) FROM [complain] WHERE ([emp_shift] IS NOT NULL) group by[emp_shift]">
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr class="table_tr">
                    <td>
                        <asp:Label ID="Label3" runat="server" Text="Technician"></asp:Label>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr class="table_tr">
                    <td colspan="2">
                        <asp:Chart ID="Chart3" runat="server" DataSourceID="SqlDataSource3">
                            <Series>
                                <asp:Series Name="Series1" XValueMember="emp_technician" 
                                    YValueMembers="Column1">
                                </asp:Series>
                            </Series>
                            <ChartAreas>
                                <asp:ChartArea Name="ChartArea1">
                                </asp:ChartArea>
                            </ChartAreas>
                        </asp:Chart>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:assetdbConnectionString %>" 
                            SelectCommand="SELECT [emp_technician],count(*)  FROM [complain] WHERE ([emp_technician] IS NOT NULL) group by[emp_technician]">
                        </asp:SqlDataSource>
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
    </asp:Content>

