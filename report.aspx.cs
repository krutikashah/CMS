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
using System.IO;
using System.Text;
using System.Xml;
using iTextSharp.text;

using iTextSharp.text.pdf;

using iTextSharp.text.html;

using iTextSharp.text.html.simpleparser;


public partial class report : System.Web.UI.Page
{
  
    
 
   int count=0;
    protected void Page_Load(object sender, EventArgs e)
    {
     
     
        try
        {
            if (Session["designation"].ToString() == "ss")
            { 
            }
        }
            catch
        
            {
                Response.Redirect("CmsHome1.aspx");
            }
        
        if (!IsPostBack)
        {
            Session ["query"]= "select ticket_id, taskdesc, client_id,emp_technician,emp_shift,docomplain,probtype,priority,ticket_status from complain where ";
        }
        
    }
    protected void lbfilter_SelectedIndexChanged(object sender, EventArgs e)
    {
       

    }
    protected void LinkButton1_Click(object sender, EventArgs e)
     
    {
        if (lbfilter.SelectedValue == "Client Name")
        {
            lband.Enabled = true;
            LinkButton1.Enabled = false;
            upclient.Visible = true;
            cbclientname.Visible = true;
            lblclientname.Visible = true;
        }
        else if (lbfilter.SelectedValue == "Head")
        {
            lband.Enabled = true;
            LinkButton1.Enabled = false;
         uphead .Visible = true;
            cbemphead.Visible = true;
            lblhead.Visible = true;
        }


        else if (lbfilter.SelectedValue == "Technician")
        {
            lband.Enabled  = true;
            LinkButton1.Enabled  = false;
            uptechnician .Visible = true;
            cbtechnician.Visible = true;
            lbltechnician.Visible = true;
        }

        else if (lbfilter.SelectedValue == "Shift Engg")
        {
            lband.Enabled = true;
            LinkButton1.Enabled = false;
            upshift .Visible = true;
            cbshiftengg.Visible = true;
            lblshiftengg.Visible = true;
        }

        else if (lbfilter.SelectedValue == "Help Desk Personnel")
        {
            lband.Enabled = true;
            LinkButton1.Enabled = false;
            uphelpdesk .Visible = true;
            cbhelpdeskper.Visible = true;
            lblhelpdesk.Visible = true;

        }

        else if (lbfilter.SelectedValue == "Date Of Complain")
        {
            lband.Enabled = true;
            LinkButton1.Enabled = false;
            updocomplain.Visible = true;
            txtcompreg.Visible = true;
            lbldate.Visible = true;
        }

        else if (lbfilter.SelectedValue == "Problem Type")
        {
            lband.Enabled = true;
            LinkButton1.Enabled = false;
            upprobtype.Visible = true;
            cbprobtype.Visible = true;
            lblprobtype.Visible = true;
        }
        else if (lbfilter.SelectedValue == "Problem Subtype")
        {
            lband.Enabled = true;
            LinkButton1.Enabled = false;
            uprpbsubtype.Visible = true;
            cbprobsubtype.Visible = true;
            lblprobsubtype.Visible = true;
        }
        else if (lbfilter.SelectedValue == "Ticket Status")
        {
            lband.Enabled = true;
            LinkButton1.Enabled = false;
            upstatus.Visible = true;
            cbstatus.Visible = true;
            lblstatus.Visible = true;
        }
     else if (lbfilter.SelectedValue == "Priority")
        {
            lband.Enabled = true;
            LinkButton1.Enabled = false;
            uppriority.Visible = true;
            cbpriority.Visible = true;
            lblpriority.Visible = true;
        }






    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (txtcompreg.Text != "")
        {
            string str1 = Session["query"].ToString();
           DateTime date;
        
            date=Convert.ToDateTime (txtcompreg.Text );
            
            str1 += "docomplain BETWEEN '" + txtcompreg .Text  + "' AND '"+txtcompreg.Text+" 23:59:59.997' ";
            Session["query"] = str1;
  
        }
        //GridView1.Visible = true;
        bll clconn = new bll();
        DataTable dt = new DataTable();
        dt=clconn.connection(Session["query"].ToString());

        GridView2.DataSource = dt;
        GridView2.DataBind();
        btnexport.Visible = true;
        btnpdf.Visible = true;
   
        
    }
    protected void cbclientname_SelectedIndexChanged(object sender, EventArgs e)
    {
        //str += " ";
        string str1 = Session["query"].ToString ();
        str1 += "client_id='" + cbclientname.SelectedValue + "'";
      
        Session["query"] = str1;
        btnsearch.Visible = true;
        btnsearch.Enabled = true;

    }
    protected void cbpriority_SelectedIndexChanged(object sender, EventArgs e)
    {

        //str += " ";
        string str1 = Session["query"].ToString();

        str1 +="priority='"+cbpriority.SelectedValue+"'";
        Session["query"] = str1;
        btnsearch.Visible = true;
        btnsearch.Enabled = true;
    }

