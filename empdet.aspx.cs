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

public partial class empdet : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int id = Convert.ToInt32(Session["id"]);
        Hashtable data = new Hashtable();

        bll selempdet = new bll();
        data = selempdet.selempdet(id);
        lblempid.Text = data["empid"].ToString();
        lblname.Text = data["name"].ToString();
        lbldob.Text = data["dob"].ToString();
        lbladdress.Text = data["adrs"].ToString();
        lblphoneno.Text = data["phoneno"].ToString();
        lblemailid.Text = data["emailid"].ToString();

    }
}
