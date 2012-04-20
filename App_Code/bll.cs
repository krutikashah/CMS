using System;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using datasetinsassetinfoTableAdapters;
using System.Collections;
using System.Web.Mail;
using complaindsTableAdapters;
using clientdetailsTableAdapters;
using empdetaildsTableAdapters;
using ins3vendordetdsTableAdapters;
using clientcontactsdsTableAdapters;
using controlTableAdapters;
using loginTableAdapters;
using System .Windows .Forms ;


/// <summary>
/// ALL business logic
/// </summary>
namespace bllnamespace
{
    public class bll
    {

        public bll()
        {

        }

        public DataTable connection(string str)
        {


            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\assetdb.mdf;Integrated Security=True;User Instance=True";
            SqlCommand cmd = new SqlCommand(str, conn);
            conn.Open();
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();


            da.Fill(ds, "complain");
            dt = ds.Tables["complain"];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                int id;
                string str1;
                id = Convert.ToInt32(dt.Rows[i]["client_id"]);
                Hashtable clientname = new Hashtable();
                bll clselemp = new bll();
                clientname = clselemp.selclientdet(id);
                Hashtable data = new Hashtable();
                bll selemp = new bll();
                if (dt.Rows[i]["emp_shift"].ToString() != "")
                {
                    data = selemp.selempdet(Convert.ToInt32(dt.Rows[i]["emp_shift"]));
                    dt.Rows[i]["emp_shift"] = data["name"].ToString();
                }
                Hashtable data1 = new Hashtable();
                if (dt.Rows[i]["emp_technician"].ToString() != "")
                {

                    data1 = selemp.selempdet(Convert.ToInt32(dt.Rows[i]["emp_technician"]));
                    dt.Rows[i]["emp_technician"] = data1["name"].ToString();
                }
                dt.Rows[i]["client_id"] = clientname["org_name"];




            }
            return dt;



        }

        public DataTable clientview(string str)
        {


            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\assetdb.mdf;Integrated Security=True;User Instance=True";
            SqlCommand cmd = new SqlCommand(str, conn);
            conn.Open();
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();


            da.Fill(ds, "complain");
            dt = ds.Tables["complain"];


            return dt;



        }

        //equipment details 


        //delete
        public void delasset(int id)
        {
            datasetinsassetinfoTableAdapters.equipment_detailsTableAdapter eqpdetapi = new datasetinsassetinfoTableAdapters.equipment_detailsTableAdapter();
            datasetinsassetinfo.equipment_detailsDataTable eqpdets = new datasetinsassetinfo.equipment_detailsDataTable();
            eqpdets = eqpdetapi.Geteqpdetbyid(id);
            eqpdetapi.Delete(id);
            eqpdetapi.Update(eqpdets);

        }
        //amc notification
        public DataTable amcnotification()
        {
            datasetinsassetinfoTableAdapters.equipment_detailsTableAdapter eqpdetapi = new datasetinsassetinfoTableAdapters.equipment_detailsTableAdapter();
            datasetinsassetinfo.equipment_detailsDataTable eqpdets = new datasetinsassetinfo.equipment_detailsDataTable();
            eqpdets = eqpdetapi.Geteqpdet();
            DateTime startTime = DateTime.Now;
            DataTable dt = new DataTable();
            DataColumn dc;


            dc = new DataColumn();
            dc.ColumnName = "equipment_id";
            dt.Columns.Add(dc);
            dc = new DataColumn();
            dc.ColumnName = "manufacturer";
            dt.Columns.Add(dc);
            dc = new DataColumn();
            dc.ColumnName = "client_id";
            dt.Columns.Add(dc);
            for (int i = 0; i < eqpdets.Rows.Count; i++)
            {
                DataRow dr;
                dr = dt.NewRow();
                // dr = new DataRow();
                DateTime endTime = Convert.ToDateTime(eqpdets.Rows[i]["next_amc"]);
                TimeSpan span = endTime.Subtract(startTime);
                int noofdays = span.Days;
                if (eqpdets.Rows[i]["amc_notified"].ToString() == "no")
                {
                    if (noofdays <= 10)
                    {
                        dr["equipment_id"] = eqpdets.Rows[i]["equipment_id"];
                        dr["manufacturer"] = eqpdets.Rows[i]["manufacturer"];
                        dr["client_id"] = eqpdets.Rows[i]["client_id"];
                        dt.Rows.Add(dr);

                    }


                }

            }

            return dt;
        }

        //insert
        public int insastinfo(Hashtable data)
        {

            datasetinsassetinfoTableAdapters.equipment_detailsTableAdapter eqpdetapi = new datasetinsassetinfoTableAdapters.equipment_detailsTableAdapter();
            datasetinsassetinfo.equipment_detailsDataTable eqpdets = new datasetinsassetinfo.equipment_detailsDataTable();
            datasetinsassetinfo.equipment_detailsRow eqpdet = eqpdets.Newequipment_detailsRow();
            eqpdet.client_id = Convert.ToInt32(data["clientid"]);
            eqpdet.equipment_id = Convert.ToInt32(data["eqpid"]);
            // eqpdet.vendor_id = data["vendorid"].ToString();
            eqpdet.bldgno = data["bldgno"].ToString();
            eqpdet.eqp_type = data["eqptype"].ToString();
            eqpdet.blockno = data["blockno"].ToString();
            if (eqpdet.eqp_type != "Housing")
            {
                eqpdet.eqp_subtype = data["eqpsubtype"].ToString();
                eqpdet.manufacturer = data["mfg"].ToString();
                eqpdet.domfg = (data["domfg"]).ToString();
                eqpdet.dofinstallation = (data["doinst"]).ToString();
                eqpdet.lenofwarranty = Convert.ToInt32(data["lenwarranty"]);
                eqpdet.extdwarranty = Convert.ToInt32(data["extdwarranty"]);
                eqpdet.make = data["make"].ToString();
                eqpdet.model = (data["model"]).ToString();
                eqpdet.serial = data["serial"].ToString();
                eqpdet.tonnage = Convert.ToDecimal(data["tonnage"]);
                eqpdet.age = Convert.ToInt32(data["age"]);
                eqpdet.servingarea = data["servingarea"].ToString();
                eqpdet.optcurrent = Convert.ToDecimal(data["optcrt"]);
                eqpdet.optvol = Convert.ToDecimal(data["optvol"]);
                eqpdet.amcperiod = Convert.ToInt32(data["amcperiod"]);
                eqpdet.next_amc = data["nextamc"].ToString();
                eqpdet.last_amc = data["lastamc"].ToString();
            }

            eqpdet.amc_notified = "no";
            eqpdet.buildingname = data["bldgname"].ToString();
            eqpdet.wing = data["wind"].ToString();
            eqpdet.aptno = data["aptno"].ToString();
            eqpdet.floor = data["floor"].ToString();
            eqpdet.zone = data["zone"].ToString();
            eqpdet.roomtype = data["roomtype"].ToString();
            eqpdet.roomdetail = data["roomdetails"].ToString();

            eqpdet.otherdetails = data["otherdetails"].ToString();

            eqpdets.Addequipment_detailsRow(eqpdet);
            eqpdetapi.Update(eqpdets);

            //int newadded = Convert.ToInt32(eqpdet.equipment_id);
            //  int dif=DateTime .Compare (DateTime.Now ,Convert .ToDateTime (data["nextamc"]));     
            return eqpdet.equipment_id;
        }

        //select 

        public Hashtable seleqpdetbyid(int id)
        {

            datasetinsassetinfoTableAdapters.equipment_detailsTableAdapter eqpdetapi = new datasetinsassetinfoTableAdapters.equipment_detailsTableAdapter();
            datasetinsassetinfo.equipment_detailsDataTable eqpdets = new datasetinsassetinfo.equipment_detailsDataTable();
            eqpdets = eqpdetapi.Geteqpdetbyid(id);
            Hashtable data = new Hashtable();
            data.Add("eqpid", eqpdets.Rows[0]["equipment_id"]);
            data.Add("eqptype", eqpdets.Rows[0]["eqp_type"]);
            if ((eqpdets.Rows[0]["eqp_type"]) != "Housing")
            {
                data.Add("eqpsubtype", eqpdets.Rows[0]["eqp_subtype"]);
                data.Add("mfg", eqpdets.Rows[0]["manufacturer"]);
                data.Add("domfg", eqpdets.Rows[0]["domfg"]);
                data.Add("doinst", eqpdets.Rows[0]["dofinstallation"]);
                data.Add("lenwarranty", eqpdets.Rows[0]["lenofwarranty"]);
                data.Add("extdwarranty", eqpdets.Rows[0]["extdwarranty"]);
                data.Add("make", eqpdets.Rows[0]["make"]);
                data.Add("model", eqpdets.Rows[0]["model"]);
                data.Add("serial", eqpdets.Rows[0]["serial"]);
                data.Add("tonnage", eqpdets.Rows[0]["tonnage"]);
                data.Add("age", eqpdets.Rows[0]["age"]);
                data.Add("servingarea", eqpdets.Rows[0]["servingarea"]);
                data.Add("optcrt", eqpdets.Rows[0]["optcurrent"]);
                data.Add("optvol", eqpdets.Rows[0]["optvol"]);
                data.Add("amcperiod", eqpdets.Rows[0]["amcperiod"]);


            }
            data.Add("bldgno", eqpdets.Rows[0]["bldgno"]);
            data.Add("blockno", eqpdets.Rows[0]["blockno"]);

            data.Add("bldgname", eqpdets.Rows[0]["buildingname"]);
            data.Add("wind", eqpdets.Rows[0]["wing"]);
            data.Add("aptno", eqpdets.Rows[0]["aptno"]);
            data.Add("floor", eqpdets.Rows[0]["floor"]);
            data.Add("zone", eqpdets.Rows[0]["zone"]);
            data.Add("roomtype", eqpdets.Rows[0]["roomtype"]);
            data.Add("roomdetails", eqpdets.Rows[0]["roomdetail"]);
            data.Add("otherdetails", eqpdets.Rows[0]["otherdetails"]);

            return data;
        }

        // update

