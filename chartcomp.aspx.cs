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
using System.Web.UI.DataVisualization.Charting;
using bllnamespace;

public partial class chartcomp : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        bll bl = new bll();
        DataTable dt = new DataTable();
        dt = bl.sample();
        Chart1.DataSource = dt;
        Chart1.Series["Series1"].XValueMember = "clientid";
        Chart1.Series["Series1"].YValueMembers = "critical";

        Chart1.Series["Series2"].XValueMember = "clientid";
        Chart1.Series["Series2"].YValueMembers = "regular";


        Chart1.DataBind();
        Chart1.Series["Series1"].ChartType = SeriesChartType.Column ;
        Chart1.Series["Series1"]["DrawingStyle"] = "Emboss";
        Chart1.ChartAreas["ChartArea1"].Area3DStyle.Enable3D = false  ;
        Chart1.Series["Series1"].IsValueShownAsLabel = true;
        //Chart1.Series["Series1"] = true;

        Chart1.Series["Series2"].ChartType = SeriesChartType.Column;
        Chart1.Series["Series2"]["DrawingStyle"] = "Emboss";
        Chart1.ChartAreas["ChartArea2"].Area3DStyle.Enable3D = false ;
        Chart1.Series["Series2"].IsValueShownAsLabel = true;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {

    }
}
