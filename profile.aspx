<%@ Page Language="C#" MasterPageFile="~/MasterHomePage.master" AutoEventWireup="true" CodeFile="profile.aspx.cs" Inherits="profile" Title="My Profile Updataion" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <div class="title">
<div class="titletxt">My profile</div>
</div> 
    <asp:ScriptManager ID="ScriptManager1" runat="server">
       
    </asp:ScriptManager>
     <asp:UpdatePanel ID="UpdatePanel1" runat="server">
         <ContentTemplate>
          <div style="background-image:url(images/bgStripe.png); float:left; width:700px; background-repeat:repeat-x;">
         
             <table class="style1">
                 <tr>
                     <td>
                     
                     <cc1:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="1" 
                            Height="500px" Width="857px" Visible="False" AutoPostBack="True">
                            <cc1:TabPanel ID="TabPanel1" runat="server" HeaderText="Equipment Information"><HeaderTemplate>Personal details</HeaderTemplate><ContentTemplate><br /><br /><table >
                                <tr class="table_tr"><td >
                                <asp:Label ID="lblempid" runat="server" Text="Employee ID" CssClass="ajxtxt"></asp:Label></td><td>
                                    <asp:TextBox ID="txtempid" runat="server" Enabled="False" CssClass="ajxtxt"></asp:TextBox></td></tr>
                                <tr class="table_tr"><td >
                                    <asp:Label ID="lblempname0" runat="server" Text="Employee name" 
                                        CssClass="ajxtxt"></asp:Label></td><td>
                                        <asp:TextBox 
                                ID="txtname" runat="server" CssClass="ajxtxt"></asp:TextBox>
                                        <cc1:FilteredTextBoxExtender ID="txtname_FilteredTextBoxExtender" 
                                            runat="server"     Enabled="True" TargetControlID="txtname" 
                                            FilterType ="Custom, UppercaseLetters, LowercaseLetters" ValidChars=" "   >
                                        </cc1:FilteredTextBoxExtender>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                            ControlToValidate="txtname" ErrorMessage="Employee Name cannot be empty"></asp:RequiredFieldValidator>
                                    </td></tr>
                                <tr class="table_tr"><td >
                                    <asp:Label ID="lbladrs" runat="server" Text="Address" CssClass="ajxtxt"></asp:Label></td><td>
                                        <asp:TextBox ID="txtadrs" runat="server" TextMode="MultiLine" CssClass="ajxtxt"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                            ControlToValidate="txtadrs" ErrorMessage="Address cannot be empty"></asp:RequiredFieldValidator>
                                    </td></tr>
                                <tr class="table_tr"><td >
                                    <asp:Label ID="lblempemailid" runat="server" Text="Email ID" CssClass="ajxtxt"></asp:Label></td><td>
                                        <asp:TextBox ID="txtemailid" runat="server" CssClass="ajxtxt"></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                            ControlToValidate="txtemailid" ErrorMessage="Enter valid Email ID" 
                                            ValidationExpression="(\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*)|( )"></asp:RegularExpressionValidator>
                                    </td></tr>
                                <tr class="table_tr"><td >
                                    <asp:Label ID="lblphoneno" runat="server" Text="Phone no." CssClass="ajxtxt"></asp:Label></td><td>
                                        <asp:TextBox ID="txtphoneno" runat="server" CssClass="ajxtxt"></asp:TextBox>
                                        <cc1:FilteredTextBoxExtender ID="txtphoneno_FilteredTextBoxExtender" 
                                            runat="server" Enabled="True" TargetControlID="txtphoneno" FilterType="Numbers"   >
                                        </cc1:FilteredTextBoxExtender>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                            ControlToValidate="txtphoneno" ErrorMessage="Phone No cannot be empty"></asp:RequiredFieldValidator>
                                    </td></tr>
                                <tr class="table_tr"><td >
                                    <asp:Label ID="lbldob" runat="server" Text="Date of birth" CssClass="ajxtxt"></asp:Label></td><td>
                                        <asp:TextBox ID="txtdob" runat="server" CssClass="ajxtxt"></asp:TextBox><cc1:CalendarExtender ID="CalendarExtender1" runat="server" Enabled="True" 
                                                    PopupButtonID="img" TargetControlID="txtdob"></cc1:CalendarExtender>&#160;&#160; <img ID="img" alt="" src="images/calendar_icon.jpg" 
                                                    style="width: 28px; height: 21px" /><asp:RequiredFieldValidator 
                                            ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtdob" 
                                            ErrorMessage="Date of Birth cannot be empty"></asp:RequiredFieldValidator>
                                    </td></tr><tr><td >&#160;</td><td>&#160;</td></tr><tr><td >&#160;</td><td>&#160;</td></tr><tr><td >&#160;</td><td>&#160;</td></tr><tr><td >&#160;</td><td>&#160;</td></tr><tr><td >&#160;</td><td>&#160;</td></tr><tr><td >&#160;</td><td>&#160;</td></tr><tr><td >&#160;</td><td>&#160;</td></tr><tr><td >&#160;</td><td>&#160;</td></tr><tr><td >&#160;</td><td>&#160;</td></tr><tr><td >&#160;</td><td>&#160;</td></tr><tr><td >&#160;</td><td>&#160;</td></tr><tr><td >&#160;</td><td>&#160;</td></tr><tr><td >&#160;</td><td>&#160;</td></tr><tr><td >&#160;</td><td>&#160;</td></tr><tr><td >&#160;</td><td>&#160;</td></tr><tr><td >&#160;</td><td>&#160;</td></tr><tr><td >&#160;</td><td>&#160;</td></tr><tr><td >&#160;</td><td>&#160;</td></tr><tr><td >&#160;</td><td>&#160;</td></tr><tr><td >&#160;</td><td>&#160;</td></tr><tr><td >&#160;</td><td>&#160;</td></tr><tr><td >&#160;</td><td>&#160;</td></tr></table></ContentTemplate></cc1:TabPanel>
                            <cc1:TabPanel ID="TabPanel2" runat="server" HeaderText="Work Details"><ContentTemplate><br /><br /><br /><br /><table >
                                <tr class="table_tr"><td ><asp:Label ID="lbldesignation" runat="server" 
                                        Text="Designation" CssClass="ajxtxt"></asp:Label></td><td >
                                        <cc1:ComboBox ID="cbdesg" runat="server" AutoCompleteMode="SuggestAppend" 
                                                    AutoPostBack="True" DataTextField="type" DataValueField="type" 
                                                    DropDownStyle="DropDownList" MaxLength="0" 
                                            style="display: inline;" CssClass="ajxtxt" ForeColor="Black"><asp:ListItem></asp:ListItem><asp:ListItem>Head</asp:ListItem><asp:ListItem>Shift engg</asp:ListItem><asp:ListItem>Technician</asp:ListItem></cc1:ComboBox></td></tr>
                                <tr class="table_tr"><td ><asp:Label ID="lblempdept" runat="server" 
                                        Text="Department" CssClass="ajxtxt"></asp:Label></td><td >
                                        <cc1:ComboBox ID="cbdep" runat="server" AutoCompleteMode="SuggestAppend" 
                                                    AutoPostBack="True" DataTextField="type" DataValueField="type" 
                                                    DropDownStyle="DropDownList" MaxLength="0" 
                                            style="display: inline;" CssClass="ajxtxt" ForeColor="Black"><asp:ListItem></asp:ListItem><asp:ListItem>HVAC</asp:ListItem><asp:ListItem>Plumbing</asp:ListItem><asp:ListItem>Electrical</asp:ListItem><asp:ListItem>Refrigeration</asp:ListItem><asp:ListItem>Carpentary</asp:ListItem><asp:ListItem>Infrastructure</asp:ListItem><asp:ListItem>Others</asp:ListItem></cc1:ComboBox></td></tr>
                                <tr class="table_tr"><td ><asp:Label ID="lblheadname" runat="server" 
                                        Text="Head name" CssClass="ajxtxt"></asp:Label></td><td >
                                        <cc1:ComboBox ID="cbheadname" runat="server" AutoCompleteMode="SuggestAppend" 
                                                    AutoPostBack="True" DataSourceID="SqlDataSource4" DataTextField="name" 
                                                    DataValueField="emp_id" DropDownStyle="DropDownList" MaxLength="0" 
                                                    style="display: inline;" CssClass="ajxtxt" ForeColor="Black"></cc1:ComboBox><asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                                                    ConnectionString="<%$ ConnectionStrings:assetdbConnectionString %>" SelectCommand="SELECT [name], [emp_id] FROM [emp_details] where designation ='Head' or designation='Shift engg'

