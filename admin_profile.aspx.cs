using adamsgarden;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_profile : System.Web.UI.Page
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
            if (!IsPostBack)
            {
                profilePanel.Visible = false;
                login.Visible = true;
                uname.Visible = false;
                ppass.Visible = false;
                psecque.Visible = false;
                bindData();
            }
        }
    }
    public void bindData()
    {
        try
        {

            DataTable dt = adminlogin.view(Session["uname"].ToString());
            tbid.Text = dt.Rows[0]["Id"].ToString();

            tbuname.Text = dt.Rows[0]["username"].ToString();
            tbpass.Text = dt.Rows[0]["password"].ToString();
            lbsec1.Text = dt.Rows[0]["security_que1"].ToString();
            lbsec2.Text = dt.Rows[0]["security_que2"].ToString();
            lbsec3.Text = dt.Rows[0]["security_que3"].ToString();
            string ans1 = tbsec1.Text;
            string ans2 = tbsec3.Text;
            string ans3 = tbsec3.Text;
        }
        catch (Exception ex)
        {
            ShowMessage(ex.Message, MessageType.Warning);
        }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        uname.Visible = true;
        

        ppass.Visible = true;
        psecque.Visible = false;
        

    }

    protected void lbpass_Click(object sender, EventArgs e)
    {

        ppass.Visible = true;
        uname.Visible = true;
        psecque.Visible = false;
    }

    protected void lbsecq_Click(object sender, EventArgs e)
    {
        psecque.Visible = false;
        uname.Visible = false;
        ppass.Visible = false;
    }

    protected void Submit_Click(object sender, EventArgs e)
    {
       // bindData();
        string name = tbuname.Text;
        string adminPassword = tbpass.Text;
        string ans1 = tbsec1.Text;
        string ans2 = tbsec2.Text;
        string ans3 = tbsec3.Text;
        string tid = tbid.Text;
        int id = Convert.ToInt32(tid.ToString());
        try
        {
            bool check = adminlogin.updateProfile(name, adminPassword, ans1, ans2, ans3, id);
        }
        catch (Exception ex)
        {
            ShowMessage(ex.Message, MessageType.Warning);
        }
        psecque.Visible = false;
        uname.Visible = false;
        ppass.Visible = false;
        Session["uname"] = name;
    }
   
  
    protected void btnlogin_Click(object sender, EventArgs e)
        {
        string name = Session["uname"].ToString();
        try {
            bool check = adminlogin.login1(name, tbcheckpassword.Text);
            if (check == true)
            {
                login.Visible = false;
                profilePanel.Visible = true;
            }
        }
        catch (Exception ex)
        {
            ShowMessage(ex.Message, MessageType.Warning);
        }
    }



    protected void lbupdate_Click(object sender, EventArgs e)
    {
        Response.Redirect("admin_data_update.aspx");
    }
}