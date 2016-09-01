using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class view_transfer_form : System.Web.UI.Page
{
    public enum MessageType { Success, Error, Info, Warning };
    protected void ShowMessage(string Message, MessageType type)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "ShowMessage('" + Message + "','" + type + "');", true);
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        //int.Parse(Session["tbid"].ToString())
       
        /*
        if (Session["uname"] == null && !Request.Path.EndsWith("login.aspx"))
        {
            Response.Redirect("login.aspx");
        }
        else
        {
            String id = Session["tbid"].ToString();
                       
           
           DataTable buyerDt =  viewtranfserform.gettingbuyerinfo(id);// viewtranfserform.getTransferBuyerInfo(int.Parse(id), reg,date); //get clientdata
            //DataTable sellerDt = viewtranfserform.sellerinfo(id);//viewtranfserform.getTransfersellerInfo( reg, date); ;//getting seller info
          foreach (DataRow row in buyerDt.Rows)
            {
                lbregid.Text = row["regno"].ToString(); ;
                lbbuyername.Text = row["name"].ToString();
                lbbuyeraddress.Text = row["permanent_address"].ToString();
                lbbuyernic.Text = row["applicant_cnic"].ToString();
                
            }
            foreach (DataRow row in sellerDt.Rows)
            {

                lbownername.Text = row["name"].ToString();
                lbowner_address.Text = row["permanent_address"].ToString();
                lbowner_cnic.Text = row["applicant_cnic"].ToString();
                
            }
          
          
            lbdate1.Text = System.DateTime.Today.ToShortDateString();
            tbregno.Focus();
            tranferId.Visible = true;
        }*/
    }



  
  
}