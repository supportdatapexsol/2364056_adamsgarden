using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;

public partial class admin_transfer_form : System.Web.UI.Page
{
    public enum MessageType { Success, Error, Info, Warning };
    protected void ShowMessage(string Message, MessageType type)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "ShowMessage('" + Message + "','" + type + "');", true);
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["uname"] == null && !Request.Path.EndsWith("login.aspx"))
        {
            Response.Redirect("login.aspx");
        }
        else
        {
            lbdate1.Text = System.DateTime.Today.ToShortDateString();
            tbregno.Focus();
            tranferId.Visible = false;
        }
    }



    protected void savetransferform_Click(object sender, EventArgs e)
    {
        try
        {
            string path = HttpContext.Current.Server.MapPath("/Captures/Buyer.jpg");
            byte[] clientImage = File.ReadAllBytes(path);
            string str = Convert.ToBase64String(clientImage);
            string msg = tranfer_form.SaveClientDataTransForm(lbregid.Text, clientImage);
            if (msg == "")
            {
                if (File.Exists(path))
                {
                    File.Delete(path);

                }
                ShowMessage("Transfer IS completed Succesfully", MessageType.Success);
            }
            else
            {
                if (File.Exists(path))
                {
                    File.Delete(path);

                }
                ShowMessage(msg, MessageType.Error);
            }
        }
        catch (Exception ex)
        {
            ShowMessage(ex.Message, MessageType.Warning);
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            tranferId.Visible = true;

            int pid = tranfer_form.getPropertyID(tbregno.Text);
            double plot_Total_Payment = tranfer_form.getPlotTotalPayment(pid);
            double paid_Payments = tranfer_form.getClientTotalInstallmentsPaid(tbregno.Text);
            if (plot_Total_Payment == paid_Payments)
            {


                string regno = tbregno.Text;
                DataTable client_info = tranfer_form.getClientDataTransferForm(regno);
                DataTable owner_info = tranfer_form.GetOwnerDataTransferForm();
                if (client_info.Rows.Count == 1)
                {
                    foreach (DataRow row in client_info.Rows)
                    {
                        lbregid.Text = regno;
                        lbdate1.Text = System.DateTime.Today.ToShortDateString();
                        lbbuyername.Text = row["name"].ToString();
                        lbbuyernic.Text = row["applicant_cnic"].ToString();
                        lbbuyeraddress.Text = row["permanent_address"].ToString();
                        lbplotno.Text = row["plot_no"].ToString();
                        lbstreet_no.Text = row["street_no"].ToString();
                        lbcatagory.Text = row["property_type"].ToString();
                        lbplot_address.Text = row["plot_address"].ToString();
                    }
                }
                else
                {
                    ShowMessage("Unable to find Property with Regno or Seller Record:" + regno, MessageType.Error);
                }
                if (owner_info.Rows.Count == 1)
                {
                    foreach (DataRow row in owner_info.Rows)
                    {
                        lbownername.Text = row["name"].ToString();
                        lbowner_address.Text = row["permanent_address"].ToString();
                        lbowner_cnic.Text = row["applicant_cnic"].ToString();
                    }
                }
               /* else
                {
                    ShowMessage("Unable to find Buyer Record :" + regno, MessageType.Error);
                }*/
            }
            else
            {
                ShowMessage("Payment is not completed", MessageType.Error);
            }

        }
        catch (Exception ex)
        {
            ShowMessage(ex.Message, MessageType.Warning);
        }
    }
}