using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_data_update : System.Web.UI.Page
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
                //  cnic = Session["search"].ToString();
                DataTable dt = updateAdminData.view();
                foreach (DataRow row in dt.Rows)
                {
                    tbname.Text = row["name"].ToString();
                    tbsof.Text = row["relation_of"].ToString();
                    tbcnic.Text = row["applicant_cnic"].ToString();
                    tboccupatiom.Text = row["occupation"].ToString();
                    tbpresentaddress.Text = row["present_address"].ToString();
                    tbtel.Text = row["telephone"].ToString();
                    tbmobile.Text = row["mobile"].ToString();
                    tbemail.Text = row["email"].ToString();
                    tbpresentaddress.Text = row["permanent_address"].ToString();

                    tbnominename.Text = row["nominee_name"].ToString();
                    tbnomineaddress.Text = row["nominee_address"].ToString();
                    tbcnicnominee.Text = row["nominee_cnic"].ToString();

                }
            }
        }


    }
  
    //to show the dynamic error 
    protected void ShowMessage(string Message, MessageType type)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "ShowMessage('" + Message + "','" + type + "');", true);
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
            
            //string filepath = "Captures/DownPayment.jpg";

            try
            {
                // Stream stream = postedfile.InputStream;
                //BinaryReader binaryreader = new BinaryReader(filepath);
                //byte[] bytes = binaryreader.ReadBytes((int)filepath.Length);
                // byte[] bytes = System.Text.Encoding.ASCII.GetBytes(filepath);


                bool returnstrng = updateAdminData.updateData(tbname.Text, tbsof.Text, tbcnic.Text, tboccupatiom.Text, tbpresentaddress.Text, tbtel.Text, tbmobile.Text, tbemail.Text, tbparmaentadd.Text, tbnominename.Text, tbnomineaddress.Text, tbcnicnominee.Text, clientImage);




                if (returnstrng ==true)
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
 
                    if (File.Exists(filepath))
                    {
                        File.Delete(filepath);

                    }

                }
                else
                {

                   // ShowMessage(Convert.ToBoolean(returnstrng), MessageType.Error);

                }



            }
            catch (Exception ex)
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




}