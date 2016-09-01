using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_add_installment_plans : System.Web.UI.Page
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
            pnlAdd.Visible = true;
            tbinstallmentcost.Focus();
        }
    }
    protected void lbtnSubmit_Click(object sender, EventArgs e)
    {
        try {
            bool check = installmentplan.insertInstallments(tbinstallmentcost.Text, tbFirstName.Text, tbplotsize.Text, tbdownpayment.Text, tblumsum.Text, tbsize.Text, tbtotalcost.Text, tbmembershipfee.Text);
        }
        catch (Exception ex)
        {
            ShowMessage(ex.Message, MessageType.Warning);
        }

        // Empty the TextBox controls.
        tbinstallmentcost.Text = "";
        tbFirstName.Text = "";
        tbtotalcost.Text = "";
        tbdownpayment.Text = "";
        tblumsum.Text = "";
        tbplotsize.Text = "";
        tbsize.Text = "";

    }

   

}