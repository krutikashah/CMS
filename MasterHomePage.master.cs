using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;


public partial class MasterHomePage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        //Response.Expires = 60;
        ////Response.Expiresabsolute = Now() - 1;
        //Response.AddHeader("pragma","no-cache");    
        //Response.AddHeader("cache-control","private");
        //Response.CacheControl = "no-cache";
        //Session["logingstatus"] = "out";
        //Session.Abandon();
        //Session.RemoveAll();

        //Response.Cache.SetNoStore();
        //Response.Redirect("CmsHome1.aspx");

        //FormsAuthentication.SignOut();
        //Session.Abandon();
        //Session.RemoveAll();
        //Response.Redirect("CmsHome1.aspx");
      
        Response.Write("<script language=javascript>var wnd=window.open('','newWin','height=1,width=1,left=900,top=700,status=no,toolbar=no,menubar=no,scrollbars=no,maximize=false,resizable=1');</script>");
        Response.Write("<script language=javascript>wnd.close();</script>");
        Response.Write("<script language=javascript>window.open('CmsHome1.aspx','_parent',replace=true);</script>");
        Session.Abandon();

    }
}