        public void eqpupd(Hashtable data)
        {
            datasetinsassetinfoTableAdapters.equipment_detailsTableAdapter eqpdetapi = new datasetinsassetinfoTableAdapters.equipment_detailsTableAdapter();
            datasetinsassetinfo.equipment_detailsDataTable eqpdets = new datasetinsassetinfo.equipment_detailsDataTable();
            // Hashtable data = new Hashtable();
            eqpdets = eqpdetapi.Geteqpdetbyid(Convert.ToInt16(data["eqpid"]));


            // eqpdets.Rows[0]["equipment_id"] =  data.Add("eqpid", );
            eqpdets.Rows[0]["eqp_type"] = data["eqptype"].ToString();
            if ((eqpdets.Rows[0]["eqp_type"]) != "Housing")
            {
                eqpdets.Rows[0]["eqp_subtype"] = data["eqpsubtype"].ToString();
                eqpdets.Rows[0]["manufacturer"] = data["mfg"].ToString();
                eqpdets.Rows[0]["dofinstallation"] = (data["doinst"]).ToString();
                eqpdets.Rows[0]["domfg"] = (data["domfg"]).ToString();
                eqpdets.Rows[0]["lenofwarranty"] = Convert.ToInt32(data["lenwarranty"]);
                eqpdets.Rows[0]["extdwarranty"] = Convert.ToInt32(data["extdwarranty"]);
                eqpdets.Rows[0]["make"] = data["make"].ToString();
                eqpdets.Rows[0]["model"] = data["model"].ToString();
                eqpdets.Rows[0]["serial"] = data["serial"].ToString();
                eqpdets.Rows[0]["tonnage"] = Convert.ToDecimal(data["tonnage"]);
                eqpdets.Rows[0]["age"] = Convert.ToInt32(data["age"]);
                eqpdets.Rows[0]["servingarea"] = data["servingarea"].ToString();
                eqpdets.Rows[0]["optcurrent"] = Convert.ToDecimal(data["optcrt"]);
                eqpdets.Rows[0]["optvol"] = Convert.ToDecimal(data["optvol"]);
                eqpdets.Rows[0]["amcperiod"] = Convert.ToInt32(data["amcperiod"]);

            }
            eqpdets.Rows[0]["bldgno"] = data["bldgno"].ToString();
            eqpdets.Rows[0]["blockno"] = data["blockno"].ToString();
            eqpdets.Rows[0]["buildingname"] = data["bldgname"].ToString();
            eqpdets.Rows[0]["wing"] = data["wind"].ToString();
            eqpdets.Rows[0]["aptno"] = data["aptno"].ToString();
            eqpdets.Rows[0]["floor"] = data["floor"].ToString();
            eqpdets.Rows[0]["zone"] = data["zone"].ToString();
            eqpdets.Rows[0]["roomtype"] = data["roomtype"].ToString();
            eqpdets.Rows[0]["roomdetail"] = data["roomdetails"].ToString();
            eqpdets.Rows[0]["otherdetails"] = data["otherdetails"].ToString();

            eqpdetapi.Update(eqpdets);

        }



        //complain details 
        //insert
        //public void inscomplaininfo(Hashtable insertdata)
        //{

        //    complaindsTableAdapters.complainTableAdapter compta = new complaindsTableAdapters.complainTableAdapter();
        //    complainds.complainDataTable compdt  = new complainds.complainDataTable ();
        //    complainds.complainRow complainrow = compdt.NewcomplainRow ();

        //   // complainrow.ticket_id = insertdata["ticket_id"].ToString();
        //    complainrow.org_name = insertdata["org_name"].ToString();
        //    complainrow.type = insertdata["type"].ToString();
        //    complainrow.eqp_type = insertdata["eqp_type"].ToString();
        //    complainrow.equipment_id = insertdata["equipment_id"].ToString();
        //    complainrow.emp_id = insertdata["emp_id"].ToString();
        //    complainrow.docomplain = Convert.ToDateTime(insertdata["docomplain"]);
        //    complainrow.complain_desc = insertdata["complain_desc"].ToString();
        //    complainrow.priority = insertdata["priority"].ToString();
        //    complainrow.ticket_status = insertdata["ticket_status"].ToString();
        //    complainrow.dorepair = Convert.ToDateTime ( insertdata["dorepair"]);
        //    complainrow.eta = insertdata["eta"].ToString();
        //    complainrow.ata = insertdata["ata"].ToString();
        //    complainrow.estcost = Convert.ToDecimal(insertdata["estcost"]);
        //    complainrow.actcost = Convert.ToDecimal(insertdata["actcost"]);
        //    complainrow.comment = insertdata["comment"].ToString();

        //    complaindt.Addcomplain_detailsRow(complainrow);
        //    complainta.Update(complaindt);

        //    MessageBox.Show("information successfully entered!! & ur ticket id is  "+complainrow.ticket_id );



        //}




        //client details
        //insert
        public int clientdetinfo(Hashtable data)
        {
           

                clientdetailsTableAdapters.client_detailsTableAdapter clientta = new clientdetailsTableAdapters.client_detailsTableAdapter();
                clientdetails.client_detailsDataTable clientdt = new clientdetails.client_detailsDataTable();
                clientdetails.client_detailsRow clientrow = clientdt.Newclient_detailsRow();
                //clientrow.client_id = data["clientid"].ToString();
                clientrow.org_name = data["org_name"].ToString();
                clientrow.address = data["address"].ToString();
                clientrow.phoneno = data["phoneno"].ToString();
                clientrow.emailid = data["emailid"].ToString();
                clientrow.orgtype = data["orgtype"].ToString();

                clientdt.Addclient_detailsRow(clientrow);

                clientta.Update(clientdt);


                loginTableAdapters.loginTableAdapter loginta = new loginTableAdapters.loginTableAdapter();
                login.loginDataTable logindt = new login.loginDataTable();
                login.loginRow loginrow = logindt.NewloginRow();
                string str = "client";

                str += clientrow.client_id;
                string password = CreateRandomPassword(8);
                //char[] plaintextchar = new char[8];
                //plaintextchar =Convert .ToChar (CreateRandomPassword  (8));
                int key;
                key = 4;
                //string plainstring="";
                string cipherstring = "";
                char[] plaintextchar = new char[8];
                for (int i = 0; i < 8; i++)
                {
                    plaintextchar[i] = Convert.ToChar(password[i]);
                }
                char[] ciphertextchar = new char[8];
                //for (int p = 0; p < 8; p++)
                //{
                //    plaintextchar[i] = password[i];
                //}


                for (int ind = 0; ind < 8; ind++)
                {
                    if (plaintextchar[ind] >= 'a' && plaintextchar[ind] <= 'z' || plaintextchar[ind] >= 'A' && plaintextchar[ind] <= 'Z')
                    {
                        ciphertextchar[ind] = Convert.ToChar((Convert.ToInt32(plaintextchar[ind])) + key);
                    }
                    else
                    {
                        ciphertextchar[ind] = plaintextchar[ind];
                    }
                }

                cipherstring = new string(ciphertextchar);



                loginrow.username = str;
                loginrow.password = cipherstring;
                loginrow.emp_id = clientrow.client_id;
                loginrow.user = "client";
                logindt.AddloginRow(loginrow);
                loginta.Update(loginrow);

                //mail
                System.Web.Mail.MailMessage mail = new System.Web.Mail.MailMessage();
                mail.From = "cms.iflcm@gmail.com";
                mail.To = data["emailid"].ToString(); ;
                mail.Subject = "Client Username and Password";
                mail.BodyFormat = System.Web.Mail.MailFormat.Html;
                mail.Body = "Dear Client" + "</br>" + "You have been now registered as a client of IFLCM and your username is " + str + " and password is " + password + "</br></br></br></br></br>" + "Thanking You" + "</br></br>" + "IFLCM TEAM";

                System.Web.Mail.SmtpMail.SmtpServer = "smtp.gmail.com";
                //System.Web.Mail.SmtpMail.SmtpServer = "smtp.mail.yahoo.com";
                mail.Fields.Add("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate", "1");
                mail.Fields.Add("http://schemas.microsoft.com/cdo/configuration/sendusername", "cms.iflcm@gmail.com");
                mail.Fields.Add("http://schemas.microsoft.com/cdo/configuration/sendpassword", "cmsiflcm");
                // - smtp.gmail.com use port 465 or 587
                mail.Fields.Add("http://schemas.microsoft.com/cdo/configuration/smtpserverport", "465");
                //mail.Fields.Add("http://schemas.microsoft.com/cdo/configuration/smtpserverport", "25");
                mail.Fields.Add("http://schemas.microsoft.com/cdo/configuration/smtpusessl", "true");
                try
                {
                    //System.Web.Mail.Send(mail);
                    System.Web.Mail.SmtpMail.Send(mail);
                    // Response.Write("Mail is Sent..!!");
                }
                catch (Exception ex)
                {
                    //return ex.Message;
                    //  Response.Write("Error - " + ex.Message);
                }

                return (clientrow.client_id);

                
            
         

           
        }

        //select
        public Hashtable selclientdet(int id)
        {
          
                clientdetailsTableAdapters.client_detailsTableAdapter clientta = new clientdetailsTableAdapters.client_detailsTableAdapter();
                clientdetails.client_detailsDataTable clientdt = new clientdetails.client_detailsDataTable();
                clientdt = clientta.Getclientbyid(id);
                Hashtable data = new Hashtable();
                data.Add("org_name", clientdt.Rows[0]["org_name"]);
                data.Add("address", clientdt.Rows[0]["address"]);
                data.Add("phoneno", clientdt.Rows[0]["phoneno"]);
                data.Add("emailid", clientdt.Rows[0]["emailid"]);
                data.Add("orgtype", clientdt.Rows[0]["orgtype"]);


                return data;
        
        }
        //update
        public void upclientdet(Hashtable data)
        {
            try
            {
                clientdetailsTableAdapters.client_detailsTableAdapter clientta = new clientdetailsTableAdapters.client_detailsTableAdapter();
                clientdetails.client_detailsDataTable clientdt = new clientdetails.client_detailsDataTable();
                clientdt = clientta.Getclientbyid(Convert.ToInt32(data["client_id"]));
                clientdt.Rows[0]["org_name"] = data["org_name"].ToString();
                clientdt.Rows[0]["address"] = data["address"].ToString();
                clientdt.Rows[0]["phoneno"] = data["phoneno"].ToString();
                clientdt.Rows[0]["emailid"] = data["emailid"].ToString();
                clientdt.Rows[0]["orgtype"] = data["orgtype"].ToString();
                clientta.Update(clientdt);

            }
            catch (Exception e)
            {
                MessageBox.Show(e.Message );

            }
        }
        //delete

