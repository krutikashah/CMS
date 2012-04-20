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

public partial class Feedbackform : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string str;
        str = Request.QueryString["Ticketid"];
        int id = Convert.ToInt32(str);
        Hashtable data = new Hashtable();
        data.Add("ticket_id", id);
        string feed="";
        if (rbyes.Checked == true)
        {
            feed += "Yes";
        }
        else if (rbno.Checked == false)
        {
            feed += "no";
        }
        feed = feed + ",";
        feed = feed + txtcomment.Text;
        data.Add("clientsatisfied", feed);
        bll feedback = new bll();

        feedback.feedback(data);
        lblthnx.Visible = true;
        
    }
}
