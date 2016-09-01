using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_client_transfer_form : System.Web.UI.Page
{
    public enum MessageType { Success, Error, Info, Warning };
    protected void ShowMessage(string Message, MessageType type)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "ShowMessage('" + Message + "','" + type + "');", true);
    }
    protected void openpage()
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "generatePage();", true);
    }
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
                pid.Visible = true;
                pnlAdd.Visible = false;
                tbregno.Focus();
            }
        }
    }

    protected void lbtnSubmit_Click(object sender, EventArgs e)
    {
        string path = HttpContext.Current.Server.MapPath("/Captures/Buyer.jpg");
        byte[] clientImage = File.ReadAllBytes(path);
        string returnmsg= clientTransferForm.InsertBuyerData(tbregno.Text,tbname.Text, tbrelation.Text, tbcnic.Text, tboccupation.Text, tbpaddress.Text, tbtel.Text, tbmobile.Text, tbemail.Text, tbpaddress.Text, tbnomineename.Text, tbnomineeaddress.Text, tbnomineecnic.Text,tbnomineeno.Text, clientImage);
        //string returnmsg = "";
        if (returnmsg == "")
        {
            if (File.Exists(path))
            {
                File.Delete(path);

            }
            Session["TransferRegno"] = tbregno.Text;
            Response.Redirect("admin_client_transfer.aspx");
            
        }
        else
        {
            ShowMessage(returnmsg, MessageType.Error);
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        //clientTransferForm.CheckPlotAvailbiltyAndTransfer(tbregno.Text)
         if (clientTransferForm.checkPropertyFirstTransefer(tbregno.Text) == true)
          {
              pid.Visible = false;
              pnlAdd.Visible = true;
              tbpregno.Text = tbregno.Text;
           
          }
        else
        {
            ShowMessage("First Transfer is not completed. Please transfer first from Adam`s Garden to client then You can transfer from Client to Client", MessageType.Error);
        }
    }
}