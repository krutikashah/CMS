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
using empdetaildsTableAdapters;
using bllnamespace;

public partial class insempdetails : System.Web.UI.Page
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
        lblretemp.Text = "";
    }
    protected void btnempdetails_Click(object sender, EventArgs e)
    {
        Hashtable data = new Hashtable();
        data.Add("name", txtname.Text);
        data.Add("dob", txtdob.Text);
        data.Add("adrs", txtadrs.Text);
        data.Add("phoneno", txtphoneno.Text);
        data.Add("emailid", txtemailid.Text);
        data.Add("designation", cbdesg.SelectedItem.Text);
        data.Add("dept", cbdep.SelectedItem.Text);
     
        if (cbdesg.SelectedItem.Text != "Head")
        {
            if (lblheadname.Visible == false)
            {
                data.Add("headname", "");
                data.Add("headid", "");
            }
            else
            {
                data.Add("headname", cbheadname.SelectedItem.Text);
                data.Add("headid", cbheadname.SelectedValue);
            }

        }
       
        data.Add("desc", txtdesc.Text);
     
      
      
        bll insempdet = new bll();
        int j;
        j=insempdet.insempdet(data);
        for (int i = 0; i < lbempunder.Items.Count; i++)
        {


            Hashtable datahead = new Hashtable();
            ListItem li = new ListItem();
            datahead.Add("empheadchange", lbempunder.Items[i].Value);
            datahead.Add("empheadname", txtname.Text);
            datahead.Add("empheadid", j);
            bll emphead = new bll();
            emphead.uphead(datahead);
        }

        lblretemp.Text = "Employee Details Inserted & Employee ID is " + j.ToString();


    }
    protected void cbdesg_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (cbdesg.SelectedItem.Text == "Head")
        {
            lbheadname.Visible = false ;
            cbheadname.Visible = false;
            lblheadname.Visible = false;

            upreportingemp.Visible = true ;
        }
         
        if (cbdesg.SelectedItem.Text != "Head")
        {
           
            lbheadname.Visible = true;
            upreportingemp.Visible = false ;

        }
        if (cbdesg.SelectedItem.Text != "Technician")
        {
            upreportingemp.Visible = true;
        }
        if (cbdesg.SelectedItem.Text == "Technician")
        {
            cbheadname.Visible = false;
            lblheadname.Visible = false;
        }
        if (cbdesg.SelectedItem.Text == "Shift engg")
        {
            cbheadname.Visible = false;
            lblheadname.Visible = false;
        }
        if (cbdesg.SelectedItem.Text == "Help desk personnel")
        {
            upreportingemp.Visible = false;
            cbheadname.Visible = false;
            lblheadname.Visible = false;
            lbheadname.Visible = false;
        }
    }

    protected void btnadd_Click(object sender, EventArgs e)
    {
     
        lbempunder.Items.Add(lbemps.SelectedItem);
        lbemps.Items.Remove(lbemps.SelectedItem);
        
    }
    protected void btnremove_Click(object sender, EventArgs e)
    {
        lbemps.Items.Add(lbempunder.SelectedItem);
        lbempunder.Items.Remove(lbempunder.SelectedItem);
    }
    protected void btnaddall_Click(object sender, EventArgs e)
    {
        
        
        for (int i = 0; i < lbemps .Items.Count; i++)
        {
            ListItem li = new ListItem();
            li.Text = lbemps .Items[i].Text;
            li.Value = lbemps .Items[i].Value;
           lbempunder .Items.Add(li);
        }
       lbemps .Items.Clear();
     

    }
    protected void btnremoveall_Click(object sender, EventArgs e)
    {
        for (int i = 0; i < lbempunder .Items.Count; i++)
        {
            ListItem li = new ListItem();
            li.Text = lbempunder .Items[i].Text;
            li.Value = lbempunder .Items[i].Value;
            lbemps.Items.Add(li);
        }
        lbempunder.Items.Clear();
    }
    protected void lbheadname_Click(object sender, EventArgs e)
    {
        lblheadname.Visible = true;
        cbheadname.Visible= true;

    }

    protected void btnempdetails0_Click(object sender, EventArgs e)
    {
        Response.Redirect("insempdetails.aspx");

    }
}