"></asp:SqlDataSource><br /><br /><br /></td></tr><tr class="table_tr"><td ><asp:Label ID="lblempunder" 
                                        runat="server" Text="Reporting Employees" CssClass="ajxtxt"></asp:Label></td><td >
                                        <cc1:ComboBox ID="cbempunder" runat="server" MaxLength="0" CssClass="ajxtxt"></cc1:ComboBox></td></tr>
                                <tr class="table_tr"><td ><table class="a" ><tr><td rowspan="4">
                                    <asp:ListBox ID="lbemps" runat="server" datasourceid="SqlDataSource5" 
                                                                DataTextField="name" DataValueField="emp_id" Height="100px" 
                                                                SelectionMode="Multiple" Width="100px" 
                                        AutoPostBack="True" CssClass="ajxtxt" ForeColor="Black"></asp:ListBox><asp:SqlDataSource ID="SqlDataSource5" runat="server" 
                                                                ConnectionString="<%$ ConnectionStrings:assetdbConnectionString %>" 
                                                                
                                                                SelectCommand="SELECT [emp_id], [name] FROM [emp_details] WHERE (([designation] &lt;&gt; @designation) AND ([dept] = @dept) AND ([headname] IS NULL))"><SelectParameters><asp:Parameter DefaultValue="Head" Name="designation" Type="String" /><asp:ControlParameter ControlID="cbdep" Name="dept" 
                                                                        PropertyName="SelectedValue" Type="String" /></SelectParameters></asp:SqlDataSource></td><td>
                                        <asp:Button ID="btnadd" runat="server" onclick="btnadd_Click" Text="&gt;" 
                                            CssClass="ajxtxt" /></td></tr><tr><td><asp:Button ID="btnaddall" 
                                            runat="server" onclick="btnaddall_Click" 
                                                                Text="&gt;&gt;" CssClass="ajxtxt" /></td></tr><tr><td>
                                        <asp:Button ID="btnremove" runat="server" onclick="btnremove_Click" 
                                                                Text="&lt;" CssClass="ajxtxt" /></td></tr><tr><td>
                                        <asp:Button ID="btnremoveall" runat="server" onclick="btnremoveall_Click" 
                                                                Text="&lt;&lt;" CssClass="ajxtxt" /></td></tr></table><br />&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;<br /></td><td >
                                        <asp:ListBox ID="lbempunder" runat="server" Height="100px" 
                                                    SelectionMode="Multiple" Width="100px" CssClass="ajxtxt" 
                                            ForeColor="Black"></asp:ListBox><br /><br /></td></tr>
                                <tr class="table_tr"><td ><asp:Label ID="lblfloor" runat="server" 
                                        Text="Description" CssClass="ajxtxt"></asp:Label></td><td >
                                        <asp:TextBox ID="txtdesc" runat="server" TextMode="MultiLine" CssClass="ajxtxt"></asp:TextBox></td></tr><tr><td ></td><td></td></tr><tr><td >&#160;&#160;</td><td>&#160;&#160;</td></tr><tr><td ><br /></td><td>&#160;</td></tr><tr><td></td><td></td></tr><tr><td>&#160;</td><td>&#160;</td></tr><tr><td>&#160;</td><td>&#160;</td></tr><tr><td>&#160;</td><td>&#160;</td></tr><tr><td>&#160;</td><td>&#160;</td></tr><tr><td>&#160;</td><td>&#160;</td></tr><tr><td>&#160;</td><td>&#160;</td></tr><tr><td>&#160;&#160;</td><td>&#160;&#160;</td></tr></table></ContentTemplate></cc1:TabPanel>
                        </cc1:TabContainer>
                         </td>
                 </tr>
                 <tr>
                     <td>
                         <asp:Button ID="btnupd" runat="server" CssClass="btnstyle" 
                             onclick="btnupd_Click" Text="Update" Visible="False" />
                     </td>
                 </tr>
             </table>
             </div> 
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
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl ="~/viewprofile.aspx"  >View Profile</asp:HyperLink>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:HyperLink ID="HyperLink2" runat="server"   Enabled ="false" >Update Profile</asp:HyperLink>
</asp:Content>

