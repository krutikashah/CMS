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

public partial class changepwd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btninsert_Click(object sender, EventArgs e)
    {
        Hashtable data = new Hashtable();
        lblres .Text ="password";
        data.Add("t", lblres.Text);
        data.Add("password", txtpwd.Text);
        data.Add("length", txtpwd.Text.Length);
        data.Add("emp_id", Convert.ToInt32(Session["empid"]));
        bll clreg1 = new bll();
        clreg1.registration(data);
        
        lblres.Text = "Password Changed";

    }
}
