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

public partial class CmsHome1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.Cache.SetAllowResponseInBrowserHistory(false);

        //Response.Cache.SetNoStore();
        //Response.Expires = 60;
        ////Response.Expiresabsolute = Now() - 1;
        //Response.AddHeader("pragma", "no-cache");
        //Response.AddHeader("cache-control", "private");
        //Response.CacheControl = "no-cache";
        //Response.Cache.SetNoStore();

    }
    protected void btnsignin_Click(object sender, EventArgs e)
    {
        Session["uname"] = txtusername.Text;
        string pwd = txtpassword.Text;
        string uname = Session["uname"].ToString();

        Hashtable data = new Hashtable();
        data.Add("username", uname);
        data.Add("password", pwd);
        data.Add ("length",pwd .Length );
        

        Hashtable retval1=new Hashtable ();
        bll clloginfun = new bll();
        retval1  = clloginfun.sellogin(data);
        Session["empid"] = retval1["emp_id"].ToString();
        if (Convert.ToInt32(retval1["emp_id"]) != 0)
        {
            Hashtable data1 = new Hashtable();

            if (retval1["user"].ToString() == "employee")
            {
                bll selempdet = new bll();
                data1 = selempdet.selempdet(Convert.ToInt32(retval1["emp_id"]));

                Session["designation"] = data1["designation"].ToString();
                Session["department"] = data1["dept"].ToString();
                Session["empid"] = data1["empid"].ToString();

                if (retval1["securityques"].ToString() == "" & retval1["securityans"].ToString() == "")
                {
                   
                    Response.Redirect("firsttimelogin.aspx");
                    

                }
                else
                {
                  
                    Response.Redirect("viewprofile.aspx");
                   
                }
            }
            else
            {
             
                Response.Redirect("clienthome.aspx");
               
            }

        }
        else if (Convert.ToInt32(retval1["emp_id"]) == 0)
        {
            lblerrmsg.Visible = true;

        }
     

    
    }
    
}
