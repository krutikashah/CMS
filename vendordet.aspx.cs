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

public partial class vendordet : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //string str;
        //str = Session["id"].ToString();
        int id = Convert.ToInt32(Session["id"]);
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
    }
}
