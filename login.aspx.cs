using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class login : System.Web.UI.Page
{
    public enum MessageType { Success, Error, Info, Warning };
    protected void ShowMessage(string Message, MessageType type)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "ShowMessage('" + Message + "','" + type + "');", true);
    }
    protected void Page_Load(object sender, EventArgs e)
    {

    }



    protected void btnlogin_Click(object sender, EventArgs e)
    {
       String uname= username.Value.ToString();
        String pass = password.Value.ToString();
        bool check = adamsgarden.adminlogin.login1(uname, pass);
        if (check == true)
        {
            Session["uname"] = uname;
            Response.Redirect("dashboard.aspx");
            Response.Write("Welcome"+uname);

        }
        else
        {
            ShowMessage("Username Or Password is not correct !", MessageType.Error);

          Response.Write("your user name and pass word is worng");
        }
       
    }
}