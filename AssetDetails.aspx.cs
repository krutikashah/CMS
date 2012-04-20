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

public partial class AssetDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int id = Convert.ToInt32(Session ["assetid"]);
        bll selvieweqpdet = new bll();
        Hashtable data = new Hashtable();

        data = selvieweqpdet.seleqpdetbyid(id);

        txtassetid.Text = data["eqpid"].ToString();
        cbtype.Text = data["eqptype"].ToString();

        if (data["eqptype"].ToString() != "Housing")
        {
            cbsubtype.SelectedValue.Replace(data["eqpsubtype"].ToString(), data["eqpsubtype"].ToString());
            txtmfg.Text = data["mfg"].ToString();
            txtdofmfg.Text = data["domfg"].ToString();
            txtdoinst.Text = data["doinst"].ToString();
            txtlenwarranty.Text = data["lenwarranty"].ToString();
            txtextwarranty.Text = data["extdwarranty"].ToString();
            txtmake.Text = data["make"].ToString();
            txtmodel.Text = data["model"].ToString();
            txtserial.Text = data["serial"].ToString();
            txttonnage.Text = data["tonnage"].ToString();
            txtage.Text = data["age"].ToString();
            txtservingarea.Text = data["servingarea"].ToString();
            txtoptcrt.Text = data["optcrt"].ToString();
            txtoptvol.Text = data["optvol"].ToString();
            txtamcperiod.Text = data["amcperiod"].ToString();

        }


        txtbldgno.Text = data["bldgno"].ToString();
        txtblockno.Text = data["blockno"].ToString();
        txtbldgname.Text = data["bldgname"].ToString();
        txtwing.Text = data["wind"].ToString();
        txtaptno.Text = data["aptno"].ToString();
        txtfloor.Text = data["floor"].ToString();
        txtzone.Text = data["zone"].ToString();
        txtroomtype.Text = data["roomtype"].ToString();
        txtroomdetails.Text = data["roomdetails"].ToString();
        txtotherdetails.Text = data["otherdetails"].ToString();


        TabContainer1.Visible = true;

        if (data["eqptype"].ToString() != "Housing")
        {
            upeqpdetshow.Visible = true;

        }
    }
   
}
