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

public partial class eqpupd : System.Web.UI.Page
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
        lblupdmes.Text = "";
        if(IsPostBack)
            {
              string  str;
              str=Request.QueryString["EQid"];
              int id = Convert.ToInt32(str);
        }
    }
    
    protected void LinkButton1_Click1(object sender, EventArgs e)
    {
        string str;
        str = Request.QueryString["EQid"];
        int id = Convert.ToInt32(str);
        bll selvieweqpdet = new bll();
        Hashtable data = new Hashtable();

      data=  selvieweqpdet.seleqpdetbyid(id);
     
        txtassetid.Text = data["eqpid"].ToString ();
        cbtype.Text =  data["eqptype"].ToString ();

        if (data["eqptype"].ToString() != "Housing")
        {
            cbsubtype.SelectedValue.Replace(data["eqpsubtype"].ToString(), data["eqpsubtype"].ToString());
            txtmfg.Text = data["mfg"].ToString();
            txtdofmfg.Text = data["domfg"].ToString();
            txtdoinst.Text = data["doinst"].ToString();
            txtlenwarranty.Text = data["lenwarranty"].ToString();
            txtextwarranty.Text = data["extdwarranty"].ToString();
            txtmake.Text = data["make"].ToString();
            txtmodel.Text = data["model"].ToString();
            txtserial.Text = data["serial"].ToString();
            txttonnage.Text = data["tonnage"].ToString();
            txtage.Text = data["age"].ToString();
            txtservingarea.Text = data["servingarea"].ToString();
            txtoptcrt.Text = data["optcrt"].ToString();
            txtoptvol.Text = data["optvol"].ToString();
            txtamcperiod.Text = data["amcperiod"].ToString();
   
        }


        txtbldgno.Text = data["bldgno"].ToString();
        txtblockno.Text = data["blockno"].ToString();
        txtbldgname.Text = data["bldgname"].ToString();
        txtwing.Text = data["wind"].ToString();
        txtaptno.Text = data["aptno"].ToString();
        txtfloor.Text = data["floor"].ToString();
        txtzone.Text = data["zone"].ToString();
        txtroomtype.Text = data["roomtype"].ToString();
        txtroomdetails.Text = data["roomdetails"].ToString();
        txtotherdetails.Text = data["otherdetails"].ToString();

        
        TabContainer1.Visible = true;

        if (data["eqptype"].ToString() != "Housing")
        {
            upeqpdetshow.Visible = true;

        }
        btnupdate.Visible = true ;
        btndelete.Visible = true;
        btndelete0.Visible = true;
    }
    protected void cbclientid_SelectedIndexChanged(object sender, EventArgs e)
    {
        TabContainer1.Visible = false;
        btnupdate.Visible = false;
    }
    protected void cbtypesel_SelectedIndexChanged(object sender, EventArgs e)
    {
        TabContainer1.Visible = false;
        btnupdate.Visible = false ;
    }
    protected void btnupdate_Click(object sender, EventArgs e)
    {
        Hashtable data = new Hashtable();

        data.Add("clientid", cbclientid .SelectedValue);
        data.Add("eqpid", txtassetid.Text);
        if (cbtype.SelectedItem.Text == "Other")
        {
            data.Add("eqptype", txttype.Text);

        }
        else
        {
            data.Add("eqptype", cbtype.SelectedItem.Text);
        }
        if (cbsubtype.SelectedItem.Text == "Other")
        {
            data.Add("eqpsubtype", txtsubtype.Text);

        }
        else
        {
            data.Add("eqpsubtype", cbsubtype.SelectedItem.Text);
        }

        data.Add("mfg", txtmfg.Text);
        data.Add("domfg", txtdofmfg.Text);
        data.Add("doinst", txtdoinst.Text);
        data.Add("lenwarranty", txtlenwarranty.Text);
        data.Add("extdwarranty", txtextwarranty.Text);
        data.Add("make", txtmake.Text);
        data.Add("model", txtmodel.Text);
        data.Add("serial", txtserial.Text);
        data.Add("tonnage", txttonnage.Text);
        data.Add("age", txtage.Text);
        data.Add("bldgno", txtbldgno.Text);
        data.Add("blockno", txtblockno.Text);
        data.Add("servingarea", txtservingarea.Text);
        data.Add("bldgname", txtbldgname.Text);
        data.Add("wind", txtwing.Text);
        data.Add("aptno", txtaptno.Text);
        data.Add("floor", txtfloor.Text);
        data.Add("zone", txtzone.Text);
        data.Add("roomtype", txtroomtype.Text);
        data.Add("roomdetails", txtroomdetails.Text);
        data.Add("optcrt", txtoptcrt.Text);
        data.Add("optvol", txtoptvol.Text);
        data.Add("amcperiod", txtamcperiod.Text);
        data.Add("otherdetails", txtotherdetails.Text);
        bll clickupd = new bll();
        clickupd.eqpupd (data);
        lblupdmes.Text = "Details Succesfully Updated";
    }
    protected void cbtype_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (cbtype.SelectedItem.Text == "Other")
        {
            txttype.Enabled = true;
            lbltype.Enabled = true;
        }
        else if (cbtype.SelectedItem.Text != "Housing")
        {
            upeqpdetshow.Visible = true;
        }
        else
        {
            txttype.Text = "";
            txttype.Enabled = false;
            lbltype.Enabled = false;

        }
    }
    protected void cbsubtype_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (cbsubtype.SelectedItem.Text == "Other")
        {
            txtsubtype.Enabled = true;
            lblsubtype.Enabled = true;

        }
        else
        {
            txtsubtype.Text = "";
            txtsubtype.Enabled = false;
            lblsubtype.Enabled = false;

        }
    }
    protected void btndelete_Click(object sender, EventArgs e)
    {
         string  str;
         str=Request.QueryString["EQid"];
         int id = Convert.ToInt32(str);
         bll cldelasset = new bll();
         cldelasset.delasset(id);
    }

    protected void btndelete0_Click(object sender, EventArgs e)
    {
        Response.Redirect("eqpupd.aspx");
    }
}
