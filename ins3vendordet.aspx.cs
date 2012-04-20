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
using ins3vendordetdsTableAdapters;
using bllnamespace;

public partial class ins3vendordet : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)

    {
        if ((Session["designation"].ToString() != "Help desk personnel"))
        {
            Response.Redirect("access.aspx");
        }
        try {
     
        if ((Session["designation"].ToString() == "H"))
        {
            Response.Redirect("access.aspx");
        }
    }
        catch 
        {
            Response.Redirect("CmsHome1.aspx");
        }

    }
    protected void btninsert_Click(object sender, EventArgs e)
    {
        Hashtable data = new Hashtable();
        data.Add("cmpname", txtcmpname.Text);
        data.Add("adrs", txtadrs.Text);
        data.Add("phoneno", txtphoneno.Text);
        data.Add("emailid", txtemailid.Text );
        data.Add("servingarea", txtservingarea.Text);
        data.Add("p1name", txtname1.Text);
        data.Add("p1phoneno",txtp1.Text );
        data.Add("p1desc",txtdesc1.Text);
        data.Add("p2name", txtname2.Text);
        if (txtname2.Text != "")
        {
            data.Add("p2phoneno", txtp2.Text);
           
        }
        data.Add("p2desc", txtdesc2.Text);
        data.Add("p3name", txtname3.Text);
        if (txtname3.Text != "")
        {
            data.Add("p3phoneno", txtp3 .Text);
            
        }
        data.Add("p3desc", txtdesc3.Text);
        int id;
        bll inscmd = new bll();
        id=inscmd.ins3vendordet(data);
        lblretvendorid.Text = "Third Party Vendor Details Inserted & Vendor ID is" + id.ToString();
    }
    protected void btninsert0_Click(object sender, EventArgs e)
    {
        Response.Redirect("CmsHome1.aspx");
    }
}
