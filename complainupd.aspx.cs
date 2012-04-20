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
using System.Drawing;
using System.Reflection;

public partial class complainupd : System.Web.UI.Page
{
    int k = 0;
    string commaDelimited;
    string[] d = new string[40];
    private TextBox[] dynamicTextBoxes;
    private AjaxControlToolkit.ComboBox[] dynamiccombobox;
    public int combosel;
    protected AjaxControlToolkit.ComboBox cb;
    protected System.Web.UI.WebControls.Label lbl;
    protected void Page_PreInit(object sender, EventArgs e)
    {
        Control myControl = GetPostBackControl(this.Page);
        //if (IsPostBack)
        //{
        //    string str;
        //    str = txtticketid.Text;
        //    int id = Convert.ToInt32(str);

        //}
    }

    protected override void OnInit(EventArgs e)
    {
       base.OnInit(e);
      


       
        int id = Convert.ToInt32(Session["ticketid"]);
      int id1;
        id1 = Convert.ToInt32(Session["clientid"]);

        Hashtable dataforvalue = new Hashtable();
        bll compview = new bll();
        //if (id == 0)
        //{
        //    dataforvalue = compview.selcomp(6);
        //}
        if (id != 0)
        {
            dataforvalue = compview.selcomp(id);

            commaDelimited = dataforvalue["fullstring"].ToString();


            string[] year = commaDelimited.Split(new char[] { ',' });
            foreach (string month in year)
            {
                d[k] = month;
                k++;
            }

            int a = id1;
            bll noof = new bll();
            int w, z, tn, cn, tc = 0, cc = 0;
            Hashtable datano = new Hashtable();
            datano = noof.noofrows(a);
            w = Convert.ToInt32(datano["noofrows"]);
            tn = Convert.ToInt32(datano["nooftxt"]);
            cn = Convert.ToInt32(datano["noofcb"]);
            dynamicTextBoxes = new TextBox[tn];
            dynamiccombobox = new AjaxControlToolkit.ComboBox[cn];
            Table tbl = new Table();
            for (z = 0; z < w; z++)
            {
                bll cuscontrol = new bll();
                Hashtable data = new Hashtable();
                data = cuscontrol.ccomp(a, z);

                TableRow tr = new TableRow();
                TableCell td0 = new TableCell();
                tr.CssClass = "table_tr";
                TableCell td1 = new TableCell();
                int field = Convert.ToInt32(data["id"]);

                if (data["control"].ToString() == "Combobox")
                {
                    Response.Write(System.Environment.NewLine);
                    lbl = new System.Web.UI.WebControls.Label();
                    lbl.ID = (2 * z).ToString();

                    lbl.Text = data["label"].ToString();
                    lbl.CssClass = "ajxtxt";

                    td0.Controls.Add(lbl);
                    cb = new AjaxControlToolkit.ComboBox();
                    cb.ID = (2 * z + 1).ToString();
                    cb.Enabled = false;
                    cb.CssClass = "ajxtxt";
                    cb.ForeColor = Color.Black;
                    dynamiccombobox[cc] = cb;
                    cc++;
                    td1.Controls.Add(cb);

                    if (data["value"].ToString() == "get")
                    {
                        string q = data["dbname"].ToString();
                        bll reff = new bll();

                        Type t = reff.GetType();


                        Type[] paramTypes = new Type[1];
                        paramTypes[0] = Type.GetType("System.Int32");


                        MethodInfo CosineInfo = t.GetMethod(q, paramTypes);

                        Object[] parameters = new Object[1];
                        parameters[0] = a;
                        Object returnVal = CosineInfo.Invoke(reff, parameters);



                        string commaDelimited1 = returnVal.ToString();
                        string[] year1 = commaDelimited1.Split(new char[] { ',' });
                        foreach (string month1 in year1)
                        {
                            cb.Items.Add(month1);
                        }
                        cb.SelectedItem.Text = d[2 * z + 1];

                    }
                    else
                    {
                        string returnVal = data["value"].ToString();



                        string commaDelimited2 = returnVal.ToString();
                        string[] year2 = commaDelimited2.Split(new char[] { ',' });
                        foreach (string month2 in year2)
                        {
                            cb.Items.Add(month2);

                        }
                        cb.SelectedItem.Text = d[2 * z + 1];
                    }
                    tr.Cells.Add(td0);
                    tr.Cells.Add(td1);
                    tbl.Rows.Add(tr);
                }


                else
                {
                    int y = 10;
                    lbl = new System.Web.UI.WebControls.Label();
                    lbl.ID = (2 * z).ToString();
                    lbl.Text = data["label"].ToString();

                    lbl.CssClass = "ajxtxt";

                    td0.Controls.Add(lbl);
                    TextBox txt = new TextBox();
                    txt.ID = (2 * z + 1).ToString();
                    // txt.Text = data["value"].ToString();
                    txt.Enabled = false;
                    txt.CssClass = "ajxtxt";
                    txt.Text = d[2 * z + 1];
                    td1.Controls.Add(txt);
                    dynamicTextBoxes[tc] = txt;
                    tc++;
                }
                tr.Cells.Add(td0);
                tr.Cells.Add(td1);
                tbl.Rows.Add(tr);
            }
            PlaceHolder1.Controls.Add(tbl);


        }
    }
    public static Control GetPostBackControl(Page thePage)
    {
        Control myControl = null;
        string ctrlName = thePage.Request.Params.Get("__EVENTTARGET");
        if (((ctrlName != null) & (ctrlName != string.Empty)))
        {
            myControl = thePage.FindControl(ctrlName);
        }
        else
        {
            foreach (string Item in thePage.Request.Form)
            {
                Control c = thePage.FindControl(Item);
                if (((c) is System.Web.UI.WebControls.Button))
                {
                    myControl = c;
                }
            }

        }
        return myControl;
    }

   


    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Session["designation"].ToString() != "Help desk personnel"))
        {
            Response.Redirect("access.aspx");
        }
     
        try
        {

            if ((Session["designation"].ToString() == "aa"))
            {
                Response.Redirect("access.aspx");
            }
        }
        catch
        {
            Response.Redirect("CmsHome1.aspx");
        }
        if (!IsPostBack)
        {
            TabContainer1.ActiveTabIndex = 0;
        }

        if (IsPostBack)
        {
           
            if (txtticketid.Text != "")
            {
                Session["ticketid"] = txtticketid.Text;
            }
            else
            {
                Session["ticketid"] = 0;
            }
            if (txtclientname.Text != "")
            {
                Session["clientid"] = txtclientname.Text;
            }
            else
            {
                Session["clientid"] = 0;
            }
        }
    }





    
  
    protected void Button1_Click1(object sender, EventArgs e)
    {
        int id = Convert.ToInt32(txtticketid.Text);
        Hashtable data = new Hashtable();
        bll compview = new bll();
        data = compview.selcomp(id);



        txtticket_id .Text = data["ticket_id"].ToString();
        txtclientname.Text = data["client_id"].ToString();
        txtcustomername.Text = data["cc_id"].ToString();
        txtempreg.Text = data["emp_reg"].ToString();
        txtdoc.Text = data["docomplain"].ToString();
        //txtempassigned.Text = data["emp_assess"].ToString();
        txtprobtype.Text = data["probtype"].ToString();
        txtprobsubtype.Text = data["probsubtype"].ToString();
        txtpriority.Text = data["priority"].ToString();
        cbstatus.SelectedItem.Text = data["ticket_status"].ToString();
        txtdorepair.Text = data["dorepair"].ToString();
        txtxtaskdesc.Text = data["taskdesc"].ToString();
        txtothers.Text = data["others"].ToString();
        txtassetid.Text = data["assetid"].ToString();



        commaDelimited = data["fullstring"].ToString();


        string[] year = commaDelimited.Split(new char[] { ',' });
        foreach (string month in year)
        {
            d[k] = month;
            k++;
        }

        TabContainer1.Visible = true;     
      
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Hashtable data = new Hashtable();
        data.Add("ticket_id", txtticket_id.Text);
       
        data.Add("taskdesc", txtxtaskdesc.Text);
        
        data.Add("ticket_status", cbstatus.SelectedItem.Text);
        
       data.Add("workdonetechnician",txtworkdonetech.Text);
        data.Add("others", txtothers.Text);
        data.Add("dorepair", txtdorepair.Text);
        data.Add("assetid", txtassetid.Text);
        bll clupd = new bll();
        clupd.compupd(data);
        int id = Convert.ToInt32(txtticket_id.Text);

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
        Label23.Text = "Successfully Updated";

    }
    protected void cbstatus_SelectedIndexChanged(object sender, EventArgs e)
    {

        int id = Convert.ToInt32(txtticket_id.Text);

       
        
        Hashtable data = new Hashtable();
        data.Add("ticket_status", cbstatus.SelectedValue);
        data.Add("ticket_id", id);
        //Hashtable feedmail = new Hashtable();
        bll statusup = new bll();
        //feedmail = 
            statusup.upcomphelp(data);
    }
}
