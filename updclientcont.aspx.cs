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
public partial class updclientcont : System.Web.UI.Page
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
        if (IsPostBack)
        {
            string str;
            str = Request.QueryString["ccid"];
            int id = Convert.ToInt32(str);
        }
    }

  
   
   
    protected void LinkButton1_Click1(object sender, EventArgs e)
    {
        string str;
        str = Request.QueryString["ccid"];
        int id = Convert.ToInt32(str);
        Hashtable data = new Hashtable();

        bll selclientcont = new bll();
        data = selclientcont.selclientcontbyid(id);

        txtclientcont.Text = data["cc_id"].ToString();
        txtaptno.Text = data["asset_id"].ToString();
        txtname.Text = data["name"].ToString();
        txtphoneno.Text = data["phoneno"].ToString();
        txtemailid.Text = data["emailid"].ToString();
        txtdesg.Text = data["desg"].ToString();
        txtdesc.Text = data["desc"].ToString();
        UpdatePanel2.Visible = true;
        btnupdate.Visible = true;
        btndel.Visible = true;
        btndel0.Visible = true;
    }
    protected void btnupdate_Click(object sender, EventArgs e)
    {
        Hashtable data = new Hashtable();
      //  data.Add("client_id", cbclientname.SelectedValue);
        data.Add("cc_id", txtclientcont.Text);
       // data.Add("asset_id",txtaptno .Text );
        data.Add("name", txtname.Text);
        data.Add("phoneno", txtphoneno.Text);
        data.Add("emailid", txtemailid.Text);
        data.Add("desg", txtdesg.Text);
        data.Add("desc", txtdesc.Text);



        bll updclientcont = new bll();
       updclientcont.updclientcontbyid (data);

       lblclientupd.Text = "Details Successfully Updated";
    }
    protected void btndel_Click(object sender, EventArgs e)
    {
        string str;
        str = Request.QueryString["ccid"];
        int id = Convert.ToInt32(str);
        bll cldelclientcont = new bll();
        cldelclientcont.delclientcontact(id);
        Response.Redirect("updclientcont.aspx");
    }
    protected void btndel0_Click(object sender, EventArgs e)
    {
        Response.Redirect("updclietndet.aspx");
    }
}
