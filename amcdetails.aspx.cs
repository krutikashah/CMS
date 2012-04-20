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

public partial class amcdetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string str4;
        str4 = Request.QueryString["mfg"];
         string mfg = (str4).ToString();
        string str5;
        str5 = Request.QueryString["clientid"];
        int id = Convert.ToInt32 ( str5 );
        int v;
        bll man = new bll();
        v=man.vendorid(mfg);


        bll clsel = new bll();

        Hashtable insertdata = new Hashtable();
        insertdata = clsel.selclientdet(id);

        txtorgnameup.Text = insertdata["org_name"].ToString();
        txtadrsup.Text = insertdata["address"].ToString();
        txtemaildidup.Text = insertdata["emailid"].ToString();
        txtorgtypeup.Text = insertdata["orgtype"].ToString();
        txtphonenoup.Text = insertdata["phoneno"].ToString();
       
        bll selview = new bll();
        Hashtable data = new Hashtable();
        data = selview.sel3vendorbyid(v);
        txtvendorid.Text = data["vendorid"].ToString();
        txtcmpname.Text = data["cmpname"].ToString();
        txtadrs.Text = data["adrs"].ToString();
        txtphoneno.Text = data["phoneno"].ToString();
        txtemailid.Text = data["emailid"].ToString();
        txtservingarea.Text = data["servingarea"].ToString();
        txtname1.Text = data["p1name"].ToString();
        txtphoneno1.Text = data["p1phoneno"].ToString();
        txtdesc1.Text = data["p1desc"].ToString();
        txtname2.Text = data["p2name"].ToString();
        if ((data["p2name"].ToString()) != "")
        {
            txtphoneno2.Text = data["p2phoneno"].ToString();

        }
        txtdesc2.Text = data["p2desc"].ToString();
        txtname3.Text = data["p3name"].ToString();
        if ((data["p3name"].ToString()) != "")
        {
            txtphoneno3.Text = data["p3phoneno"].ToString();

        }
        txtdesc3.Text = data["p3desc"].ToString();
        TabContainer1.Visible = true;
        
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string str5;
        str5 = Request.QueryString["eqpid"];
        int id = Convert.ToInt32(str5);
        
        bll calamcnotify = new bll();
        calamcnotify.amcnotify(id);
        Label7.Text = "Successfully Notified";
    }
}
