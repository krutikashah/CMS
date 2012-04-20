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

public partial class AMC : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if ((Session["designation"].ToString() == "ss"))
            {
                Response.Redirect("access.aspx");
            }
        }
        catch
        {
            Response.Redirect("CmsHome1.aspx");
        }
    }
   
    protected void Button1_Click(object sender, EventArgs e)
    {
        string str;
        str = Request.QueryString["vdid"];
        int id = Convert.ToInt32(str);
        Hashtable data2 = new Hashtable();
        data2.Add("ticket_id",Session["compid"]);
        data2.Add("desc", txttaskdesc.Text);
        data2.Add("pk", id);
        data2.Add("dbname", "vendor");
        bll helptakt = new bll();
        helptakt.inshelptas(data2);
        Hashtable data4= new Hashtable();
        data4.Add("ticket_id",Session["compid"]);
        data4.Add("ticket_status","Escalate to Help Desk");
        bll comphelp = new bll();
        comphelp.upcomphelp(data4);
        
        
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        string str;
        str = Request.QueryString["vdid"];
        int id = Convert.ToInt32(str);
        txtvendorid.Text = str;
    }
}
