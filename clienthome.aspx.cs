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
using System.Drawing;
using System.Reflection;

public partial class clienthome : System.Web.UI.Page
{
    
   
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        { 
        if (Session["empid"].ToString()=="")
        {
        }
        }
        catch
        {
            Response.Redirect("CmsHome1.aspx");
        }
        if (!IsPostBack)
        {

            Session["query"] = "select ticket_id, taskdesc,priority,ticket_status from complain where client_id='" + Session["empid"] + "'  ";

        }  
           
        
    }
    protected void txtdob_TextChanged(object sender, EventArgs e)
    {
        string str1;
        str1 = Session["query"].ToString();
        str1 += "AND docomplain BETWEEN '" + txtdob.Text + "' AND '" + txtdob.Text + " 23:59:59.997' ";
        Session["query"] = str1;
        //UpdatePanel2.Visible = false;

    }
    protected void cbtype_SelectedIndexChanged(object sender, EventArgs e)
    {
        string str1;
        str1 = Session["query"].ToString();
        str1 += "AND probtype'" + cbtype.SelectedValue + "' ";
        Session["query"] = str1;
        //UpdatePanel2.Visible = false;
    }
    protected void btnsearch_Click(object sender, EventArgs e)
    {
        bll clconn = new bll();
        DataTable dt = new DataTable();
        dt = clconn.clientview(Session["query"].ToString());
        if (dt != null)
        {
            GridView1.DataSource = dt;
            GridView1.DataBind();
           
        }
        else
        {
            lblresult.Text = "There is no such complain registered.";

        }
        //UpdatePanel2.Visible = false;
    }


    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Write("<script language=javascript>var wnd=window.open('','newWin','height=1,width=1,left=900,top=700,status=no,toolbar=no,menubar=no,scrollbars=no,maximize=false,resizable=1');</script>");
        Response.Write("<script language=javascript>wnd.close();</script>");
        Response.Write("<script language=javascript>window.open('CmsHome1.aspx','_parent',replace=true);</script>");
        Session.Abandon();
    }
}
