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

public partial class selectcontrols : System.Web.UI.Page
{
    public string  str;
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Session["designation"].ToString() != "Help desk personnel"))
        {
            Response.Redirect("access.aspx");
        }
     
        try
        {
            if ((Session["designation"].ToString() != "aa"))
            {
                Response.Redirect("access.aspx");
            }
        }
        catch
        {
            Response.Redirect("CmsHome1.aspx");
        }


    }

    protected void imgtxtbox_Click(object sender, ImageClickEventArgs e)
    {
        updetails.Visible = true;
      Label5 .Text = "Textbox";
    }
    protected void imgradiobtn_Click(object sender, ImageClickEventArgs e)
    {
        updetails.Visible = true;
        Label5.Text = "Radiobutton";
    }
    protected void imgcheckbox_Click(object sender, ImageClickEventArgs e)
    {
        updetails.Visible = true;
        Label5.Text = "Checkbox";
    }
    protected void imgddl_Click(object sender, ImageClickEventArgs e)
    {
        updetails.Visible = true;
        Label5.Text = "Dropdownlist";
    }
    protected void imgcombobox_Click(object sender, ImageClickEventArgs e)
    {
        updetails.Visible = true;
        Label5.Text = "Combobox";
    }
    protected void btninsert_Click(object sender, EventArgs e)
    {
        Hashtable data = new Hashtable();
        data.Add ("client_id",cbclientnme .SelectedValue );
        data.Add ("control",Label5 .Text );
        data.Add ("value",txtdefvalues .Text );
        data.Add ("dbname",txtmethodname .Text );
        data.Add ("label",txtlabelname .Text );
        data.Add ("description",txtdesc.Text  );
        int id;
        bll clins = new bll();
       
        id= clins.inscontrol(data);
        lblretid.Text = "Control Details Successfully Inserted & Control ID is " + id.ToString();

    }
    protected void btninsert0_Click(object sender, EventArgs e)
    {
        Response.Redirect("selectcontrols.aspx");

    }
}