    protected void lband_Click(object sender, EventArgs e)
    {
        string str1 = Session["query"].ToString();

        str1 += " AND ";
       
        Session["query"]= str1;
        lband.Enabled = false ;
        LinkButton1.Enabled = true ;
        btnsearch.Enabled = false  ;
    }
    protected void cbemphead_SelectedIndexChanged(object sender, EventArgs e)
    {
        string str1 = Session["query"].ToString();

        str1 += "emp_head='" + cbemphead .SelectedValue + "'";
        Session["query"] = str1;
        btnsearch.Visible = true;
        btnsearch.Enabled = true;
    }
    protected void cbshiftengg_SelectedIndexChanged(object sender, EventArgs e)
    {
        string str1 = Session["query"].ToString();

        str1 += "emp_shift='" + cbshiftengg .SelectedValue + "'";
        Session["query"] = str1;
        btnsearch.Visible = true;
        btnsearch.Enabled = true;
    }
    protected void cbtechnician_SelectedIndexChanged(object sender, EventArgs e)
    {
        string str1 = Session["query"].ToString();

        str1 += "emp_technician='" + cbtechnician .SelectedValue + "'";
        Session["query"] = str1;
        btnsearch.Visible = true;
        btnsearch.Enabled = true;
    }
    protected void cbhelpdeskper_SelectedIndexChanged(object sender, EventArgs e)
    {
        string str1 = Session["query"].ToString();

        str1 += "emp_reg='" + cbhelpdeskper .SelectedValue + "'";
        Session["query"] = str1;
        btnsearch.Visible = true;
        btnsearch.Enabled = true;
    
    }
    protected void cbprobtype_SelectedIndexChanged(object sender, EventArgs e)
    {
        string str1 = Session["query"].ToString();

        str1 += "probtype='" + cbprobtype .SelectedValue + "'";
        Session["query"] = str1;
        btnsearch.Visible = true;
        btnsearch.Enabled = true;
    }
    protected void cbprobsubtype_SelectedIndexChanged(object sender, EventArgs e)
    {
        string str1 = Session["query"].ToString();

        str1 += "probsubtype='" + cbprobsubtype .SelectedValue + "'";
        Session["query"] = str1;
        btnsearch.Visible = true;
        btnsearch.Enabled = true;
    }
    protected void cbstatus_SelectedIndexChanged(object sender, EventArgs e)
    {
        string str1 = Session["query"].ToString();

        str1 += "ticket_status='" + cbstatus .SelectedValue + "'";
        Session["query"] = str1;
        btnsearch.Visible = true;
        btnsearch.Enabled = true;
    }
    protected void txtcompreg_TextChanged(object sender, EventArgs e)
    {
        //string str1 = Session["query"].ToString();

        //str1 += "docomplain LIKE '%" + txtcompreg.Text + "%'";
        //Session["query"] = str1;
        btnsearch.Visible = true;
        btnsearch.Enabled = true;
    }
  