        public void delclient(int id)
        {
            try
            {
                clientdetailsTableAdapters.client_detailsTableAdapter clientta = new clientdetailsTableAdapters.client_detailsTableAdapter();
                clientdetails.client_detailsDataTable clientdt = new clientdetails.client_detailsDataTable();
                clientdt = clientta.Getclientbyid(id);

                clientta.Delete(id);
                clientta.Update(clientdt);
            }
            catch (Exception e)
            {
                MessageBox.Show(e.Message );
            }

        }

        //employee details
        //insert

        //encryption for pwd

        //public string pwd(string str)
        //{
        //    int i;
        //    string encpwd;
        //    for (i = 0; i < str.Length; i++)
        //    {
        //    }
        //    return pwd;
        //}
        public int insempdet(Hashtable data)
        {


            empdetaildsTableAdapters.emp_detailsTableAdapter empapi = new empdetaildsTableAdapters.emp_detailsTableAdapter();
            empdetailds.emp_detailsDataTable empdt = new empdetailds.emp_detailsDataTable();
            empdetailds.emp_detailsRow emprow = empdt.Newemp_detailsRow();
            emprow.name = data["name"].ToString();
            emprow.dob = (data["dob"]).ToString();
            emprow.address = data["adrs"].ToString();
            emprow.phoneno = Convert.ToInt32(data["phoneno"]);
            emprow.emailid = data["emailid"].ToString();
            emprow.designation = data["designation"].ToString();
            emprow.dept = data["dept"].ToString();
            if (data["designation"].ToString() != "Head")
            {
                if (data["headname"].ToString() != "")
                {
                    emprow.headname = data["headname"].ToString();
                    emprow.headid = Convert.ToInt32(data["headid"]);
                }
            }
            emprow.description = data["desc"].ToString();
            emprow.count = 0;
            // emprow.assignedemp = data["empunder"].ToString();
            empdt.Addemp_detailsRow(emprow);
            empapi.Update(empdt);

            loginTableAdapters.loginTableAdapter loginta = new loginTableAdapters.loginTableAdapter();
            login.loginDataTable logindt = new login.loginDataTable();
            login.loginRow loginrow = logindt.NewloginRow();
            string str;
            if (data["designation"].ToString() == "Shift engg")
            {
                 str = "Shiftengg";
            }
            else if (data["designation"].ToString() == "Help desk personnel")
            {
              str = "Helpdesk";
            }
            else
            {
           str = "Head";
            }

            str += data["dept"].ToString();
            str += emprow.emp_id;
            string password = CreateRandomPassword(8);
            //char[] plaintextchar = new char[8];
            //plaintextchar =Convert .ToChar (CreateRandomPassword  (8));
            int key;
            key = 4;
            //string plainstring="";
            string cipherstring = "";
            char[] plaintextchar = new char[8];
            for (int i = 0; i < 8; i++)
            {
                plaintextchar[i] = Convert.ToChar(password[i]);
            }
            char[] ciphertextchar = new char[8];
            //for (int p = 0; p < 8; p++)
            //{
            //    plaintextchar[i] = password[i];
            //}


            for (int ind = 0; ind < 8; ind++)
            {
                if (plaintextchar[ind] >= 'a' && plaintextchar[ind] <= 'z' || plaintextchar[ind] >= 'A' && plaintextchar[ind] <= 'Z')
                {
                    ciphertextchar[ind] = Convert.ToChar((Convert.ToInt32(plaintextchar[ind])) + key);
                }
                else
                {
                    ciphertextchar[ind] = plaintextchar[ind];
                }
            }

            cipherstring = new string(ciphertextchar);



            loginrow.username = str;
            loginrow.password = cipherstring;
            loginrow.emp_id = emprow.emp_id;
            loginrow.user = "employee";
            logindt.AddloginRow(loginrow);
            loginta.Update(loginrow);

            //mail
            System.Web.Mail.MailMessage mail = new System.Web.Mail.MailMessage();
            mail.From = "cms.iflcm@gmail.com";
            mail.To = data["emailid"].ToString(); ;
            mail.Subject = "Employee Username and Password";
            mail.BodyFormat = System.Web.Mail.MailFormat.Html;
            mail.Body = "Dear Employee" + "</br>" + "You have been now registered as an employee of IFLCM and your username is " + str + " and password is " + password + "</br></br></br></br></br>" + "Thanking You" + "</br></br>" + "IFLCM TEAM";

            System.Web.Mail.SmtpMail.SmtpServer = "smtp.gmail.com";
            //System.Web.Mail.SmtpMail.SmtpServer = "smtp.mail.yahoo.com";
            mail.Fields.Add("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate", "1");
            mail.Fields.Add("http://schemas.microsoft.com/cdo/configuration/sendusername", "cms.iflcm@gmail.com");
            mail.Fields.Add("http://schemas.microsoft.com/cdo/configuration/sendpassword", "cmsiflcm");
            // - smtp.gmail.com use port 465 or 587
            mail.Fields.Add("http://schemas.microsoft.com/cdo/configuration/smtpserverport", "465");
            //mail.Fields.Add("http://schemas.microsoft.com/cdo/configuration/smtpserverport", "25");
            mail.Fields.Add("http://schemas.microsoft.com/cdo/configuration/smtpusessl", "true");
            try
            {
                //System.Web.Mail.Send(mail);
                System.Web.Mail.SmtpMail.Send(mail);
                // Response.Write("Mail is Sent..!!");
            }
            catch (Exception ex)
            {
                //return ex.Message;
                //  Response.Write("Error - " + ex.Message);
            }

            return emprow.emp_id;
        }
        //random passwords
        public string CreateRandomPassword(int PasswordLength)
        {
            string _allowedChars = "abcdefghijkmnopqrstuvwxyzABCDEFGHJKLMNOPQRSTUVWXYZ0123456789";
            Random randNum = new Random();
            char[] chars = new char[PasswordLength];
            int allowedCharCount = _allowedChars.Length;

            for (int i = 0; i < PasswordLength; i++)
            {
                chars[i] = _allowedChars[(int)((_allowedChars.Length) * randNum.NextDouble())];
            }

            return new string(chars);
        }

        //select

        public Hashtable selempdet(int id)
        {
            try
            {
                empdetaildsTableAdapters.emp_detailsTableAdapter empapi = new empdetaildsTableAdapters.emp_detailsTableAdapter();
                empdetailds.emp_detailsDataTable empdt = new empdetailds.emp_detailsDataTable();
                empdt = empapi.Getempdetbyid(id);
                Hashtable data = new Hashtable();
                data.Add("empid", empdt.Rows[0]["emp_id"]);
                data.Add("name", empdt.Rows[0]["name"]);
                data.Add("dob", empdt.Rows[0]["dob"]);
                data.Add("adrs", empdt.Rows[0]["address"]);
                data.Add("phoneno", empdt.Rows[0]["phoneno"]);
                data.Add("emailid", empdt.Rows[0]["emailid"]);
                data.Add("designation", empdt.Rows[0]["designation"]);
                data.Add("dept", empdt.Rows[0]["dept"]);

                if (empdt.Rows[0]["designation"] != "Head")
                {
                    data.Add("headname", empdt.Rows[0]["headname"]);
                    data.Add("headid", empdt.Rows[0]["headid"]);


                }

                data.Add("desc", empdt.Rows[0]["description"]);
                //data.AsQueryable("empunder", empdt.Rows[0]["empunder"]);
                return data;
            }
            catch
            {
                Hashtable data = new Hashtable();
                data.Add("name", "");
                data.Add("empid", "");
                return data;
            }
        }

        //delete

        public void delempdet(int id)
        {
            empdetaildsTableAdapters.emp_detailsTableAdapter empapi = new empdetaildsTableAdapters.emp_detailsTableAdapter();
            empdetailds.emp_detailsDataTable empdt = new empdetailds.emp_detailsDataTable();
            empdt = empapi.Getempdetbyid(id);
            empapi.Delete(id);
            empapi.Update(empdt);


        }

        //update
        public void upemp(Hashtable data)
        {
            empdetaildsTableAdapters.emp_detailsTableAdapter empapi = new empdetaildsTableAdapters.emp_detailsTableAdapter();
            empdetailds.emp_detailsDataTable empdt = new empdetailds.emp_detailsDataTable();
            empdt = empapi.Getempdetbyid(Convert.ToInt32(data["empid"]));
            empdt.Rows[0]["name"] = data["name"].ToString();
            empdt.Rows[0]["dob"] = (data["dob"]).ToString();
            empdt.Rows[0]["address"] = data["adrs"].ToString();
            empdt.Rows[0]["phoneno"] = Convert.ToInt32(data["phoneno"]);
            empdt.Rows[0]["emailid"] = data["emailid"].ToString();
            empdt.Rows[0]["designation"] = data["designation"].ToString();
            empdt.Rows[0]["dept"] = data["dept"].ToString();
            if (data["designation"].ToString() != "Head")
            {
                if (data["headname"].ToString() != "")
                {
                    empdt.Rows[0]["headname"] = data["headname"].ToString();
                    empdt.Rows[0]["headid"] = Convert.ToInt32(data["headid"]);

                }
            }


            empdt.Rows[0]["description"] = data["desc"].ToString();
            empapi.Update(empdt);

        }


        //updatehead


        public void uphead(Hashtable data)
        {
            empdetaildsTableAdapters.emp_detailsTableAdapter empapi = new empdetaildsTableAdapters.emp_detailsTableAdapter();
            empdetailds.emp_detailsDataTable empdt = new empdetailds.emp_detailsDataTable();
            empdt = empapi.Getempdetbyid(Convert.ToInt32(data["empheadchange"]));
            empdt.Rows[0]["headname"] = data["empheadname"].ToString();
            empdt.Rows[0]["headid"] = Convert.ToInt32(data["empheadid"]);
            empapi.Update(empdt);

        }
        //return emp id
        public int empid(string str)
        {
            empdetaildsTableAdapters.emp_detailsTableAdapter empapi = new empdetaildsTableAdapters.emp_detailsTableAdapter();
            empdetailds.emp_detailsDataTable empdt = new empdetailds.emp_detailsDataTable();
            empdt = empapi.Getemphead(str);
            int id;
            id = Convert.ToInt32(empdt.Rows[0]["emp_id"]);
            return id;

        }
        public int empidshift(string str)
        {
            empdetaildsTableAdapters.emp_detailsTableAdapter empapi = new empdetaildsTableAdapters.emp_detailsTableAdapter();
            empdetailds.emp_detailsDataTable empdt = new empdetailds.emp_detailsDataTable();
            empdt = empapi.Getempshift(str);
            int id;
            id = Convert.ToInt32(empdt.Rows[0]["emp_id"]);
            return id;

        }

