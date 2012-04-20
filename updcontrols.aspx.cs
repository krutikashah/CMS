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

public partial class updcontrols : System.Web.UI.Page
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
    protected void btnupdate_Click(object sender, EventArgs e)
    {
        Hashtable data = new Hashtable();
        data.Add("id", cbcontrolname.SelectedValue);
        data.Add("value", txtdefvalues.Text);
        data.Add("dbname", txtmethodname.Text);
        data.Add("label", txtlabelname.Text);
        data.Add("description", txtdesc.Text);
        data.Add("control", cbupdcontrols.SelectedValue);
        bll clupd = new bll();
        clupd.updcontrol(data);
        lblretupdate.Text = "Details Successfully Updated";


    }
    protected void cbcontrolname_SelectedIndexChanged(object sender, EventArgs e)
    {
        int id;
        id = Convert .ToInt32(cbcontrolname .SelectedValue);
        Hashtable data=new Hashtable ();
        bll clupdate = new bll();
        data=clupdate.selcontrol (id);

        txtlabelname.Text  = data["label"].ToString();
        txtdefvalues.Text = data["value"].ToString();
        txtmethodname.Text = data["dbname"].ToString();
        txtdesc.Text = data["description"].ToString();
        cbupdcontrols.SelectedValue = data["control"].ToString();
        
    }
    protected void btndelete_Click(object sender, EventArgs e)
    {
        int id;
        id = Convert.ToInt32(cbcontrolname.SelectedValue);
        bll cldel = new bll();
        cldel.delcontrol(id);
        Response.Redirect("updcontrols.aspx");

    }
    protected void btndelete0_Click(object sender, EventArgs e)
    {
        Response.Redirect("updcontrols.aspx");
    }
}
