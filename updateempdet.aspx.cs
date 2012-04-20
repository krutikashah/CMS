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
using System.Windows.Forms;
using bllnamespace;

public partial class updateempdet : System.Web.UI.Page
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
        lblupd.Text = "";
        if (IsPostBack)
        {
            string str;
            str = Request.QueryString["Empid"];
            int id = Convert.ToInt32(str);
        }


    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        

    }
    protected void btnupd_Click(object sender, EventArgs e)
    {
        Hashtable data = new Hashtable();
        data.Add("empid", txtempid.Text);
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
        bll upemp = new bll();
        upemp.upemp(data);


        for (int i = 0; i < lbempunder.Items.Count; i++)
        {
            MessageBox.Show("dfdsa");

            Hashtable datahead = new Hashtable();
            ListItem li = new ListItem();
            datahead.Add("empheadchange", lbempunder.Items[i].Value);
            datahead.Add("empheadname", txtname.Text);
            datahead.Add("empheadid", txtempid.Text);
            bll emphead = new bll();
            emphead.uphead(datahead);
            
        }
        lblupd.Text = "Details Successfully Updated";


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

        for (int i = 0; i < lbemps.Items.Count; i++)
        {
            ListItem li = new ListItem();
            li.Text = lbemps.Items[i].Text;
            li.Value = lbemps.Items[i].Value;
            lbempunder.Items.Add(li);
        }
        lbemps.Items.Clear();

    }
    protected void btnremoveall_Click(object sender, EventArgs e)
    {
        for (int i = 0; i < lbempunder.Items.Count; i++)
        {
            ListItem li = new ListItem();
            li.Text = lbempunder.Items[i].Text;
            li.Value = lbempunder.Items[i].Value;
            lbemps.Items.Add(li);
        }
        lbempunder.Items.Clear();
    }
    protected void LinkButton1_Click1(object sender, EventArgs e)
    {


    }
    protected void cbseldesg_SelectedIndexChanged(object sender, EventArgs e)
    {
        TabContainer1.Visible = false;
        btnupd.Visible = false;
        btndel.Visible = false;

        GridView3.DataSource = SqlDataSource7;
        GridView3.DataBind();

        if (cbseldesg.SelectedValue != "Head")
        {
            cbselhead.Enabled = true;
        }
        if (cbseldesg.SelectedValue == "Head")
        {
            cbselhead.Enabled = false;

        }
    }
    protected void cbselhead_SelectedIndexChanged(object sender, EventArgs e)
    {
        TabContainer1.Visible = false;
        btnupd.Visible = false;
        btndel.Visible = false;
        GridView3.DataSource = SqlDataSource6;
        GridView3.DataBind();
    }
    protected void btndel_Click(object sender, EventArgs e)
    {
        string str;
        str = Request.QueryString["Empid"];
        int id = Convert.ToInt32(str);
        bll delemp = new bll();
        delemp.delempdet(id);
    }


    protected void LinkButton1_Click2(object sender, EventArgs e)
    {
        string str;
        str = Request.QueryString["Empid"];
        int id = Convert.ToInt32(str);
        Hashtable data = new Hashtable();

        bll selempdet = new bll();
        data = selempdet.selempdet(id);
        txtempid.Text = data["empid"].ToString();
        txtname.Text = data["name"].ToString();
        txtdob.Text = data["dob"].ToString();
        txtadrs.Text = data["adrs"].ToString();
        txtphoneno.Text = data["phoneno"].ToString();
        txtemailid.Text = data["emailid"].ToString();
        cbdesg.SelectedItem.Text = data["designation"].ToString();
        cbdep.SelectedItem.Text = data["dept"].ToString();
        if (data["designation"].ToString() != "Head")
        {
            if ((data["headname"].ToString()) != "")
            {
                //cbheadname.SelectedItem.Text = data["headname"].ToString();
                cbheadname.SelectedValue.Replace(data["headname"].ToString(), data["headname"].ToString());

            }
            else
            {
                cbheadname.SelectedValue = null;
            }


        }
        else
        {
            cbheadname.Enabled = false;

        }

        txtdesc.Text = data["desc"].ToString();

        TabContainer1.Visible = true;
        btnupd.Visible = true;
        btndel.Visible = true;
        btndel0.Visible = true;
        
      
    }


    protected void btndel0_Click1(object sender, EventArgs e)
    {
        Response.Redirect("updateempdet.aspx");
    }
}