        //3 party vendor

        //delete 

        public void delthirdvendor(int id)
        {
            ins3vendordetdsTableAdapters.vendor3_detailsTableAdapter vendorapi = new ins3vendordetdsTableAdapters.vendor3_detailsTableAdapter();
            ins3vendordetds.vendor3_detailsDataTable vendordt = new ins3vendordetds.vendor3_detailsDataTable();
            vendordt = vendorapi.GetDatavendor3detbyid(id);
            vendorapi.Delete(id);
            vendorapi.Update(vendordt);


        }


        //insert

        public int ins3vendordet(Hashtable data)
        {
            ins3vendordetdsTableAdapters.vendor3_detailsTableAdapter vendorapi = new ins3vendordetdsTableAdapters.vendor3_detailsTableAdapter();
            ins3vendordetds.vendor3_detailsDataTable vendordt = new ins3vendordetds.vendor3_detailsDataTable();
            ins3vendordetds.vendor3_detailsRow vendorrow = vendordt.Newvendor3_detailsRow();

            vendorrow.cmpname = data["cmpname"].ToString();
            vendorrow.address = data["adrs"].ToString();
            vendorrow.phoneno = data["phoneno"].ToString ();
            vendorrow.emailid = data["emailid"].ToString();
            vendorrow.servingarea = data["servingarea"].ToString();
            vendorrow.p1name = data["p1name"].ToString();
            vendorrow.p1phoneno = data["p1phoneno"].ToString ();
            vendorrow.p1desc = data["p1desc"].ToString();
            vendorrow.p2name = data["p2name"].ToString();
            if ((data["p2name"].ToString()) != "")
            {
                vendorrow.p2phoneno = data["p2phoneno"].ToString ();

            }

            vendorrow.p2desc = data["p2desc"].ToString();
            vendorrow.p3name = data["p3name"].ToString();
            if ((data["p3name"].ToString()) != "")
            {
                vendorrow.p3phoneno = data["p3phoneno"].ToString ();

            }
            vendorrow.p3desc = data["p3desc"].ToString();
            vendordt.Addvendor3_detailsRow(vendorrow);
            vendorapi.Update(vendordt);
            return vendorrow.vendor_id;

        }

        //select

        public Hashtable sel3vendorbyid(int id)
        {

            ins3vendordetdsTableAdapters.vendor3_detailsTableAdapter vendorapi = new ins3vendordetdsTableAdapters.vendor3_detailsTableAdapter();
            ins3vendordetds.vendor3_detailsDataTable vendordt = new ins3vendordetds.vendor3_detailsDataTable();
            vendordt = vendorapi.GetDatavendor3detbyid(id);
            Hashtable data = new Hashtable();
            data.Add("vendorid", vendordt.Rows[0]["vendor_id"]);
            data.Add("cmpname", vendordt.Rows[0]["cmpname"]);
            data.Add("adrs", vendordt.Rows[0]["address"]);
            data.Add("phoneno", vendordt.Rows[0]["phoneno"]);
            data.Add("emailid", vendordt.Rows[0]["emailid"]);
            data.Add("servingarea", vendordt.Rows[0]["servingarea"]);
            data.Add("p1name", vendordt.Rows[0]["p1name"]);
            data.Add("p1phoneno", vendordt.Rows[0]["p1phoneno"]);
            data.Add("p1desc", vendordt.Rows[0]["p1desc"]);
            data.Add("p2name", vendordt.Rows[0]["p2name"]);
            data.Add("p2phoneno", vendordt.Rows[0]["p2phoneno"]);
            data.Add("p2desc", vendordt.Rows[0]["p2desc"]);
            data.Add("p3name", vendordt.Rows[0]["p3name"]);
            data.Add("p3phoneno", vendordt.Rows[0]["p3phoneno"]);
            data.Add("p3desc", vendordt.Rows[0]["p3desc"]);
            return data;

        }

        //update
        public void up3vendor(Hashtable data)
        {
            ins3vendordetdsTableAdapters.vendor3_detailsTableAdapter vendorapi = new ins3vendordetdsTableAdapters.vendor3_detailsTableAdapter();
            ins3vendordetds.vendor3_detailsDataTable vendordt = new ins3vendordetds.vendor3_detailsDataTable();
            vendordt = vendorapi.GetDatavendor3detbyid(Convert.ToInt32(data["vendorid"]));

            vendordt.Rows[0]["cmpname"] = data["cmpname"].ToString();
            vendordt.Rows[0]["address"] = data["adrs"].ToString();
            vendordt.Rows[0]["phoneno"] = Convert.ToInt32(data["phoneno"]);
            vendordt.Rows[0]["emailid"] = data["emailid"].ToString();
            vendordt.Rows[0]["servingarea"] = data["servingarea"].ToString();
            vendordt.Rows[0]["p1name"] = data["p1name"].ToString();
            vendordt.Rows[0]["p1phoneno"] = data["p1phoneno"].ToString ();
            vendordt.Rows[0]["p1desc"] = data["p1desc"].ToString();
            vendordt.Rows[0]["p2name"] = data["p2name"].ToString();
            if(data["p2phoneno"].ToString ()!="")
            {
            vendordt.Rows[0]["p2phoneno"] =data["p2phoneno"].ToString ();
            }
            vendordt.Rows[0]["p2desc"] = data["p2desc"].ToString();
            vendordt.Rows[0]["p3name"] = data["p3name"].ToString();
            if (data["p3phoneno"].ToString() != "")
            {
                vendordt.Rows[0]["p3phoneno"] = data["p3phoneno"].ToString();
            }
            vendordt.Rows[0]["p3desc"] = data["p3desc"].ToString();
            vendorapi.Update(vendordt);

        }

        //clientcontact details

        //delete

        public void delclientcontact(int id)
        {
            clientcontactsdsTableAdapters.clientcontact_detailsTableAdapter clientcontta = new clientcontactsdsTableAdapters.clientcontact_detailsTableAdapter();
            clientcontactsds.clientcontact_detailsDataTable clientcontdt = new clientcontactsds.clientcontact_detailsDataTable();
            clientcontdt = clientcontta.Getclientcontbyid(id);
            clientcontta.Delete(id);
            clientcontta.Update(clientcontdt);


        }



        //insert

        public int insclientcontactdet(Hashtable data)
        {
            clientcontactsdsTableAdapters.clientcontact_detailsTableAdapter clientcontta = new clientcontactsdsTableAdapters.clientcontact_detailsTableAdapter();
            clientcontactsds.clientcontact_detailsDataTable clientcontdt = new clientcontactsds.clientcontact_detailsDataTable();
            clientcontactsds.clientcontact_detailsRow clientcontrow = clientcontdt.Newclientcontact_detailsRow();

            clientcontrow.client_id = Convert.ToInt32(data["client_id"]);
            clientcontrow.asset_id = Convert.ToInt32(data["asset_id"]);
            clientcontrow.name = data["name"].ToString();
            clientcontrow.phoneno = data["phoneno"].ToString();
            clientcontrow.emailid = data["emailid"].ToString();
            clientcontrow.desg = data["desg"].ToString();
            clientcontrow.desc = data["desc"].ToString();

            clientcontdt.Addclientcontact_detailsRow(clientcontrow);
            clientcontta.Update(clientcontdt);
            return clientcontrow.cc_id;



        }

        //select

        public Hashtable selclientcontbyid(int id)
        {
            clientcontactsdsTableAdapters.clientcontact_detailsTableAdapter clientcontta = new clientcontactsdsTableAdapters.clientcontact_detailsTableAdapter();
            clientcontactsds.clientcontact_detailsDataTable clientcontdt = new clientcontactsds.clientcontact_detailsDataTable();
            clientcontdt = clientcontta.Getclientcontbyid(id);


            Hashtable data = new Hashtable();
            data.Add("cc_id", clientcontdt.Rows[0]["cc_id"]);
            data.Add("asset_id", clientcontdt.Rows[0]["asset_id"]);
            data.Add("name", clientcontdt.Rows[0]["name"]);
            data.Add("phoneno", clientcontdt.Rows[0]["phoneno"]);
            data.Add("emailid", clientcontdt.Rows[0]["emailid"]);
            data.Add("desg", clientcontdt.Rows[0]["desg"]);
            data.Add("desc", clientcontdt.Rows[0]["desc"]);

            return data;

        }

        //update


        public void updclientcontbyid(Hashtable data)
        {
            clientcontactsdsTableAdapters.clientcontact_detailsTableAdapter clientcontta = new clientcontactsdsTableAdapters.clientcontact_detailsTableAdapter();
            clientcontactsds.clientcontact_detailsDataTable clientcontdt = new clientcontactsds.clientcontact_detailsDataTable();
            clientcontdt = clientcontta.Getclientcontbyid(Convert.ToInt32(data["cc_id"]));

            //  clientcontdt .Rows [0]["cc_id"]=Convert .ToInt32 ( data["cc_id"]);
            // clientcontdt .Rows [0]["asset_id"]=Convert.ToInt32(data["asset_id"]);
            clientcontdt.Rows[0]["name"] = data["name"].ToString();

            clientcontdt.Rows[0]["phoneno"] = data["phoneno"].ToString();
            clientcontdt.Rows[0]["emailid"] = data["emailid"].ToString();
            clientcontdt.Rows[0]["desg"] = data["desg"].ToString();
            clientcontdt.Rows[0]["desc"] = data["desc"].ToString();
            clientcontta.Update(clientcontdt);



        }

        //complain details
        //insert

