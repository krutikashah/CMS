<%@ Page Language="C#" MasterPageFile="~/MasterHomePage.master" AutoEventWireup="true" CodeFile="insempdetails.aspx.cs" Inherits="insempdetails" Title="Add Employee Details" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .ajax__combobox_buttoncontainer button
{
    background-image: url(mvwres://AjaxControlToolkit, Version=3.0.30930.28736, Culture=neutral, PublicKeyToken=28f01b0e84b6d53e/AjaxControlToolkit.ComboBox.arrow-down.gif);
    background-position: center;
    background-repeat: no-repeat;
    border-color: ButtonFace;
    height: 15px;
    width: 15px;
}
.ajax__combobox_buttoncontainer button
{
    background-image: url(mvwres://AjaxControlToolkit, Version=3.0.30930.28736, Culture=neutral, PublicKeyToken=28f01b0e84b6d53e/AjaxControlToolkit.ComboBox.arrow-down.gif);
    background-position: center;
    background-repeat: no-repeat;
    border-color: ButtonFace;
    height: 15px;
    width: 15px;
}
    
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="table_tr" width="100%">
        <tr>
            <td colspan="2">
            <div class="title">
<div class="titletxt">Insert Employee Details</div>
</div>
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <br />
              <cc1:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" 
                                Width="857px" AutoPostBack="True" >
                                <cc1:TabPanel ID="TabPanel1" runat="server" HeaderText="Equipment Information"><HeaderTemplate>Personal details 
                          
                                 
                                
                                
                                
                                
                                </HeaderTemplate><ContentTemplate>
                                    
                                
                                
                                    
                                
                                
                                <br /><br /><table ><tr class="table_tr"><td><asp:Label ID="lblempname" runat="server" 
                                            CssClass="ajxtxt" Text="Employee name"></asp:Label></td><td ><asp:TextBox 
                                                ID="txtname" runat="server" CssClass="ajxtxt"></asp:TextBox><cc1:FilteredTextBoxExtender 
                                                ID="txtname_FilteredTextBoxExtender" runat="server" Enabled="True" 
                                                FilterType="Custom, UppercaseLetters, LowercaseLetters" 
                                                TargetControlID="txtname" ValidChars=" "></cc1:FilteredTextBoxExtender><asp:RequiredFieldValidator 
                                                ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtname" 
                                                ErrorMessage="Employee Name cannot be empty"></asp:RequiredFieldValidator></td></tr><tr class="table_tr"><td><asp:Label 
                                                ID="lbladrs" runat="server" CssClass="ajxtxt" Text="Address"></asp:Label></td><td ><asp:TextBox 
                                                    ID="txtadrs" runat="server" CssClass="ajxtxt" TextMode="MultiLine"></asp:TextBox><asp:RequiredFieldValidator 
                                                    ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtadrs" 
                                                    ErrorMessage="Address cannot be empty"></asp:RequiredFieldValidator></td></tr><tr class="table_tr"><td><asp:Label 
                                                ID="lblempemailid" runat="server" CssClass="ajxtxt" Text="Email ID"></asp:Label></td><td ><asp:TextBox 
                                                    ID="txtemailid" runat="server" CssClass="ajxtxt"></asp:TextBox><asp:RegularExpressionValidator 
                                                    ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtemailid" 
                                                    ErrorMessage="Enter valid Email ID" 
                                                    ValidationExpression="(\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*)|( )"></asp:RegularExpressionValidator></td></tr><tr class="table_tr"><td><asp:Label 
                                                ID="lblphoneno" runat="server" CssClass="ajxtxt" Text="Phone no."></asp:Label></td><td ><asp:TextBox 
                                                    ID="txtphoneno" runat="server" CssClass="ajxtxt"></asp:TextBox><cc1:FilteredTextBoxExtender 
                                                    ID="txtphoneno_FilteredTextBoxExtender" runat="server" Enabled="True" 
                                                    FilterType="Numbers" TargetControlID="txtphoneno"></cc1:FilteredTextBoxExtender><asp:RequiredFieldValidator 
                                                    ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtphoneno" 
                                                    ErrorMessage="Phone No cannot be empty"></asp:RequiredFieldValidator></td></tr><tr class="table_tr"><td><asp:Label 
                                                ID="lbldob" runat="server" CssClass="ajxtxt" Text="Date of birth"></asp:Label></td><td ><asp:TextBox 
                                                    ID="txtdob" runat="server" CssClass="ajxtxt"></asp:TextBox><cc1:CalendarExtender 
                                                    ID="CalendarExtender1" runat="server" Enabled="True" PopupButtonID="img" 
                                                    TargetControlID="txtdob"></cc1:CalendarExtender>&#160;&#160; <img id="img" alt="" 
                                                    src="images/calendar_icon.jpg" style="width: 28px; height: 21px" /><asp:RequiredFieldValidator 
                                                    ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtdob" 
                                                    ErrorMessage="Date of Birth cannot be empty"></asp:RequiredFieldValidator><asp:RegularExpressionValidator 
                                                    ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtdob" 
                                                    ErrorMessage="Enter valid Date of Birth" 
                                                    ValidationExpression="([1-9]|1[012])[ /]([1-9]|[12][0-9]|3[01])[ /](19|20)\d\d"></asp:RegularExpressionValidator></td></tr></table></ContentTemplate></cc1:TabPanel>
                                <cc1:TabPanel ID="TabPanel2" runat="server" HeaderText="Work Details"><ContentTemplate><br /><table ">
                                    <tr class="table_tr" class="table_tr"></tr><tr class="table_tr"><td ><asp:Label ID="lbldesignation" runat="server" CssClass="ajxtxt" 
                                                    Text="Designation"></asp:Label></td><td ><cc1:ComboBox ID="cbdesg" runat="server" AutoCompleteMode="SuggestAppend" 
                                                    AutoPostBack="True" CssClass="ajxtxt" DataTextField="type" 
                                                    DataValueField="type" DropDownStyle="DropDownList" MaxLength="0" 
                                                    style="display: inline;" ForeColor="Black" 
                                                    onselectedindexchanged="cbdesg_SelectedIndexChanged"><asp:ListItem></asp:ListItem><asp:ListItem>Head</asp:ListItem><asp:ListItem>Shift engg</asp:ListItem><asp:ListItem>Technician</asp:ListItem><asp:ListItem>Help desk personnel</asp:ListItem></cc1:ComboBox></td></tr><tr class="table_tr"><td><asp:Label ID="lblempdept" runat="server" CssClass="ajxtxt" Text="Department"></asp:Label></td><td><cc1:ComboBox ID="cbdep" runat="server" AutoCompleteMode="SuggestAppend" 
                                                    AutoPostBack="True" CssClass="ajxtxt" DataTextField="type" 
                                                    DataValueField="type" DropDownStyle="DropDownList" MaxLength="0" 
                                                    OnSelectedIndexChanged="cbdesg_SelectedIndexChanged" 
                                                    style="display: inline;" ForeColor="Black"><asp:ListItem></asp:ListItem><asp:ListItem>Plumbing</asp:ListItem><asp:ListItem>Electrical</asp:ListItem><asp:ListItem>Carpentary</asp:ListItem><asp:ListItem>Infrastructure</asp:ListItem><asp:ListItem>Others</asp:ListItem></cc1:ComboBox></td></tr><tr><td class="table_tr" colspan="2" ><asp:LinkButton ID="lbheadname" runat="server" CssClass="ajxtxt" 
                                                OnClick="lbheadname_Click" Visible="False">Click here to select head</asp:LinkButton></td></tr><tr class="table_tr"><td><asp:Label ID="lblheadname" runat="server" CssClass="ajxtxt" Text="Head name" 
                                            Visible="False"></asp:Label></td><td><br /><br /><br /><br /><br /><cc1:ComboBox ID="cbheadname" runat="server" AutoCompleteMode="SuggestAppend" 
                                                AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="name" 
                                                DataValueField="emp_id" DropDownStyle="DropDownList" MaxLength="0" 
                                                style="display: inline;" Visible="False" ForeColor="Black"></cc1:ComboBox><asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                                ConnectionString="<%$ ConnectionStrings:assetdbConnectionString %>" SelectCommand="SELECT [name], [emp_id] FROM [emp_details] where designation ='Head' or designation='Shift engg'

"></asp:SqlDataSource></td></tr><tr><td colspan="2" ><asp:UpdatePanel ID="upreportingemp" runat="server" Visible="False"><ContentTemplate><table><tr><td><asp:Label ID="lblempunder" runat="server" CssClass="ajxtxt" 
                                                                    Text="Reporting Employees"></asp:Label></td><td>&#160;</td></tr><tr><td><table><tr><td rowspan="4"><asp:ListBox ID="lbemps" runat="server" AutoPostBack="True" CssClass="ajxtxt" 
                                                                                DataSourceID="SqlDataSource2" DataTextField="name" DataValueField="emp_id" 
                                                                                Height="100px" SelectionMode="Multiple" Width="100px" ForeColor="Black"></asp:ListBox><asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                                                                                ConnectionString="<%$ ConnectionStrings:assetdbConnectionString %>" 
                                                                                SelectCommand="SELECT [emp_id], [name] FROM [emp_details] WHERE (([dept] = @dept) AND ([headname] IS NULL) AND ([designation] &lt;&gt; @designation))"><SelectParameters><asp:ControlParameter ControlID="cbdep" Name="dept" 
                                                                                        PropertyName="SelectedValue" Type="String" /><asp:Parameter DefaultValue="Head" Name="designation" Type="String" /></SelectParameters></asp:SqlDataSource></td><td><asp:Button ID="btnadd" runat="server" CssClass="ajxtxt" OnClick="btnadd_Click" 
                                                                                Text="&gt;" /></td></tr><tr><td><asp:Button ID="btnaddall" runat="server" CssClass="ajxtxt" 
                                                                                OnClick="btnaddall_Click" Text="&gt;&gt;" /></td></tr><tr><td><asp:Button ID="btnremove" runat="server" CssClass="ajxtxt" 
                                                                                OnClick="btnremove_Click" Text="&lt;" /></td></tr><tr><td><asp:Button ID="btnremoveall" runat="server" CssClass="ajxtxt" 
                                                                                OnClick="btnremoveall_Click" Text="&lt;&lt;" /></td></tr></table>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;<br /></td><td><asp:ListBox ID="lbempunder" runat="server" CssClass="ajxtxt" Height="100px" 
                                                                    SelectionMode="Multiple" Width="100px" ForeColor="Black"></asp:ListBox></td></tr></table></ContentTemplate></asp:UpdatePanel></td></tr><tr><td ><asp:Label ID="lblfloor" runat="server" CssClass="ajxtxt" Text="Description"></asp:Label></td><td><asp:TextBox ID="txtdesc" runat="server" CssClass="ajxtxt" TextMode="MultiLine"></asp:TextBox></td></tr></table>
                                
                                
                                
                                
                                
                                
                                </ContentTemplate></cc1:TabPanel>
                               
                            </cc1:TabContainer></td>
        </tr>
       
        <tr>
            <td colspan="2" style="float:left;">
                                   
                                   <asp:Button ID="btnempdetails" runat="server" Text="Insert" 
                                       onclick="btnempdetails_Click" CssClass="btnstyle" />
                                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                   
                                   <asp:Button ID="btnempdetails0" runat="server" Text="Reset" 
                                       onclick="btnempdetails0_Click" CssClass="btnstyle" />
                                   <br />
                                   <br />
                                   <asp:Label ID="lblretemp" runat="server" CssClass="ajxtxt" ForeColor="Red"></asp:Label>
            </td>
        </tr>
    </table>
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
</asp:Content>
<asp:Content ContentPlaceHolderID ="ContentPlaceHolder2" runat ="server" ID ="emp1">
    <asp:HyperLink ID="HyperLink1" runat="server" Enabled ="false" >Insert</asp:HyperLink>  &nbsp;  &nbsp;  &nbsp;  &nbsp;|    &nbsp;  &nbsp;  &nbsp;  &nbsp;
    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl ="~/updateempdet.aspx"  >Update</asp:HyperLink>

</asp:Content>


