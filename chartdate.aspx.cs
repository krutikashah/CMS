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

public partial class chartdate : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void txtstartdate_TextChanged(object sender, EventArgs e)
    {
        //DateTime startdate;
        //startdate = Convert.ToDateTime(txtstartdate.Text);
    }
    protected void txtenddate_TextChanged(object sender, EventArgs e)
    {
    //    DateTime enddate;
    //    enddate = Convert.ToDateTime(txtenddate.Text);
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Chart1.Visible = true;
    }
}