        public int inscomplaindet(Hashtable data)
        {

            complaindsTableAdapters.complainTableAdapter compta = new complaindsTableAdapters.complainTableAdapter();
            complainds.complainDataTable compdt = new complainds.complainDataTable();
            complainds.complainRow comprow = compdt.NewcomplainRow();


            comprow.client_id = data["client_id"].ToString();
            comprow.cc_id = data["cc_id"].ToString();
            comprow.docomplain = Convert.ToDateTime(data["doc"]);
            comprow.probtype = data["probtype"].ToString();
            comprow.probsubtype = data["probsubtype"].ToString();
            comprow.priority = data["priority"].ToString();
            comprow.others = data["others"].ToString();
            comprow.taskdesc = data["taskdesc"].ToString();
            comprow.eta = data["eta"].ToString();

            comprow.emp_reg = data["emp_reg"].ToString();
            comprow.field1 = data[0].ToString();
            comprow.field2 = data[1].ToString();
            comprow.field3 = data[2].ToString();
            comprow.field4 = data[3].ToString();
            comprow.field5 = data[4].ToString();
            comprow.field6 = data[5].ToString();
            comprow.field7 = data[6].ToString();
            comprow.field8 = data[7].ToString();
            comprow.field9 = data[8].ToString();
            comprow.field10 = data[9].ToString();
            comprow.field11 = data[10].ToString();
            comprow.field12 = data[11].ToString();
            comprow.field13 = data[12].ToString();
            comprow.field14 = data[13].ToString();
            comprow.field15 = data[14].ToString();
            comprow.field16 = data[15].ToString();
            comprow.field17 = data[16].ToString();
            comprow.field18 = data[17].ToString();
            comprow.field19 = data[18].ToString();
            comprow.field20 = data[19].ToString();
            bll clempid = new bll();
            string str;
            str = "";
            if (data["probtype"].ToString() == "Housing")
            {
                str = data["probsubtype"].ToString();
            }
            else if (data["probtype"].ToString() == "Fixed Asset")
            {
                if (data["probsubtype"].ToString() == "Fittings")
                    str = "Plumbing";
                if (data["probsubtype"].ToString() == "Lift")
                    str = "Electrical";
                if (data["probsubtype"].ToString() == "Water Tank")
                    str = "Plumbing";
                if (data["probsubtype"].ToString() == "Others")
                    str = data["probsubtype"].ToString();

            }
            else
            {
                str = data["probtype"].ToString();
            }
            int id;

            if (data["priority"].ToString() == "Critical" )
            {
                id = clempid.empidshift(str);
                comprow.emp_shift = id.ToString();

                comprow.ticket_status = "Escalate to Help Desk";
            }
            else
            {
                id = clempid.empid(str);
                comprow.emp_head = id.ToString();
                comprow.ticket_status = "Open";
            }


            compdt.AddcomplainRow(comprow);
            compta.Update(compdt);
            if (data["priority"].ToString() == "Critical" )
            {
                Hashtable data2 = new Hashtable();
                data2.Add("ticket_id", comprow.ticket_id);
                data2.Add("desc", "inform shift engg that new there is new complain for  '" + data["client_id"].ToString() + "' and task description is '" + data["taskdesc"].ToString() + "' ");
                data2.Add("pk", id);
                data2.Add("dbname", "employee");
                bll helptakt = new bll();
                helptakt.inshelptas(data2);
            }
            bll clemail = new bll();
            Hashtable data1 = new Hashtable();
            data1 = clemail.selclientdet(Convert.ToInt32(data["client_id"]));
            string emaild;
            emaild = data1["emailid"].ToString();

            System.Web.Mail.MailMessage mail = new System.Web.Mail.MailMessage();
            mail.From = "cms.iflcm@gmail.com";
            mail.To = emaild;
            mail.Subject = "Complain Reference Number";
            mail.BodyFormat = System.Web.Mail.MailFormat.Html;
            mail.Body = "Dear Client" + "</br>" + "Your complain has been registered and Ticket ID is " + comprow.ticket_id + "</br></br></br></br></br>" + "Thanking You" + "</br></br>" + "IFLCM TEAM";

            System.Web.Mail.SmtpMail.SmtpServer = "smtp.gmail.com";
            //System.Web.Mail.SmtpMail.SmtpServer = "smtp.mail.yahoo.com";
            mail.Fields.Add("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate", "1");
            mail.Fields.Add("http://schemas.microsoft.com/cdo/configuration/sendusername", "cms.iflcm@gmail.com");
            mail.Fields.Add("http://schemas.microsoft.com/cdo/configuration/sendpassword", "cmsiflcm");
            // - smtp.gmail.com use port 465 or 587
            mail.Fields.Add("http://schemas.microsoft.com/cdo/configuration/smtpserverport", "465");
            //mail.Fields.Add("http://schemas.microsoft.com/cdo/configuration/smtpserverport", "25");
            mail.Fields.Add("http://schemas.microsoft.com/cdo/configuration/smtpusessl", "true");
            try
            {
                //System.Web.Mail.Send(mail);
                System.Web.Mail.SmtpMail.Send(mail);
                // Response.Write("Mail is Sent..!!");
            }
            catch (Exception ex)
            {
                //return ex.Message;
                //  Response.Write("Error - " + ex.Message);
            }

            return comprow.ticket_id;


        }




        //select
        //update




        //customized complain select
        public Hashtable ccomp(int a, int b)
        {
            controlTableAdapters.customizedcomplainTableAdapter capi = new controlTableAdapters.customizedcomplainTableAdapter();
            control.customizedcomplainDataTable cdt = new control.customizedcomplainDataTable();
            cdt = capi.Getcontrol(a);


            Hashtable data = new Hashtable();
            data.Add("id", cdt.Rows[b]["fields"]);
            data.Add("control", cdt.Rows[b]["control"]);
            data.Add("value", cdt.Rows[b]["value"]);
            data.Add("dbname", cdt.Rows[b]["dbname"]);
            data.Add("label", cdt.Rows[b]["label"]);
            data.Add("validation", cdt.Rows[b]["validation"]);

            return data;
        }

        public Hashtable ccomp1(int a)
        {
            controlTableAdapters.customizedcomplainTableAdapter capi = new controlTableAdapters.customizedcomplainTableAdapter();
            control.customizedcomplainDataTable cdt = new control.customizedcomplainDataTable();
            cdt = capi.Getcntrlbyid(a);


            Hashtable data = new Hashtable();
            data.Add("id", cdt.Rows[0]["fields"]);
            data.Add("control", cdt.Rows[0]["control"]);
            data.Add("value", cdt.Rows[0]["value"]);
            data.Add("dbname", cdt.Rows[0]["dbname"]);
            data.Add("label", cdt.Rows[0]["label"]);
            data.Add("validation", cdt.Rows[0]["validation"]);

            return data;




        }


        public Hashtable noofrows(int a)
        {
            controlTableAdapters.customizedcomplainTableAdapter capi = new controlTableAdapters.customizedcomplainTableAdapter();
            control.customizedcomplainDataTable cdt = new control.customizedcomplainDataTable();
            cdt = capi.Getcontrol(a);
            int p = cdt.Rows.Count;
            int i, tb = 0, cb = 0;
            for (i = 0; i < p; i++)
            {
                if (cdt.Rows[i]["control"].ToString() == "Textbox")
                {
                    tb++;
                }
                else if (cdt.Rows[i]["control"].ToString() == "Combobox")
                {
                    cb++;
                }
            }
            Hashtable data = new Hashtable();
            data.Add("noofrows", p);
            data.Add("nooftxt", tb);
            data.Add("noofcb", cb);
            return data;


        }
        public string Getbldgno(int a)
        {

            bldgnodsTableAdapters.equipment_detailsTableAdapter api = new bldgnodsTableAdapters.equipment_detailsTableAdapter();
            bldgnods.equipment_detailsDataTable dt = new bldgnods.equipment_detailsDataTable();
            dt = api.Getbldgno(Convert.ToInt32(a));

            Hashtable data = new Hashtable();
            int i;

            string commaDelimeted;
            string[] s = new string[dt.Rows.Count];
            string q;
            for (i = 0; i < dt.Rows.Count; i++)
            {
                q = dt.Rows[i]["bldgno"].ToString();
                s[i] = q;



            }
            string idstring = string.Join(",", s);


            return idstring;
        }

        //login check

        public Hashtable sellogin(Hashtable data)
        {
            string uname = data["username"].ToString();
            string pwdtyped = data["password"].ToString();
            int key;
            key = 4;

            string cipherstring = "";
            int index = Convert.ToInt32(data["length"]);
            char[] plaintextchar = new char[index];
            char[] ciphertextchar = new char[index];
            for (int ind = 0; ind < index; ind++)
            {
                plaintextchar[ind] = Convert.ToChar(pwdtyped[ind]);
            }


            for (int ind = 0; ind < index; ind++)
            {
                if (plaintextchar[ind] >= 'a' && plaintextchar[ind] <= 'z' || plaintextchar[ind] >= 'A' && plaintextchar[ind] <= 'Z')
                {
                    ciphertextchar[ind] = Convert.ToChar((Convert.ToInt32(plaintextchar[ind])) + key);
                }
                else
                {
                    ciphertextchar[ind] = plaintextchar[ind];
                }
            }

            cipherstring = new string(ciphertextchar);


            loginTableAdapters.loginTableAdapter loginta = new loginTableAdapters.loginTableAdapter();
            login.loginDataTable logindt = new login.loginDataTable();
            logindt = loginta.Getsellogin(uname, cipherstring);
            int id;
            Hashtable retval = new Hashtable();

            if (logindt.Rows.Count != 0)
            {
                retval.Add("securityques", logindt.Rows[0]["securityques"]);
                retval.Add("securityans", logindt.Rows[0]["securityans"]);
                retval.Add("emp_id", logindt.Rows[0]["emp_id"]);
                retval.Add("user", logindt.Rows[0]["user"]);
                //id = Convert .ToInt32 (logindt .Rows[0]["emp_id"]);
            }
            else
            {
                retval.Add("securityques", "");
                retval.Add("securityans", "");
                // id = 0;
                int id1;
                id1 = 0;
                retval.Add("emp_id", id1);


            }
            return retval;
        }

        //select with 3 criterias for forgot pwd

