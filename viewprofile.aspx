<%@ Page Language="C#" MasterPageFile="~/MasterHomePage.master" AutoEventWireup="true" CodeFile="viewprofile.aspx.cs" Inherits="viewprofile" Title="My Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
            float :left ;
        }
        .style2
        {
            width: 361px;
        }
        .style3
        {
            width: 364px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="title">
<div class="titletxt">My profile</div>
</div> 
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table class="style1">
                <tr class="table_tr">
                    <td colspan="2"><hr style="color: #0000FF" />
                        &nbsp;</td>
                </tr>
                <tr class="table_tr">
                    <td colspan="2">
                        <asp:Label ID="Label19" runat="server" Text="Personal Details" Font-Bold="True" 
                            Font-Size="Large"></asp:Label>
                    </td>
                </tr>
                <tr class="table_tr">
                    <td>
                        <asp:Label ID="Label1" runat="server" CssClass="ajxtxt " Text="Employee ID"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblempid" runat="server" CssClass="ajxtxt "></asp:Label>
                    </td>
                </tr>
                <tr class="table_tr">
                    <td>
                        <asp:Label ID="Label7" runat="server" CssClass="ajxtxt " Text="Name"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblname" runat="server" CssClass="ajxtxt "></asp:Label>
                    </td>
                </tr>
                <tr class="table_tr">
                    <td>
                        <asp:Label ID="Label3" runat="server" CssClass="ajxtxt " Text="Date of Birth"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lbldob" runat="server" CssClass="ajxtxt "></asp:Label>
                    </td>
                </tr>
                <tr class="table_tr">
                    <td>
                        <asp:Label ID="Label4" runat="server" CssClass="ajxtxt " Text="Address"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lbladdress" runat="server" CssClass="ajxtxt "></asp:Label>
                    </td>
                </tr>
                <tr class="table_tr">
                    <td>
                        <asp:Label ID="Label5" runat="server" CssClass="ajxtxt " Text="Phone Number"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblphoneno" runat="server" CssClass="ajxtxt "></asp:Label>
                    </td>
                </tr>
                <tr class="table_tr">
                    <td>
                        <asp:Label ID="Label6" runat="server" CssClass="ajxtxt " Text="Email ID"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblemailid" runat="server" CssClass="ajxtxt "></asp:Label>
                    </td>
                </tr>
                <tr class="table_tr">
                    <td colspan="2">
                        <hr style="color: #0000FF" />
                    </td>
                </tr>
                <tr class="table_tr">
                    <td colspan="2">
                        <asp:Label ID="Label20" runat="server" Font-Bold="True" Font-Size="Large" 
                            Text="Job Details"></asp:Label>
                    </td>
                </tr>
                <tr class="table_tr">
                    <td>
                        <asp:Label ID="Label2" runat="server" CssClass="ajxtxt " Text="Designation"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lbldesg" runat="server" CssClass="ajxtxt "></asp:Label>
                    </td>
                </tr>
                <tr class="table_tr">
                    <td>
                        <asp:Label ID="Label8" runat="server" CssClass="ajxtxt " Text="Department"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lbldept" runat="server" CssClass="ajxtxt "></asp:Label>
                    </td>
                </tr>
                <tr class="table_tr">
                    <td class="table_tr" colspan="2">
                        <asp:UpdatePanel ID="upshift" runat="server" Visible="False">
                            <ContentTemplate>
                                <table class="style1">
                                    <tr class="table_tr">
                                        <td class="style2">
                                            <asp:Label ID="Label21" runat="server" CssClass="ajxtxt " Text="Head Name"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="lblheadname" runat="server" CssClass="ajxtxt "></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <br />
                        <asp:UpdatePanel ID="uphead" runat="server" Visible="False">
                            <ContentTemplate>
                                <table class="style1">
                                    <tr class="table_tr">
                                        <td class="style3">
                                            <asp:Label ID="Label22" runat="server" CssClass="ajxtxt " 
                                                Text="Reporting Employees"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:SqlDataSource ID="SqlDataSource6" runat="server" 
                                                ConnectionString="<%$ ConnectionStrings:assetdbConnectionString %>" 
                                                SelectCommand="SELECT [name] FROM [emp_details] WHERE ([headid] = @headid)">
                                                <SelectParameters>
                                                    <asp:SessionParameter Name="headid" SessionField="empid" Type="Int32" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                            <asp:ListBox ID="lbreportingemp" runat="server" DataSourceID="SqlDataSource6" 
                                                DataTextField="name" DataValueField="name"></asp:ListBox>
                                            <br />
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
                <tr class="table_tr">
                    <td colspan="2">
                        <hr style="color: #0000FF" />
                    </td>
                </tr>
                <tr class="table_tr">
                    <td colspan="2">
                        &nbsp;</td>
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
    <asp:UpdateProgress ID="UpdateProgress1" runat="server" DynamicLayout ="false" >
<ProgressTemplate >
 <div class="Progress">
  <img src="images/loading.gif" alt="Loading" />
            
        </div>
 
</ProgressTemplate>                
                </asp:UpdateProgress>
  
       
      
      
           
   </asp:Content>
<asp:Content ContentPlaceHolderID ="ContentPlaceHolder2" ID="proflie" runat ="server" >
    <asp:HyperLink ID="HyperLink1" runat="server" Enabled ="false" >View Profile</asp:HyperLink>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl ="~/profile.aspx" >Update Profile</asp:HyperLink>
    <asp:HyperLink ID ="HyperLink3" runat ="server" NavigateUrl ="~/changepwd.aspx" >Change Password</asp:HyperLink>
   
</asp:Content>

