using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using System.Data.SqlClient;
using System.Configuration;

public partial class admin_transfer_form : System.Web.UI.Page
{
    public enum MessageType { Success, Error, Info, Warning };
    protected void ShowMessage(string Message, MessageType type)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "ShowMessage('" + Message + "','" + type + "');", true);
    }
    protected void Page_Load(object sender, EventArgs e)
    {
          if (Session["TransferRegno"] != null)
         {
         string regno = Session["TransferRegno"].ToString() ;
       
        int sid = getsellerId(regno);
            int bid = getbuyerId(regno);
            DataTable transferdata = getbuyer_Seller_data(sid,bid,regno);
            if (transferdata.Rows.Count != 2)
            {
                ShowMessage("Could Not FInd Buyer Seller Data", MessageType.Error);
            }
            else
            {
            int id = int.Parse(transferdata.Rows[0]["id"].ToString());
            if (id == bid)
            {
                DataRow row = transferdata.Rows[0];
                DataRow sellerrow = transferdata.Rows[1];
                    lbregid.Text = regno;
                lbdate1.Text = System.DateTime.Today.ToShortDateString();
                lbbuyername.Text = row["name"].ToString();
                lbbuyernic.Text = row["applicant_cnic"].ToString();
                lbbuyeraddress.Text = row["permanent_address"].ToString();
                lbplotno.Text = row["plot_no"].ToString();
                lbstreet_no.Text = row["street_no"].ToString();
                lbcatagory.Text = row["property_type"].ToString();
                lbplot_address.Text = row["plot_address"].ToString();
                //****************seller***********
                lbownername.Text = sellerrow["name"].ToString();
                lbowner_address.Text = sellerrow["permanent_address"].ToString();
                lbowner_cnic.Text = sellerrow["applicant_cnic"].ToString();

            }
            else
            {
                DataRow row = transferdata.Rows[1];
                DataRow sellerrow = transferdata.Rows[0];
                lbregid.Text = regno;
                lbdate1.Text = System.DateTime.Today.ToShortDateString();
                lbbuyername.Text = row["name"].ToString();
                lbbuyernic.Text = row["applicant_cnic"].ToString();
                lbbuyeraddress.Text = row["permanent_address"].ToString();
                lbplotno.Text = row["plot_no"].ToString();
                lbstreet_no.Text = row["street_no"].ToString();
                lbcatagory.Text = row["property_type"].ToString();
                lbplot_address.Text = row["plot_address"].ToString();
               //buyer image
                byte[] img = (byte[]) row["image"];
                string imgurl = "data:Image/jpg;base64,"+Convert.ToBase64String(img);
                buyerimage.ImageUrl = imgurl;
                //****************seller***********
                lbownername.Text = sellerrow["name"].ToString();
                lbowner_address.Text = sellerrow["permanent_address"].ToString();
                lbowner_cnic.Text = sellerrow["applicant_cnic"].ToString();
                    if (!Convert.IsDBNull(sellerrow["image"]))
                    {
                        img = (byte[])sellerrow["image"];
                    }
                  //  img = (byte[])sellerrow["image"];
                imgurl = "data:Image/jpg;base64," + Convert.ToBase64String(img);
                sellerimg.ImageUrl = imgurl;
            }




            }
            
        }
        else
        {
            Response.Redirect("/admin_client_transfer_form.aspx");
        }
        lbdate1.Text = System.DateTime.Today.ToShortDateString();

    }

  protected static int getsellerId(string regno)
    {
        
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            con.Open();
            string query = @"Select Transfer_form.seller_id 
from Transfer_form
where regno='" + regno + "' order by CONVERT(DateTime, Transfer_form.date,101) desc;";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataAdapter sd = new SqlDataAdapter(cmd);
        
        DataTable dt = new DataTable();
            sd.Fill(dt);
       
int cid = int.Parse(dt.Rows[0][0].ToString());
            return cid;
        



    }
    protected static int getbuyerId(string regno)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
        con.Open();
        string query = @"Select Transfer_form.buyer_id
from Transfer_form
where regno='" + regno + "' order by CONVERT(DateTime, Transfer_form.date,101) desc;";
        SqlCommand cmd = new SqlCommand(query, con);
        SqlDataAdapter sd = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sd.Fill(dt);
        int cid = int.Parse(dt.Rows[0][0].ToString());

        return cid;

    }
    protected static DataTable getbuyer_Seller_data(int sid,int bid,string regno)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
        con.Open();
        string query = @"Select Transfer_form_information.id,Transfer_form_information.name,Transfer_form_information.applicant_cnic,Transfer_form_information.permanent_address,Transfer_form_information.image,property_info.plot_no,property_info.street_no,property_info.property_type,property_info.plot_address
from Transfer_form_information
inner join property_info on property_info.registrationo='" + regno+"' where Transfer_form_information.id='"+bid+"' or Transfer_form_information.id='"+sid+"';";
        SqlCommand cmd = new SqlCommand(query, con);
        SqlDataAdapter sd = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sd.Fill(dt);
        return dt;
    }
    protected void savetransferform_Click(object sender, EventArgs e)
    {
        
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        
    }
}