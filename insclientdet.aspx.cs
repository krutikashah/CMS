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

public partial class insclientdet : System.Web.UI.Page
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
    protected void btninsclientdetails_Click(object sender, EventArgs e)
    {
        Hashtable insertdata = new Hashtable();
        //insertdata.Add("client_det", txtclientid1 .Text);
        insertdata.Add("org_name", txtorgname.Text);
        insertdata.Add("address", txtadrs.Text);
        insertdata.Add("phoneno", txtphoneno.Text);
        insertdata.Add("emailid", txtemaildid.Text);
        insertdata.Add("orgtype", txtorgtype.Text);

        int id;
        bll clickins = new bll();
        id=clickins.clientdetinfo(insertdata);

        lblretclientid.Text = "Client Details Inserted & Client ID is " + id.ToString();
    }
    protected void btninsclientdetails0_Click(object sender, EventArgs e)
    {
        Response.Redirect("insclientdet.aspx");
    }
}
