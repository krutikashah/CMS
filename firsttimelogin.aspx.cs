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

public partial class firsttimelogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btninsert_Click(object sender, EventArgs e)
    {
        Hashtable data=new Hashtable ();
        lblmes .Text ="all";
        string pwd = txtpwd.Text;
        data.Add("t", lblmes.Text);
        data.Add("emp_id", Convert .ToInt32 (Session ["empid"]));
        data .Add ("securityques",cbsecques .SelectedItem .Text );
        data.Add ("password",txtpwd .Text );
        data.Add("length", pwd.Length);
        data .Add ("securityans",txtsecans .Text );
        

        bll clreg = new bll();
        clreg.registration(data);
        lblmes.Text = "Account Details Saved";
    }
}