        public int forgotpwd(Hashtable data)
        {
            string username = data["username"].ToString();
            string securityques = data["securityques"].ToString();
            string securityans = data["securityans"].ToString();
            loginTableAdapters.loginTableAdapter loginta = new loginTableAdapters.loginTableAdapter();
            login.loginDataTable logindt = new login.loginDataTable();
            logindt = loginta.Getforgotpwd(username, securityques, securityans);
            int id;
            int id1;
            string pwd;

            if (logindt.Rows.Count != 0)
            {
                id = Convert.ToInt32(logindt.Rows[0]["emp_id"]);
                pwd = logindt.Rows[0]["password"].ToString();
                int key;
                key = 4;

                string plainstring = "";

                char[] plaintextchar = new char[pwd.Length];
                for (int i = 0; i < pwd.Length; i++)
                {
                    plaintextchar[i] = Convert.ToChar(pwd[i]);
                }
                //string str = data["password"].ToString();
                for (int ind = 0; ind < pwd.Length; ind++)
                {

                    if (plaintextchar[ind] >= 'a' && plaintextchar[ind] <= 'z' || plaintextchar[ind] >= 'A' && plaintextchar[ind] <= 'Z')
                    {
                        plaintextchar[ind] = Convert.ToChar((Convert.ToInt32(plaintextchar[ind])) - key);
                    }
                    else
                    {
                        plaintextchar[ind] = plaintextchar[ind];
                    }
                }
                plainstring = new string(plaintextchar);


                Hashtable retval = new Hashtable();
                bll clemail = new bll();
                retval = clemail.selempdet(id);
                // retval.Add("emailid", retval["emailid"].ToString ());
                //mail
                System.Web.Mail.MailMessage mail = new System.Web.Mail.MailMessage();
                mail.From = "cms.iflcm@gmail.com";
                mail.To = retval["emailid"].ToString();
                mail.Subject = "Employee Username and Password";
                mail.BodyFormat = System.Web.Mail.MailFormat.Html;
                mail.Body = "Dear Employee" + "</br>" + "Your password is " + plainstring + "</br></br></br></br></br>" + "Thanking You" + "</br></br>" + "IFLCM TEAM";

                System.Web.Mail.SmtpMail.SmtpServer = "smtp.gmail.com";
                //System.Web.Mail.SmtpMail.SmtpServer = "smtp.mail.yahoo.com";
                mail.Fields.Add("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate", "1");
                mail.Fields.Add("http://schemas.microsoft.com/cdo/configuration/sendusername", "cms.iflcm@gmail.com");
                mail.Fields.Add("http://schemas.microsoft.com/cdo/configuration/sendpassword", "cmsiflcm");
                // - smtp.gmail.com use port 465 or 587
                mail.Fields.Add("http://schemas.microsoft.com/cdo/configuration/smtpserverport", "465");
                //mail.Fields.Add("http://schemas.microsoft.com/cdo/configuration/smtpserverport", "25");
                mail.Fields.Add("http://schemas.microsoft.com/cdo/configuration/smtpusessl", "true");
                try
                {
                    //System.Web.Mail.Send(mail);
                    System.Web.Mail.SmtpMail.Send(mail);
                    // Response.Write("Mail is Sent..!!");
                }
                catch (Exception ex)
                {
                    //return ex.Message;
                    //  Response.Write("Error - " + ex.Message);
                }
                //id = Convert .ToInt32 (logindt .Rows[0]["emp_id"]);
            }
            else
            {
                id = 0;


            }
            return id;
        }
        //change pwd.questnd ans
        public void registration(Hashtable data)
        {


            loginTableAdapters.loginTableAdapter loginta = new loginTableAdapters.loginTableAdapter();
            login.loginDataTable logindt = new login.loginDataTable();
            logindt = loginta.Getafterlogin(Convert.ToInt32(data["emp_id"]));
            // loginrow.username = data["username"].ToString();
            int key;
            key = 4;

            string cipherstring = "";

            char[] ciphertextchar = new char[Convert.ToInt32(data["length"])];

            string str = data["password"].ToString();
            char[] plaintextchar = new char[Convert.ToInt32(data["length"])];
            for (int i = 0; i < Convert.ToInt32(data["length"]); i++)
            {
                plaintextchar[i] = Convert.ToChar(str[i]);
            }

            for (int ind = 0; ind < Convert.ToInt32(data["length"]); ind++)
            {

                if (plaintextchar[ind] >= 'a' && plaintextchar[ind] <= 'z' || plaintextchar[ind] >= 'A' && plaintextchar[ind] <= 'Z')
                {
                    ciphertextchar[ind] = Convert.ToChar((Convert.ToInt32(plaintextchar[ind])) + key);
                }
                else
                {
                    ciphertextchar[ind] = plaintextchar[ind];
                }
            }
            cipherstring = new string(ciphertextchar);
            if (data["t"].ToString() == "all")
            {
                logindt.Rows[0]["password"] = cipherstring;
                //logindt.Rows[0]["password"] = data["password"].ToString();
                logindt.Rows[0]["securityques"] = data["securityques"].ToString();

                logindt.Rows[0]["securityans"] = data["securityans"].ToString();
            }
            else if (data["t"].ToString() == "password")
            {
                logindt.Rows[0]["password"] = cipherstring;
                //logindt.Rows[0]["password"] = data["password"].ToString();
            }
            loginta.Update(logindt);
            return;

        }




        //select complain
        public Hashtable selcomp(int id)
        {
            string commade;
            commade = "";

            complaindsTableAdapters.complainTableAdapter compta = new complaindsTableAdapters.complainTableAdapter();
            complainds.complainDataTable compdt = new complainds.complainDataTable();
            compdt = compta.Getcompbyid(id);

            Hashtable data = new Hashtable();
            //data.Add("ticket_id", id);
            data.Add("client_id", compdt.Rows[0]["client_id"]);
            Hashtable data1 = new Hashtable();
            bll selname = new bll();

            data1 = selname.selclientcontbyid(Convert.ToInt32(compdt.Rows[0]["cc_id"]));

            data.Add("cc_id", data1["name"].ToString());
            //data.Add("cc_id", compdt.Rows[0]["client_id"]);
            data.Add("docomplain", compdt.Rows[0]["docomplain"]);
            data.Add("probtype", compdt.Rows[0]["probtype"]);
            data.Add("probsubtype", compdt.Rows[0]["probsubtype"]);
            data.Add("priority", compdt.Rows[0]["priority"]);
            data.Add("taskdesc", compdt.Rows[0]["taskdesc"]);
            data.Add("others", compdt.Rows[0]["others"]);
            data.Add("ticket_id", compdt.Rows[0]["ticket_id"]);
            data.Add("assetid", compdt.Rows[0]["assetid"]);
            //data.Add("emp_shift", compdt.Rows[0]["emp_shift"]);
            //data.Add("emp_technician",compdt.Rows[0]["emp_technician"]);

            data.Add("ticket_status", compdt.Rows[0]["ticket_status"]);
            data.Add("dorepair", compdt.Rows[0]["dorepair"]);
            data.Add("eta", compdt.Rows[0]["eta"]);
            data.Add("ata", compdt.Rows[0]["ata"]);
            data.Add("cost", compdt.Rows[0]["cost"]);


            data.Add(0, compdt.Rows[0]["field1"]);
            data.Add(1, compdt.Rows[0]["field2"]);
            data.Add(2, compdt.Rows[0]["field3"]);
            data.Add(3, compdt.Rows[0]["field4"]);
            data.Add(4, compdt.Rows[0]["field5"]);
            data.Add(5, compdt.Rows[0]["field6"]);
            data.Add(6, compdt.Rows[0]["field7"]);
            data.Add(7, compdt.Rows[0]["field8"]);
            data.Add(8, compdt.Rows[0]["field9"]);
            data.Add(9, compdt.Rows[0]["field10"]);
            data.Add(10, compdt.Rows[0]["field11"]);
            data.Add(11, compdt.Rows[0]["field12"]);
            data.Add(12, compdt.Rows[0]["field13"]);
            data.Add(13, compdt.Rows[0]["field14"]);
            data.Add(14, compdt.Rows[0]["field15"]);
            data.Add(15, compdt.Rows[0]["field16"]);
            data.Add(16, compdt.Rows[0]["field17"]);
            data.Add(17, compdt.Rows[0]["field18"]);
            data.Add(18, compdt.Rows[0]["field19"]);
            data.Add(19, compdt.Rows[0]["field20"]);

            Hashtable data2 = new Hashtable();
            bll selemp = new bll();
            if ((compdt.Rows[0]["emp_reg"]).ToString() != "")
            {
                data2 = selemp.selempdet(Convert.ToInt32(compdt.Rows[0]["emp_reg"]));
                data.Add("emp_reg", data2["name"]);
            }
            else
            {
                data.Add("emp_reg", compdt.Rows[0]["emp_reg"]);
            }

            if ((compdt.Rows[0]["emp_head"]).ToString() != "")
            {
                data2 = selemp.selempdet(Convert.ToInt32(compdt.Rows[0]["emp_head"]));
                data.Add("emp_head", data2["name"]);
            }
            else
            {
                data.Add("emp_head", compdt.Rows[0]["emp_head"]);
            }

            if ((compdt.Rows[0]["emp_technician"]).ToString() != "")
            {
                data2 = selemp.selempdet(Convert.ToInt32(compdt.Rows[0]["emp_technician"]));
                data.Add("emp_technician", data2["name"]);
            }
            else
            {
                data.Add("emp_technician", compdt.Rows[0]["emp_technician"]);
            }

            if ((compdt.Rows[0]["emp_shift"]).ToString() != "")
            {
                data2 = selemp.selempdet(Convert.ToInt32(compdt.Rows[0]["emp_shift"]));
                data.Add("emp_shift", data2["name"]);
            }
            else
            {
                data.Add("emp_shift", compdt.Rows[0]["emp_shift"]);
            }


            data.Add("atc", compdt.Rows[0]["atc"]);
            data.Add("partsrequired", compdt.Rows[0]["partsrequired"]);
            data.Add("partdesc", compdt.Rows[0]["partdesc"]);
            data.Add("customerpayment", compdt.Rows[0]["customerpayment"]);
            data.Add("labourcost", compdt.Rows[0]["labourcost"]);
            data.Add("additionalcost", compdt.Rows[0]["additionalcost"]);
            data.Add("partscost", compdt.Rows[0]["partscost"]);
            data.Add("total", compdt.Rows[0]["total"]);
            data.Add("tax", compdt.Rows[0]["tax"]);
            data.Add("grandtotal", compdt.Rows[0]["grandtotal"]);
            data.Add("workdonehead", compdt.Rows[0]["workdonehead"]);
            data.Add("workdoneshift", compdt.Rows[0]["workdoneshift"]);
            data.Add("workdonetechnician", compdt.Rows[0]["workdonetechnician"]);

            for (int k = 0; k < 20; k++)
            {
                if (data[k].ToString() != "")
                {
                    commade += data[k].ToString();
                    commade += ",";
                }

            }
            data.Add("fullstring", commade);
            return data;

        }
        //update comp
        public void compupd(Hashtable data)
        {
            complaindsTableAdapters.complainTableAdapter compta = new complaindsTableAdapters.complainTableAdapter();
            complainds.complainDataTable compdt = new complainds.complainDataTable();
            compdt = compta.Getcompbyid(Convert.ToInt32(data["ticket_id"]));

            compdt.Rows[0]["others"] = data["others"].ToString();
            compdt.Rows[0]["taskdesc"] = data["taskdesc"].ToString();
            compdt.Rows[0]["ticket_status"] = data["ticket_status"].ToString();
            if (data["dorepair"].ToString() != "")
            {
                compdt.Rows[0]["dorepair"] = Convert.ToDateTime(data["dorepair"]);
            }
            compdt.Rows[0]["assetid"] = data["assetid"].ToString();
            compdt.Rows[0]["workdonetechnician"] = data["workdonetechnician"].ToString();
            compta.Update(compdt);
            if (data["ticket_status"].ToString() == "Close")
            {

                bll delhelptask1 = new bll();
                delhelptask1.delhelptast(Convert.ToInt32(data["ticket_id"]));
            }
        }

