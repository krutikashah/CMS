<%@ Page Language="C#" MasterPageFile="~/MasterHomePage.master" AutoEventWireup="true" CodeFile="chartsatisfaction.aspx.cs" Inherits="chartsatisfaction" Title="Comparision of Feedback" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            height: 30px;
            width: 604px;
        }
        .style3
        {
            width: 604px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
         
                            <div class="title" style="width:740px;">
<div class="titletxt">Comparision of Client Feedbacks<br /></div>
</div>    
   
    
    
    <table class="style1">
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="table_tr" colspan="2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Chart ID="Chart1" runat="server" Height="308px" Width="627px">
                    <Series>
                        <asp:Series Name="Series1">
                        </asp:Series>
                    </Series>
                    <ChartAreas>
                        <asp:ChartArea Name="ChartArea1">
                        </asp:ChartArea>
                    </ChartAreas>
                    <Series>
                        <asp:Series Name="Series2">
                        </asp:Series>
                    </Series>
                    <ChartAreas>
                        <asp:ChartArea Name="ChartArea2">
                        </asp:ChartArea>
                    </ChartAreas>
                </asp:Chart>
                
            </td>
            <td>
                NOTATION<br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <asp:Image ID="Image1" runat="server" 
                    ImageUrl="~/images/notationfeedback.png" />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
            </td>
        </tr>
        <tr>
            <td class="table_tr" colspan="2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

