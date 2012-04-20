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

public partial class viewprofile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
     
        int id = Convert.ToInt32(Session["empid"]);
        Hashtable data = new Hashtable();

        bll selempdet = new bll();
        data = selempdet.selempdet(id);
        if (data["name"].ToString() == "")
        {
            Response.Redirect("CmsHome1.aspx");
        }
        lblempid .Text = data["empid"].ToString();
        lblname .Text = data["name"].ToString();
        lbldob .Text = data["dob"].ToString();
        lbladdress .Text = data["adrs"].ToString();
        lblphoneno.Text = data["phoneno"].ToString();
        lblemailid .Text = data["emailid"].ToString();
        lbldesg .Text = data["designation"].ToString();
        lbldept .Text = data["dept"].ToString();
        if (data["designation"].ToString() != "Head")
        {
            upshift.Visible = true;
             if ((data["headname"].ToString()) != "")
             {
            lblheadname.Text = data["headname"].ToString();
             }
             else
             {
                 lblheadname.Text = "No Head Assigned!";

             }
        }
            //{
            //    //cbheadname.SelectedItem.Text = data["headname"].ToString();
            //    cbheadname.SelectedValue.Replace(data["headname"].ToString(), data["headname"].ToString());

            //}
                             
        else
        {
            uphead . Visible = true;
            //lbreportingemp .Text =
            //cbheadname.Enabled = false;

        }

      

        
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        //FormsAuthentication.SignOut();
        //Session.Abandon();
        //Session.RemoveAll();
        //Response.Redirect("CmsHome1.aspx");
        ////Response.Write("<script language=javascript>var wnd=window.open('','newWin','height=1,width=1,left=900,top=700,status=no,toolbar=no,menubar=no,scrollbars=no,maximize=false,resizable=1');</script>");
        ////Response.Write("<script language=javascript>wnd.close();</script>");
        ////Response.Write("<script language=javascript>window.open('CmsHome1.aspx','_parent',replace=true);</script>");
        ////Session.Abandon();
//Response.Redirect("CmsHome1.aspx");

    }
}
