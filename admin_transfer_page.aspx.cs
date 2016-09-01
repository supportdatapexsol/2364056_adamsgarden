using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_transfer_page : System.Web.UI.Page
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
        }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if(RadioButtonList1.Text== "Adam's Garden Transfer")
        {
            Response.Redirect("admin_transfer_form.aspx", true);

        }
        else if(RadioButtonList1.Text == "Client's Transfer")
        {
            Response.Redirect("admin_client_transfer_form.aspx", true);

        }

    }
}