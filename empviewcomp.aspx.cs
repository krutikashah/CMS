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
public partial class empviewcomp : System.Web.UI.Page
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
        if ((Session["designation"].ToString() == "Help desk personnel"))
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
        
        if (IsPostBack)
        {
            UpdatePanel2.Visible = true;

            if (Session["forcomplain"].ToString() =="yes")
            {
                string str2;
                str2 = Request.QueryString["Empid"];
                int id2 = Convert.ToInt32(str2);

                string str3;
                str3 = Request.QueryString["empname"];
                //int id3 = Convert.ToInt32(str3);

               
                if (Session["employee"].ToString() == "Shift engg")
                {
                    lblnameshift.Text = str3;
                }
                else if (Session["employee"].ToString() == "Technician")
                {
                    lblnametech.Text = str3;
                }
                if (Session["designation"].ToString() == "Head")
                {
                   //Session["query"] = "select ticket_id, taskdesc, client_id,emp_technician,emp_shift,docomplain,probtype,priority,ticket_status from complain where emp_head='" + Session["empid"] + "' ";
                    lbshift.Enabled = true;
                    lbtech.Enabled = false;

                }
                else if (Session["designation"].ToString() == "Shift engg")
                {
                  //  Session["query"] = "select ticket_id, taskdesc, client_id,emp_technician,emp_shift,docomplain,probtype,priority,ticket_status from complain where emp_shift='" + Session["empid"] + "'  ";
                    lbtech.Enabled = true;
                    lbshift.Enabled = false;
                }
           

            }
                string str;
                str = Request.QueryString["Ticketid"];
                int id = Convert.ToInt32(str);
                string str1;
                str1 = Request.QueryString["clientname"];
               if (txtticketid.Text != "")
               {
                   Session["ticketid"] = id;
               }
               else
               {
                   Session["ticketid"] = 0;
               }
               if (txtclientname.Text == "")
               {
                   Session["clientid"] = 0;
               }
              
       }
        if (!IsPostBack)
        {
            if (Session["designation"].ToString () == "Head")
            {
                Session["query"] = "select ticket_id, taskdesc, client_id,emp_technician,emp_shift,docomplain,probtype,priority,ticket_status from complain where emp_head='" + Session["empid"] + "' ";
                //lbshift.Enabled = true;
                //lbtech.Enabled = false;

            }
            else if (Session["designation"].ToString () == "Shift engg")
            {
                Session["query"] = "select ticket_id, taskdesc, client_id,emp_technician,emp_shift,docomplain,probtype,priority,ticket_status from complain where emp_shift='" + Session["empid"] + "'  ";
                //lbtech.Enabled = true;
                //lbshift.Enabled = false;
            }
            Session["forcomplain"] = "no";
            Session["employee"] = "on";
        }
    }
    protected void cbclientname_SelectedIndexChanged(object sender, EventArgs e)
    {

        string str1;
        str1 = Session["query"].ToString();
        str1+="AND client_id='"+cbclientname .SelectedValue +"' " ;
        Session["query"] = str1;
        UpdatePanel2.Visible = false;
    }
    protected void txtdob_TextChanged(object sender, EventArgs e)
    {
        string str1;
        str1 = Session["query"].ToString();
        str1 += "AND docomplain BETWEEN '" + txtdob.Text + "' AND '" + txtdob.Text + " 23:59:59.997' ";
        Session["query"] = str1;
        UpdatePanel2.Visible = false;
    }
    protected void cbtype_SelectedIndexChanged(object sender, EventArgs e)
    {
        string str1;
        str1 = Session["query"].ToString();
        str1 += "AND probtype'" + cbtype .SelectedValue  + "' ";
        Session["query"] = str1;
        UpdatePanel2.Visible = false;

    }
    protected void btnsearch_Click(object sender, EventArgs e)
    {
        bll clconn = new bll();
        DataTable dt = new DataTable();
        dt = clconn.connection(Session["query"].ToString());
        if (dt != null)
        {
            GridView1.DataSource = dt;
            GridView1.DataBind();

        }
        else
        {
            lblresult.Text = "There is no such complain registered.";
            
        }
        UpdatePanel2.Visible = false;
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        
        
            string str;
            str = Request.QueryString["Ticketid"];
            int id = Convert.ToInt32(str);
            string str1;
            str1 = Request.QueryString["clientname"];
            txtticketid.Text = id.ToString();
            txtclientname.Text = str1;
            Hashtable data = new Hashtable();
            bll clemp = new bll();
            data=clemp.selcomp(id);

            txtprobtype.Text = data["probtype"].ToString();
            txtprobsubtype.Text  = data["probsubtype"].ToString();
            txtdocomplain.Text  = data["docomplain"].ToString();
            txtdorepair.Text  = data["dorepair"].ToString();
            txtpriority.Text  = data["priority"].ToString();
            cbstatus .SelectedValue= data["ticket_status"].ToString();
            txteta.Text = data["eta"].ToString();
            txtata.Text = data["ata"].ToString();
            txtatc.Text = data["atc"].ToString();
            txtotherdesc.Text = data["others"].ToString();
            txttastdesc.Text= data["taskdesc"].ToString();
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
            lblnaemempreg.Text = data["emp_reg"].ToString();
            lblnamehead.Text = data["emp_head"].ToString();
            lblnameshift .Text =data ["emp_shift"].ToString ();
            lblnametech.Text = data["emp_technician"].ToString();
            txtassetid.Text = data["assetid"].ToString();
            Session["assetid"] = txtassetid.Text;
            Session["emp_technician"] = data["emp_technician"].ToString();
            Session["emp_shift"] = data["emp_shift"].ToString();
            if (data["partsrequired"].ToString() == "Yes")
            {
                rbyespart.Checked=true ;
            }
            else if(data["partsrequired"].ToString() == "No")
            {
                rbnopart.Checked=true ;
            }
            if (data["customerpayment"].ToString() == "Yes")
            {
                rbyespayment.Checked=true ;

            }
            else if (data["customerpayment"].ToString() == "No")
            {
                rbnopayment.Checked=true ;
            }
            if (data["emp_shift"].ToString() == "" && Session ["designation"].ToString ()=="Head")
            {
                lbshift.Enabled =true ;
                lbtech.Enabled = false ;
            }
            else if (data["emp_shift"].ToString() != "" && Session["designation"].ToString() == "Head")
            {
                lbshift.Enabled = true;
                lbtech.Enabled = false ;
            }

            if (data["emp_technician"].ToString() == "" && Session["designation"].ToString() == "Shift engg")
            {
                lbshift.Enabled = false ;
                lbtech.Enabled = true ;
            }
            else if (data["emp_technician"].ToString() != "" && Session["designation"].ToString() == "Shift engg")
            {
                lbshift.Enabled =false ;
                lbtech.Enabled = true ;
            }

            //if (data["emp_technician"].ToString() != "")
            //{
            //    lbtech.Enabled = false;
            //}
            //else
            //{
            //    lbtech.Enabled = true;
               
            //}


            if (Session["designation"].ToString () == "Head")
            {
                txtwrkdnehead.Enabled = true;
                lblwrkhead.Enabled = true;
                txtwrkdneshift.Enabled = false ;
                lblworkshift.Enabled = false ;
                txtwrkdnetech.Enabled = false ;
                lblwrktech.Enabled = false;
            }
        else if (Session["designation"].ToString () == "Shift engg")
            {
                txtwrkdneshift.Enabled = true;
                lblworkshift.Enabled = true;
                txtwrkdnetech.Enabled = true;
                lblwrktech.Enabled = true;
                txtwrkdnehead.Enabled = false ;
                lblwrkhead.Enabled = false ;

            }


            UpdatePanel2.Visible = true;
            PlaceHolder1.Visible = false;
            Session["clientid"] = data["client_id"];


    }

    protected void lbadditionalfield_Click(object sender, EventArgs e)
    {
        PlaceHolder1.Visible = true;
    }
    protected void lbshift_Click(object sender, EventArgs e)
    {

        Session["forcomplain"] = "yes";
        Session["employee"] = "Shift engg";
        
    }
    protected void lbtech_Click(object sender, EventArgs e)
    {
        Session["forcomplain"] = "yes";
        Session["employee"] = "Technician";
    }
    protected void btnupd_Click(object sender, EventArgs e)
    {
        Hashtable data = new Hashtable();
        string str2;
        str2 = Request.QueryString["Empid"];
        int id2 = Convert.ToInt32(str2);
        if (id2 != 0)
        {
            if (Session["designation"].ToString() == "Shift engg")
            {
                data.Add("emp_technician", id2);
                data.Add("update", "technician");
                cbstatus.SelectedItem.Text = "Escalate to Help Desk";
                Hashtable data2= new Hashtable();
                data2.Add("ticket_id", txtticketid.Text);
                data2.Add("desc","inform teachnician that new task has been assigned to him for '"+txtclientname.Text+"' and task description is '"+txttastdesc.Text +"' ");
                data2.Add("pk",id2);
                data2.Add("dbname", "employee");
                bll helptakt = new bll();
                helptakt.inshelptas(data2);
            }
            else if (Session["designation"].ToString() == "Head")
            {
                data.Add("emp_shift", id2);
                data.Add("update", "shift");
            }
        }
        else
        {
            data.Add("update", "none");
        }

              data.Add("ticket_id", txtticketid.Text);
              data.Add("designation", Session["designation"].ToString());
              data.Add("probtype" , txtprobtype.Text);
              data.Add( "probsubtype",txtprobsubtype.Text);  
              data.Add( "docomplain",txtdocomplain.Text);    
              data.Add("dorepair" ,txtdorepair.Text);  
              data.Add("priority" , txtpriority.Text);
              data.Add( "ticket_status",cbstatus.SelectedValue );
              data.Add("eta" , txteta.Text);
              data.Add( "ata", txtata.Text);
              data.Add("atc" , txtatc.Text);
              data.Add("others" , txtotherdesc.Text);
              data.Add("taskdesc" ,txttastdesc.Text);
              
              data.Add("labourcost" ,txtlabourcost.Text);
              data.Add( "additionalcost",txtaddcost.Text);
              data.Add( "partscost", txtpartcost.Text);
              data.Add( "total",txttotal.Text);
              data.Add("tax" ,txttax.Text );
              data.Add("grandtotal" , txtgrandtotal.Text);
              data.Add("assetid", txtassetid.Text);
            
              data.Add("workdonehead" , txtwrkdnehead.Text);
              data.Add( "workdoneshift",txtwrkdneshift.Text);
              data.Add( "workdonetechnician",txtwrkdnetech.Text);
        if(rbnopart.Checked ==true )
        {
              data.Add( "partsrequired", rbnopart .Text );
        }
        else if (rbyespart.Checked == true)
        {
            data.Add("partsrequired", rbyespart.Text);
        }
        else
        {
            data.Add("partsrequired", "");
        }
        data.Add ("partsdesc",txtpartdesc .Text );
        
        if(rbyespayment .Checked ==true )
        {
            data.Add ("customerpayment",rbyespayment .Text );
        }
        else if (rbnopayment.Checked == true)
        {
            data.Add("customerpayment", rbnopayment.Text);
        }
        else
        {
            data.Add("customerpayment", "");
        }


       
        bll empcomup = new bll();
        empcomup.updempcomp(data);

        
        string empid;
        empid = Request.QueryString["Empid"];
        int eid = Convert.ToInt32(empid);
        if (eid != 0)
        {
            bll count = new bll();
            count.empcount(Convert.ToInt32(empid));
        }

        int id = Convert.ToInt32(txtticketid.Text );

       
        lblupmess.Text = "Successfully Updated";
       
         
        
    }
    protected void LinkButton1_Click1(object sender, EventArgs e)
    {

    }
   
    protected void LinkButton1_Click2(object sender, EventArgs e)
    {

    }
    protected void txtlabourcost_TextChanged(object sender, EventArgs e)
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
    protected void txtaddcost_TextChanged(object sender, EventArgs e)
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