        //update emp complain

        public void updempcomp(Hashtable data)
        {
            complaindsTableAdapters.complainTableAdapter compta = new complaindsTableAdapters.complainTableAdapter();
            complainds.complainDataTable compdt = new complainds.complainDataTable();
            compdt = compta.Getcompbyid(Convert.ToInt32(data["ticket_id"]));
            if (data["update"].ToString() != "none")
            {
                if (data["update"].ToString() == "shift")
                {
                    compdt.Rows[0]["emp_shift"] = data["emp_shift"].ToString();
                }
                else if (data["update"].ToString() == "technician")
                {
                    compdt.Rows[0]["emp_technician"] = data["emp_technician"].ToString();
                }
            }
            compdt.Rows[0]["ticket_status"] = data["ticket_status"].ToString();
            compdt.Rows[0]["dorepair"] = data["dorepair"].ToString();
            compdt.Rows[0]["ata"] = data["ata"].ToString();
           
            compdt.Rows[0]["others"] = data["others"].ToString();
            compdt.Rows[0]["taskdesc"] = data["taskdesc"].ToString();
            compdt.Rows[0]["workdonehead"] = data["workdonehead"].ToString();
            compdt.Rows[0]["workdoneshift"] = data["workdoneshift"].ToString();
            compdt.Rows[0]["workdonetechnician"] = data["workdonetechnician"].ToString();
            compdt.Rows[0]["partsrequired"] = data["partsrequired"].ToString();
            compdt.Rows[0]["partdesc"] = data["partsdesc"].ToString();
            compdt.Rows[0]["customerpayment"] = data["customerpayment"].ToString();
            compdt.Rows[0]["labourcost"] = data["labourcost"].ToString();
            compdt.Rows[0]["additionalcost"] = data["additionalcost"].ToString();
            compdt.Rows[0]["partscost"] = data["partscost"].ToString();
            compdt.Rows[0]["total"] = data["total"].ToString();
            compdt.Rows[0]["tax"] = data["tax"].ToString();
            compdt.Rows[0]["grandtotal"] = data["grandtotal"].ToString();
            if (data["assetid"].ToString() != "")
            {
                compdt.Rows[0]["assetid"] = data["assetid"].ToString();
            }
            if (data["ticket_status"].ToString() == "Close")
            {
                DateTime docomplain, dorepair;
                docomplain = Convert.ToDateTime(compdt.Rows[0]["docomplain"]);
                dorepair = Convert.ToDateTime(data["dorepair"]);
                
                TimeSpan span = dorepair .Subtract(docomplain );
                int noofdays = span.Days;
                compdt.Rows[0]["atc"] = noofdays .ToString() +" days";

            }
            compta.Update(compdt);
            if (data["ticket_status"].ToString() == "Close")
            {
                Hashtable data2 = new Hashtable();
                bll delhelptask1 = new bll();
                data2 = delhelptask1.selhelp(Convert.ToInt32(data["ticket_id"]));
                if (data2["desc"].ToString() != "")
                {
                    delhelptask1.delhelptast(Convert.ToInt32(data["ticket_id"]));
                }
                
            
            }
        }
        //customised controls
        //insert
        public int inscontrol(Hashtable data)
        {


            controlTableAdapters.customizedcomplainTableAdapter controlta = new controlTableAdapters.customizedcomplainTableAdapter();
            control.customizedcomplainDataTable controldt = new control.customizedcomplainDataTable();
            control.customizedcomplainRow controlrow = controldt.NewcustomizedcomplainRow();

            controlrow.client_id = Convert.ToInt32(data["client_id"]);
            controlrow.control = data["control"].ToString();
            controlrow.value = data["value"].ToString();
            controlrow.dbname = data["dbname"].ToString();
            controlrow.label = data["label"].ToString();
            controlrow.validation = data["description"].ToString();



            controldt.AddcustomizedcomplainRow(controlrow);
            controlta.Update(controldt);
            return controlrow.fields;


        }
        //select
        public Hashtable selcontrol(int id)
        {
            controlTableAdapters.customizedcomplainTableAdapter controlta = new controlTableAdapters.customizedcomplainTableAdapter();
            control.customizedcomplainDataTable controldt = new control.customizedcomplainDataTable();
            controldt = controlta.Getcntrlbyid(id);

            Hashtable data = new Hashtable();

            data.Add("control", controldt.Rows[0]["control"]);
            data.Add("value", controldt.Rows[0]["value"]);
            data.Add("dbname", controldt.Rows[0]["dbname"]);
            data.Add("description", controldt.Rows[0]["validation"]);
            data.Add("label", controldt.Rows[0]["label"]);

            return data;


        }

        //update
        public void updcontrol(Hashtable data)
        {
            controlTableAdapters.customizedcomplainTableAdapter controlta = new controlTableAdapters.customizedcomplainTableAdapter();
            control.customizedcomplainDataTable controldt = new control.customizedcomplainDataTable();
            controldt = controlta.Getcntrlbyid(Convert.ToInt32(data["id"]));

            controldt.Rows[0]["label"] = data["label"].ToString();
            controldt.Rows[0]["value"] = data["value"].ToString();
            controldt.Rows[0]["dbname"] = data["dbname"].ToString();
            controldt.Rows[0]["validation"] = data["description"].ToString();
            controldt.Rows[0]["control"] = data["control"].ToString();
            controlta.Update(controldt);
        }


        //delete

        public void delcontrol(int id)
        {
            controlTableAdapters.customizedcomplainTableAdapter controlta = new controlTableAdapters.customizedcomplainTableAdapter();
            control.customizedcomplainDataTable controldt = new control.customizedcomplainDataTable();
            controldt = controlta.Getcntrlbyid(id);
            controlta.Delete(id);
            controlta.Update(controldt);
        }
        // help desk peson task
        //select
        public Hashtable selhelp(int id)
        {
            try
            {
                helpdeskTableAdapters.helpdesktaskTableAdapter helpta = new helpdeskTableAdapters.helpdesktaskTableAdapter();
                helpdesk.helpdesktaskDataTable helpdt = new helpdesk.helpdesktaskDataTable();
                helpdt = helpta.Gethelpbyid(id);
                Hashtable data = new Hashtable();
                data.Add("desc", helpdt.Rows[0]["desc"]);
                data.Add("pk", helpdt.Rows[0]["pk"]);
                data.Add("dbname", helpdt.Rows[0]["dbname"]);
                return data;
            }
            catch
            {
                Hashtable data = new Hashtable();
                data.Add("desc", "");
                return data;
            }
        }

        // delete
        public void delhelptast(int id)
        {
            helpdeskTableAdapters.helpdesktaskTableAdapter helpta = new helpdeskTableAdapters.helpdesktaskTableAdapter();
            helpdesk.helpdesktaskDataTable helpdt = new helpdesk.helpdesktaskDataTable();
            helpdt = helpta.Gethelpbyid(id);
            helpta.Delete(id);
            helpta.Update(helpdt);

        }
        // send mail for feedback
        public Hashtable feedbackmail(int id)
        {
            complaindsTableAdapters.complainTableAdapter compta = new complaindsTableAdapters.complainTableAdapter();
            complainds.complainDataTable compdt = new complainds.complainDataTable();
            compdt = compta.Getcompbyid(Convert.ToInt32(id));
            int clientid;
            clientid = Convert.ToInt32(compdt.Rows[0]["client_id"]);
            Hashtable data = new Hashtable();
            clientdetailsTableAdapters.client_detailsTableAdapter clientta = new clientdetailsTableAdapters.client_detailsTableAdapter();
            clientdetails.client_detailsDataTable clientdt = new clientdetails.client_detailsDataTable();
            clientdt = clientta.Getclientbyid(Convert.ToInt32(clientid));
            Hashtable data1 = new Hashtable();
            data.Add("ticket_id", id);
            data.Add("emailid", clientdt.Rows[0]["emailid"]);
            data.Add("body", "http://localhost:3047/asset/Feedbackform.aspx?Ticketid=" + id + "");
            return data;
        }