    protected void Button1_Click2(object sender, EventArgs e)
    {
     

        Response.Clear();
        Response.AddHeader("content-disposition", "attachment;filename=FileName.xls");
        Response.Charset = "";

        // If you want the option to open the Excel file without saving then
        // comment out the line below
         Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.ContentType = "application/vnd.xls";
        System.IO.StringWriter stringWrite = new System.IO.StringWriter();
        System.Web.UI.HtmlTextWriter htmlWrite = new HtmlTextWriter(stringWrite);
        GridView2.RenderControl(htmlWrite);
        Response.Write(stringWrite.ToString());
        Response.End();

    }
    public override void VerifyRenderingInServerForm(Control control)
    {
        /* Confirms that an HtmlForm control is rendered for the specified ASP.NET
           server control at run time. */
    }


    protected void btncsv_Click(object sender, EventArgs e)
    {
        //Response.Clear();

        //StringBuilder sb = new StringBuilder();
        //StringWriter sw = new StringWriter(sb);
        //HtmlTextWriter htw = new HtmlTextWriter(sw);

        //GridView2.RenderControl(htw);

        //Response.ContentType = "application/pdf";
        //Response.AddHeader("content-disposition", "attachment; filename=MypdfFile.pdf");

        //Document document = new Document();


        //PdfWriter.GetInstance(document, Response.OutputStream);
        //document.Open();

        //string html = sb.ToString();

        //XmlTextReader reader = new XmlTextReader(new StringReader(html));
        //HtmlParser.Parse(document, reader);

        //document.Close();
        //sw.Close();

        //Response.Flush();
        //Response.End();

        //Response.Clear();
        //Response.AddHeader("content-disposition", "attachment;filename=FileName.pdf");
        //Response.Charset = "";

        //// If you want the option to open the Excel file without saving then
        //// comment out the line below
        //Response.Cache.SetCacheability(HttpCacheability.NoCache);
        //Response.ContentType = "application/pdf";
        //System.IO.StringWriter stringWrite = new System.IO.StringWriter();
        //System.Web.UI.HtmlTextWriter htmlWrite = new HtmlTextWriter(stringWrite);
        //GridView2.RenderControl(htmlWrite);
        //Response.Write(stringWrite.ToString());
        //Response.End();
        //Response.ContentType = "application/pdf";

        //Response.AddHeader("content-disposition",

        // "attachment;filename=GridViewExport.pdf");

        //Response.Cache.SetCacheability(HttpCacheability.NoCache);

        //StringWriter sw = new StringWriter();

        //HtmlTextWriter hw = new HtmlTextWriter(sw);

        //GridView2.AllowPaging = false;

        //GridView2.DataBind();

        //GridView2.RenderControl(hw);

        //StringReader sr = new StringReader(sw.ToString());

        //Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 10f, 0f);

        //HTMLWorker htmlparser = new HTMLWorker(pdfDoc);

        //PdfWriter.GetInstance(pdfDoc, Response.OutputStream);

        //pdfDoc.Open();

        //htmlparser.Parse(sr);

        ////pdfDoc.Close();

        //Response.Write(pdfDoc);

        //Response.End();  
        Response.ContentType = "application/pdf";
        Response.AddHeader("content-disposition", "attachment;filename=GridViewExport.pdf");
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        StringWriter sw = new StringWriter();
        HtmlTextWriter hw = new HtmlTextWriter(sw);
        //GridView2.AllowPaging = false; //gvEmployee is name of GridView
        //GridView2.DataBind();
        GridView2 .RenderControl(hw);
        StringReader sr = new StringReader(sw.ToString());
        Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 10f, 0f);
        HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
        PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
        pdfDoc.Open();
        htmlparser.Parse(sr);
        pdfDoc.Close();
        Response.Write(pdfDoc);
        Response.End();  
    }
}
