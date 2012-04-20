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

public partial class forgotpwd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        Hashtable data = new Hashtable();
        data.Add("username", txtuname.Text);
        data.Add("securityques", cbsecques.SelectedItem.Text);
        data.Add("securityans", txtsecans.Text);

        bll clfrg = new bll();
        int id;
        id = clfrg.forgotpwd(data);

        if (id != 0)
        {
            lblresult.Text = "A mail with your account details has been sent to your email id";
        }
        else
        {
            lblresult.Text = "Please enter valid security question and answer";

        }
    }
}
