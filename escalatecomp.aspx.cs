using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using bllnamespace;
public partial class escalatecomp : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Session ["designation"]=="as")
            {
            }

        }
        catch{
            Response .Redirect ("CmsHome1.aspx");
        }
            if (Session["designation"].ToString() == "Head")
            {
                upheadshift.Visible = true;
                Session["query"] = "select ticket_id, taskdesc, client_id,emp_technician,emp_shift,docomplain,probtype,priority,ticket_status from complain where emp_head='" + Session["empid"] + "' AND ticket_status='Escalate to Head'";
                bll clconn = new bll();
                DataTable dt = new DataTable();
                dt = clconn.connection(Session["query"].ToString());
                GridView3.DataSource = dt;
                GridView3.DataBind();
                lbnopart.Visible = true;

            }
            else if (Session["designation"].ToString() == "Shift engg")
            {
                upheadshift.Visible = true;
                Session["query"] = "select ticket_id, taskdesc, client_id,emp_technician,emp_shift,docomplain,probtype,priority,ticket_status from complain where emp_shift='" + Session["empid"] + "' AND ( ticket_status='Parts Received' OR ticket_status='Escalate to shift engineer' OR ticket_status='Submit for client approval' OR ticket_status='Submit to store' OR ticket_status='AMC vendor notified')";
                bll clconn = new bll();
                DataTable dt = new DataTable();
                dt = clconn.connection(Session["query"].ToString());
                GridView3.DataSource = dt;
                GridView3.DataBind();
                rbnopart.Enabled = true;
                rbyespart.Enabled = true;
            }
            else if (Session["designation"].ToString() == "Help desk personnel")
            {
                uphelp.Visible = true;
                if (IsPostBack)
                {
                    //string str1;
                    //str1 = Request.QueryString["ticketid"];
                    //int id2 = Convert.ToInt32(str1);
                }

                bll amcnotification = new bll();
                DataTable dt;
                dt = amcnotification.amcnotification();
                GridView5.DataSource = dt;
                GridView5.DataBind();
                bll amc = new bll();
                amc.notifiedno();
            }
        
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Hashtable data = new Hashtable();
        bll get = new bll();
        string str1;
        str1 = Request.QueryString["ticketid"];
        int id2 = Convert.ToInt32(str1);
       data= get.selhelp(id2);
        txtid.Text = data["pk"].ToString();
        txttask.Text = data["desc"].ToString();
        Session["id"] = txtid.Text;
        Label1.Visible = true;
        Label2.Visible = true;
        txttask.Visible = true;
        txtid.Visible = true;
        if (data["dbname"].ToString() == "vendor")
        {
            upvendor.Visible = true;
        }
        else if (data["dbname"].ToString() == "employee")
        {
            upemp.Visible = true;
        }
    }
    protected void LinkButton1_Click2(object sender, EventArgs e)
    {
        string str4;
        str4 = Request.QueryString["Ticketid"];
        int id = Convert.ToInt32(str4);
        string str5;
        str5 = Request.QueryString["clientname"];
        txtticketid.Text = id.ToString();
        txtclientname.Text = str5;
        Hashtable data = new Hashtable();
        bll clemp = new bll();
        data = clemp.selcomp(id);

        txtprobtype.Text = data["probtype"].ToString();
        txtprobsubtype.Text = data["probsubtype"].ToString();
        txtdocomplain.Text = data["docomplain"].ToString();
        txtdorepair.Text = data["dorepair"].ToString();
        txtpriority.Text = data["priority"].ToString();
        cbstatus.SelectedValue = data["ticket_status"].ToString();
        txteta.Text = data["eta"].ToString();
        txtata.Text = data["ata"].ToString();
        txtatc.Text = data["atc"].ToString();
        txtotherdesc.Text = data["others"].ToString();
        txttastdesc.Text = data["taskdesc"].ToString();
        txtpartdesc.Text = data["partdesc"].ToString();
        txtlabourcost.Text = data["labourcost"].ToString();
        txtaddcost.Text = data["additionalcost"].ToString();
        txtpartcost.Text = data["partscost"].ToString();
        txttotal.Text = data["total"].ToString();
        txttax.Text = data["tax"].ToString();
        txtgrandtotal.Text = data["grandtotal"].ToString();
        txtcc.Text = data["cc_id"].ToString();
        txtassetid.Text = data["assetid"].ToString();
        txtwrkdnehead.Text = data["workdonehead"].ToString();
        txtwrkdneshift.Text = data["workdoneshift"].ToString();
        txtwrkdnetech.Text = data["workdonetechnician"].ToString();
        txtassetid.Text = data["assetid"].ToString();
        Session["assetid"] = txtassetid.Text;
        lblnaemempreg.Text = data["emp_reg"].ToString();
      
        lblnamehead.Text = data["emp_head"].ToString();
        lblnameshift.Text = data["emp_shift"].ToString();
        lblnametech.Text = data["emp_technician"].ToString();
        Session["emp_technician"] = data["emp_technician"].ToString();
        Session["emp_shift"] = data["emp_shift"].ToString();
        if (data["partsrequired"].ToString() == "Yes")
        {
            rbyespart.Checked = true;
        }
        else if (data["partsrequired"].ToString() == "No")
        {
            rbnopart.Checked = true;
        }
        if (data["customerpayment"].ToString() == "Yes")
        {
            rbyespayment.Checked = true;

        }
        else if (data["customerpayment"].ToString() == "No")
        {
            rbnopayment.Checked = true;
        }
           
        if (Session["designation"].ToString() == "Head")
        {
            txtwrkdnehead.Enabled = true;
            lblwrkhead.Enabled = true;
            txtwrkdneshift.Enabled = false;
            lblworkshift.Enabled = false;
            txtwrkdnetech.Enabled = false;
            lblwrktech.Enabled = false;
        }
        else if (Session["designation"].ToString() == "Shift engg")
        {
            txtwrkdneshift.Enabled = true;
            lblworkshift.Enabled = true;
            txtwrkdnetech.Enabled = true;
            lblwrktech.Enabled = true;
            txtwrkdnehead.Enabled = false;
            lblwrkhead.Enabled = false;

        }


        UpdatePanel2.Visible = true;
        PlaceHolder1.Visible = false;
        Session["clientid"] = data["client_id"];

    }
    protected void btnupd_Click(object sender, EventArgs e)
    {
        Hashtable data = new Hashtable();

        data.Add("update", "none");
        data.Add("ticket_id", txtticketid.Text);
        data.Add("designation", Session["designation"].ToString());
        data.Add("probtype", txtprobtype.Text);
        data.Add("probsubtype", txtprobsubtype.Text);
        data.Add("docomplain", txtdocomplain.Text);
        data.Add("dorepair", txtdorepair.Text);
        data.Add("priority", txtpriority.Text);
        data.Add("eta", txteta.Text);
        data.Add("ata", txtata.Text);
        data.Add("atc", txtatc.Text);
        data.Add("others", txtotherdesc.Text);
        data.Add("taskdesc", txttastdesc.Text);

        data.Add("labourcost", txtlabourcost.Text);
        data.Add("additionalcost", txtaddcost.Text);
        data.Add("partscost", txtpartcost.Text);
        data.Add("total", txttotal.Text);
        data.Add("tax", txttax.Text);
        data.Add("grandtotal", txtgrandtotal.Text);

        data.Add("workdonehead", txtwrkdnehead.Text);
        data.Add("workdoneshift", txtwrkdneshift.Text);
        data.Add("workdonetechnician", txtwrkdnetech.Text);

        if (rbnopart.Checked == true)
        {
            data.Add("partsrequired", rbnopart.Text);
        }
        else if (rbyespart.Checked == true)
        {
            data.Add("partsrequired", rbyespart.Text);
        }
        else
        {
            data.Add("partsrequired", "");
        }
        data.Add("partsdesc", txtpartdesc.Text);

        if (rbyespayment.Checked == true)
        {
            data.Add("customerpayment", rbyespayment.Text);
        }
        else if (rbnopayment.Checked == true)
        {
            data.Add("customerpayment", rbnopayment.Text);
        }
        else
        {
            data.Add("customerpayment", "");
        }

        data.Add("assetid", txtassetid.Text);

            data.Add("ticket_status", cbstatus.SelectedValue );
        
       



        bll empcomup = new bll();
        empcomup.updempcomp(data);

        string str4;
        str4 = Request.QueryString["Ticketid"];
        int id = Convert.ToInt32(str4);

        if (cbstatus.SelectedValue.ToString() == "Close")
        {
            Hashtable feedmail = new Hashtable();

            bll fm = new bll();
            feedmail = fm.feedbackmail(id);
            System.Web.Mail.MailMessage mail = new System.Web.Mail.MailMessage();
            mail.From = "cms.iflcm@gmail.com";
            mail.To = feedmail["emailid"].ToString();
            mail.Subject = "Feedback";
            mail.BodyFormat = System.Web.Mail.MailFormat.Html;
            mail.Body = "<html><body><br><br>Dear Client,<br><br>IFLCM would like to invite you to participate in a survey to tell us about your experiences with IFLCM.<br><br> The survey will take about 5 minutes to complete and can be accessed by clicking on the link below.<br><br>" + feedmail["body"].ToString() + " <br><br>Your feedback is very important, as the results of this survey will help us develop and offer better  services to you, and other clients in the future.   <br><br>Thank you in advance for your participation!   <br><br>  Please note: all of your answers are completely anonymous and confidential.<br><br> <br> Sincerely,<br> IFLCM Team </body></html>";
            System.Web.Mail.SmtpMail.SmtpServer = "smtp.gmail.com";
            //System.Web.Mail.SmtpMail.SmtpServer = "smtp.mail.yahoo.com";
            mail.Fields.Add("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate", "1");
            mail.Fields.Add("http://schemas.microsoft.com/cdo/configuration/sendusername", "cms.iflcm@gmail.com");
            mail.Fields.Add("http://schemas.microsoft.com/cdo/configuration/sendpassword", "cmsiflcm");
            // - smtp.gmail.com use port 465 or 587
            mail.Fields.Add("http://schemas.microsoft.com/cdo/configuration/smtpserverport", "465");
            //mail.Fields.Add("http://schemas.microsoft.com/cdo/configuration/smtpserverport", "25");
            mail.Fields.Add("http://schemas.microsoft.com/cdo/configuration/smtpusessl", "true");
            try
            {
                //System.Web.Mail.Send(mail);
                System.Web.Mail.SmtpMail.Send(mail);
                // Response.Write("Mail is Sent..!!");
            }
            catch (Exception ex)
            {
                //return ex.Message;
                //  Response.Write("Error - " + ex.Message);
            }
        } 
        lblupmess.Text = "Successfully Updated";

    }
    protected void lbadditionalfield_Click(object sender, EventArgs e)
    {

    }
    protected void cbstatushelp_SelectedIndexChanged(object sender, EventArgs e)
    {
        string str4;
        str4 = Request.QueryString["Ticketid"];
        int id = Convert.ToInt32(str4);
       
        Hashtable data = new Hashtable();
        data.Add("ticket_status", cbstatushelp.SelectedValue);
        data.Add("ticket_id", id);
        bll statusup = new bll();
        statusup.upcomphelp(data);

        if (cbstatushelp.SelectedValue.ToString() == "Close")
        {
            Hashtable feedmail = new Hashtable();

            bll fm = new bll();
            feedmail = fm.feedbackmail(id);
            System.Web.Mail.MailMessage mail = new System.Web.Mail.MailMessage();
            mail.From = "cms.iflcm@gmail.com";
            mail.To = feedmail["emailid"].ToString();
            mail.Subject = "Feedback";
            mail.BodyFormat = System.Web.Mail.MailFormat.Html;
            mail.Body = "<html><body><br><br>Dear Client,<br><br>IFLCM would like to invite you to participate in a survey to tell us about your experiences with IFLCM.<br><br> The survey will take about 5 minutes to complete and can be accessed by clicking on the link below.<br><br>" + feedmail["body"].ToString() + " <br><br>Your feedback is very important, as the results of this survey will help us develop and offer better  services to you, and other clients in the future.   <br><br>Thank you in advance for your participation!   <br><br>  Please note: all of your answers are completely anonymous and confidential.<br><br> <br> Sincerely,<br> IFLCM Team </body></html>";
            System.Web.Mail.SmtpMail.SmtpServer = "smtp.gmail.com";
            //System.Web.Mail.SmtpMail.SmtpServer = "smtp.mail.yahoo.com";
            mail.Fields.Add("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate", "1");
            mail.Fields.Add("http://schemas.microsoft.com/cdo/configuration/sendusername", "cms.iflcm@gmail.com");
            mail.Fields.Add("http://schemas.microsoft.com/cdo/configuration/sendpassword", "cmsiflcm");
            // - smtp.gmail.com use port 465 or 587
            mail.Fields.Add("http://schemas.microsoft.com/cdo/configuration/smtpserverport", "465");
            //mail.Fields.Add("http://schemas.microsoft.com/cdo/configuration/smtpserverport", "25");
            mail.Fields.Add("http://schemas.microsoft.com/cdo/configuration/smtpusessl", "true");
            try
            {
                //System.Web.Mail.Send(mail);
                System.Web.Mail.SmtpMail.Send(mail);
                // Response.Write("Mail is Sent..!!");
            }
            catch (Exception ex)
            {
                //return ex.Message;
                //  Response.Write("Error - " + ex.Message);
            }
        }
    }
    protected void cbstatus_SelectedIndexChanged(object sender, EventArgs e)
    {
        string str4;
        str4 = Request.QueryString["Ticketid"];
        int id = Convert.ToInt32(str4);    
        Hashtable data = new Hashtable();
        data.Add("ticket_status", cbstatus.SelectedValue);
        data.Add("ticket_id", id);
        //Hashtable feedmail = new Hashtable();
        bll statusup = new bll();
       //feedmail =
           statusup.upcomphelp(data);
    }


    protected void rbyespart_CheckedChanged(object sender, EventArgs e)
    {
        if (rbyespart.Checked == true)
        {
            lbyespar.Visible = true;
            lbnopart.Visible = false;
            if (Session["designation"].ToString() == "Shift engg")
            {
                lbyespar.Visible = true;
                lbnopart.Visible = false;
            }
            Hashtable data4 = new Hashtable();
            data4.Add("ticket_id", txtticketid.Text );
            data4.Add("ticket_status", "Escalate to shift engineer");
            cbstatus.SelectedValue = "Escalate to shift engineer";
            bll comphelp = new bll();
            comphelp.upcomphelp(data4);
        }
    }
    protected void rbnopart_CheckedChanged(object sender, EventArgs e)
    {
        if (rbnopart.Checked == true)
        {
            //lbnopart.Visible = true;
            //lbyespar.Visible = false ;
            if (Session["designation"] == "Head")
            {
                lbnopart.Visible = true;
                lbyespar.Visible = false;
            }
            //lbnopart.Visible = true;
            //lbyespar.Visible = false ;

            Hashtable data4 = new Hashtable();
            data4.Add("ticket_id", txtticketid.Text );
            data4.Add("ticket_status", "Escalate to Head");
            cbstatus.SelectedValue = "Escalate to Head";
            bll comphelp = new bll();
            comphelp.upcomphelp(data4);
        }

    }
    protected void lbyespar_Click(object sender, EventArgs e)
    {

        Hashtable data = new Hashtable();

        data.Add("update", "none");
        data.Add("ticket_id", txtticketid.Text);
        data.Add("designation", Session["designation"].ToString());
        data.Add("probtype", txtprobtype.Text);
        data.Add("probsubtype", txtprobsubtype.Text);
        data.Add("docomplain", txtdocomplain.Text);
        data.Add("dorepair", txtdorepair.Text);
        data.Add("priority", txtpriority.Text);
        data.Add("eta", txteta.Text);
        data.Add("ata", txtata.Text);
        data.Add("atc", txtatc.Text);
        data.Add("others", txtotherdesc.Text);
        data.Add("taskdesc", txttastdesc.Text);

        data.Add("labourcost", txtlabourcost.Text);
        data.Add("additionalcost", txtaddcost.Text);
        data.Add("partscost", txtpartcost.Text);
        data.Add("total", txttotal.Text);
        data.Add("tax", txttax.Text);
        data.Add("grandtotal", txtgrandtotal.Text);

        data.Add("workdonehead", txtwrkdnehead.Text);
        data.Add("workdoneshift", txtwrkdneshift.Text);
        data.Add("workdonetechnician", txtwrkdnetech.Text);
        if (rbnopart.Checked == true)
        {
            data.Add("partsrequired", rbnopart.Text);
        }
        else if (rbyespart.Checked == true)
        {
            data.Add("partsrequired", rbyespart.Text);
        }
        else
        {
            data.Add("partsrequired", "");
        }
        data.Add("partsdesc", txtpartdesc.Text);

        if (rbyespayment.Checked == true)
        {
            data.Add("customerpayment", rbyespayment.Text);
        }
        else if (rbnopayment.Checked == true)
        {
            data.Add("customerpayment", rbnopayment.Text);
        }
        else
        {
            data.Add("customerpayment", "");
        }
 
        
        data.Add("ticket_status", cbstatus.SelectedValue);
        
       


        bll empcomup = new bll();
        empcomup.updempcomp(data);
        Session["compid"] = txtticketid.Text;
        Response.Redirect("partreplacement.aspx");
       
    }
    protected void lbnopart_Click(object sender, EventArgs e)
    {

        Hashtable data = new Hashtable();

        data.Add("update", "none");
        data.Add("ticket_id", txtticketid.Text);
        data.Add("designation", Session["designation"].ToString());
        data.Add("probtype", txtprobtype.Text);
        data.Add("probsubtype", txtprobsubtype.Text);
        data.Add("docomplain", txtdocomplain.Text);
        data.Add("dorepair", txtdorepair.Text);
        data.Add("priority", txtpriority.Text);
        data.Add("eta", txteta.Text);
        data.Add("ata", txtata.Text);
        data.Add("atc", txtatc.Text);
        data.Add("others", txtotherdesc.Text);
        data.Add("taskdesc", txttastdesc.Text);

        data.Add("labourcost", txtlabourcost.Text);
        data.Add("additionalcost", txtaddcost.Text);
        data.Add("partscost", txtpartcost.Text);
        data.Add("total", txttotal.Text);
        data.Add("tax", txttax.Text);
        data.Add("grandtotal", txtgrandtotal.Text);

        data.Add("workdonehead", txtwrkdnehead.Text);
        data.Add("workdoneshift", txtwrkdneshift.Text);
        data.Add("workdonetechnician", txtwrkdnetech.Text);
        if (rbnopart.Checked == true)
        {
            data.Add("partsrequired", rbnopart.Text);
        }
        else if (rbyespart.Checked == true)
        {
            data.Add("partsrequired", rbyespart.Text);
        }
        else
        {
            data.Add("partsrequired", "");
        }
        data.Add("partsdesc", txtpartdesc.Text);

        if (rbyespayment.Checked == true)
        {
            data.Add("customerpayment", rbyespayment.Text);
        }
        else if (rbnopayment.Checked == true)
        {
            data.Add("customerpayment", rbnopayment.Text);
        }
        else
        {
            data.Add("customerpayment", "");
        }



        
        data.Add("ticket_status", cbstatus.SelectedValue);
        
        

        bll empcomup = new bll();
        empcomup.updempcomp(data);
        Session ["compid"] = txtticketid.Text;
        Response.Redirect("AMC.aspx");
        
    }
    protected void txtlabourcost_TextChanged(object sender, EventArgs e)
    {
        int lc = 0, ac = 0, pc = 0, total = 0; 
          double   gt,tax = 0;
        if (txtlabourcost.Text != "")
        {
            lc = Convert.ToInt32(txtlabourcost.Text);
        }
        if (txtaddcost.Text != "")
        {
            ac = Convert.ToInt32(txtaddcost.Text);
        }
        if (txtpartcost.Text != "")
        {
            pc = Convert.ToInt32(txtpartcost.Text);
        }
        total = lc + pc + ac;
        txttotal.Text = total.ToString();
        tax = total * 0.1;

        txttax.Text = tax.ToString();
        gt = tax + total;
        txtgrandtotal.Text = gt.ToString();
    }
    protected void txtaddcost_TextChanged(object sender, EventArgs e)
    {
        int lc = 0, ac = 0, pc = 0, total = 0;
        double tax=0,gt = 0;
        if (txtlabourcost.Text != "")
        {
            lc = Convert.ToInt32(txtlabourcost.Text);
        }
        if (txtaddcost.Text != "")
        {
            ac = Convert.ToInt32(txtaddcost.Text);
        }
        if (txtpartcost.Text != "")
        {
            pc = Convert.ToInt32(txtpartcost.Text);
        }
        total = lc + pc + ac;
        txttotal.Text = total.ToString();
        tax = total * 0.1;

        txttax.Text = tax.ToString();
        gt = tax + total;
        txtgrandtotal.Text = gt.ToString();
    }
    protected void txtpartcost_TextChanged(object sender, EventArgs e)
    {
        int lc = 0, ac = 0, pc = 0, total = 0;
        double gt,tax = 0;
        if (txtlabourcost.Text != "")
        {
            lc = Convert.ToInt32(txtlabourcost.Text);
        }
        if (txtaddcost.Text != "")
        {
            ac = Convert.ToInt32(txtaddcost.Text);
        }
        if (txtpartcost.Text != "")
        {
            pc = Convert.ToInt32(txtpartcost.Text);
        }
        total = lc + pc + ac;
        txttotal.Text = total.ToString();
        tax = total * 0.1;

        txttax.Text = tax.ToString();
        gt = tax + total;
        txtgrandtotal.Text = gt.ToString();
    }
}