        // update status
        public void upcomphelp(Hashtable data)
        {
            complaindsTableAdapters.complainTableAdapter compta = new complaindsTableAdapters.complainTableAdapter();
            complainds.complainDataTable compdt = new complainds.complainDataTable();
            compdt = compta.Getcompbyid(Convert.ToInt32(data["ticket_id"]));
            compdt.Rows[0]["ticket_status"] = data["ticket_status"].ToString();
            string headid, shiftid, technicianid;
            headid = compdt.Rows[0]["emp_head"].ToString();
            shiftid = compdt.Rows[0]["emp_shift"].ToString();
            technicianid = compdt.Rows[0]["emp_technician"].ToString();
            compta.Update(compdt);
            if (headid != "")
            {
                empdetaildsTableAdapters.emp_detailsTableAdapter empapi = new empdetaildsTableAdapters.emp_detailsTableAdapter();
                empdetailds.emp_detailsDataTable empdt = new empdetailds.emp_detailsDataTable();
                empdt = empapi.Getempdetbyid(Convert.ToInt32(headid));
                int count;
                count = Convert.ToInt32(empdt.Rows[0]["count"]);
                count = count - 1;
                empdt.Rows[0]["count"] = count;
                empapi.Update(empdt);
            }

            if (shiftid != "")
            {
                empdetaildsTableAdapters.emp_detailsTableAdapter empapi = new empdetaildsTableAdapters.emp_detailsTableAdapter();
                empdetailds.emp_detailsDataTable empdt = new empdetailds.emp_detailsDataTable();
                empdt = empapi.Getempdetbyid(Convert.ToInt32(shiftid));
                int count;
                count = Convert.ToInt32(empdt.Rows[0]["count"]);
                count = count - 1;
                empdt.Rows[0]["count"] = count;
                empapi.Update(empdt);
            }

            if (technicianid != "")
            {
                empdetaildsTableAdapters.emp_detailsTableAdapter empapi = new empdetaildsTableAdapters.emp_detailsTableAdapter();
                empdetailds.emp_detailsDataTable empdt = new empdetailds.emp_detailsDataTable();
                empdt = empapi.Getempdetbyid(Convert.ToInt32(technicianid));
                int count;
                count = Convert.ToInt32(empdt.Rows[0]["count"]);
                count = count - 1;
                empdt.Rows[0]["count"] = count;
                empapi.Update(empdt);
            }


            if (data["ticket_status"].ToString() == "Close")
            {
                Hashtable data2 = new Hashtable();
                bll delhelptask1 = new bll();
                data2 = delhelptask1.selhelp(Convert.ToInt32(data["ticket_id"]));
                if (data2["desc"].ToString() != "")
                {
                    delhelptask1.delhelptast(Convert.ToInt32(data["ticket_id"]));
                }

                empdetaildsTableAdapters.emp_detailsTableAdapter empapi = new empdetaildsTableAdapters.emp_detailsTableAdapter();
                empdetailds.emp_detailsDataTable empdt = new empdetailds.emp_detailsDataTable();
                empdt = empapi.Getempdetbyid(Convert.ToInt32(data["empid"]));

            }
        }
        //insert
        public void inshelptas(Hashtable data)
        {
            Hashtable data2 = new Hashtable();
            bll delhelptask1 = new bll();
            data2 = delhelptask1.selhelp(Convert.ToInt32(data["ticket_id"]));
            if (data2["desc"] == "")
            {
                helpdeskTableAdapters.helpdesktaskTableAdapter helpta = new helpdeskTableAdapters.helpdesktaskTableAdapter();
                helpdesk.helpdesktaskDataTable helpdt = new helpdesk.helpdesktaskDataTable();
                helpdesk.helpdesktaskRow helprow = helpdt.NewhelpdesktaskRow();
                helprow.ticket_id = Convert.ToInt32(data["ticket_id"]);
                helprow.desc = data["desc"].ToString();
                helprow.pk = Convert.ToInt32(data["pk"]);
                helprow.dbname = data["dbname"].ToString();
                helpdt.AddhelpdesktaskRow(helprow);
                helpta.Update(helpdt);
            }
            else
            {
                helpdeskTableAdapters.helpdesktaskTableAdapter helpta = new helpdeskTableAdapters.helpdesktaskTableAdapter();
                helpdesk.helpdesktaskDataTable helpdt = new helpdesk.helpdesktaskDataTable();
                helpdt = helpta.Gethelpbyid(Convert.ToInt32(data["ticket_id"]));
                helpdt.Rows[0]["desc"] = data["desc"].ToString();
                helpdt.Rows[0]["pk"] = Convert.ToInt32(data["pk"]);
                helpdt.Rows[0]["dbname"] = (data["dbname"]).ToString();
                helpta.Update(helpdt);
            }


        }



        //charts
        //complain type

        public DataTable sample()
        {
            DataTable dt = new DataTable();
            DataColumn dc;

            dc = new DataColumn();
            dc.ColumnName = "clientid";
            dt.Columns.Add(dc);
            dc = new DataColumn();
            dc.ColumnName = "critical";
            dt.Columns.Add(dc);
            dc = new DataColumn();
            dc.ColumnName = "regular";
            dt.Columns.Add(dc);

            clientdetailsTableAdapters.client_detailsTableAdapter clientta = new clientdetailsTableAdapters.client_detailsTableAdapter();
            clientdetails.client_detailsDataTable clientdt = new clientdetails.client_detailsDataTable();
            clientdt = clientta.Getchartclient();
            int i;
            for (i = 0; i < clientdt.Rows.Count; i++)
            {

                DataRow dr;
                dr = dt.NewRow();

                clientdetailsTableAdapters.client_detailsTableAdapter clientta1 = new clientdetailsTableAdapters.client_detailsTableAdapter();
                clientdetails.client_detailsDataTable clientdt1 = new clientdetails.client_detailsDataTable();
                clientdt1 = clientta1.Getclientbyid(Convert.ToInt32(clientdt.Rows[i]["client_id"]));
                dr["clientid"] = clientdt1.Rows[0]["org_name"];
                string id = (clientdt.Rows[i]["client_id"]).ToString();
                complaindsTableAdapters.complainTableAdapter compta = new complaindsTableAdapters.complainTableAdapter();
                complainds.complainDataTable compdt = new complainds.complainDataTable();
                compdt = compta.Getchart((id).ToString(), "Regular");
                int countreg = compdt.Rows.Count;
                dr["regular"] = countreg;
                string id1 = (clientdt.Rows[i]["client_id"]).ToString();

                complaindsTableAdapters.complainTableAdapter compta1 = new complaindsTableAdapters.complainTableAdapter();
                complainds.complainDataTable compdt1 = new complainds.complainDataTable();
                compdt1 = compta1.Getchart(id1.ToString(), "Critical");
                int countcri = compdt1.Rows.Count;
                dr["critical"] = countcri;
                dt.Rows.Add(dr);
            }

            return dt;
        }

        //update feedback

        public void feedback(Hashtable data)
        {
            complaindsTableAdapters.complainTableAdapter compta = new complaindsTableAdapters.complainTableAdapter();
            complainds.complainDataTable compdt = new complainds.complainDataTable();
            compdt = compta.Getcompbyid(Convert.ToInt32(data["ticket_id"]));
            compdt.Rows[0]["clientsatisfied"] = data["clientsatisfied"].ToString();

            compta.Update(compdt);
        }

        public void empcount(int id)
        {
            empdetaildsTableAdapters.emp_detailsTableAdapter empapi = new empdetaildsTableAdapters.emp_detailsTableAdapter();
            empdetailds.emp_detailsDataTable empdt = new empdetailds.emp_detailsDataTable();
            empdt = empapi.Getempdetbyid(Convert.ToInt32(id));
            int count;
            count = Convert.ToInt32(empdt.Rows[0]["count"]);
            count = count + 1;
            empdt.Rows[0]["count"] = count;
            empapi.Update(empdt);
        }

        public int vendorid(string cmpname)
        {
            ins3vendordetdsTableAdapters.vendor3_detailsTableAdapter vendorapi = new ins3vendordetdsTableAdapters.vendor3_detailsTableAdapter();
            ins3vendordetds.vendor3_detailsDataTable vendordt = new ins3vendordetds.vendor3_detailsDataTable();
            vendordt = vendorapi.Getmfg(cmpname);
            return Convert.ToInt32(vendordt.Rows[0]["vendor_id"]);
        }
        public void amcnotify(int id)
        {
            datasetinsassetinfoTableAdapters.equipment_detailsTableAdapter eqpdetapi = new datasetinsassetinfoTableAdapters.equipment_detailsTableAdapter();
            datasetinsassetinfo.equipment_detailsDataTable eqpdets = new datasetinsassetinfo.equipment_detailsDataTable();
            // Hashtable data = new Hashtable();
            eqpdets = eqpdetapi.Geteqpdetbyid(id);
            eqpdets.Rows[0]["last_amc"] = eqpdets.Rows[0]["next_amc"];
            DateTime n = Convert.ToDateTime(eqpdets.Rows[0]["next_amc"]);
            int dm, dy, dd;


            dm = n.Month;
            dd = n.Day;
            dy = n.Year;
            string date;
            date = dm.ToString() + "/" + dd.ToString() + "/" + dy.ToString();
            int nextdate = Convert.ToInt32(eqpdets.Rows[0]["amcperiod"]);
            DateTime next;
            next = Convert.ToDateTime(date).AddMonths(nextdate);
            eqpdets.Rows[0]["next_amc"] = next;
            eqpdets.Rows[0]["amc_notified"] = "yes";

            eqpdetapi.Update(eqpdets);




        }
        public DataTable feedbackchar()
        {
            DataTable dt = new DataTable();
            DataColumn dc;

            dc = new DataColumn();
            dc.ColumnName = "feedback";
            dt.Columns.Add(dc);
            dc = new DataColumn();
            dc.ColumnName = "satisfied";
            dt.Columns.Add(dc);
            dc = new DataColumn();
            dc.ColumnName = "notsatisfied";
            dt.Columns.Add(dc);

            

                DataRow dr;
                dr = dt.NewRow();

                complaindsTableAdapters.complainTableAdapter compta = new complaindsTableAdapters.complainTableAdapter();
                complainds.complainDataTable compdt = new complainds.complainDataTable();
                compdt = compta.Getcomplain ();
                int countyes = 0;
                int countno = 0;
                for (int i = 0; i < compdt.Rows.Count; i++)
                {
                    string commaDelimited;
                    commaDelimited = compdt.Rows[i]["clientsatisfied"].ToString();
                    int k = 0;
                    string[] df = new string[2];
                    string[] year = commaDelimited.Split(new char[] { ',' });
                    foreach (string month in year)
                    {
                        df[k] = month;
                        k++;
                    }


                    if (df[0].ToString () == "Yes")
                    {
                        countyes += 1;
                    }

                    else if (df[0].ToString() == "No")
                    {
                        countno += 1;
                    }
                   
                }
                dr["satisfied"] = countyes;
                dr["notsatisfied"] = countno;
                dr["feedback"] = "feedback count";
                dt.Rows.Add(dr);

                
            

            return dt;

        }
        public void notifiedno()
        {

            datasetinsassetinfoTableAdapters.equipment_detailsTableAdapter eqpdetapi = new datasetinsassetinfoTableAdapters.equipment_detailsTableAdapter();
            datasetinsassetinfo.equipment_detailsDataTable eqpdets = new datasetinsassetinfo.equipment_detailsDataTable();
            eqpdets = eqpdetapi.Geteqpdet();
            DateTime startTime = DateTime.Now;
            DataTable dt = new DataTable();
            DataColumn dc;



            for (int i = 0; i < eqpdets.Rows.Count; i++)
            {

                DateTime endTime = Convert.ToDateTime(eqpdets.Rows[i]["last_amc"]);
                TimeSpan span = endTime.Subtract(startTime);
                int noofdays = span.Days;

                if (noofdays <= 0)
                {
                    eqpdets.Rows[i]["amc_notified"] = "no";
                    eqpdetapi.Update(eqpdets);
                }


            }





        }
    }
  
    }
 