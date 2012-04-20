<%@ Page Language="C#" MasterPageFile="~/MasterHomePage.master" AutoEventWireup="true" CodeFile="escalatecomp.aspx.cs" Inherits="escalatecomp" Title="Forwarded Complaint" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
        }
        </style>
     <script  src ="js/jquery-1.3.2.min.js"  type="text/javascript"></script>
    <script src ="js/thickbox.js" type="text/javascript"></script>
    <link href ="css/thickbox.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <div class="title">
<div class="titletxt">My Tasks</div>
</div>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
        <div style="background-image:url(images/bgStripe.png); width:700px; float:left; background-repeat:repeat-x;">

    <asp:UpdatePanel ID="uphelp" runat="server" Visible="False">
        <ContentTemplate>
            <table class="style1">
                <tr class="table_tr">
                    <td colspan="2">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr class="table_tr">
                    <td colspan="2">
                        <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" 
                            CssClass="ajxtxt slct grdview" DataKeyNames="ticket_id" 
                            DataSourceID="SqlDataSource1">
                            <Columns>
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                            CommandName="Select" onclick="LinkButton1_Click" Text="Select" PostBackUrl='<%# "~/escalatecomp.aspx?ticketid="+Eval("ticket_id") %>'></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="ticket_id" HeaderText="ticket_id" ReadOnly="True" 
                                    SortExpression="ticket_id" />
                                <asp:BoundField DataField="desc" HeaderText="desc" SortExpression="desc" />
                            </Columns>
                            <HeaderStyle BackColor="#FC950A" CssClass="grdhead" Font-Bold="True" 
                                ForeColor="White" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:assetdbConnectionString %>" 
                            SelectCommand="SELECT [ticket_id], [desc] FROM [helpdesktask]">
                        </asp:SqlDataSource>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr class="table_tr">
                    <td colspan="3">
                        &nbsp;</td>
                </tr>
                <tr class="table_tr">
                    <td class="style2" colspan="3">
                        <asp:Label ID="Label1" runat="server" CssClass="ajxtxt" Text="Task description" 
                            Visible="False"></asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="txttask" runat="server" CssClass="ajxtxt" TextMode="MultiLine" 
                            Visible="False"></asp:TextBox>
                    </td>
                </tr>
                <tr class="table_tr">
                    <td class="style2" colspan="3">
                        <asp:Label ID="Label2" runat="server" CssClass="ajxtxt" Text="ID " 
                            Visible="False"></asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                        <asp:TextBox ID="txtid" runat="server" CssClass="ajxtxt" Visible="False"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <table class="style1">
                <tr class="table_tr">
                    <td class="style2" colspan="2">
                        <asp:Label ID="Label32" runat="server" Text="Update Status of Complain"></asp:Label>
                    </td>
                    <td class="style2" colspan="2">
                        <cc1:ComboBox ID="cbstatushelp" runat="server" AutoCompleteMode="SuggestAppend" 
                            AutoPostBack="True" CssClass="ajxtxt" DropDownStyle="DropDownList" 
                            ForeColor="Black" MaxLength="0" 
                            onselectedindexchanged="cbstatushelp_SelectedIndexChanged" 
                            style="display: inline;">
                            <asp:ListItem Selected="True"></asp:ListItem>
                            <asp:ListItem>Open</asp:ListItem>
                            <asp:ListItem>Escalate to Head</asp:ListItem>
                            <asp:ListItem Selected="True">Escalate to Help Desk</asp:ListItem>
                            <asp:ListItem>Escalate to shift engineer</asp:ListItem>
                            <asp:ListItem>Submit for client approval</asp:ListItem>
                            <asp:ListItem>Submit to store</asp:ListItem>
                            <asp:ListItem>AMC vendor notified</asp:ListItem>
                            <asp:ListItem>Parts Received</asp:ListItem>
                            <asp:ListItem>Close</asp:ListItem>
                        </cc1:ComboBox>
                    </td>
                </tr>
                <tr class="table_tr">
                    <td class="style2" colspan="4">
                        <asp:UpdatePanel ID="upemp" runat="server" Visible="False">
                            <ContentTemplate>
                                <a class="thickbox" 
                                    href="empdet.aspx?keepThis=true&amp;TB_iframe=true&amp;height=300&amp;width=500" 
                                    title="Technician details">click here to view detail</a>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
                <tr class="table_tr">
                    <td class="style2" colspan="4">
                        <asp:UpdatePanel ID="upvendor" runat="server" Visible="False">
                            <ContentTemplate>
                                <a class="thickbox" 
                                    href="vendordet.aspx?keepThis=true&amp;TB_iframe=true&amp;height=600&amp;width=500" 
                                    title="Third party vendor detail">click here to view detail</a>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
                <tr class="table_tr">
                    <td class="style2" colspan="4">
                        <asp:Label ID="Label33" runat="server" Text="AMC Notification"></asp:Label>
                    </td>
                </tr>
                <tr class="table_tr">
                    <td class="style2" colspan="4">
                        <asp:GridView ID="GridView5" runat="server" CssClass="ajxtxt slct grdview">
                            <Columns>
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false" 
                                            CommandName="Select" Text="Select" PostBackUrl ='<%# "~/amcdetails.aspx?mfg="+Eval("manufacturer")+ "&clientid="+Eval("client_id")+"&eqpid="+Eval("equipment_id") %>'></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <HeaderStyle BackColor="#FC950A" CssClass="grdhead" Font-Bold="True" 
                                ForeColor="White" />
                        </asp:GridView>
                    </td>
                </tr>
                <tr class="table_tr">
                    <td class="style2" colspan="4">
                        &nbsp;</td>
                </tr>
                <tr class="table_tr">
                    <td class="style2">
                        &nbsp;</td>
                    <td colspan="2">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr class="table_tr">
                    <td colspan="3">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
            <br />
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdatePanel ID="upheadshift" runat="server" Visible="False">
        <ContentTemplate>
            <table class="style1">
                <tr class="table_tr">
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr class="table_tr">
                    <td colspan="2">
                        <asp:GridView ID="GridView3" runat="server" 
                            AlternatingRowStyle-BackColor="#CCCCCC" AlternatingRowStyle-ForeColor="Black" 
                            CssClass="ajxtxt slct grdview" Font-Bold="False" 
                            HeaderStyle-BackColor="#FFFF66" HeaderStyle-CssClass="grdhead" 
                            HeaderStyle-Font-Bold="true">
                            <RowStyle ForeColor="Black" />
                            <Columns>
                                <asp:TemplateField HeaderStyle-CssClass="gridtxt " HeaderStyle-Font-Bold="True" 
                                    HeaderStyle-Font-Italic="true" HeaderStyle-ForeColor="Black" 
                                    ItemStyle-Font-Overline="False" ShowHeader="True">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false" 
                                            CommandName="Select" CssClass="slct" ForeColor="#3399FF" Height="17px" 
                                            onclick="LinkButton1_Click2" 
                                            PostBackUrl ='<%# "~/escalatecomp.aspx?Ticketid="+Eval("ticket_id")+ "&clientname="+Eval("client_id") %>'  Text="Select"></asp:LinkButton>
                                    </ItemTemplate>
                                    <HeaderStyle BackColor="White" CssClass="gridtxt ajxtxt" Font-Bold="True" />
                                    <ItemStyle Font-Overline="False" />
                                </asp:TemplateField>
                            </Columns>
                            <HeaderStyle BackColor="#FC950A" CssClass="grdhead" Font-Bold="True" 
                                Font-Italic="False" ForeColor="White" />
                            <EditRowStyle Font-Bold="False" />
                            <AlternatingRowStyle ForeColor="Black" />
                        </asp:GridView>
                    </td>
                </tr>
                <tr class="table_tr">
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr class="table_tr">
                    <td colspan="2">
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
                                            <asp:TextBox ID="txtticketid" runat="server" CssClass="ajxtxt"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:Label ID="Label10" runat="server" CssClass="ajxtxt" Text="Problem Type"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtprobtype" runat="server" CssClass="ajxtxt"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr class="table_tr">
                                        <td>
                                            <asp:Label ID="Label7" runat="server" CssClass="ajxtxt" Text="Client Name"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtclientname" runat="server" CssClass="ajxtxt"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:Label ID="Label9" runat="server" CssClass="ajxtxt" Text="Problem Subtype"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtprobsubtype" runat="server" CssClass="ajxtxt"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr class="table_tr">
                                        <td>
                                            <asp:Label ID="Label30" runat="server" CssClass="ajxtxt" 
                                                Text="Client Contact  Name"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtcc" runat="server" CssClass="ajxtxt"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:Label ID="Label31" runat="server" CssClass="ajxtxt" Text="Asset Id"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtassetid" runat="server" CssClass="ajxtxt"></asp:TextBox>
                                         <br />
                                            <a class="thickbox" 
                                                href="AssetDetails.aspx?keepThis=true&amp;TB_iframe=true&amp;height=300&amp;width=500" 
                                                title="Asset Details">click here to view asset detail</a></td>
                                        </td>
                                    </tr>
                                    <tr class="table_tr">
                                        <td colspan="4">
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
                                            <asp:TextBox ID="txtdocomplain" runat="server" CssClass="ajxtxt"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:Label ID="Label14" runat="server" CssClass="ajxtxt" 
                                                Text="Task Description"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txttastdesc" runat="server" CssClass="ajxtxt" 
                                                TextMode="MultiLine"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr class="table_tr">
                                        <td>
                                            <asp:Label ID="Label28" runat="server" CssClass="ajxtxt" Text="Date of Repair"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtdorepair" runat="server" CssClass="ajxtxt"></asp:TextBox>
                                           
                                                 <cc1:MaskedEditExtender ID="txtdorepair_MaskedEditExtender" runat="server" 
                                         CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" 
                                         CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                                         CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" 
                                         TargetControlID="txtdorepair" MaskType ="DateTime" 
                                         Mask ="99/99/9999 99:99:99" AcceptAMPM ="True" ErrorTooltipEnabled ="True" 
                                         MessageValidatorTip="true" 
   
   
    InputDirection="RightToLeft" 
    AcceptNegative="Left" 
    DisplayMoney="Left"
   />
                                         
                                         
                                         <cc1:MaskedEditValidator
    ControlExtender="txtdorepair_MaskedEditExtender"
    ControlToValidate="txtdorepair" 
    IsValidEmpty="False" 
    MaximumValue="12000" 
    EmptyValueMessage="Number is required"
    InvalidValueMessage="Number is invalid"
    runat="server" 
    EmptyValueBlurredText="*" 
    InvalidValueBlurredMessage="*" 
    MaximumValueBlurredMessage="*" 
    MinimumValueBlurredText="*"
    Display="Dynamic" 
    TooltipMessage="Input a number: -100 up to 12.000"/>
    
                                         
                                     </cc1:MaskedEditExtender>
                                           
                                        </td>
                                        <td>
                                            <asp:Label ID="Label17" runat="server" CssClass="ajxtxt" Text="Other Details"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtotherdesc" runat="server" CssClass="ajxtxt" 
                                                TextMode="MultiLine"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr class="table_tr">
                                        <td>
                                            <asp:Label ID="Label12" runat="server" Text="ETA"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txteta" runat="server" CssClass="ajxtxt"></asp:TextBox>
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
                                            <asp:TextBox ID="txtata" runat="server" CssClass="ajxtxt"></asp:TextBox>
                                        </td>
                                        <td colspan="2">
                                            &nbsp;</td>
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
                                            <asp:TextBox ID="txtpriority" runat="server" CssClass="ajxtxt"></asp:TextBox>
                                        </td>
                                        <td colspan="2">
                                            &nbsp;</td>
                                    </tr>
                                    <tr class="table_tr">
                                        <td>
                                            <asp:Label ID="Label13" runat="server" CssClass="ajxtxt" Text="Status"></asp:Label>
                                        </td>
                                        <td>
                                            <cc1:ComboBox ID="cbstatus" runat="server" AutoCompleteMode="SuggestAppend" 
                                                AutoPostBack="True" CssClass="ajxtxt" DropDownStyle="DropDownList" 
                                                ForeColor="Black" MaxLength="0" style="display: inline;" 
                                                onselectedindexchanged="cbstatus_SelectedIndexChanged">
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
                                            <asp:Label ID="lblwrktech" runat="server" CssClass="ajxtxt" Enabled="False" 
                                                Text="Work Done By Technician"></asp:Label>
                                            <br />
                                            <asp:Label ID="lblnametech" runat="server" CssClass="ajxtxt" Enabled="False"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtwrkdnetech" runat="server" CssClass="ajxtxt" 
                                                Enabled="False" TextMode="MultiLine"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr class="table_tr">
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
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
                                                                &nbsp;</td>
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
                                        <td colspan="4">
                                            <hr style="color: #0000FF" />
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
                                            <asp:RadioButton ID="rbyespart" runat="server" GroupName="a" Text="Yes" 
                                                AutoPostBack="True" Enabled="False" 
                                                oncheckedchanged="rbyespart_CheckedChanged" />
                                            &nbsp;&nbsp;
                                            <asp:RadioButton ID="rbnopart" runat="server" GroupName="a" Text="No" 
                                                AutoPostBack="True" Enabled="False" 
                                                oncheckedchanged="rbnopart_CheckedChanged" />
                                        </td>
                                        <td>
                                            <asp:Label ID="Label23" runat="server" CssClass="ajxtxt" Text="Labour Cost"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtlabourcost" runat="server" CssClass="ajxtxt" 
                                                ontextchanged="txtlabourcost_TextChanged" AutoPostBack="True"></asp:TextBox>
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
                                                ontextchanged="txtaddcost_TextChanged" AutoPostBack="True"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr class="table_tr">
                                        <td>
                                            <asp:Label ID="Label21" runat="server" CssClass="ajxtxt" 
                                                Text="Customer Payment"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:RadioButton ID="rbyespayment" runat="server" GroupName="b" Text="Yes" 
                                                AutoPostBack="True" />
                                            &nbsp;
                                            <asp:RadioButton ID="rbnopayment" runat="server" GroupName="b" Text="No" 
                                                AutoPostBack="True" />
                                        </td>
                                        <td>
                                            <asp:Label ID="Label22" runat="server" CssClass="ajxtxt" Text="Parts Cost"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtpartcost" runat="server" CssClass="ajxtxt" 
                                                ontextchanged="txtpartcost_TextChanged" AutoPostBack="True"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr class="table_tr">
                                        <td colspan="2">
                                            <asp:LinkButton ID="lbyespar" runat="server" onclick="lbyespar_Click" 
                                                Visible="False">Click here for details regarding Third party</asp:LinkButton>
                                        </td>
                                        <td>
                                            <asp:Label ID="Label26" runat="server" CssClass="ajxtxt" Text="Total"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txttotal" runat="server" CssClass="ajxtxt" AutoPostBack="True"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr class="table_tr">
                                        <td colspan="2">
                                            <asp:LinkButton ID="lbnopart" runat="server" onclick="lbnopart_Click" 
                                                Visible="False">Click here for details regarding AMC</asp:LinkButton>
                                        </td>
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
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr class="table_tr">
                                        <td colspan="4">
                                            <hr style="color: #0000FF" />
                                        </td>
                                    </tr>
                                    <tr class="table_tr">
                                        <td colspan="4">
                                            &nbsp;</td>
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
                                            &nbsp;</td>
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
                <tr class="table_tr">
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr class="table_tr">
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
            <br />
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

