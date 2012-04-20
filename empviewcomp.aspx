<%@ Page Language="C#" MasterPageFile="~/MasterHomePage.master" AutoEventWireup="true" CodeFile="empviewcomp.aspx.cs" Inherits="empviewcomp" Title="Complaint Summary" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
    <script  src ="js/jquery-1.3.2.min.js"  type="text/javascript"></script>
    <script src ="js/thickbox.js" type="text/javascript"></script>
    <link href ="css/thickbox.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <div class="title">
<div class="titletxt">Complaint Summary</div>
</div>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
        <div style="background-image:url(images/bgStripe.png); width:700px; float:left; background-repeat:repeat-x;">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table class="style1">
                <tr class="table_tr">
                    <td>
                        <asp:Label ID="Label1" runat="server" CssClass="ajxtxt" Text="View Complain By"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label3" runat="server" CssClass="ajxtxt" Text="Date of Complain"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label4" runat="server" CssClass="ajxtxt" Text="Client Name"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label5" runat="server" CssClass="ajxtxt" Text="Type"></asp:Label>
                    </td>
                </tr>
                <tr class="table_tr">
                    <td>
                        &nbsp;</td>
                    <td>
                        <asp:TextBox ID="txtdob" runat="server" CssClass="ajxtxt" 
                            ontextchanged="txtdob_TextChanged"></asp:TextBox>
                        <cc1:CalendarExtender ID="CalendarExtender1" runat="server" Enabled="True" 
                            PopupButtonID="img" TargetControlID="txtdob">
                        </cc1:CalendarExtender>
                        <img ID="img" alt="" src="images/calendar_icon.jpg" 
                            style="width: 28px; height: 21px" /></td>
                    <td>
                        <cc1:ComboBox ID="cbclientname" runat="server" AutoCompleteMode="SuggestAppend" 
                            AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="org_name" 
                            DataValueField="client_id" DropDownStyle="DropDownList" MaxLength="0" 
                            style="display: inline;" 
                            onselectedindexchanged="cbclientname_SelectedIndexChanged">
                        </cc1:ComboBox>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:assetdbConnectionString %>" 
                            SelectCommand="SELECT [client_id], [org_name] FROM [client_details]">
                        </asp:SqlDataSource>
                    </td>
                    <td>
                        <cc1:ComboBox ID="cbtype" runat="server" AutoPostBack="True" 
                            DataSourceID="SqlDataSource2" DataTextField="probtype" 
                            DataValueField="probtype" MaxLength="0" style="display: inline;" 
                            AutoCompleteMode="SuggestAppend" DropDownStyle="DropDownList" 
                            onselectedindexchanged="cbtype_SelectedIndexChanged">
                        </cc1:ComboBox>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:assetdbConnectionString %>" 
                            SelectCommand="SELECT [probtype] FROM [complain] WHERE (([emp_shift] = @emp_shift) OR ([emp_head] = @emp_head))">
                            <SelectParameters>
                                <asp:SessionParameter Name="emp_shift" SessionField="empid" Type="String" />
                                <asp:SessionParameter Name="emp_head" SessionField="empid" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr class="table_tr">
                    <td colspan="4">
                        <asp:Button ID="btnsearch" runat="server" CssClass="btnstyle" 
                            onclick="btnsearch_Click" Text="Search" />
                    </td>
                </tr>
                <tr class="table_tr">
                    <td colspan="4">
                        <asp:Label ID="lblresult" runat="server" CssClass="ajxtxt" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
                <tr class="table_tr">
                    <td colspan="4">
                        <asp:GridView ID="GridView1" runat="server" CssClass="ajxtxt slct grdview">
                            <Columns>
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false" 
                                            CommandName="Select" onclick="LinkButton1_Click" Text="Select" PostBackUrl ='<%# "~/empviewcomp.aspx?Ticketid="+Eval("ticket_id")+ "&clientname="+Eval("client_id") %>' ></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <HeaderStyle BackColor="#FC950A" CssClass="grdhead" Font-Bold="True" 
                                ForeColor="White" />
                        </asp:GridView>
                    </td>
                </tr>
                <tr class="table_tr">
                    <td colspan="4">
                        &nbsp;</td>
                </tr>
                <tr class="table_tr">
                    <td colspan="4">
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server" Visible="False">
                            <ContentTemplate>
                                <table class="style1">
                                    <tr class="table_tr">
                                        <td colspan="4">
                                        
                                            <hr style="color: #0000FF" />
                                        </td>
                                    </tr>
                                    <tr class="table_tr">
                                        <td colspan="4">
                                            <asp:Label ID="lblhead" runat="server" CssClass="ajxtxt" Font-Bold="True" 
                                                Font-Size="Large" Text="General Details"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr class="table_tr">
                                        <td>
                                            <asp:Label ID="lblticketid" runat="server" CssClass="ajxtxt" Text="Ticket#"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtticketid" runat="server" CssClass="ajxtxt" Enabled="False"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:Label ID="Label10" runat="server" CssClass="ajxtxt" Text="Problem Type"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtprobtype" runat="server" CssClass="ajxtxt" Enabled="False"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr class="table_tr">
                                        <td>
                                            <asp:Label ID="Label7" runat="server" CssClass="ajxtxt" Text="Client Name"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtclientname" runat="server" CssClass="ajxtxt" 
                                                Enabled="False"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:Label ID="Label9" runat="server" CssClass="ajxtxt" Text="Problem Subtype"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtprobsubtype" runat="server" CssClass="ajxtxt" 
                                                Enabled="False"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr class="table_tr">
                                        <td>
                                            <asp:Label ID="Label30" runat="server" CssClass="ajxtxt" 
                                                Text="Client Contact  Name"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtcc" runat="server" CssClass="ajxtxt" Enabled="False"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:Label ID="Label31" runat="server" CssClass="ajxtxt" Text="Asset Id"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtassetid" runat="server" CssClass="ajxtxt" Enabled="False"></asp:TextBox>
                                            <br />
                                            <a class="thickbox" 
                                                href="AssetDetails.aspx?keepThis=true&amp;TB_iframe=true&amp;height=300&amp;width=500" 
                                                title="Asset Details">click here to view asset detail</a></td>
                                    </tr>
                                    <tr class="table_tr">
                                        <td colspan="4">
                                            <asp:LinkButton ID="lbadditionalfield" runat="server" 
                                                onclick="lbadditionalfield_Click">Click here to select additional field</asp:LinkButton>
                                            &nbsp;&nbsp;     
                                        </td>
                                    </tr>
                                    <tr class="table_tr">
                                        <td colspan="4">
                                            <asp:PlaceHolder ID="PlaceHolder1" runat="server" Visible="False">
                                            </asp:PlaceHolder>
                                        </td>
                                    </tr>
                                    <tr class="table_tr">
                                        <td colspan="4">
                                        <hr style="color: #0000FF" />
                                            &nbsp;</td>
                                    </tr>
                                    <tr class="table_tr">
                                        <td colspan="4">
                                            <asp:Label ID="lbltaskdetails" runat="server" Font-Bold="True" 
                                                Font-Size="Large" Text="Task Details"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr class="table_tr">
                                        <td>
                                            <asp:Label ID="Label11" runat="server" CssClass="ajxtxt" 
                                                Text="Date of Complain"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtdocomplain" runat="server" CssClass="ajxtxt" 
                                                Enabled="False"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:Label ID="Label14" runat="server" CssClass="ajxtxt" 
                                                Text="Task Description"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txttastdesc" runat="server" CssClass="ajxtxt" 
                                                TextMode="MultiLine" Enabled="False"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr class="table_tr">
                                        <td>
                                            <asp:Label ID="Label28" runat="server" CssClass="ajxtxt" Text="Date of Repair"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtdorepair" runat="server" CssClass="ajxtxt" Enabled="False"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:Label ID="Label17" runat="server" CssClass="ajxtxt" Text="Other Details"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtotherdesc" runat="server" CssClass="ajxtxt" 
                                                TextMode="MultiLine" Enabled="False"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr class="table_tr">
                                        <td>
                                            <asp:Label ID="Label12" runat="server" Text="ETA"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txteta" runat="server" CssClass="ajxtxt" Enabled="False"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:Label ID="lblwrkhead" runat="server" CssClass="ajxtxt" Enabled="False" 
                                                Text="Work Done By Head"></asp:Label>
                                            <br />
                                            <asp:Label ID="lblnamehead" runat="server" CssClass="ajxtxt" Enabled="False"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtwrkdnehead" runat="server" CssClass="ajxtxt" 
                                                Enabled="False" TextMode="MultiLine"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr class="table_tr">
                                        <td>
                                            <asp:Label ID="Label15" runat="server" Text="ATA"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtata" runat="server" CssClass="ajxtxt" Enabled="False"></asp:TextBox>
                                        </td>
                                        <td colspan="2">
                                            <asp:LinkButton ID="lbshift" runat="server" onclick="lbshift_Click" 
                                                Enabled="False">Click here to select Shift Engg</asp:LinkButton>
                                        </td>
                                    </tr>
                                    <tr class="table_tr">
                                        <td>
                                            <asp:Label ID="Label16" runat="server" Text="ATC"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtatc" runat="server" CssClass="ajxtxt"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:Label ID="lblworkshift" runat="server" CssClass="ajxtxt" Enabled="False" 
                                                Text="Work Done By Shift Engg"></asp:Label>
                                            <br />
                                            <asp:Label ID="lblnameshift" runat="server" CssClass="ajxtxt" Enabled="False"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtwrkdneshift" runat="server" CssClass="ajxtxt" 
                                                Enabled="False" TextMode="MultiLine"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr class="table_tr">
                                        <td>
                                            <asp:Label ID="Label29" runat="server" CssClass="ajxtxt" Text="Priority"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtpriority" runat="server" CssClass="ajxtxt" Enabled="False"></asp:TextBox>
                                        </td>
                                        <td colspan="2">
                                            <asp:LinkButton ID="lbtech" runat="server" onclick="lbtech_Click" 
                                                Enabled="False">Click here to select Technician</asp:LinkButton>
                                        </td>
                                    </tr>
                                    <tr class="table_tr">
                                        <td>
                                            <asp:Label ID="Label13" runat="server" CssClass="ajxtxt" Text="Status"></asp:Label>
                                        </td>
                                        <td>
                                            <cc1:ComboBox ID="cbstatus" runat="server" AutoCompleteMode="SuggestAppend" 
                                                AutoPostBack="True" CssClass="ajxtxt" DropDownStyle="DropDownList" 
                                                ForeColor="Black" MaxLength="0" style="display: inline;">
                                                <asp:ListItem Selected="True">Escalate to Help Desk</asp:ListItem>
                                                <asp:ListItem>Open</asp:ListItem>
                                                <asp:ListItem>Escalate to Head</asp:ListItem>
                                                <asp:ListItem>Escalate to shift engineer</asp:ListItem>
                                                <asp:ListItem>Submit for client approval</asp:ListItem>
                                                <asp:ListItem>Submit to store</asp:ListItem>
                                                <asp:ListItem>AMC vendor notified</asp:ListItem>
                                                <asp:ListItem>Parts Received</asp:ListItem>
                                                <asp:ListItem>Close</asp:ListItem>
                                            </cc1:ComboBox>
                                        </td>
                                        <td>
                                            <asp:Label ID="lblwrktech" runat="server" CssClass="ajxtxt" 
                                                Text="Work Done By Technician" Enabled="False"></asp:Label>
                                            <br />
                                            <asp:Label ID="lblnametech" runat="server" CssClass="ajxtxt" Enabled="False"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtwrkdnetech" runat="server" CssClass="ajxtxt" 
                                                TextMode="MultiLine" Enabled="False"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr class="table_tr">
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            <asp:Label ID="lblwrktech0" runat="server" CssClass="ajxtxt" Enabled="False" 
                                                Text="Complaint Registered By"></asp:Label>
                                            <br />
                                            <asp:Label ID="lblnaemempreg" runat="server" CssClass="ajxtxt" Enabled="False"></asp:Label>
                                        </td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr class="table_tr">
                                        <td colspan="4">
                                            <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                                <ContentTemplate>
                                                    <table class="style1">
                                                        <tr>
                                                            <td colspan="2">
                                                                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                                                                    CssClass="ajxtxt slct grdview" DataKeyNames="emp_id" 
                                                                    DataSourceID="SqlDataSource3" AllowSorting="True">
                                                                    <Columns>
                                                                        <asp:TemplateField ShowHeader="False">
                                                                            <ItemTemplate>
                                                                                 <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                                                                    CommandName="Select" 
                                                                                    PostBackUrl='<%# "~/empviewcomp.aspx?Empid="+Eval("emp_id")+ "&empname="+Eval("name") %>' 
                                                                                    Text="Select" onclick="LinkButton1_Click1"></asp:LinkButton>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:BoundField DataField="emp_id" HeaderText="emp_id" InsertVisible="False" 
                                                                            ReadOnly="True" SortExpression="emp_id" />
                                                                        <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                                                                        <asp:BoundField DataField="designation" HeaderText="designation" 
                                                                            SortExpression="designation" />
                                                                        <asp:BoundField DataField="dept" HeaderText="dept" SortExpression="dept" />
                                                                        <asp:BoundField DataField="phoneno" HeaderText="phoneno" 
                                                                            SortExpression="phoneno" />
                                                                        <asp:BoundField DataField="emailid" HeaderText="emailid" 
                                                                            SortExpression="emailid" />
                                                                        <asp:BoundField DataField="count" HeaderText="count" SortExpression="count" />
                                                                    </Columns>
                                                                    <HeaderStyle BackColor="#FC950A" CssClass="grdhead" ForeColor="White" />
                                                                </asp:GridView>
                                                                <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                                                                    ConnectionString="<%$ ConnectionStrings:assetdbConnectionString %>" 
                                                                    
                                                                    SelectCommand="SELECT [emp_id], [name], [designation], [dept], [phoneno], [emailid],[count] FROM [emp_details] WHERE (([designation] = @designation) AND ([dept] = @dept)) AND([count]&lt;= 5)">
                                                                    <SelectParameters>
                                                                        <asp:SessionParameter Name="designation" SessionField="employee" 
                                                                            Type="String" />
                                                                        <asp:SessionParameter Name="dept" SessionField="department" Type="String" />
                                                                    </SelectParameters>
                                                                </asp:SqlDataSource>
                                                            </td>
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
                                        </td>
                                    </tr>
                                    <tr class="table_tr">
                                        <td colspan="4"><hr style="color: #0000FF" />
                                            &nbsp;</td>
                                    </tr>
                                    <tr class="table_tr">
                                        <td colspan="4">
                                            <asp:Label ID="lbltaskdetails0" runat="server" Font-Bold="True" 
                                                Font-Size="Large" Text="Invoice Details"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr class="table_tr">
                                        <td>
                                            <asp:Label ID="Label19" runat="server" CssClass="ajxtxt" Text="Parts Required"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:RadioButton ID="rbyespart" runat="server" GroupName="a" Text="Yes" />
                                            &nbsp;&nbsp;
                                            <asp:RadioButton ID="rbnopart" runat="server" GroupName="a" Text="No" />
                                        </td>
                                        <td>
                                            <asp:Label ID="Label23" runat="server" CssClass="ajxtxt" Text="Labour Cost"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtlabourcost" runat="server" CssClass="ajxtxt" 
                                                AutoPostBack="True" ontextchanged="txtlabourcost_TextChanged"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr class="table_tr">
                                        <td>
                                            <asp:Label ID="Label20" runat="server" CssClass="ajxtxt" 
                                                Text="Part Description"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtpartdesc" runat="server" TextMode="MultiLine"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:Label ID="Label24" runat="server" CssClass="ajxtxt" Text="Additional Cost"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtaddcost" runat="server" CssClass="ajxtxt" 
                                                AutoPostBack="True" ontextchanged="txtaddcost_TextChanged"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr class="table_tr">
                                        <td>
                                            <asp:Label ID="Label21" runat="server" CssClass="ajxtxt" 
                                                Text="Customer Payment"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:RadioButton ID="rbyespayment" runat="server" GroupName="b" Text="Yes" />
                                            &nbsp;
                                            <asp:RadioButton ID="rbnopayment" runat="server" GroupName="b" Text="No" />
                                        </td>
                                        <td>
                                            <asp:Label ID="Label22" runat="server" CssClass="ajxtxt" Text="Parts Cost"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtpartcost" runat="server" CssClass="ajxtxt" 
                                                AutoPostBack="True" ontextchanged="txtpartcost_TextChanged"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr class="table_tr">
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            <asp:Label ID="Label26" runat="server" CssClass="ajxtxt" Text="Total"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txttotal" runat="server" CssClass="ajxtxt" AutoPostBack="True"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr class="table_tr">
                                        <td>
                                        </td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            <asp:Label ID="Label25" runat="server" CssClass="ajxtxt" Text="Tax"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txttax" runat="server" CssClass="ajxtxt" AutoPostBack="True" 
                                                Enabled="False">10%</asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr class="table_tr">
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            <asp:Label ID="Label27" runat="server" CssClass="ajxtxt" Text="Grand Total"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtgrandtotal" runat="server" CssClass="ajxtxt" 
                                                AutoPostBack="True"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr class="table_tr">
                                        <td colspan="4">
                                            <hr style="color: #0000FF" />
                                        </td>
                                    </tr>
                                    <tr class="table_tr">
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            <asp:Button ID="btnupd" runat="server" CssClass="btnstyle" 
                                                onclick="btnupd_Click" Text="Update" />
                                        </td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr class="table_tr">
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            <asp:Label ID="lblupmess" runat="server" CssClass="ajxtxt" ForeColor="Red"></asp:Label>
                                        </td>
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

