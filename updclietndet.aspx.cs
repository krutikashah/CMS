using bllnamespace;
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

public partial class updclietndet : System.Web.UI.Page
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
        Hashtable insertdata = new Hashtable();
        //insertdata.Add("client_det", txtclientid1 .Text);
        insertdata.Add("org_name", txtorgnameup.Text);
        insertdata.Add("address", txtadrsup.Text);
        insertdata.Add("phoneno", txtphonenoup.Text);
        insertdata.Add("emailid", txtemaildidup.Text);
        insertdata.Add("orgtype", txtorgtypeup.Text);
        insertdata.Add("client_id", ComboBox1.SelectedValue);

        bll clupdclient = new bll();
        clupdclient.upclientdet(insertdata);
        lblupclient.Text = "Details Successfully Updated";

    }
    protected void btndel_Click(object sender, EventArgs e)
    {
        int id = Convert.ToInt32(ComboBox1.SelectedValue);
        bll cldelete = new bll();
        cldelete.delclient(id);
        lbldelclient.Text = "Details Successfully Deleted";
        Response.Redirect("updclietndet.aspx");

    }
    protected void ComboBox1_SelectedIndexChanged(object sender, EventArgs e)
    {
        int id1 = Convert.ToInt32(ComboBox1.SelectedValue);
        bll clsel = new bll();

        Hashtable insertdata = new Hashtable();
        insertdata = clsel.selclientdet(id1);

        txtorgnameup.Text = insertdata["org_name"].ToString();
        txtadrsup.Text = insertdata["address"].ToString();
        txtemaildidup.Text = insertdata["emailid"].ToString();
        txtorgtypeup.Text = insertdata["orgtype"].ToString();
        txtphonenoup.Text = insertdata["phoneno"].ToString();

    }
    protected void btndel0_Click(object sender, EventArgs e)
    {
        Response.Redirect("updclietndet.aspx");
    }
}
