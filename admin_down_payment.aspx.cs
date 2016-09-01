using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class property_payment : System.Web.UI.Page
{
    public enum MessageType { Success, Error, Info, Warning };
    private string cnic = "";
    protected void Page_Load(object sender, EventArgs e)
    {
       
            if (Session["uname"] == null && !Request.Path.EndsWith("login.aspx"))
            {
                Response.Redirect("login.aspx");
            }
            else
            {
                if (!IsPostBack)
                {
                    cnic = Session["search"].ToString();
                Cal1.Visible = false;
                dataBind(cnic);
                tbmobile.Focus();
               
            }
            }
   
        
    }
    public void dataBind(string searchInput)
    {

        try {

            DataTable dt = client.getClientByRegno(searchInput);
            DataTable newdt = new DataTable();//for filtering data
            newdt.Columns.Add("client Id", typeof(string));
            newdt.Columns.Add("name", typeof(string));
            newdt.Columns.Add("relation of", typeof(string));
            newdt.Columns.Add("cnic", typeof(string));
            newdt.Columns.Add("profession", typeof(string));
            newdt.Columns.Add("present address", typeof(string));
            newdt.Columns.Add("telephone", typeof(string));
            newdt.Columns.Add("Regteration no", typeof(string));

            foreach (DataRow row in dt.Rows)
            {
                DataRow nrow = newdt.NewRow();  //creating newRow
                nrow["client Id"] = row["Id"];
                nrow["name"] = row["name"];
                nrow["relation of"] = row["relation_of"];
                nrow["cnic"] = row["applicant_cnic"];
                nrow["profession"] = row["occupation"];
                nrow["present address"] = row["present_address"];
                nrow["telephone"] = row["telephone"];
                nrow["Regteration no"] = row["registrationo"];


                newdt.Rows.Add(nrow);

                tbname.Text = nrow["name"].ToString();
                tbsof.Text = nrow["relation of"].ToString();
                tbcnic.Text = nrow["cnic"].ToString();
                tboccupatiom.Text = nrow["profession"].ToString();
                tbpresentaddress.Text = nrow["present address"].ToString();
                tbtel.Text = nrow["telephone"].ToString();
                tbregistrationo.Text = nrow["Regteration no"].ToString();
                tbparmaentadd.Text = tbpresentaddress.Text;
                tbnomineaddress.Text = tbpresentaddress.Text;
            }
        }
        catch(Exception ex)
        {
            ShowMessage(ex.Message,MessageType.Warning);
        }
    }
    //to show the dynamic error 
    protected void ShowMessage(string Message, MessageType type)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "ShowMessage('" + Message + "','" + type + "');", true);
    }
    protected void plotsize_ServerValidate(object source, ServerValidateEventArgs args)
    {
        args.IsValid = r1.Checked || r2.Checked || r3.Checked || r4.Checked || r5.Checked;
    }
    protected void paymentmadethrough_server(object source, ServerValidateEventArgs args)
    {
        args.IsValid = pcash.Checked || pcheque.Checked || pdraft.Checked || porder.Checked;
    }
    protected void plottype_server(object source, ServerValidateEventArgs args)
    {
        args.IsValid =residential.Checked || commercial.Checked ;
    }
    protected void btnsave_Click(object sender, EventArgs e)
    {
       
        if (Page.IsValid)
        {
            //HttpPostedFile postedfile = imageupload.PostedFile;
            //string filename = Path.GetFileName(postedfile.FileName);
            //string fileextention = Path.GetExtension(filename);
            // int size = postedfile.ContentLength;

            // if (fileextention.ToLower() == ".jpg")
            //{
            string filepath = HttpContext.Current.Server.MapPath("/Captures/DownPayment.jpg");
            byte[] clientImage = File.ReadAllBytes(filepath);
            string str = Convert.ToBase64String(clientImage);
            string returnstrng;
            //string filepath = "Captures/DownPayment.jpg";

            try
                    {
                       // Stream stream = postedfile.InputStream;
                        //BinaryReader binaryreader = new BinaryReader(filepath);
                        //byte[] bytes = binaryreader.ReadBytes((int)filepath.Length);
                       // byte[] bytes = System.Text.Encoding.ASCII.GetBytes(filepath);
                        //**************plot size****************
                        string plotsize = "";
                        if (r1.Checked == true) { plotsize = "4 Marla"; }
                        else if (r2.Checked == true) { plotsize = "5 Marla"; }
                        else if (r3.Checked == true) { plotsize = "7 Marla"; }
                        else if (r4.Checked == true) { plotsize = "10 Marla"; }
                        else if (r5.Checked == true) { plotsize = "1 Kanal"; }
                        //****************payment Type************************
                        string pay_type = "";
                        if (pcash.Checked == true) { pay_type = "Cash"; }
                        else if (pcheque.Checked == true) { pay_type = "Cheque"; }
                        else if (pdraft.Checked == true) { pay_type = "Draft"; }
                        else if (porder.Checked == true) { pay_type = "Pay Order"; }
                        //*****************plottype***************************
                        string plottype = "";
                        if (residential.Checked == true) { plottype = "Residential"; }
                        else if (commercial.Checked == true) { plottype = "Commercial"; }
                     Session["reg_id"] = tbregistrationo.Text;

                returnstrng = applicant_info.downpayment(tbname.Text, tbsof.Text, tbcnic.Text, tboccupatiom.Text, tbpresentaddress.Text, tbtel.Text, tbmobile.Text, tbemail.Text, tbparmaentadd.Text, tbnominename.Text, tbnomineaddress.Text, tbcnicnominee.Text, tbno.Text, clientImage, tbregistrationo.Text, tbamoutn.Text, tbamountinwords.Text, plotsize, pay_type, tbplotnumber.Text, tbstreet.Text, "address", plottype, tbdate.Text);




                    if (returnstrng == "")
                    {
                    
                        ShowMessage("Record submitted successfully", MessageType.Success);
                        
                        tbname.Text = "";
                        tbsof.Text = "";
                        tbcnic.Text = "";
                        tboccupatiom.Text = "";
                        tbpresentaddress.Text = "";
                        tbtel.Text = "";
                        tbmobile.Text = "";
                        tbemail.Text = "";
                        tbparmaentadd.Text = "";
                        tbnominename.Text = "";
                        tbnomineaddress.Text = "";
                        tbcnicnominee.Text = "";
                        tbno.Text = "";
                        tbregistrationo.Text = "";
                        tbamoutn.Text = "";
                        tbamountinwords.Text = "";
                        r1.Checked = false;
                        r2.Checked = false;
                        r3.Checked = false;
                        r4.Checked = false;
                        r5.Checked = false;
                        pcash.Checked = false;
                        pcheque.Checked = false;
                        pdraft.Checked = false;
                        porder.Checked = false;
                        tbplotnumber.Text = "";
                        tbstreet.Text = "";
                        if (File.Exists(filepath))
                        {
                            File.Delete(filepath);

                        }
                    Response.Redirect("printable_downpayment_form.aspx");
                }
                    else
                    {

                        ShowMessage(returnstrng, MessageType.Error);

                    }

                
               
            }
            catch(Exception ex)
                    {
                        ShowMessage(ex.Message, MessageType.Warning);
                    }
                
             
           

           
        }
    }
    protected static byte[] ReadImageFile(string imageLocation)
    {
        byte[] imageData = null;
        FileInfo fileInfo = new FileInfo(imageLocation);
        long imageFileLength = fileInfo.Length;
        FileStream fs = new FileStream(imageLocation, FileMode.Open, FileAccess.Read);
        BinaryReader br = new BinaryReader(fs);
        imageData = br.ReadBytes((int)imageFileLength);
        return imageData;
    }
    protected void downPaymentId_Click(object sender, EventArgs e)
    {
       
     
            Response.Redirect("admin_down_payment.aspx");
       
    }

    protected void property_Click(object sender, EventArgs e)
    {
        Response.Redirect("admin_property_info.aspx");
    }
    protected void tbplotnumber_TextChanged(object sender, EventArgs e)
    {
        try {
            string plotno = tbplotnumber.Text;
            if (applicant_info.checkplotno(int.Parse(plotno)) == false)
            {
                ShowMessage("This plot no. " + plotno + " has been sold !", MessageType.Error);

            }
        }catch(Exception ex)
        {
            ShowMessage(ex.Message, MessageType.Warning);
        }
    
    }
    protected void ImageButton_Click(object sender, ImageClickEventArgs e)
    {
        if (Cal1.Visible == false)
        {
            Cal1.Visible = true;
        }
        else
        {
            Cal1.Visible = false;

        }
    }

    protected void Cal1_SelectionChanged(object sender, EventArgs e)
    {
        tbdate.Text = Cal1.SelectedDate.ToShortDateString();
        Cal1.Visible = false;
    }

}