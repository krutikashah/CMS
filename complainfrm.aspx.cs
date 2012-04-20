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
using bldgnodsTableAdapters;
using AjaxControlToolkit;
//using System.Windows.Forms;
using controlTableAdapters;
using System.Reflection;
using System.Drawing;
public partial class complainfrm : System.Web.UI.Page
{
    private TextBox[] dynamicTextBoxes;
    private AjaxControlToolkit.ComboBox[] dynamiccombobox;
    public int combosel;
    protected AjaxControlToolkit.ComboBox cb;
    protected System.Web.UI.WebControls.Label lbl;
   

    protected void Page_PreInit(object sender, EventArgs e)
    {
        Control myControl = GetPostBackControl(this.Page);

    }

    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);
        int a = Convert.ToInt32(Session["combosel"]);
        bll noof = new bll();
        int w, z,tn,cn,tc=0,cc=0;
        Hashtable datano = new Hashtable();
        datano = noof.noofrows(a);
        w = Convert.ToInt32(datano ["noofrows"]);
        tn = Convert.ToInt32(datano["nooftxt"]);
        cn = Convert.ToInt32(datano["noofcb"]);
        dynamicTextBoxes = new TextBox[tn];
        dynamiccombobox = new AjaxControlToolkit.ComboBox[cn];
        Table tbl = new Table();
        for (z = 0; z < w; z++)
        {
            bll cuscontrol = new bll();
            Hashtable data = new Hashtable();
            data = cuscontrol.ccomp(a, z);

            TableRow tr = new TableRow();
            TableCell td0 = new TableCell();
            tr.CssClass = "table_tr";
            TableCell td1 = new TableCell();
            int field = Convert.ToInt32(data["id"]);

            if (data["control"].ToString() == "Combobox")
            {
                Response.Write(System.Environment.NewLine);
                lbl = new System.Web.UI.WebControls.Label();
                lbl.ID = (2 * z).ToString();

                lbl.Text = data["label"].ToString();
                lbl.CssClass = "ajxtxt";

                td0.Controls.Add(lbl);
                cb = new AjaxControlToolkit.ComboBox();
                cb.ID = (2 * z + 1).ToString();
                cb.CssClass = "ajxtxt";
                cb.ForeColor = Color.Black;
                dynamiccombobox[cc] =cb;
                cc++;
                td1.Controls.Add(cb);

                if (data["value"].ToString() == "get")
                {
                    string q = data["dbname"].ToString();
                    bll reff = new bll();

                    Type t = reff.GetType();


                    Type[] paramTypes = new Type[1];
                    paramTypes[0] = Type.GetType("System.Int32");


                    MethodInfo CosineInfo = t.GetMethod(q, paramTypes);

                    Object[] parameters = new Object[1];
                    parameters[0] = a;
                    Object returnVal = CosineInfo.Invoke(reff, parameters);



                    string commaDelimited = returnVal.ToString();
                    string[] year = commaDelimited.Split(new char[] { ',' });
                    foreach (string month in year)
                    {
                        cb.Items.Add(month);
                    }


                }
                else
                {
                    string returnVal = data["value"].ToString();



                    string commaDelimited = returnVal.ToString();
                    string[] year = commaDelimited.Split(new char[] { ',' });
                    foreach (string month in year)
                    {
                        cb.Items.Add(month);
                    }

                }
                tr.Cells.Add(td0);
                tr.Cells.Add(td1);
                tbl.Rows.Add(tr);
            }


            else
            {
                int y = 10;
                lbl = new System.Web.UI.WebControls.Label();
                lbl.ID = (2 * z).ToString();
                lbl.Text = data["label"].ToString();

                lbl.CssClass = "ajxtxt";

                td0.Controls.Add(lbl);
                TextBox txt = new TextBox();
                txt.ID = (2 * z + 1).ToString();
                txt.Text = data["value"].ToString();

                txt.CssClass = "ajxtxt";

                td1.Controls.Add(txt);
                dynamicTextBoxes[tc] = txt ;
                tc++;
            }
            tr.Cells.Add(td0);
            tr.Cells.Add(td1);
            tbl.Rows.Add(tr);
        }
        PlaceHolder1.Controls.Add(tbl);
       
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Session["designation"].ToString() != "Help desk personnel"))
        {
            Response.Redirect("access.aspx");
        }
     
        try
        {

            if ((Session["designation"].ToString() == "aa"))
            {
                Response.Redirect("access.aspx");
            }
        }
        catch
        {
            Response.Redirect("Cmshome1.aspx");
        }
        txtdoc.Text = DateTime.Now.ToString();
        if (!IsPostBack)
        {
            TabContainer1.ActiveTabIndex = 0;
        }
      
          
        
    }


    protected void TabContainer1_ActiveTabChanged(object sender, EventArgs e)
    {
                

    }
   
    protected void cbclientnme_SelectedIndexChanged1(object sender, EventArgs e)
    {
        Session["combosel"] = cbclientnme.SelectedValue;
    }
 
    protected void Button1_Click1(object sender, EventArgs e)
    {
        int i = 0,j=0;
          string[] cmbb= new string[10];
    foreach (AjaxControlToolkit.ComboBox tb in dynamiccombobox)
    {
     
       cmbb [i] = tb.SelectedItem.Text ;
       i++;
    }
      string[] tbb = new string[10];
    foreach (TextBox tb in dynamicTextBoxes)
    {
     
        tbb[j] = tb.Text;
        j++;
    }

        Hashtable data = new Hashtable();
        data.Add("client_id", cbclientnme.SelectedValue);
        data.Add("cc_id", cbclientcont.SelectedValue);
        data.Add("doc", txtdoc.Text);
        data.Add("probtype", cbprobtype.SelectedValue);
        data.Add("probsubtype", cbprobtype0.SelectedValue);
        data.Add("priority", ddlpriority.SelectedValue);
        data.Add("taskdesc", txtxtaskdesc.Text);
        data.Add("others", txtothers.Text);
        data.Add("emp_reg",Session["empid"]);
        data.Add("eta", txteta.Text);
        int a = Convert.ToInt32(Session["combosel"]);
        bll noof = new bll();
        int w, z,tn,cn,tc=0,cc=0;
        Hashtable datano = new Hashtable();
        datano = noof.noofrows(a);
        w = Convert.ToInt32(datano ["noofrows"]);
        tn = Convert.ToInt32(datano["nooftxt"]);
        cn = Convert.ToInt32(datano["noofcb"]);
        dynamicTextBoxes = new TextBox[tn];
        dynamiccombobox = new AjaxControlToolkit.ComboBox[cn];
        Table tbl = new Table();
        for (z = 0; z < w; z++)
        {

            bll cuscontrol = new bll();
            Hashtable data1 = new Hashtable();
            data1 = cuscontrol.ccomp(a, z);
            if (data1["control"].ToString() == "Textbox")
            {
                string value = data1["id"].ToString();
                value += ",";
                
               value+=tbb[tc];
               
               data.Add(z,  value);
               tc++;
            }
            else if (data1["control"].ToString() == "Combobox")
            {
                string value = data1["id"].ToString();
                value += ",";

                  value += cmbb [cc];
                data.Add(z, value);
                cc++;
            }
        }
        for (int h = w; h < 20; h++)
        {
            data.Add(h, "");
        }
        int id;
        bll inscomp = new bll();
        id=inscomp.inscomplaindet(data);
        lblretticketid.Text = "Complain Details Inserted & Ticket ID is " + id.ToString();

            
   
    }
    public static Control GetPostBackControl(Page thePage)
    {
        Control myControl = null;
        string ctrlName = thePage.Request.Params.Get("__EVENTTARGET");
        if (((ctrlName != null) & (ctrlName != string.Empty)))
        {
            myControl = thePage.FindControl(ctrlName);
        }
        else
        {
            foreach (string Item in thePage.Request.Form)
            {
                Control c = thePage.FindControl(Item);
                if (((c) is System.Web.UI.WebControls.Button))
                {
                    myControl = c;
                }
            }

        }
        return myControl;
    }

    protected void btninsert0_Click(object sender, EventArgs e)
    {
        Response.Redirect("complainfrm.aspx");
    }
}

