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

public partial class vendor3up : System.Web.UI.Page
{
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
            Response .Redirect ("CmsHome1.aspx");
        }
        if (IsPostBack)
        {
            string str;
            str = Request.QueryString["vdid"];
            int id = Convert.ToInt32(str);
        }
        lblupvendor3.Text = "";
    }
 
   
    protected void LinkButton1_Click1(object sender, EventArgs e)
    {
        string str;
        str = Request.QueryString["vdid"];
        int id = Convert.ToInt32(str);
        bll selview = new bll();
        Hashtable data = new Hashtable();
        data = selview.sel3vendorbyid(id);
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
        btnupdate.Visible = true;
        btndel.Visible = true;
        btndel0.Visible = true;
    }
    protected void btnupdate_Click(object sender, EventArgs e)
    {
        Hashtable data = new Hashtable();
        data.Add("cmpname",txtcmpname.Text );
        data.Add("vendorid", txtvendorid.Text);
        data.Add("adrs", txtadrs.Text);
        data.Add("phoneno", txtphoneno.Text);
        data.Add("emailid", txtemailid.Text);
        data.Add("servingarea", txtservingarea.Text);
        data.Add("p1name", txtname1.Text);
        data.Add("p1phoneno", txtphoneno1.Text);
        data.Add("p1desc", txtdesc1.Text);
        data.Add("p2name", txtname2.Text);
        if (txtname2.Text != "")
        {
            data.Add("p2phoneno", txtphoneno2.Text);

        }
        data.Add("p2desc", txtdesc2.Text);
        data.Add("p3name", txtname3.Text);
        if (txtname3.Text != "")
        {
            data.Add("p3phoneno", txtphoneno3.Text);

        }
        data.Add("p3desc", txtdesc3.Text);
        bll upven = new bll();
        upven.up3vendor(data);
        lblupvendor3.Text = "Details Successfully Updated";
    }
    protected void btndel_Click(object sender, EventArgs e)
    {
        string str;
        str = Request.QueryString["vdid"];
        int id = Convert.ToInt32(str);
        bll cldelthird = new bll();
        cldelthird.delthirdvendor(id);
        Response.Redirect("vendor3up.aspx");
    }
    protected void btndel0_Click(object sender, EventArgs e)
    {
        Response.Redirect("vendor3up.aspx");
    }
}
