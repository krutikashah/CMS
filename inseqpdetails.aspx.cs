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
using datasetinsassetinfoTableAdapters;
using bllnamespace;
using System.Windows .Forms;

public partial class eqpdetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblretassetid.Text = "";
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
    protected void Button1_Click(object sender, EventArgs e)
    {

        Hashtable data = new Hashtable();
        
        data.Add("clientid", cborgname.SelectedValue);
        if (cbtype.SelectedItem.Text == "Other")
        {
            data.Add("eqptype", txttype.Text);

        }
        else
        {
            data.Add("eqptype", cbtype.SelectedItem.Text);
        }
        if (cbsubtype .SelectedItem.Text == "Other")
        {
            data.Add("eqpsubtype", txtsubtype .Text);

        }
        else
        {
            data.Add("eqpsubtype", cbsubtype .SelectedItem.Text);
        }
     
        data.Add("mfg", txtmfg.Text);

        if (txtdofmfg.Text!="")
        {
            data.Add("domfg", txtdofmfg.Text);
        }
        if (txtdoinst.Text!="")
        {
            data.Add("doinst", txtdoinst.Text);

        }
        if(txtlenwarranty.Text!="")
        {
                    data.Add("lenwarranty", txtlenwarranty.Text);

        }
        if(txtextwarranty.Text!="")
        {
                    data.Add("extdwarranty", txtextwarranty.Text);

        }
        if(txttonnage.Text!="")
        {
                    data.Add("tonnage", txttonnage.Text);

        }
        if(txtage.Text!="")
        {
                    data.Add("age", txtage.Text);

        }
        if (txtamcperiod.Text!="")
        {
            data.Add("amcperiod", txtamcperiod.Text);
            int dm, dy, dd;


            dm = DateTime.Now.Month;
            dd = DateTime.Now.Day;
            dy = DateTime.Now.Year;
            string date;
            date = dm.ToString() + "/" + dd.ToString() + "/" + dy.ToString();
            int nextdate = Convert.ToInt32(txtamcperiod.Text);
            DateTime next;
            next = Convert.ToDateTime(date).AddMonths(nextdate);

            data.Add("nextamc", next);
            data.Add("lastamc", date);

        }
        
        // if(txtoptvol.Text!="")
        {
                     data.Add("optvol", txtoptvol.Text);

        }
         if(txtoptcrt.Text!="")
        {
                     data.Add("optcrt", txtoptcrt.Text);

        }
        data.Add("make", txtmake.Text);
        data.Add("model", txtmodel.Text);
        data.Add("serial", txtserial.Text);
        data.Add("bldgno", txtbldgno .Text);
        data.Add("blockno", txtblockno.Text);
        data.Add("servingarea", txtservingarea.Text);
        data.Add("bldgname", txtbldgname.Text);
        data.Add("wind", txtwing.Text);
        data.Add("aptno", txtaptno.Text);
        data.Add("floor", txtfloor.Text);
        data.Add("zone", txtzone.Text);
        data.Add("roomtype", txtroomtype.Text);
        data.Add("roomdetails", txtroomdetails.Text);
        data.Add("otherdetails", txtotherdetails.Text);

        int id;
        bll clickins = new bll();
        id=clickins.insastinfo(data);
        lblretassetid.Text = "Asset Details Inserted & Asset ID is " + id.ToString();
       
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        TabContainer1.Visible = true;
        btninsert.Visible = true;
        btninsert0.Visible = true;

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
        else if (cbtype.SelectedItem.Text == "Housing")
        {
            upeqpdetshow.Visible = false;
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



    protected void cborgname_SelectedIndexChanged(object sender, EventArgs e)
    {
        btnaddneweqp.Visible = true;
    }
    protected void btninsert0_Click(object sender, EventArgs e)
    {
        Response.Redirect("inseqpdetails.aspx");
    }
}
