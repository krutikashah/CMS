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

public partial class clientcontactdetails : System.Web.UI.Page
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
            Response.Redirect("CmsHome1.aspx");
        }
    }
   
    protected void btninsert_Click(object sender, EventArgs e)
    {
        Hashtable data = new Hashtable();
        data.Add("client_id", cbclientname.SelectedValue);
        data.Add("asset_id", cbaptno.SelectedValue);
        data.Add("name", txtname.Text);
        data.Add("phoneno", txtphoneno.Text);
        data.Add("emailid", txtemailid.Text );
        data.Add("desg", txtdesg.Text);
        data.Add("desc", txtdesc.Text);

        int id;

        bll insclientcont = new bll();
        id=insclientcont.insclientcontactdet(data);
        lblretccid.Text = "Client Contact Details Inserted & Client Contact ID is " + id.ToString();
    }
    protected void btninsert0_Click(object sender, EventArgs e)
    {
        Response.Redirect("insclientcontactdet.aspx");
    }
}
